#include "Chat.h"

Chat::Chat(QObject *parent)
    : QObject{parent}
{

}

QString Chat::AI() const
{
    return m_AI;
}

void Chat::setAI(const QString &newAI)
{
    if (m_AI == newAI)
        return;
    m_AI = newAI;
    emit AIChanged();
}

qint32 Chat::ID() const
{
    return m_ID;
}
