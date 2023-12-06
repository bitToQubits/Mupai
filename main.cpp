#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QProcess>
#include <QDir>
#include <QIcon>
#include "Login.h"
#include "Register.h"
#include "User.h"
#include <session.h>
#include "app\src\lang\Lang.h"
#include "app\src\AppInfo.h"
#include "Chat.h"
#include "Template.h"
#include "database.h"
#include "Graficos.h"
#define session Session::getInstance().getSession()

#if defined(STATICLIB)
#include <FluentUI.h>
#endif

int main(int argc, char *argv[])
{
    qputenv("QT_QUICK_CONTROLS_STYLE","Basic");
    
    #ifdef Q_OS_WIN
        qputenv("QT_QPA_PLATFORM","windows:darkmode=2");
    #endif

    QApplication::setOrganizationName("Mupia INC");
    //QGuiApplication::setOrganizationDomain("https://zhuzichu520.github.io");
    QApplication::setApplicationName("Mupi");

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QApplication app(argc, argv);

    app.setWindowIcon(QIcon(":/images/Icon.png"));
    QQmlApplicationEngine engine;

    Database& db = Database::getInstance();

    if(!db.openConnection()){
        return 0;
    }

    QQmlContext * context = engine.rootContext();

    AppInfo* appInfo = new AppInfo();

    QString activeWindowEvent = "activeWindow";
    app.setQuitOnLastWindowClosed(false);
    #if defined(STATICLIB)
        FluentUI::initialize(&engine);
    #endif

    Lang* lang = appInfo->lang();
    context->setContextProperty("lang",lang);

    Login *login = new Login(&app);
    qmlRegisterSingletonInstance("app.Login", 1,0, "Login", login);

    Register *registro = new Register(&app);
    qmlRegisterSingletonInstance("app.registro", 1,0, "Register", registro);

    User *user = new User(&app);
    qmlRegisterSingletonInstance("app.user", 1,0, "User", user);

    Chat *chat = new Chat(&app);
    qmlRegisterSingletonInstance("app.chat", 1,0, "Chat", chat);

    Plantilla *plantilla = new Plantilla(&app);
    qmlRegisterSingletonInstance("app.plantilla", 1,0, "Plantilla", plantilla);

    Graficos *grafico = new Graficos(&app);
    qmlRegisterSingletonInstance("app.graficos", 1,0, "Graficos", grafico);

    QObject::connect(appInfo,&AppInfo::langChanged,&app,[context,appInfo]{
        context->setContextProperty("lang",appInfo->lang());
    });
    context->setContextProperty("appInfo",appInfo);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
