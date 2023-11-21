QT += quick
QT += sql
QT += core
QT += gui

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        Login.cpp \
        Register.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    Login.h \
    Register.h \
    database.h \
    session.h

win32: LIBS += -L'C:/Program Files/MySQL/MySQL Connector C 6.1/lib/' -llibmysql

INCLUDEPATH += 'C:/Program Files/MySQL/MySQL Connector C 6.1/include'
DEPENDPATH += 'C:/Program Files/MySQL/MySQL Connector C 6.1/include'

DISTFILES += \
    login.qml \
    registro.qml
