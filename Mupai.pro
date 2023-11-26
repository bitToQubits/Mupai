QT += quick sql core gui concurrent network multimedia
CONFIG += c++17
DEFINES += QT_DEPRECATED_WARNINGS QT_NO_WARNING_OUTPUT

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        Chat.cpp \
        Login.cpp \
        Register.cpp \
        User.cpp \
        main.cpp \
        app/src/controller/ChatController.cpp \
        app/src/AppInfo.cpp \
        app/src/lang/En.cpp \
        app/src/lang/Lang.cpp \
        app/src/lang/Zh.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

CONFIG(debug,debug|release) {
    DESTDIR = $$absolute_path($${_PRO_FILE_PWD_}/../bin/debug)
} else {
    DESTDIR = $$absolute_path($${_PRO_FILE_PWD_}/../bin/release)
}

mac: {
    QMAKE_INFO_PLIST = Info.plist
}

HEADERS += \
    Chat.h \
    Login.h \
    Register.h \
    User.h \
    database.h \
    session.h \
    app/src/lang/En.h \
    app/src/lang/Lang.h \
    app/src/lang/Zh.h \
    app/src/stdafx.h \
    app/src/controller/ChatController.h \
    app/src/AppInfo.h

win32: LIBS += -L'C:/Program Files/MySQL/MySQL Connector C 6.1/lib/' -llibmysql

INCLUDEPATH += 'C:/Program Files/MySQL/MySQL Connector C 6.1/include'
DEPENDPATH += 'C:/Program Files/MySQL/MySQL Connector C 6.1/include'

DISTFILES += \
    login.qml \
    registro.qml
