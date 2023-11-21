#include "db_conn.h"


db_conn::db_conn(QObject *parent)
    : QObject{parent}
{
    db.setHostName("localhost");
    db.setDatabaseName("mupai");
    db.setUserName("root");
    db.setPassword("");
    db.setPort(3309);
}

bool db_conn::ok() const
{
    return _ok;
}
