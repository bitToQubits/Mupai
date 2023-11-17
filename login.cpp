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
    m_email = "Te has logueado de manera exitosa! " + m_email;
    m_password = "Tu clave es: " + m_password;

    emit emailChanged();
    emit passwordChanged();
}

void Login::ir_a_registro()
{

}
