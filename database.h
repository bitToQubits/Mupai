#ifndef DATABASE_H
#define DATABASE_H

#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QSqlQuery>
#include <QSqlError>
#include <iostream>

class Database
{
public:
    static Database& getInstance()
    {
        static Database instance;
        return instance;
    }

    bool openConnection()
    {
        if (!db.isOpen()) {
            if (!db.open()) {
                qDebug() << "Error para conectar con el servidor.";
                qDebug() << db.lastError().text();
                std::cout << db.lastError().text().toStdString();
                return false;
            }
        }
        return true;
    }

    void closeConnection()
    {
        if (db.isOpen()) {
            db.close();
        }
    }

    QSqlDatabase getDatabase()
    {
        return db;
    }

private:
    QSqlDatabase db;

    // Private constructor and copy constructor to prevent direct instantiation and copying
    Database()
    {
        db = QSqlDatabase::addDatabase("QPSQL");
        db.setHostName("mupai-do-user-14978458-0.c.db.ondigitalocean.com");
        db.setDatabaseName("mupai");
        db.setUserName("doadmin");
        db.setPassword("AVNS_Ab_h9CxdUdXYFGaorT_");
        db.setPort(25060);
    }

    Database(const Database&) = delete;
    Database& operator=(const Database&) = delete;
};

#endif // DATABASE_H
