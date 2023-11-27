import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import FluentUI
import QtQuick.Dialogs
import "../component"
import app.plantilla

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
      height: parent.width / 1.5
      anchors.centerIn: parent
      clip: true
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
      onAccepted: {
        image.source = selectedFile
        Plantilla.img = selectedFile
      }
      nameFilters: ["Imagenes (*.png *.svg *jpeg)"]
    }

    FluTextBox {
      id: nombre
      height: 20
      font.pixelSize: 12
      onTextChanged: Plantilla.nombre = text
      placeholderText: qsTr("Nombre de la plantilla")
      Layout.fillWidth: true
    }

    FluCheckBox {
      id: publica
      text: "Hacer pública para todos"
      onClicked: {
        Plantilla.publica = publica.selected
      }
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
      onTextChanged: Plantilla.desc = text
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
      onTextChanged: Plantilla.instr = text
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
      onClicked: {
        Plantilla.guardar()

        if (Plantilla.status_form === 1) {
          showSuccess("¡Tu plantilla se ha guardado con éxito!", 3000)
        } else {
          if (Plantilla.status_server) {
            if (Plantilla.status_form === 0) {
              showError("Favor rellenar los campos obligatorios", 3000)
            }
          } else {
            showError("Error para conectar al servidor", 3000)
          }
        }
      }
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
