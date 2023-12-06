#include "AppInfo.h"
#include "lang/En.h"
#include "qcoreapplication.h"

AppInfo::AppInfo(QObject *parent)
    : QObject{parent}
{
    version("1.0.0");
    lang(new En());
}

void AppInfo::reiniciarApp(){
    QProcess::startDetached(QCoreApplication::applicationFilePath());
    exit(12);
}
