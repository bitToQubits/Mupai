#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QSettings>
#include "Login.h"
#include "Register.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    app.setWindowIcon(QIcon(":/images/Icon.png"));
    QQmlApplicationEngine engine;

    Login *login = new Login(&app);
    qmlRegisterSingletonInstance("app.Login", 1,0, "Login", login);

    Register *registro = new Register(&app);
    qmlRegisterSingletonInstance("app.registro", 1,0, "Register", registro);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
