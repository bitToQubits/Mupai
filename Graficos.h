#ifndef GRAFICOS_H
#define GRAFICOS_H

#include <QObject>
#include <QSqlQuery>
#include <QVariantList>

class Graficos : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList nombres READ nombres WRITE setNombres NOTIFY nombresChanged)
    Q_PROPERTY(QVariantList numeros READ numeros WRITE setNumeros NOTIFY numerosChanged)
public:
    explicit Graficos(QObject *parent = nullptr);

    QVariantList nombres() const;
    void setNombres(const QVariantList &newNombres);

    QVariantList numeros() const;
    void setNumeros(const QVariantList &newNumeros);

public slots:
    void getData();

signals:
    void nombresChanged();

    void numerosChanged();

private:

    QVariantList m_nombres;
    QVariantList m_numeros;
};

#endif // GRAFICOS_H
