#ifndef TEMPLATE_H
#define TEMPLATE_H

#include <QObject>
#include <QFile>

class Template : public QObject
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

public:
    explicit Template(QObject *parent = nullptr);

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

public slots:
    QByteArray convertFileToBase64(const QString &filePath);
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
};

#endif // TEMPLATE_H
