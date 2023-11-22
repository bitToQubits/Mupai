#include "login.h"
#include <QString>
#include <QtDebug>
#include "database.h"
#include <session.h>
#define session Session::getInstance().getSession()

Login::Login(QObject *parent)
    : QObject{parent}
{

}


QString Login::email() const
{
    return m_email;
}

QString Login::password() const
{
    return m_password;
}

void Login::loguearse()
{
    m_email = m_email.trimmed();
    m_password = m_password.trimmed();

    if(m_email.size() == 0 || m_password.size() == 0){
        m_status_form = false;
    }else{
        if(createConnection()){
            QSqlQuery query;
            query.prepare("SELECT * FROM users WHERE user_email = ? AND "
                          "password = ? LIMIT 1");
            query.addBindValue(m_email);
            query.addBindValue(m_password);
            query.exec();
            if(query.size() == 0){
                m_status_form = false;
            }else{
                while(query.next()){
                    qint32 ID_user = query.value(0).toInt();
                    QString first_name = query.value(1).toString();
                    QString last_name = query.value(2).toString();
                    QString email = query.value(3).toString();
                    QString creation_date = query.value(4).toString();
                    QString imgbase = query.value(5).toString();

                    session.setValue("user/id", ID_user);
                    session.setValue("user/name", first_name);
                    session.setValue("user/last_name", last_name);
                    session.setValue("user/email", email);
                    session.setValue("user/creation_date", creation_date);
                    session.setValue("user/imgbase", imgbase);


                }
                m_status_form = true;
            }
        }else{
            m_status_server = false;
        }
    }
}

void Login::loguearse_con_google()
{

}

void Login::setEmail(const QString &newEmail)
{
    if (m_email == newEmail)
        return;
    m_email = newEmail;
    emit emailChanged();
}

void Login::setPassword(const QString &newPassword)
{
    if (m_password == newPassword)
        return;
    m_password = newPassword;
    emit passwordChanged();
}

bool Login::status_form() const
{
    return m_status_form;
}

bool Login::status_server() const
{
    return m_status_server;
}

void Login::clear(){
    m_email = "";
    m_password = "";
    m_status_form = false;
    m_status_server = true;
}
