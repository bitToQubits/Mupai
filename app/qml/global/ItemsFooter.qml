pragma Singleton

import QtQuick
import FluentUI
import app.user
import app.chat

FluObject {
  id: footer_items

  property var navigationView

  FluPaneItemSeparator {}

  FluPaneItem {
    title: 'Inicio'
    cusIcon: Image {
      anchors.centerIn: parent
      source: FluTheme.dark ? "qrc:app/res/svg/home_dark.svg" : "qrc:app/res/svg/home.svg"
      sourceSize: Qt.size(30, 30)
      width: 18
      height: 18
    }
    onTap: {
      navigationView.push("qrc:app/qml/page/T_Home.qml")
    }
  }

  FluPaneItem {
    title: 'Nuevo chat'
    icon: FluentIcons.SubscriptionAdd

    onTap: {
      Chat.setear("mupi", true)
      navigationView.push("qrc:app/qml/page/T_Chat.qml")
    }
  }

  FluPaneItem {
    title: 'Configuración'
    icon: FluentIcons.Settings
    onTap: {
      navigationView.push("qrc:app/qml/page/T_Settings.qml")
    }
  }

  FluPaneItem {
    title: 'Cerrar sesión'
    icon: FluentIcons.BlockContact
    tapFunc: function () {
      User.limpiarSesion()
      appInfo.reiniciarApp()
    }
  }
}
