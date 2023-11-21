#ifndef DATABASE_H
#define DATABASE_H

#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QSqlQuery>

static bool createConnection()
{

    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");

    db.setHostName("localhost");
    db.setDatabaseName("mupai");
    db.setUserName("root");
    db.setPassword("");
    db.setPort(3309);

    if (!db.open()) {
        qDebug() << "Error para conectar con el servidor.";
        return false;
    }

    return true;
}

#endif // DATABASE_H
