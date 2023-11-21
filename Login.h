#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include <QString>

class Login : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString email READ email WRITE setEmail NOTIFY emailChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)
    Q_PROPERTY(bool status_form READ status_form NOTIFY statusChanged)
    Q_PROPERTY(bool status_server READ status_server NOTIFY statusServerChanged)

public:
    explicit Login(QObject *parent = nullptr);

    QString email() const;

    QString password() const;

    Q_INVOKABLE void loguearse();

    void setEmail(const QString &newEmail);

    void setPassword(const QString &newPassword);

    bool status_form() const;

    bool status_server() const;

public slots:
    void loguearse_con_google();
    void clear();

signals:

    void emailChanged();

    void passwordChanged();

    void statusChanged();

    void statusServerChanged();

private:

    QString m_email;
    QString m_password;
    bool m_status_form = false;
    bool m_status_server = true;
};

#endif // LOGIN_H
