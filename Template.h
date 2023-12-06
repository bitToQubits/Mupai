#ifndef TEMPLATE_H
#define TEMPLATE_H

#include <QObject>
#include <QFile>
#include <QList>
#include <QSqlQuery>

class Plantilla : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int ID READ ID NOTIFY IDChanged)
    Q_PROPERTY(int user_id READ user_id NOTIFY userChanged)
    Q_PROPERTY(QString nombre READ nombre WRITE setNombre NOTIFY nombreChanged)
    Q_PROPERTY(QString desc READ desc WRITE setDesc NOTIFY descChanged)
    Q_PROPERTY(QString instr READ instr WRITE setInstr NOTIFY instrChanged)
    Q_PROPERTY(bool publica READ publica WRITE setPublica NOTIFY publicaChanged)
    Q_PROPERTY(QString img READ img WRITE setImg NOTIFY imgChanged)
    Q_PROPERTY(int status_form READ status_form NOTIFY status_formChanged)
    Q_PROPERTY(bool status_server READ status_server NOTIFY status_serverChanged)
    Q_PROPERTY(bool reporte_publico READ reporte_publico WRITE setReporte_publico
                   NOTIFY reporte_publicoChanged)

public:
    explicit Plantilla(QObject *parent = nullptr);

    int ID() const;
    int user_id() const;

    QString nombre() const;
    void setNombre(const QString &newNombre);

    QString desc() const;
    void setDesc(const QString &newDesc);

    QString instr() const;
    void setInstr(const QString &newInstr);

    bool publica() const;
    void setPublica(bool newPublica);

    QString img() const;
    void setImg(const QString &newImg);

    Q_INVOKABLE void guardar();

    int status_form() const;

    bool status_server() const;

    bool reporte_publico() const;

    void setReporte_publico(bool newReporte_publico);

public slots:
    QByteArray convertFileToBase64(QString filePath);
    //Get the templates from mysql database and put them in a list ready for qml
    QList<QObject*> getTemplates(bool publico, int limite);
    void setear(const int ID, bool es_nuevo);
    bool eliminar(const int ID);

signals:
    void IDChanged();
    void userChanged();

    void nombreChanged();

    void descChanged();

    void instrChanged();

    void publicaChanged();

    void imgChanged();

    void status_formChanged();

    void status_serverChanged();

    void reporte_publicoChanged();

private:
    int m_ID = 0;
    int m_user_id = 0;
    QString m_nombre;
    QString m_desc;
    QString m_instr;
    bool m_publica = 0;
    QString m_img;
    int m_status_form = 0;
    bool m_status_server = true;
    bool m_reporte_publico = true;
};

#endif // TEMPLATE_H
