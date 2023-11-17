#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include <QString>

class Login : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString email READ email NOTIFY emailChanged)
    Q_PROPERTY(QString password READ password NOTIFY passwordChanged)

public:
    explicit Login(QObject *parent = nullptr);

    QString email() const;

    QString password() const;

    Q_INVOKABLE void loguearse();

public slots:
    void loguearse_con_google();
    void ir_a_registro();

signals:

    void emailChanged();

    void passwordChanged();

private:

    QString m_email = "kmsdkfmlskdmf";
    QString m_password;
};

#endif // LOGIN_H
