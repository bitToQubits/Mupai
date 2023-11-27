#include "Chat.h"

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

void Chat::sendMessage(const QString& text, const QString& role = "user"){
    isLoading(true);
    QUrl url("https://api.openai.com/v1/chat/completions");
    QNetworkRequest request(url);

    // Set the necessary headers
    request.setRawHeader("Content-Type", "application/json");
    request.setRawHeader("Authorization", "Bearer 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");

    // Create the JSON object for the body
    QJsonObject json;
    json.insert("model", "gpt-3.5-turbo");

    if(messages.isEmpty() && role == "user"){
        if (m_AI == "neumann")
            sendMessage(neumann, "system");
        else if(m_AI == "davinci")
            sendMessage(davinci, "system");
        else if(m_AI == "chaplin")
            sendMessage(chaplin, "system");
        else
            sendMessage(mupi, "system");
        qDebug() << "AI:" << m_AI;
    }

    messages.append(createMessage(role, text));

    json.insert("messages", messages);

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
        messages.append(createMessage("assistant",text));
    }
    responseData(text.trimmed());
    emit nuevoMensaje(text.trimmed());
}

QJsonObject Chat::createMessage(const QString& role,const QString& content){
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

void Chat::setear(const QString modelo)
{
    //Limpiando las variables miembros.
    setAI(modelo);
    qDebug() << m_AI;

    //Limpiando los vectores. Declarando uno nuevo.
    messages = {};
}
