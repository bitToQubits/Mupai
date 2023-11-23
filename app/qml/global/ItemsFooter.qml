﻿pragma Singleton

import QtQuick
import FluentUI
import app.user

FluObject {
  id: footer_items

  property var navigationView

  FluPaneItemSeparator {}
  FluPaneItem {
    title: 'Acerca de'
    icon: FluentIcons.Help
    tapFunc: function () {
      FluApp.navigate("/about")
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
