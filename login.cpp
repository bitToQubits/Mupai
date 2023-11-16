#include "login.h"
#include <QString>

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

}

void Login::loguearse_con_google()
{

}

void Login::ir_a_registro()
{

}
