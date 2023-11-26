#ifndef CHAT_H
#define CHAT_H

#include <QObject>

class Chat : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString AI READ AI WRITE setAI NOTIFY AIChanged)
    Q_PROPERTY(qint32 ID READ ID NOTIFY IDChanged)
public:
    explicit Chat(QObject *parent = nullptr);
    QString AI() const;
    void setAI(const QString &newAI);
    qint32 ID() const;

signals:
    void AIChanged();
    void IDChanged();

private:
    QString m_AI = "mupi";
    qint32 m_ID = 0;
};

#endif // CHAT_H
