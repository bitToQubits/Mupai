#ifndef REGISTER_H
#define REGISTER_H

#include <QObject>
#include <QString>

class Register : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString firstName READ firstName WRITE setFirstName NOTIFY firstNameChanged)
    Q_PROPERTY(QString lastName READ lastName WRITE setlastName NOTIFY lastNameChanged)
    Q_PROPERTY(QString email READ email WRITE setEmail NOTIFY emailChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)
    Q_PROPERTY(QString confirmPassword READ confirmPassword
                        WRITE setConfirmPassword NOTIFY confirmPasswordChanged)
    Q_PROPERTY(int status_form READ status_form NOTIFY statusChanged)
    Q_PROPERTY(bool status_server READ status_server NOTIFY statusServerChanged)

public:
    explicit Register(QObject *parent = nullptr);

    QString email() const;
    void setEmail(const QString &newEmail);

    QString password() const;
    void setPassword(const QString &newPassword);

    Q_INVOKABLE void registrarse();

    int status_form() const;

    bool status_server() const;

    QString confirmPassword() const;
    void setConfirmPassword(const QString &newConfirmPassword);

    QString firstName() const;
    void setFirstName(const QString &newFirstName);

    QString lastName() const;
    void setlastName(const QString &newLastName);

public slots:
    void registrarse_con_google();
    void clear();

signals:
    void emailChanged();
    void passwordChanged(QString p);

    void statusChanged();

    void statusServerChanged();

    void confirmPasswordChanged(QString cP);

    void firstNameChanged();

    void lastNameChanged();

    void emailExists();

private:
    QString m_email = "";
    QString m_password = "";
    int m_status_form = 0;
    bool m_status_server = true;
    QString m_confirmPassword = "";
    QString m_firstName = "";
    QString m_lastName = "";
};

#endif // REGISTER_H
