﻿#ifndef CHATCONTROLLER_H
#define CHATCONTROLLER_H

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
#include "../stdafx.h"

class ChatController : public QObject
{
    Q_OBJECT
    Q_PROPERTY_AUTO(bool,isLoading)
    Q_PROPERTY_AUTO(QString,responseData);
public:
    explicit ChatController(QObject *parent = nullptr);

    Q_INVOKABLE void sendMessage(const QString& text);
    Q_INVOKABLE void clipText(const QString& text);
public slots:
    void onPostRequestFinished(QNetworkReply *reply);
private:
    QJsonObject createMessage(const QString& role,const QString& content);

private:
    QNetworkAccessManager* networkManager;
    QJsonArray messages;
    QString baseKey = "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";
};

#endif // CHATCONTROLLER_H
