#include "User.h"
#include "database.h"

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

void User::limpiarSesion()
{
    session.clear();
    obtenerDatos();
}

int User::guardarConfiguracion()
{
    if(m_firstName.size() == 0 || m_lastName.size() == 0 || m_email.size() == 0){
        obtenerDatos();
        return -2; //Error: no se pueden dejar vacios alguno de estos campos
    }

    if(!createConnection()){
        return -1; //Error: no se pudo crear la conexion
    }

    QSqlQuery query;
    query.prepare("SELECT ID FROM users WHERE user_email = ? and ID != ?");
    query.addBindValue(m_email);
    query.addBindValue(m_ID);

    if(!query.exec()){
        return -1; //Error: no se pudo consultar el query
    }

    if(query.last()){
        obtenerDatos();
        return 0; //Error: email ya existe en la db
    }

    query.clear();

    query.prepare("UPDATE users SET first_name = ?, last_name = ?, user_email = ?, password = ? WHERE "
                  "ID = ?");
    query.addBindValue(m_firstName);
    query.addBindValue(m_lastName);
    query.addBindValue(m_email);
    query.addBindValue(m_password);
    query.addBindValue(m_ID);
    if(query.exec()){
        session.setValue("user/name", m_firstName);
        session.setValue("user/last_name", m_lastName);
        session.setValue("user/email", m_email);
        session.setValue("user/password", m_password);
        return 1; //success
    }else{
        return -1; //Error: no se pudo realizar la consulta
    }

}

QString User::password() const
{
    return m_password;
}
