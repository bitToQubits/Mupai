#include "ChatController.h"

ChatController::ChatController(QObject *parent)
    : QObject{parent}
{
    isLoading(false);
    networkManager = new QNetworkAccessManager(this);
}


void ChatController::sendMessage(const QString& text){
    isLoading(true);
    QUrl url("https://api.openai.com/v1/chat/completions");
    QNetworkRequest request(url);

    // Set the necessary headers
    request.setRawHeader("Content-Type", "application/json");
    request.setRawHeader("Authorization", "Bearer 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");

    // Create the JSON object for the body
    QJsonObject json;
    json.insert("model", "gpt-3.5-turbo");
    messages.append(createMessage("user", text));
    json.insert("messages", messages);

    // Create a network access manager
    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    // Connect the finished signal to a slot
    connect(manager, &QNetworkAccessManager::finished, this, &ChatController::onPostRequestFinished);

    // Send the POST request
    manager->post(request, QJsonDocument(json).toJson());
    isLoading(false);
}

void ChatController::onPostRequestFinished(QNetworkReply *reply) {
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
    reply->deleteLater();
    qDebug() << "Response:" << responseString;
}

QJsonObject ChatController::createMessage(const QString& role,const QString& content){
    QJsonObject message;
    message.insert("role",role);
    message.insert("content",content);
    return message;
}

void ChatController::clipText(const QString& text){
    qDebug()<<text;
    QClipboard *clipboard = QGuiApplication::clipboard();
    clipboard->setText(text);
}
