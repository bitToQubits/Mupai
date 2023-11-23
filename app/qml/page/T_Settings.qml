import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import FluentUI
import app.user
import "qrc:app/qml/global/"
import "../component"

FluScrollablePage {

  title: "Configuración"
  leftPadding: 10
  rightPadding: 10
  bottomPadding: 20
  spacing: 0

  FluArea {
    Layout.fillWidth: true
    Layout.topMargin: 20
    height: 250
    paddings: 10

    FluText {
      id: tucuenta
      text: qsTr("Tu cuenta")
      fontStyle: FluText.BodyStrong
      Layout.bottomMargin: 4
      font.pixelSize: 20
    }

    RowLayout {
      id: rowLayout

      width: parent.width
      height: 20
      anchors.top: tucuenta.bottom
      anchors.topMargin: 10
      spacing: 10

      FluText {
        id: label_nombre
        text: qsTr("Nombre")
        fontStyle: FluText.BodyStrong
        Layout.bottomMargin: 4
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 3
      }

      FluText {
        id: label_apellido
        text: qsTr("Apellido")
        fontStyle: FluText.BodyStrong
        Layout.bottomMargin: 4
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 3
      }

      FluText {
        id: label_correo
        text: qsTr("Correo electrónico")
        fontStyle: FluText.BodyStrong
        Layout.bottomMargin: 4
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 3
      }
    }

    RowLayout {
      id: rowLayout_2

      width: parent.width
      height: 20
      anchors.top: rowLayout.bottom
      anchors.topMargin: 10
      spacing: 10

      FluTextBox {
        id: nombre
        height: 20
        font.pixelSize: 12
        placeholderText: qsTr("Nombre")
        //onTextChanged: Login.email = text
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 3
        text: User.firstName
      }

      FluTextBox {
        id: apellido
        height: 20
        font.pixelSize: 12
        placeholderText: qsTr("Apellido")
        //onTextChanged: Login.email = text
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 3
        text: User.lastName
      }

      FluTextBox {
        id: correo
        height: 20
        font.pixelSize: 12
        placeholderText: qsTr("Correo electrónico")
        //onTextChanged: Login.email = text
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 3
        text: User.email
      }
    }

    RowLayout {
      id: rowLayout_3

      width: parent.width
      height: 20
      anchors.top: rowLayout_2.bottom
      anchors.topMargin: 20
      spacing: 10

      FluText {
        id: label_clave
        text: qsTr("Clave actual")
        fontStyle: FluText.BodyStrong
        Layout.bottomMargin: 4
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 2
      }

      FluText {
        id: label_clave_nueva
        text: qsTr("Clave nueva")
        fontStyle: FluText.BodyStrong
        Layout.bottomMargin: 4
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 2
      }
    }

    RowLayout {
      id: rowLayout_4

      width: parent.width
      height: 20
      anchors.top: rowLayout_3.bottom
      anchors.topMargin: 10
      spacing: 10

      FluTextBox {
        id: clave
        height: 20
        font.pixelSize: 12
        placeholderText: qsTr("Clave")
        //onTextChanged: Login.email = text
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 2
      }

      FluTextBox {
        id: clave_nueva
        height: 20
        font.pixelSize: 12
        placeholderText: qsTr("Clave nueva")
        //onTextChanged: Login.email = text
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 2
      }
    }

    RowLayout {
      id: rowAcciones
      width: parent.width
      height: 20
      anchors.top: rowLayout_4.bottom
      anchors.topMargin: 25
      spacing: 10

      FluButton {
        text: "Cancelar"
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 3
      }

      FluFilledButton {
        text: "Guardar cambios"
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 1
      }
    }
  }

  FluArea {
    Layout.fillWidth: true
    Layout.topMargin: 20
    height: 136
    paddings: 10

    ColumnLayout {
      spacing: 10
      anchors {
        top: parent.top
        left: parent.left
      }
      FluText {
        text: qsTr("Colores del programa")
        fontStyle: FluText.BodyStrong
        Layout.bottomMargin: 4
      }
      Repeater {
        model: [{
            "title": "Sistema",
            "mode": FluDarkMode.System
          }, {
            "title": "Blanco",
            "mode": FluDarkMode.Light
          }, {
            "title": "Oscuro",
            "mode": FluDarkMode.Dark
          }]
        delegate: FluRadioButton {
          selected: FluTheme.darkMode === modelData.mode
          text: modelData.title
          onClicked: {
            FluTheme.darkMode = modelData.mode
          }
        }
      }
    }
  }

  FluArea {
    Layout.fillWidth: true
    Layout.topMargin: 20
    height: 168
    paddings: 10

    ColumnLayout {
      spacing: 10
      anchors {
        top: parent.top
        left: parent.left
      }

      FluText {
        text: "Apariencia del menú"
        fontStyle: FluText.BodyStrong
        Layout.bottomMargin: 4
      }
      Repeater {
        model: [{
            "title": "Abierto",
            "mode": FluNavigationView.Open
          }, {
            "title": "Compacto",
            "mode": FluNavigationView.Compact
          }, {
            "title": "Mínimo",
            "mode": FluNavigationView.Minimal
          }, {
            "title": "Auto",
            "mode": FluNavigationView.Auto
          }]
        delegate: FluRadioButton {
          selected: MainEvent.displayMode === modelData.mode
          text: modelData.title
          onClicked: {
            MainEvent.displayMode = modelData.mode
          }
        }
      }
    }
  }
}
