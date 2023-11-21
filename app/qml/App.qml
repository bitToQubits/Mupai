import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

FluWindow {
  id: app
  width: 1224
  height: 620
  Component.onCompleted: {
    FluApp.init(app)
    FluTheme.frameless = ("windows" === Qt.platform.os)
    FluTheme.darkMode = FluDarkMode.System
    FluApp.routes = {
      "/": "qrc:app/qml/window/MainWindow.qml",
      "/about": "qrc:app/qml/window/AboutWindow.qml",
      "/login": "qrc:app/qml/window/LoginWindow.qml",
      "/chat": "qrc:app/qml/window/ChatWindow.qml",
      "/media": "qrc:app/qml/window/MediaWindow.qml",
      "/singleTaskWindow": "qrc:app/qml/window/SingleTaskWindow.qml",
      "/standardWindow": "qrc:app/qml/window/StandardWindow.qml",
      "/singleInstanceWindow": "qrc:app/qml/window/SingleInstanceWindow.qml"
    }
    FluApp.initialRoute = "/"
    FluApp.run()
  }
}
