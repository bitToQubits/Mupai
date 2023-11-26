#include <QGuiApplication>
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
#include "app\src\controller/ChatController.h"
#include "Chat.h"
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

    QGuiApplication::setOrganizationName("Mupia INC");
    //QGuiApplication::setOrganizationDomain("https://zhuzichu520.github.io");
    QGuiApplication::setApplicationName("Mupia");

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    app.setWindowIcon(QIcon(":/images/Icon.png"));
    QQmlApplicationEngine engine;

    QQmlContext * context = engine.rootContext();

    AppInfo* appInfo = new AppInfo();

    QString activeWindowEvent = "activeWindow";
    app.setQuitOnLastWindowClosed(false);
    #if defined(STATICLIB)
        FluentUI::initialize(&engine);
    #endif

    qmlRegisterType<ChatController>("Controller",1,0,"ChatController");
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
