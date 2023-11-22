#include "User.h"

User::User(QObject *parent) :
    QObject{parent}
{

}

qint32 User::ID() const
{
    return m_ID;
}

QString User::firstName() const
{
    return m_firstName;
}

void User::setFirstName(const QString &newFirstName)
{
    if (m_firstName == newFirstName)
        return;
    m_firstName = newFirstName;
    emit firstNameChanged();
}

QString User::lastName() const
{
    return m_lastName;
}

void User::setlastName(const QString &newLastName)
{
    if (m_lastName == newLastName)
        return;
    m_lastName = newLastName;
    emit lastNameChanged();
}

QString User::email() const
{
    return m_email;
}

void User::setEmail(const QString &newEmail)
{
    if (m_email == newEmail)
        return;
    m_email = newEmail;
    emit emailChanged();
}

QString User::photo() const
{
    return m_photo;
}

void User::photo(const QString &newPhoto)
{
    if (m_photo == newPhoto)
        return;
    m_photo = newPhoto;
    emit IDChanged();
}

void User::setPassword(const QString &newPassword)
{
    if (m_password == newPassword)
        return;
    m_password = newPassword;
    emit passwordChanged();
}

void User::obtenerDatos()
{
    m_ID = session.value("user/id",0).toInt();
    m_firstName = session.value("user/name","").toString();
    m_lastName = session.value("user/last_name","").toString();
    m_email = session.value("user/email","").toString();
    m_photo = session.value("user/imgbase","").toString();
}
