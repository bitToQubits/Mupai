#include "Chat.h"
#include "session.h"
#include <QIODevice>
#include <QImage>
#define session Session::getInstance().getSession()

Chat::Chat(QObject *parent)
    : QObject{parent}
{
    isLoading(false);
    isLoading_msg(false);
    networkManager = new QNetworkAccessManager(this);

}

QString Chat::AI() const
{
    return m_AI;
}

void Chat::setAI(const QString &newAI)
{
    if (m_AI == newAI)
        return;
    m_AI = newAI;
    emit AIChanged();
}

qint32 Chat::ID() const
{
    return m_ID;
}

QList<QObject *>Chat::getChats(){
        QSqlQuery query;
        query.prepare("SELECT ID, nombre, tema, fecha FROM chats WHERE user_id = :id ORDER BY ID ASC");
        query.bindValue(":id", session.value("user/id").toInt());
        query.exec();
        QList<QObject*> chats;
        while(query.next()){
            Chat* chat = new Chat();
            chat->m_ID = query.value(0).toInt();
            chat->m_nombre = query.value(1).toString();
            chat->m_tema = query.value(2).toString();
            chat->m_tema = query.value(3).toString();
            chats.append(chat);
        }
        return chats;
}

QJsonObject Chat::createMessage(const QString& role,const QString& content){
    QJsonObject message;
    message.insert("role",role);
    message.insert("content",content);
    return message;
}

QJsonObject Chat::createMessage(const QString& role,const QJsonValue& content){
    QJsonObject message;
    message.insert("role",role);
    message.insert("content",content);
    return message;
}

//Crear imagen con el endpoint de openai
void Chat::sendPrompt(const QString& prompt){
    isLoading(true);
    if(m_messages.isEmpty()){
        m_ID = crearChat(prompt);
        if (m_AI == "neumann"){
            sendMessage(neumann, "system");
        }else if(m_AI == "davinci"){
            sendMessage(davinci, "system");
        }else if(m_AI == "chaplin"){
            sendMessage(chaplin, "system");
        }else{
            sendMessage(mupi, "system");
        }
    }
    QUrl url("https://api.openai.com/v1/images/generations");
    QNetworkRequest request(url);
    // Set the necessary headers
    request.setRawHeader("Content-Type", "application/json");
    request.setRawHeader("Authorization", "Bearer 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");

    // Create the JSON object for the body
    QJsonObject json;
    json.insert("model", "dall-e-2");
    json.insert("prompt", prompt);
    json.insert("n", 1);
    json.insert("size", "1024x1024");
    json.insert("response_format", "b64_json");

    // Create a network access manager
    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    m_messages.append(createMessage("user", prompt));
    saveMessage(prompt, "user", 1);

    // Connect the finished signal to a slot
    connect(manager, &QNetworkAccessManager::finished, this, &Chat::onImgRequestFinished);

    // Send the POST request
    manager->post(request, QJsonDocument(json).toJson());
}

void Chat::onImgRequestFinished(QNetworkReply *reply) {
    if (reply->error()) {
        qDebug() << reply->errorString();
        int statusCode = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();
        qDebug() << "HTTP status code:" << statusCode;
        isLoading(false);
        return;
    }

    QString responseString = QString::fromUtf8(reply->readAll());
    QJsonDocument doc = QJsonDocument::fromJson(responseString.toUtf8());
    QJsonObject jsonObj = doc.object();
    QVariantList images = jsonObj.value("data").toArray().toVariantList();

    if(images.isEmpty()){
        qDebug() << "Error del lado del servidor";
        m_status_server = false;
    }else{
        m_status_server = true;
        saveMessage("No se guardan imagenes en nuestros servidores", "assistant", 0);
    }

    //m_messages.append(createMessage("assistant",jsonObj.value("data")));
    qDebug() << "numero de mensajes" << m_messages.count();
    if(m_messages.at(1).toObject().value("role").toString() == "user" && m_messages.size() == 2){
        emit nuevoChat(m_messages.at(1).toObject().value("user").toString(), m_ID);
    }

    responseImages(images);
    emit nuevaImagen();


    reply->deleteLater();
    isLoading(false);
}

int Chat::crearChat(const QString& nombre){
        m_status_server = true;
        QSqlQuery query;
        //TO-DO: AGREGAR TEMAS DE BUSQUEDA
        query.prepare("INSERT INTO chats (user_id, nombre, inteligencia, es_plantilla)"
                      "VALUES (:user,:nombre,:ai,:es_plantilla)");
        query.bindValue(":user",session.value("user/id").toInt());
        query.bindValue(":nombre",nombre);
        query.bindValue(":ai",m_AI);
        query.bindValue(":es_plantilla",m_es_plantilla);

        query.exec();

        if(!(query.numRowsAffected() > 0)){
            //Debug error message
            m_status_server = false;
            return 0;
        }

        m_status_server = true;

        query.clear();

        query.prepare("SELECT ID FROM chats WHERE user_id = :id ORDER BY ID DESC LIMIT 1");
        query.bindValue(":id", session.value("user/id").toInt());

        query.exec();
        query.next();

        if(query.isValid()){
            m_status_server = true;
            return query.value(0).toInt();
        }else{
            m_status_server = false; //bobo
            return 0;
        }
        m_status_server = false;
        return 0;

}

//Tipo, 1 para texto, 0 para imagen
bool Chat::saveMessage(const QJsonValue content, const QString& rol, int tipo){

        QSqlQuery query;

        if(tipo == 1){
            query.prepare("INSERT INTO chats_messages (chat_id,mensaje, rol, tipo) VALUES (:chat_id,:mensaje,:rol,:tipo)");
            query.bindValue(":chat_id", m_ID);
            query.bindValue(":mensaje", content.toString());
            query.bindValue(":rol",rol);
            query.bindValue(":tipo",1);
        }else{
            query.prepare("INSERT INTO chats_messages (chat_id,mensaje, rol, tipo) VALUES (:chat_id,:mensaje,:rol,:tipo)");
            query.bindValue(":chat_id", m_ID);
            query.bindValue(":mensaje", "No guardamos imagenes en nuestro servidor");
            query.bindValue(":rol",rol);
            query.bindValue(":tipo",1);
        }

        query.exec();

        if(query.numRowsAffected() > 0){
            m_status_server = true;
            return true;
        }else{
            m_status_server = false;
            return false;
        }

        m_status_server = false;
        return false;
}

void Chat::sendMessage(const QString& text, const QString& role = "user"){
    isLoading_msg(true);
    if(m_messages.isEmpty() && role == "user"){
        m_ID = crearChat(text);
        if (m_AI == "neumann"){
            sendMessage(neumann, "system");
        }else if(m_AI == "davinci"){
            sendMessage(davinci, "system");
        }else if(m_AI == "chaplin"){
            sendMessage(chaplin, "system");
        }else{
            if(m_es_plantilla){
                sendMessage(plantilla, "system");
            }else{
                sendMessage(mupi, "system");
            }
        }
    }
    saveMessage(text, role, 1);
    QUrl url("https://api.openai.com/v1/chat/completions");
    QNetworkRequest request(url);

    // Set the necessary headers
    request.setRawHeader("Content-Type", "application/json");
    request.setRawHeader("Authorization", "Bearer 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");

    // Create the JSON object for the body
    QJsonObject json;
    if (m_AI == "neumann"){
        json.insert("model", "gpt-4");
    }else{
        json.insert("model", "gpt-3.5-turbo");
    }

    m_messages.append(createMessage(role, text));

    json.insert("messages", m_messages);
    json.insert("stream", true);

    // Create a network access manager
    QNetworkAccessManager *manager = new QNetworkAccessManager(this);
    QNetworkReply* reply = manager->post(request, QJsonDocument(json).toJson());

    if(role != "system"){
        emit nuevoMensaje();
        connect(manager, &QNetworkAccessManager::finished, this, &Chat::onPostRequestFinished);
        // Connect the finished signal to a slot
        respuesta = "";
        connect(reply, &QIODevice::readyRead, [=]() {

            if(reply->error() == QNetworkReply::NoError)
            {
                m_status_server = true;
                QString response = QString::fromUtf8(reply->readAll());

                response.replace("\n\n", "},");
                if(response.contains(",data: [DONE]},")){
                    response.remove(",data: [DONE]},");
                }else{
                    response.remove(response.lastIndexOf(","), 1);
                }
                response.replace("data:", "{\"data\":");
                response.prepend("{\"conjunto\": [");
                response.append("]}");
                QJsonDocument doc = QJsonDocument::fromJson(response.toUtf8());
                QJsonObject jsonObj = doc.object();

                if(doc.isNull()){
                    qDebug() << response;
                }else{
                    //Iterar a traves de los objetos
                    QJsonArray jsonArray = jsonObj["conjunto"].toArray();
                    for (int i = 0; i < jsonArray.size(); i++) {
                        QJsonObject jsonObject = jsonArray[i].toObject();
                        if(jsonObject["data"].toObject()["choices"].toArray().at(0).toObject().value("delta") != QJsonValue::Undefined){
                            if(jsonObject["data"].toObject()["choices"].toArray().at(0).toObject().value("delta").toObject().value("content").toString() != ""){
                                emit nuevoToken(jsonObject["data"].toObject()["choices"].toArray().at(0).toObject().value("delta").toObject().value("content").toString());
                                respuesta+= jsonObject["data"].toObject()["choices"].toArray().at(0).toObject().value("delta").toObject().value("content").toString();
                            }
                        }
                    }
                }
            }
            else // handle error
            {
                m_status_server = false;
                qDebug() << "Error";
            }
        });
    }
}

void Chat::onPostRequestFinished(QNetworkReply *reply) {
    if (reply->error()) {
        qDebug() << reply->errorString();
        int statusCode = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();
        qDebug() << "HTTP status code:" << statusCode;
        isLoading_msg(false);
        m_status_server = false;
        return;
    }

    if(respuesta.isEmpty()){
        m_status_server = false;
        respuesta = "Error del lado del servidor: Contactar con el desarrollador.";
    }else{
        m_status_server = true;
        m_messages.append(createMessage("assistant",respuesta));
        saveMessage(respuesta, "assistant", 1);
        //Chequear si existe ya el primer mensaje de usuario de la conversacion
        if(m_messages.at(1).toObject().value("role").toString() == "user" && m_messages.size() == 3){
            emit nuevoChat(m_messages.at(1).toObject().value("user").toString(), m_ID);
        }
    }
    reply->deleteLater();
    isLoading_msg(false);
}

void Chat::clipText(QString text, bool is_img){
    //Si es imagen, convertir base64 a imagen y copiarla
    if(is_img){
        text.remove("data:image/png;base64,");
        QByteArray byteArray = QByteArray::fromBase64(text.toUtf8());
        QImage image;
        image.loadFromData(byteArray);
        QClipboard *clipboard = QGuiApplication::clipboard();
        clipboard->setImage(image);
    }else{
        QClipboard *clipboard = QGuiApplication::clipboard();
        clipboard->setText(text);
    }
}

void Chat::setear(const QString ID, bool es_nuevo, const bool es_plantilla)
{

    if(es_nuevo){
        setAI(ID); //Seteando el modelo de inteligencia artificial

        //Limpiando las variables. Volviendolos a definir.
        m_messages = {};
        m_ID = 0;
        m_nombre = "";
        m_tema = "";
        m_fecha = "";
        setEs_plantilla(false);
        plantilla = "";
        m_nombre_plantilla = "";
        m_desc_plantilla = "";
        m_img_plantilla = "";
        if(es_plantilla){
            //Haciendo consulta a la tabla plantillas para extraer las instrucciones.
            QSqlQuery query;
            query.prepare("SELECT * FROM templates WHERE ID = :ai");
            query.bindValue(":ai", m_AI);
            query.exec();
            query.next();
            setEs_plantilla(true);
            setAI(query.value("ID").toString());
            setNombre_plantilla(query.value("nombre").toString());
            plantilla = "Tu nombre es: " + m_nombre_plantilla + "." + query.value("instrucciones").toString();
            setDesc_plantilla(query.value("descripcion").toString());
            setImg_plantilla(query.value("img").toString());
            m_img_plantilla = query.value("img").toString();
        }
    }else{
        QSqlQuery query;
        query.prepare("SELECT * FROM chats WHERE ID = :ai");
        query.bindValue(":ai", ID);
        query.exec();
        query.next();
        m_ID = query.value(0).toInt();
        setNombre(query.value(2).toString());
        setTema(query.value(3).toString());
        setFecha(query.value(4).toString());
        setAI(query.value(5).toString());
        setEs_plantilla(query.value(6).toBool());
        if(m_es_plantilla){
            //Haciendo consulta a la tabla templates para extraer las instrucciones.
            QSqlQuery query;
            query.prepare("SELECT * FROM templates WHERE ID = :ai");
            query.bindValue(":ai",m_AI);
            query.exec();
            query.next();
            setAI(query.value("ID").toString());
            setNombre_plantilla(query.value("nombre").toString());
            plantilla = "Tu nombre es: " + m_nombre_plantilla + "." + query.value("instrucciones").toString();
            setDesc_plantilla(query.value("descripcion").toString());
            setImg_plantilla(query.value("img").toString()); //shelow shaq
        }
    }
}

void Chat::obtenerMensajes(int ID){
    QSqlQuery query;
    query.prepare("SELECT * FROM chats_messages WHERE chat_id = :ai");
    query.bindValue(":ai", ID);
    query.exec();
    m_messages = {};
    while(query.next()){
        m_messages.append(createMessage(query.value(4).toString(),query.value(2).toString()));
    }
}

void Chat::removeChat(int ID)
{
        m_status_server = true;
        QSqlQuery query;
        query.prepare("DELETE FROM chats WHERE ID = :id");
        query.bindValue(":id", ID);
        query.exec();
        query.prepare("DELETE FROM chats_messages WHERE chat_id = :id_chat");
        query.bindValue(":id_chat", ID);
        query.exec();
}

void Chat::guardarTitulo(int ID, QString nombre)
{
        m_status_server = true;
        QSqlQuery query;
        query.prepare("UPDATE chats SET nombre = :nombre WHERE ID = :id");
        query.bindValue(":nombre",nombre);
        query.bindValue(":id",ID);
        if(query.exec()){
            m_status_server = true;
            emit tituloCambiado();
        }else{
            m_status_server = false;
        }
}

bool Chat::status_server() const
{
    return m_status_server;
}

QString Chat::nombre() const
{
    return m_nombre;
}

void Chat::setNombre(const QString &newNombre)
{
    if (m_nombre == newNombre)
        return;
    m_nombre = newNombre;
    emit nombreChanged();
}

QString Chat::tema() const
{
    return m_tema;
}

void Chat::setTema(const QString &newTema)
{
    if (m_tema == newTema)
        return;
    m_tema = newTema;
    emit temaChanged();
}

QString Chat::fecha() const
{
    return m_fecha;
}

void Chat::setFecha(const QString &newFecha)
{
    if (m_fecha == newFecha)
        return;
    m_fecha = newFecha;
    emit fechaChanged();
}

bool Chat::es_plantilla() const
{
    return m_es_plantilla;
}

void Chat::setEs_plantilla(bool newEs_plantilla)
{
    if (m_es_plantilla == newEs_plantilla)
        return;
    m_es_plantilla = newEs_plantilla;
    emit es_plantillaChanged();
}

QJsonArray Chat::messages() const
{
    return m_messages;
}

QString Chat::nombre_plantilla() const
{
    return m_nombre_plantilla;
}

void Chat::setNombre_plantilla(const QString &newNombre_plantilla)
{
    if (m_nombre_plantilla == newNombre_plantilla)
        return;
    m_nombre_plantilla = newNombre_plantilla;
    emit nombre_plantillaChanged();
}

QString Chat::img_plantilla() const
{
    return m_img_plantilla;
}

void Chat::setImg_plantilla(const QString &newImg_plantilla)
{
    if (m_img_plantilla == newImg_plantilla)
        return;
    m_img_plantilla = newImg_plantilla;
    emit Img_plantillaChanged();
}

QString Chat::desc_plantilla() const
{
    return m_desc_plantilla;
}

void Chat::setDesc_plantilla(const QString &newDesc_plantilla)
{
    if (m_desc_plantilla == newDesc_plantilla)
        return;
    m_desc_plantilla = newDesc_plantilla;
    emit desc_plantillaChanged();
}
