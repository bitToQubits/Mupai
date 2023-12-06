QT += quick sql core gui concurrent network multimedia charts
CONFIG += c++17
DEFINES += QT_DEPRECATED_WARNINGS QT_NO_WARNING_OUTPUT

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        Chat.cpp \
        Graficos.cpp \
        Login.cpp \
        Register.cpp \
        Template.cpp \
        User.cpp \
        main.cpp \
        app/src/AppInfo.cpp \
        app/src/lang/En.cpp \
        app/src/lang/Lang.cpp

RESOURCES += qml.qrc

OUTPUT += Console

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

RC_ICONS = images/Icon.ico

# Check if the configuration is for release
CONFIG(release, debug|release) {
    # Add the path to your library files
    LIBS += -L"C:/Qt/6.4.3/mingw_64/qml/FluentUI"

    # Add the name of your library
    # Replace 'YourLibraryName' with the actual name of your library
    LIBS += -FluentUI
}


mac: {
    QMAKE_INFO_PLIST = Info.plist
}

HEADERS += \
    Chat.h \
    Graficos.h \
    Login.h \
    Register.h \
    Template.h \
    User.h \
    database.h \
    session.h \
    app/src/lang/En.h \
    app/src/lang/Lang.h \
    app/src/stdafx.h \
    app/src/AppInfo.h

DISTFILES += \
    C:/Users/cloud/Downloads/Icon.ico \
    login.qml \
    registro.qml
