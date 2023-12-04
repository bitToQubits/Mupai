#ifndef DATABASE_H
#define DATABASE_H

#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QSqlQuery>
#include <QSqlError>

static bool createConnection()
{

    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");

    db.setHostName("mupai-do-user-14978458-0.c.db.ondigitalocean.com");
    db.setDatabaseName("mupai");
    db.setUserName("doadmin");
    db.setPassword("AVNS_Ab_h9CxdUdXYFGaorT_");
    db.setPort(25060);

    if (!db.open()) {
        qDebug() << "Error para conectar con el servidor.";
        //Debugguear el mensaje de error, mostrar error
        qDebug() << db.lastError().text();
        return false;
    }

    return true;
}

#endif // DATABASE_H
