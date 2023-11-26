import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import FluentUI
import QtQuick.Dialogs
import "../component"

FluScrollablePage {

  title: "Editor de plantillas"
  leftPadding: 10
  rightPadding: 10
  bottomPadding: 20
  spacing: 0

  FluArea {
    Layout.alignment: Qt.AlignHCenter
    width: 100
    height: 100
    Image {
      id: image
      fillMode: Image.PreserveAspectFit
      height: parent.width / 2
      anchors.centerIn: parent
      clip: true


      /*anchors.left: parent.left
      anchors.bottom: parent.bottom
      anchors.top: parent.top
      anchors.right: parent.right*/
      smooth: true
    }
  }

  RowLayout {
    id: rowLayout

    Layout.fillWidth: true
    Layout.maximumWidth: parent.width
    Layout.topMargin: 20
    spacing: 10

    FluButton {
      text: qsTr("Escoger imagen...")
      onClicked: fileDialog.open()
    }

    FileDialog {
      id: fileDialog
      currentFolder: StandardPaths.standardLocations(
                       StandardPaths.PicturesLocation)[0]
      onAccepted: image.source = selectedFile
      nameFilters: ["Imagenes (*.png *.svg *jpeg)"]
    }

    FluTextBox {
      id: nombre
      height: 20
      font.pixelSize: 12
      placeholderText: qsTr("Nombre de la plantilla")
      Layout.fillWidth: true
    }

    FluCheckBox {
      text: "Hacer pública para todos"
    }
  }

  ScrollView {
    id: scrollviewDesc
    Layout.fillWidth: true
    Layout.maximumWidth: parent.width
    Layout.preferredHeight: 80
    Layout.maximumHeight: 80
    Layout.topMargin: 20
    FluMultilineTextBox {
      id: textboxDesc
      placeholderText: "Descripción de la plantilla .."
      font.pixelSize: 12
    }
  }

  ScrollView {
    id: scrollviewInstrucciones
    Layout.fillWidth: true
    Layout.maximumWidth: parent.width
    Layout.preferredHeight: 120
    Layout.maximumHeight: 120
    Layout.topMargin: 20
    FluMultilineTextBox {
      id: textboxIns
      placeholderText: "Instrucciones y ejemplos para el modelo de IA .."
      font.pixelSize: 12
    }
  }

  RowLayout {
    id: rowLayout2

    Layout.fillWidth: true
    Layout.maximumWidth: parent.width
    Layout.topMargin: 20
    spacing: 10

    FluFilledButton {
      id: guardar
      text: "Guardar"
      Layout.fillWidth: true
    }

    Button {
      id: cancelar
      flat: true
      background: Rectangle {
        color: "#FF0000"
        border.color: "#FF0000"
        radius: 4
      }

      contentItem: Text {
        text: "Cancelar / Borrar"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#FFFFFF"
        font.bold: true
      }

      HoverHandler {
        acceptedDevices: PointerDevice.Mouse
        cursorShape: Qt.PointingHandCursor
      }
      Layout.fillWidth: true
    }
  }
}
