import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import FluentUI
import app.user
import "qrc:app/qml/global/"

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
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 3
        text: User.firstName
      }

      FluTextBox {
        id: apellido
        height: 20
        font.pixelSize: 12
        placeholderText: qsTr("Apellido")
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

      FluPasswordBox {
        id: clave
        height: 20
        font.pixelSize: 12
        placeholderText: qsTr("Clave")
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 2
      }

      FluPasswordBox {
        id: clave_nueva
        height: 20
        font.pixelSize: 12
        placeholderText: qsTr("Clave nueva")
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
        onClicked: {
          nombre.text = User.firstName
          apellido.text = User.lastName
          correo.text = User.email
          clave_nueva.text = ''
          clave.text = ''
        }
      }

      FluFilledButton {
        text: "Guardar cambios"
        Layout.fillWidth: true
        Layout.maximumWidth: parent.width / 1
        onClicked: {
          if (clave_nueva.text !== '') {
            if (clave.text !== User.password) {
              showError('La clave actual no es correcta')
              return
            } else {
              User.password = clave_nueva.text
            }
          }

          User.firstName = nombre.text
          User.lastName = apellido.text
          User.email = correo.text

          let status = User.guardarConfiguracion()

          if (status === 1) {
            showSuccess('¡Exito! Has actualizado tus datos.', 3000)
          } else if (status === 0) {
            showError('Este correo ya lo tiene otra cuenta.', 3000)
          } else if (status === -2) {
            showError('No puedes dejar email, nombre o apellido vacio', 3000)
          } else {
            showError('Error del lado del servidor.', 3000)
          }
        }
      }
    }
  }

  FluArea {
    Layout.fillWidth: true
    Layout.topMargin: 20
    height: 200
    paddings: 10

    ColumnLayout {
      spacing: 10
      anchors {
        top: parent.top
        left: parent.left
      }
      FluText {
        text: qsTr("Apariencia del programa")
        fontStyle: FluText.BodyStrong
        Layout.bottomMargin: 4
      }
      RowLayout {
        id: colores_select
        Layout.topMargin: 10
        Repeater {
          model: [FluColors.Yellow, FluColors.Orange, FluColors.Red, FluColors.Magenta, FluColors.Purple, FluColors.Blue, FluColors.Teal, FluColors.Green]
          delegate: FluRectangle {
            width: 42
            height: 42
            radius: [4, 4, 4, 4]
            color: mouse_item.containsMouse ? Qt.lighter(modelData.normal,
                                                         1.1) : modelData.normal
            FluIcon {
              anchors.centerIn: parent
              iconSource: FluentIcons.AcceptMedium
              iconSize: 15
              visible: modelData === FluTheme.primaryColor
              color: FluTheme.dark ? Qt.rgba(0, 0, 0, 1) : Qt.rgba(1, 1, 1, 1)
            }
            MouseArea {
              id: mouse_item
              anchors.fill: parent
              hoverEnabled: true
              onClicked: {
                FluTheme.primaryColor = modelData
              }
            }
          }
        }
      }
      Repeater {
        Layout.fillWidth: true
        Layout.topMargin: 25
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
    height: 140
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
