import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import FluentUI
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
    height: 136
    paddings: 10

    ColumnLayout {
      spacing: 10
      anchors {
        top: parent.top
        left: parent.left
      }
      FluText {
        id: tucuenta
        text: qsTr("Tu cuenta")
        fontStyle: FluText.BodyStrong
        Layout.bottomMargin: 4
      }

      FluTextBox {
        id: nombre
        placeholderText: "Nombre"
        anchors {
          top: tucuenta.bottom
        }
      }


      /*FluTextBox {
        id: apellido
        Layout.topMargin: 20
        placeholderText: "Apellido"
        Layout.preferredWidth: 300
        anchors {
          top: nombre.bottom
          verticalCenter: parent.verticalCenter
          left: parent.left
        }
      }

      FluTextBox {
        id: correo
        Layout.topMargin: 20
        placeholderText: "Correo"
        Layout.preferredWidth: 300
        anchors {
          top: apellido.bottom
          verticalCenter: parent.verticalCenter
          left: parent.left
        }
      }

      FluPasswordBox {
        id: clave_actual
        Layout.topMargin: 20
        placeholderText: "Clave actual"
        Layout.preferredWidth: 300
        anchors {
          top: correo.bottom
          verticalCenter: parent.verticalCenter
          left: parent.left
        }
      }

      FluPasswordBox {
        id: clave_nueva
        Layout.topMargin: 20
        placeholderText: "Nueva clave"
        Layout.preferredWidth: 300
        anchors {
          top: clave_nueva.bottom
          verticalCenter: parent.verticalCenter
          left: parent.left
        }
      }*/
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
        text: lang.navigation_view_display_mode
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
