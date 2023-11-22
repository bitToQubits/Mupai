import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Basic
import FluentUI

Window {
  id: app
  title: qsTr("Mupia")
  property string notificacion

  Component.onCompleted: {
    FluApp.init(app)
    FluTheme.frameless = ("windows" === Qt.platform.os)
    FluTheme.darkMode = FluDarkMode.System
    FluApp.routes = {
      "/": "qrc:app/qml/window/MainWindow.qml",
      "/about": "qrc:app/qml/window/AboutWindow.qml",
      "/login": "qrc:login.qml",
      "/register": "qrc:registro.qml",
      "/control_usuario": "qrc:control_usuario.qml",
      "/chat": "qrc:app/qml/window/ChatWindow.qml",
      "/media": "qrc:app/qml/window/MediaWindow.qml",
      "/singleTaskWindow": "qrc:app/qml/window/SingleTaskWindow.qml",
      "/standardWindow": "qrc:app/qml/window/StandardWindow.qml",
      "/singleInstanceWindow": "qrc:app/qml/window/SingleInstanceWindow.qml"
    }
    FluApp.initialRoute = "/control_usuario"
    FluApp.run()
  }
}
