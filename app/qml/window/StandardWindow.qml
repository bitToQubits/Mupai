import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

FluWindow {

  id: window
  title: "Standard"
  width: 500
  height: 600
  minimumWidth: 500
  minimumHeight: 600
  maximumWidth: 500
  maximumHeight: 600
  launchMode: FluWindow.Standard

  FluAppBar {
    id: appbar
    title: "Cambiar nombre"
    width: parent.width
  }

  FluTextBox {
    id: textbox
    anchors.centerIn: parent
    placeholderText: qsTr("Titulo")
    text: "Cambiar nombre a este chat"
  }

  FluButton {
    text: "Guardar"
    anchors.centerIn: parent
    anchors.top: textbox.bottom
    anchors.topMargin: 10
    onClicked: {
      FluWindow.open("Standard.qml")
    }
  }
}
