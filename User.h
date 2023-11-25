#ifndef USER_H
#define USER_H

#include <QObject>
#include <session.h>
#include <QString>

#define session Session::getInstance().getSession()

class User : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qint32 ID READ ID NOTIFY IDChanged)
    Q_PROPERTY(QString firstName READ firstName WRITE setFirstName NOTIFY firstNameChanged)
    Q_PROPERTY(QString lastName READ lastName WRITE setlastName NOTIFY lastNameChanged)
    Q_PROPERTY(QString email READ email WRITE setEmail NOTIFY emailChanged)
    Q_PROPERTY(QString photo READ photo WRITE photo NOTIFY IDChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)


public:
    explicit User(QObject *parent = nullptr);
    qint32 ID() const;

    QString firstName() const;
    void setFirstName(const QString &newFirstName);

    QString lastName() const;
    void setlastName(const QString &newLastName);

    QString email() const;
    void setEmail(const QString &newEmail);

    QString photo() const;
    void photo(const QString &newPhoto);

    void setPassword(const QString &newPassword);

    QString password() const;

public slots:
    void obtenerDatos();
    void limpiarSesion();
    int guardarConfiguracion();

signals:
    void IDChanged();
    void firstNameChanged();

    void lastNameChanged();

    void emailChanged();

    void passwordChanged();

private:
    qint32 m_ID = session.value("user/id",0).toInt();
    QString m_firstName = session.value("user/name","").toString();
    QString m_lastName = session.value("user/last_name","").toString();
    QString m_email = session.value("user/email","").toString();
    QString m_photo = session.value("user/imgbase","").toString();
    QString m_password = session.value("user/password","").toString();
};

#endif // USER_H
