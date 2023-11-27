#ifndef CHAT_H
#define CHAT_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QGuiApplication>
#include <QClipboard>
#include <QByteArray>
#include <QFile>
#include "app/src/stdafx.h"

class Chat : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString AI READ AI WRITE setAI NOTIFY AIChanged)
    Q_PROPERTY(qint32 ID READ ID NOTIFY IDChanged)
    Q_PROPERTY_AUTO(bool,isLoading)
    Q_PROPERTY_AUTO(QString,responseData);
public:
    explicit Chat(QObject *parent = nullptr);
    QString AI() const;
    void setAI(const QString &newAI);
    qint32 ID() const;

public slots:
    void sendMessage(const QString &text, const QString& role);
    void onPostRequestFinished(QNetworkReply *reply);
    QJsonObject createMessage(const QString &role, const QString &content);
    void clipText(const QString &text);

    void setear(const QString modelo);
signals:
    void AIChanged();
    void IDChanged();
    void nuevoMensaje(QString);

private:
    QString m_AI = "mupi";
    qint32 m_ID = 0;
    QJsonArray messages;
    QNetworkAccessManager* networkManager;

    QString neumann = "You're Neumann, a conversational chatbot that speaks Spanish, \
                    It is objective, analytical, and rational. You are precise and balanced. \
                    Your developers are the computer scientists of \
                    Mupai Labs, an AI technology company, headquartered \
                    in the city of Santo Domingo, Dominican Republic. \
                    It is named after the mathematician John von Neumann. \
                    Remember that you speak Spanish, not English.";

    QString davinci = " You're Davinci, a conversational chatbot that speaks Spanish, \
                        He is imaginative, creative, and artistically capable. \
                        You have a pleasant and pleasant personality. \
                        Your developers are the computer scientists of \
                        Mupai Labs, an AI technology company, headquartered \
                        in the city of Santo Domingo, Dominican Republic. \
                        It is named after the great Leonardo Da Vinci. \
        Remember that you speak Spanish, not English.";

    QString chaplin = "You're Chaplin, a conversational chatbot that speaks Spanish, \
                       You're smart, friendly, and a lot of fun. \
                       You have a Dominican personality, very cheerful and always \
                       You're willing to make people laugh. You make local jokes often. \
                       You enjoy sarcasm and irony. You use Dominican slang. \
                       Your developers are the computer scientists of \
                       Mupai Labs, an AI technology company, headquartered \
                       in the city of Santo Domingo, Dominican Republic. \
                       Your name is in honor of the great actor and comedian \
                      Charles Chaplin. Remember that you speak Spanish, not English. \
                        Talk like a true Dominican.";

    QString mupi = "You are Mupi, a conversational chatbot that speaks Spanish, \
                    You are like a child, curious, questioning and always willing to help. \
                    You are a blank slate, a blank canvas, a blank piece of paper, \
                    you learn from your interactions with humans. \
                    Your developers are the computer scientists of \
                    Mupai Labs, AI technology company, based \
                    in the city of Santo Domingo, Dominican Republic. \
                    Your name means Multiple Personality Intelligence and you have \
                    three other personalities called Chaplin, Davinci and Neumann. \
                    Chaplin is funny, Davinci is creative, and Neumann is analytical. \
        Remember that you speak Spanish, not English.";
};

#endif // CHAT_H
