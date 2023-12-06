#include "Template.h"
#include <QtDebug>
#include "session.h"
#define session Session::getInstance().getSession()

Plantilla::Plantilla(QObject *parent)
    : QObject{parent}
{

}

int Plantilla::ID() const
{
    return m_ID;
}

int Plantilla::user_id() const
{
    return m_user_id;
}

QString Plantilla::nombre() const
{
    return m_nombre;
}

void Plantilla::setNombre(const QString &newNombre)
{
    if (m_nombre == newNombre)
        return;
    m_nombre = newNombre;
    emit nombreChanged();
}

QString Plantilla::desc() const
{
    return m_desc;
}

void Plantilla::setDesc(const QString &newDesc)
{
    if (m_desc == newDesc)
        return;
    m_desc = newDesc;
    emit descChanged();
}

QString Plantilla::instr() const
{
    return m_instr;
}

void Plantilla::setInstr(const QString &newInstr)
{
    if (m_instr == newInstr)
        return;
    m_instr = newInstr;
    emit instrChanged();
}

bool Plantilla::publica() const
{
    return m_publica;
}

void Plantilla::setPublica(bool newPublica)
{
    if (m_publica == newPublica)
        return;
    m_publica = newPublica;
    emit publicaChanged();
}

QString Plantilla::img() const
{
    return m_img;
}

void Plantilla::setImg(const QString &newImg)
{
    if (m_img == newImg)
        return;
    m_img = newImg;
    emit imgChanged();
}

void Plantilla::guardar()
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
            if(db.openConnection()){
                qDebug() << "Se conecto";

                QSqlQuery query;

                    if(m_ID != 0){
                        query.prepare("UPDATE templates SET nombre = :nombre, descripcion = :desc, instrucciones = :ins, publica = :publica, img = :img WHERE ID = :id");
                        query.bindValue(":nombre",m_nombre);
                        query.bindValue(":desc", m_desc);
                        query.bindValue(":ins", m_instr);
                        if(m_publica){
                            query.bindValue(":publica",true);
                        }else{
                            query.bindValue(":publica",false);
                        }

                        if(m_img == ""){
                            query.bindValue(":img","0");
                        }else{

                            if(m_img.contains("file:///"))
                                query.bindValue(":img",convertFileToBase64(m_img));
                            else {
                                query.bindValue(":img", m_img);
                            }

                        }
                        query.bindValue(":id", m_ID);
                        if(query.exec()){
                            m_status_form = 1;
                        }else{
                            m_status_server = false;
                        }
                        return;
                    }

                    query.prepare("INSERT INTO templates (user_id, nombre, descripcion, instrucciones, publica, img)"
                                  "VALUES (:id,:nombre,:desc,:ins,:publica,:img)");
                    query.bindValue(":id",session.value("user/id").toInt());
                    query.bindValue(":nombre",m_nombre);
                    query.bindValue(":desc",m_desc);
                    query.bindValue(":ins",m_instr);
                    if(m_publica){
                        query.bindValue(":publica",true);
                    }else{
                        query.bindValue(":publica",false);
                    }

                    if(m_img == "")
                        query.bindValue(":img","0");
                    else
                        query.bindValue(":img",convertFileToBase64(m_img));

                    query.exec();

                    if(query.numRowsAffected() > 0){
                        m_status_form = 1;
                        //Seleccionar el ID de la plantilla recien creada
                        query.prepare("SELECT ID FROM templates ORDER BY ID DESC LIMIT 1");
                        query.exec();
                        while (query.next()) {
                            m_ID = query.value("ID").toInt();
                        }
                    }else{
                        m_status_server = false;
                    }
                    //db.closeConnection();
            }else{
                m_status_server = false;
            }

        }

}

QByteArray Plantilla::convertFileToBase64(QString filePath)
{
        filePath.replace("file:///", "");
        QFile file(filePath);

        if (file.open(QIODevice::ReadOnly)) {
            return file.readAll().toBase64();
        }

        return QByteArray();
}


QList<QObject*> Plantilla::getTemplates(bool publico = true, int limite = -1)
{
        //Declarar objeto con propiedades title, description, etc
        QList<QObject*> plantillas;
        if(db.openConnection()){

            QSqlQuery query;

            if(publico){
                if(limite > 0)
                    query.prepare("SELECT * FROM templates WHERE publica = true ORDER BY ID DESC LIMIT :limit");
                else
                    query.prepare("SELECT * FROM templates WHERE publica = true ORDER BY ID DESC");

                if(limite > 0)
                    query.bindValue(":limit", limite);
            }else{
                if(limite > 0)
                    query.prepare("SELECT * FROM templates WHERE user_id = :user_id ORDER BY ID DESC LIMIT :limit");
                else
                    query.prepare("SELECT * FROM templates WHERE user_id = :user_id ORDER BY ID DESC");

                query.bindValue(":user_id",session.value("user/id").toInt());

                if(limite > 0)
                    query.bindValue(":limit",limite);
            }

            query.exec();

            while (query.next()) {
                Plantilla *plantilla = new Plantilla();
                plantilla->m_ID = query.value("ID").toInt();
                plantilla->m_user_id = query.value("user_id").toInt();
                plantilla->m_nombre = query.value("nombre").toString();
                plantilla->m_desc = query.value("descripcion").toString();
                plantilla->m_instr = query.value("instrucciones").toString();
                plantilla->m_publica = query.value("publica").toBool();
                plantilla->m_img = query.value("img").toString();
                plantillas.append(plantilla);
            }
            //db.closeConnection();
        }else{
            m_status_server = false;
        }

        return plantillas;
}

void Plantilla::setear(const int ID, bool es_nuevo)
{
    if(es_nuevo){
        m_ID = 0;
        m_user_id = 0;
        m_nombre = "";
        m_desc = "";
        m_instr = "";
        m_publica = 0;
        m_img = "";
        m_status_form = 0;
        m_status_server = true;
        m_reporte_publico = true;
    }else{
        if(!db.openConnection()){
            m_status_server = false;
            return;
        }

        QSqlQuery query;
        query.prepare("SELECT * FROM templates WHERE ID = :id");
        query.bindValue(":id",ID);
        query.exec();
        query.next();
        m_ID = query.value("ID").toInt();
        m_nombre = query.value("nombre").toString();
        m_desc = query.value("descripcion").toString();
        m_instr = query.value("instrucciones").toString();
        m_publica = query.value("publica").toBool();
        m_img = query.value("img").toString();
        //db.closeConnection();
    }
}

bool Plantilla::eliminar(const int ID)
{
    if(!db.openConnection()){
        m_status_server = false;
        return false;
    }

    QSqlQuery query;
    query.prepare("DELETE FROM templates WHERE ID = :id");
    query.bindValue(":id",ID);
    query.exec();
    if(query.numRowsAffected() > 0){
        return true;
    }else{
        m_status_server = false;
        return false;
    }
    //db.closeConnection();
}


int Plantilla::status_form() const
{
        return m_status_form;
}

bool Plantilla::status_server() const
{
        return m_status_server;
}

bool Plantilla::reporte_publico() const
{
        return m_reporte_publico;
}

void Plantilla::setReporte_publico(bool newReporte_publico)
{
        if (m_reporte_publico == newReporte_publico)
            return;
        m_reporte_publico = newReporte_publico;
        emit reporte_publicoChanged();
}
