#include "Graficos.h"
#include <session.h>
#include <QSqlError>
#define session Session::getInstance().getSession()

Graficos::Graficos(QObject *parent)
    : QObject{parent}
{

}

void Graficos::getData(){
    QSqlQuery query;
    query.prepare("SELECT CASE WHEN c.es_plantilla = true THEN t.nombre ELSE c.inteligencia END AS nombre, COUNT(c.inteligencia) AS numero FROM chats c LEFT JOIN templates t ON (cast_to_int(c.inteligencia, 0) = t.ID AND c.es_plantilla = true) WHERE c.user_id = :user_id GROUP BY (c.inteligencia, c.es_plantilla, t.nombre)");
    query.bindValue(":user_id",session.value("user/id").toInt());

    if(query.exec()){
        qDebug() << "Query OK";
    }else{
        qDebug() << "Query ERROR";
        //Imprimir ultimo error
        qDebug() << query.lastError().text();
    }
        ;
    //Crear mapa de resultados
    QVariantList nombres;
    QVariantList contabilidad;
    while(query.next()){
        nombres.append(query.value("nombre").toString());
        qDebug() << query.value("nombre").toString();
        contabilidad.append(query.value("numero").toInt());
        qDebug() << query.value("numero").toString();
    }
    m_numeros = contabilidad;
    m_nombres = nombres;
}

QVariantList Graficos::nombres() const
{
    return m_nombres;
}

void Graficos::setNombres(const QVariantList &newNombres)
{
    if (m_nombres == newNombres)
        return;
    m_nombres = newNombres;
    emit nombresChanged();
}

QVariantList Graficos::numeros() const
{
    return m_numeros;
}

void Graficos::setNumeros(const QVariantList &newNumeros)
{
    if (m_numeros == newNumeros)
        return;
    m_numeros = newNumeros;
    emit numerosChanged();
}
