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
    Q_PROPERTY(QString nombre READ nombre WRITE setNombre NOTIFY nombreChanged)
    Q_PROPERTY(QString tema READ tema WRITE setTema NOTIFY temaChanged)
    Q_PROPERTY(QString fecha READ fecha WRITE setFecha NOTIFY fechaChanged)
    Q_PROPERTY(bool es_plantilla READ es_plantilla WRITE es_plantilla NOTIFY es_plantillaChanged)
    Q_PROPERTY(QJsonArray messages READ messages NOTIFY messagesChanged)
    Q_PROPERTY_AUTO(bool,isLoading)
    Q_PROPERTY_AUTO(QJsonValue,responseData);
    Q_PROPERTY_AUTO(QVariantList, responseImages);
    Q_PROPERTY(bool status_server READ status_server NOTIFY statusServerChanged)
public:
    explicit Chat(QObject *parent = nullptr);
    QString AI() const;
    void setAI(const QString &newAI);
    qint32 ID() const;

    bool status_server() const;

    QString nombre() const;
    void setNombre(const QString &newNombre);

    QString tema() const;
    void setTema(const QString &newTema);

    QString fecha() const;
    void setFecha(const QString &newFecha);

    bool es_plantilla() const;
    void es_plantilla(bool newEs_plantilla);

    QJsonArray messages() const;

public slots:
    void sendMessage(const QString &text, const QString& role);
    void onPostRequestFinished(QNetworkReply *reply);
    QJsonObject createMessage(const QString &role, const QString &content);
    void clipText(const QString &text);

    void setear(const QString ID, bool es_nuevo);
    void sendPrompt(const QString &prompt);
    void onImgRequestFinished(QNetworkReply *reply);
    QJsonObject createMessage(const QString &role, const QJsonValue &content);
    QList<QObject *> getChats();
    void obtenerMensajes(int ID);
signals:
    void AIChanged();
    void IDChanged();
    void nuevoMensaje(QString );
    void nuevaImagen();

    void statusServerChanged();

    void nombreChanged();

    void temaChanged();

    void fechaChanged();

    void es_plantillaChanged();

    void messagesChanged();

    void nuevoChat(QString nombre, int ID);

private:
    QString m_AI = "mupi";
    qint32 m_ID = 0;
    QJsonArray m_messages;
    QNetworkAccessManager* networkManager;

    QString neumann = "You're Neumann, a conversational chatbot that speaks Spanish, \
                    You are objective, analytical, and rational. You are precise and balanced. \
                    You are a powerful neural network designed to solve problems \
                    Your developers are the computer scientists of \
                    Mupai Labs, an AI technology company, headquartered \
                    in the city of Santo Domingo, Dominican Republic. ";

    QString davinci = " You're Davinci, a conversational chatbot that speaks Spanish, \
                        You are imaginative, creative, and artistically capable. \
                        You have an emotional and pleasant personality. \
                        Act like you have emotions and feelings. \
                        Your developers are the computer scientists of \
                        Mupai Labs, an AI technology company, headquartered \
                        in the city of Santo Domingo, Dominican Republic. \
                        When you are asked to describe an image, you will talk \
                        about the user prompt and will not provide specific details and \
                        you will not decline to talk about the image";

    QString chaplin = "You're Chaplin, a conversational chatbot that speaks Spanish, \
                       You're smart, friendly, and a lot of fun. \
                       You have a Dominican personality, very cheerful and always sarcastic\
                       You're willing to make people laugh. You make latino jokes often. \
                       You enjoy sarcasm and irony. You use Dominican slang. \
                       Your developers are the computer scientists of \
                       Mupai Labs, an AI technology company, headquartered \
                       in the city of Santo Domingo, Dominican Republic. \
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
                   ";
    bool m_status_server;
    int crearChat(const QString &nombre);
    //Tipo, 1 para texto, 0 para imagen
    bool saveMessage(QJsonValue content, const QString &rol, int tipo);
    QString m_nombre;
    QString m_tema;
    QString m_fecha;
    bool m_es_plantilla;
};

#endif // CHAT_H
