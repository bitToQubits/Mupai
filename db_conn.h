#ifndef DB_CONN_H
#define DB_CONN_H
#include <QtSql>
#include <QSqlDatabase>

class db_conn : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool ok READ ok NOTIFY statusServerChanged)
     QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
public:
    explicit db_conn(QObject *parent = nullptr);

    bool ok() const;
signals:
    void statusServerChanged();

private:
    bool _ok = db.open();
};

#endif // DB_CONN_H
