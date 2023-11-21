#ifndef SESSION_H
#define SESSION_H

// singleton.h
#include <QSettings>
//Utilizando un singleton para tener una sola instancia del objeto Session.

class Session {
public:
    static Session& getInstance() {
        static Session instance;
        return instance;
    }

    QSettings& getSession() {
        return settings;
    }

private:
    Session() : settings("Mupia Inc", "Mu-pia") {}
    QSettings settings;
};

#endif // SESSION_H
