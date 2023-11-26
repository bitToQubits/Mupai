#include "Template.h"
#include <QtDebug>
#include "database.h"
#include "session.h"
#define session Session::getInstance().getSession()

Template::Template(QObject *parent)
    : QObject{parent}
{

}

int Template::ID() const
{
    return m_ID;
}

int Template::user_id() const
{
    return m_user_id;
}

QString Template::nombre() const
{
    return m_nombre;
}

void Template::setNombre(const QString &newNombre)
{
    if (m_nombre == newNombre)
        return;
    m_nombre = newNombre;
    emit nombreChanged();
}

QString Template::desc() const
{
    return m_desc;
}

void Template::setDesc(const QString &newDesc)
{
    if (m_desc == newDesc)
        return;
    m_desc = newDesc;
    emit descChanged();
}

QString Template::instr() const
{
    return m_instr;
}

void Template::setInstr(const QString &newInstr)
{
    if (m_instr == newInstr)
        return;
    m_instr = newInstr;
    emit instrChanged();
}

bool Template::publica() const
{
    return m_publica;
}

void Template::setPublica(bool newPublica)
{
    if (m_publica == newPublica)
        return;
    m_publica = newPublica;
    emit publicaChanged();
}

QString Template::img() const
{
    return m_img;
}

void Template::setImg(const QString &newImg)
{
    if (m_img == newImg)
        return;
    m_img = newImg;
    emit imgChanged();
}

void Template::guardar()
{

        m_nombre = m_nombre.trimmed();
        m_desc = m_desc.trimmed();
        m_instr = m_instr.trimmed();

        if( m_nombre.size() == 0
            || m_desc.size() == 0
            || m_instr.size() == 0
            ){

            m_status_form = 0;

        }else{
            if(createConnection()){

                QSqlQuery query;


                    query.prepare("INSERT INTO templates (user_id, nombre, descripcion, instrucciones, publica, img)"
                                  "VALUES (?,?,?,?,?,?)");
                    query.addBindValue(session.value("user/id").toInt());
                    query.addBindValue(m_nombre);
                    query.addBindValue(m_desc);
                    query.addBindValue(m_instr);
                    query.addBindValue(m_publica);
                    query.addBindValue(m_img);
                    query.exec();

                    if(query.numRowsAffected() > 0){
                        m_status_form = 1;
                    }else{
                        m_status_server = false;
                    }

            }else{
                m_status_server = false;
            }

        }

}

int Template::status_form() const
{
        return m_status_form;
}

bool Template::status_server() const
{
        return m_status_server;
}
