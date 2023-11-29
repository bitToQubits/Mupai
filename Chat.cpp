#include "Chat.h"
#include "database.h"
#include "session.h"
#define session Session::getInstance().getSession()

Chat::Chat(QObject *parent)
    : QObject{parent}
{
    isLoading(false);
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
    if(createConnection()){
        QSqlQuery query;
        query.prepare("SELECT ID, nombre, tema, fecha FROM chats WHERE user_id = ? ORDER BY ID ASC");
        query.addBindValue(session.value("user/id").toInt());
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
    }else{
        return QList<QObject*>(); //lista vacia
    }
}


//Crear imagen con el endpoint de openai
void Chat::sendPrompt(const QString& prompt){
    isLoading(true);
    if(m_messages.isEmpty()){
        m_ID = crearChat(prompt);
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
    json.insert("size", "512x512");
    //json.insert("n", "3");
    json.insert("response_format", "b64_json");

    // Create a network access manager
    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    m_messages.append(createMessage("user", prompt));
    saveMessage(prompt, "user", 1);

    // Connect the finished signal to a slot
    connect(manager, &QNetworkAccessManager::finished, this, &Chat::onImgRequestFinished);

    // Send the POST request
    manager->post(request, QJsonDocument(json).toJson());

    isLoading(false);
}

void Chat::onImgRequestFinished(QNetworkReply *reply) {
    if (reply->error()) {
        qDebug() << reply->errorString();
        int statusCode = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();
        qDebug() << "HTTP status code:" << statusCode;
        return;
    }

    QString responseString = QString::fromUtf8(reply->readAll());
    QJsonDocument doc = QJsonDocument::fromJson(responseString.toUtf8());
    QJsonObject jsonObj = doc.object();
    QVariantList images = jsonObj.value("data").toArray().toVariantList();

    if(images.isEmpty()){
        qDebug() << "Error del lado del servidor";
    }else{
        //messages.append(createMessage("assistant",jsonObj.value("data")));
        saveMessage(jsonObj.value("data"), "assistant", 0);
    }
    responseImages(images);
    emit nuevaImagen();
    reply->deleteLater();
}

int Chat::crearChat(const QString& nombre){
    if(createConnection()){

        QSqlQuery query;
        //TO-DO: AGREGAR TEMAS DE BUSQUEDA
        query.prepare("INSERT INTO chats (user_id, nombre, inteligencia, es_plantilla)"
                      "VALUES (?,?,?,?)");
        query.addBindValue(session.value("user/id").toInt());
        query.addBindValue(nombre);
        query.addBindValue(m_AI);
        query.addBindValue(false);

        query.exec();

        if(!(query.numRowsAffected() > 0)){
            return 0;
        }

        query.clear();

        query.prepare("SELECT ID FROM chats WHERE user_id = ? ORDER BY ID DESC LIMIT 1");
        query.addBindValue(session.value("user/id").toInt());

        query.exec();
        query.next();

        if(query.isValid()){
            return query.value(0).toInt();
        }else{
            m_status_server = false; //bobo
            return 0;
        }

    }else{
        m_status_server = false;
        return 0;
    }
}

//Tipo, 1 para texto, 0 para imagen
bool Chat::saveMessage(const QJsonValue content, const QString& rol, int tipo){
    if(createConnection()){

        QSqlQuery query;

        if(tipo == 1){
            query.prepare("INSERT INTO chats_messages (chat_id,mensaje, rol, tipo) VALUES (?,?,?,?)");
        }else{
            query.prepare("INSERT INTO chats_messages (chat_id,imagen, rol, tipo) VALUES (?,?,?,?)");
            content.toString();
            qDebug() << content;
        }

        query.addBindValue(m_ID);
        query.addBindValue(content);
        query.addBindValue(rol);
        query.addBindValue(tipo);

        query.exec();

        if(query.numRowsAffected() > 0){
            return true;
        }else{
            m_status_server = false; //bobo
            return false;
        }

    }else{
        m_status_server = false;
        return false;
    }
}

void Chat::sendMessage(const QString& text, const QString& role = "user"){
    isLoading(true);
    if(m_messages.isEmpty() && role == "user"){
        m_ID = crearChat(text);
        if (m_AI == "neumann")
            sendMessage(neumann, "system");
        else if(m_AI == "davinci")
            sendMessage(davinci, "system");
        else if(m_AI == "chaplin")
            sendMessage(chaplin, "system");
        else
            sendMessage(mupi, "system");
    }
    saveMessage(text, role, 1);
    QUrl url("https://api.openai.com/v1/chat/completions");
    QNetworkRequest request(url);

    // Set the necessary headers
    request.setRawHeader("Content-Type", "application/json");
    request.setRawHeader("Authorization", "Bearer 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");

    // Create the JSON object for the body
    QJsonObject json;
    json.insert("model", "gpt-3.5-turbo");

    m_messages.append(createMessage(role, text));

    json.insert("messages", m_messages);

    // Create a network access manager
    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    if(role != "system"){
        // Connect the finished signal to a slot
        connect(manager, &QNetworkAccessManager::finished, this, &Chat::onPostRequestFinished);
    }

    // Send the POST request
    manager->post(request, QJsonDocument(json).toJson());
    isLoading(false);
}

void Chat::onPostRequestFinished(QNetworkReply *reply) {
    if (reply->error()) {
        qDebug() << reply->errorString();
        int statusCode = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();
        qDebug() << "HTTP status code:" << statusCode;
        return;
    }

    QString responseString = QString::fromUtf8(reply->readAll());
    QJsonDocument doc = QJsonDocument::fromJson(responseString.toUtf8());
    QJsonObject jsonObj = doc.object();
    QString text = jsonObj.value("choices").toArray().at(0).toObject().value("message").toObject().value("content").toString();
    if(text.isEmpty()){
        text = "Error del lado del servidor: Contactar con el desarrollador.";
    }else{
        m_messages.append(createMessage("assistant",text));
        saveMessage(text, "assistant", 1);
        //Chequear si existe ya el primer mensaje de usuario de la conversacion
        if(m_messages.at(1).toObject().value("role").toString() == "user" && m_messages.size() == 3){
            emit nuevoChat(m_messages.at(1).toObject().value("user").toString(), m_ID);
        }else{
            qDebug() << "WASA WASA" << text;
            responseData(text.trimmed());
            emit nuevoMensaje(text.trimmed());
        }
    }
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

void Chat::clipText(const QString& text){
    qDebug()<<text;
    QClipboard *clipboard = QGuiApplication::clipboard();
    clipboard->setText(text);
}

void Chat::setear(const QString ID, bool es_nuevo)
{

    if(es_nuevo){
        setAI(ID); //Seteando el modelo de inteligencia artificial

        //Limpiando las variables. Volviendolos a definir.
        m_messages = {};
        m_ID = 0;
        m_nombre = "";
        m_tema = "";
        m_fecha = "";
        m_es_plantilla = false;
    }else{
        QSqlQuery query;
        query.prepare("SELECT * FROM chats WHERE ID = ?");
        query.addBindValue(ID);
        query.exec();
        query.next();
        m_ID = query.value(0).toInt();
        qDebug() << "Chat_cpp: m_ID" << m_ID;
        m_nombre = query.value(2).toString();
        m_tema = query.value(3).toString();
        m_fecha = query.value(4).toString();
        m_AI = query.value(5).toString();
        qDebug() << "Chat_cpp: m_AI" << m_AI;
        m_es_plantilla = query.value(6).toBool();
    }
}

void Chat::obtenerMensajes(int ID){
    QSqlQuery query;
    query.prepare("SELECT * FROM chats_messages WHERE chat_id = ?");
    query.addBindValue(ID);
    query.exec();
    m_messages = {};
    qDebug () << "Llego a obtener mensajes" << ID;
    while(query.next()){
        m_messages.append(createMessage(query.value(4).toString(),query.value(2).toString()));
        qDebug() << "content: " << query.value(2).toString() << "rol: " << query.value(4).toString();
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

void Chat::es_plantilla(bool newEs_plantilla)
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
