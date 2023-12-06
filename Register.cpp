#include "Register.h"
#include <QtDebug>
#include <QString>

Register::Register(QObject *parent)
    : QObject{parent}
{

}

QString Register::email() const
{
    return m_email;
}

void Register::setEmail(const QString &newEmail)
{
    if (m_email == newEmail)
        return;
    m_email = newEmail;
    emit emailChanged();
}

QString Register::password() const
{
    return m_password;
}

void Register::setPassword(const QString &newPassword)
{
    if (m_password == newPassword)
        return;
    m_password = newPassword;
    emit passwordChanged(m_password);
}

void Register::registrarse()
{
    m_confirmPassword = m_confirmPassword.trimmed();
    m_password = m_password.trimmed();
    m_email = m_email.trimmed();
    m_firstName = m_firstName.trimmed();
    m_lastName = m_lastName.trimmed();

    if( m_email.size() == 0
        || m_password.size() == 0
        || m_confirmPassword.size() == 0
        || m_firstName.size() == 0
        || m_lastName.size() == 0){

        m_status_form = 0;

    }else{
        if(m_password != m_confirmPassword){
            m_status_form = -1;
            return;
        }

            m_status_server = true;
            QSqlQuery query;

            query.prepare("SELECT ID FROM users WHERE user_email = :user_email");
            query.bindValue(":user_email",m_email);

            query.exec();

            if(query.size() == 0){
                query.prepare("INSERT INTO users (first_name, last_name, user_email, password)"
                              "VALUES (:firstname,:lastname,:email,:password)");
                query.bindValue(":firstname",m_firstName);
                query.bindValue(":lastname",m_lastName);
                query.bindValue(":email",m_email);
                query.bindValue(":password",m_password);

                if(query.exec()){
                    m_status_form = 1;
                    m_status_server = true;
                }else{
                    m_status_server = false;
                }
            }else{
                m_status_form = -2;
                emit emailExists();
            }

    }
}

void Register::clear()
{
    m_email = "";
    m_password = "";
    m_status_form = 0;
    m_status_server = true;
    m_confirmPassword = "";
    m_firstName = "";
    m_lastName = "";
}

int Register::status_form() const
{
    return m_status_form;
}

bool Register::status_server() const
{
    return m_status_server;
}

void Register::registrarse_con_google()
{

}

QString Register::confirmPassword() const
{
    return m_confirmPassword;
}

void Register::setConfirmPassword(const QString &newConfirmPassword)
{
    if (m_confirmPassword == newConfirmPassword)
        return;
    m_confirmPassword = newConfirmPassword;
    emit confirmPasswordChanged(m_confirmPassword);
}

QString Register::firstName() const
{
    return m_firstName;
}

void Register::setFirstName(const QString &newFirstName)
{
    if (m_firstName == newFirstName)
        return;
    m_firstName = newFirstName;
    emit firstNameChanged();
}

QString Register::lastName() const
{
    return m_lastName;
}

void Register::setlastName(const QString &newLastName)
{
    if (m_lastName == newLastName)
        return;
    m_lastName = newLastName;
    emit lastNameChanged();
}

QString Register::error_server() const
{
    return m_error_server;
}
