import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Basic
import app.Login
import FluentUI
import app.user

Item {

  id: paginaLogin

  GridLayout {
    id: gridLayout
    width: parent.width
    height: parent.height

    Item {
      id: item1
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.alignment: Qt.AlignVCenter

      Rectangle {
        width: parent.width
        height: parent.height
        color: "#493299"

        Rectangle {
          width: parent.width
          height: 350
          anchors.verticalCenter: parent.verticalCenter
          color: "#493299"

          Text {
            id: bienvenido
            text: qsTr("Bienvenido a")
            font.family: fuentePrincipal.font.family
            font.pixelSize: 35
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#FFFFFF"
          }

          Image {
            id: mupaiLogo
            anchors.top: bienvenido.bottom
            height: parent.height / 2

            source: "images/Logo.png"
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: bienvenido.horizontalCenter
          }
          Text {
            id: texto_registro
            text: qsTr("¿No tienes una cuenta? Registrate hoy mismo")
            font.family: fuenteSecundaria.font.family
            font.pixelSize: 18
            font.weight: 200
            anchors.top: mupaiLogo.bottom
            anchors.horizontalCenter: mupaiLogo.horizontalCenter
            color: "#FFFFFF"
          }

          Button {
            id: registrate
            width: parent.width / 4
            height: 40

            topPadding: 10
            contentItem: Text {
              text: "Crear cuenta"
              horizontalAlignment: Text.AlignHCenter
              verticalAlignment: Text.AlignVCenter
              color: "#FFFFFF"
              font.family: fuentePrincipal.font.family
              font.bold: true
            }

            background: Rectangle {
              color: "#493299"
              border.color: "#FFFFFF"
              radius: 10
            }

            HoverHandler {
              acceptedDevices: PointerDevice.Mouse
              cursorShape: Qt.PointingHandCursor
            }

            anchors.top: texto_registro.bottom
            flat: true
            anchors.topMargin: 30
            anchors.horizontalCenter: texto_registro.horizontalCenter
            bottomPadding: 10
            onClicked: {
              Login.clear()
              stack.push("registro.qml")
            }
          }
        }
      }
    }

    Item {
      id: item2
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.alignment: Qt.AlignVCenter

      Rectangle {
        id: rectangle
        width: parent.width
        height: 350
        anchors.verticalCenter: parent.verticalCenter
        color: 'transparent'

        FluText {
          id: inicieSesion
          text: qsTr("Inicie sesión")
          font.family: fuentePrincipal.font.family
          font.pixelSize: 35
          anchors.topMargin: 20
          anchors.horizontalCenter: parent.horizontalCenter
        }

        FluButton {
          id: googleButton
          anchors.top: inicieSesion.bottom
          highlighted: false
          flat: true
          focusPolicy: Qt.StrongFocus
          width: 40
          height: 40
          anchors.topMargin: 20
          anchors.horizontalCenter: inicieSesion.horizontalCenter
          Image {
            height: parent.height / 2
            source: FluTheme.dark ? "images/google_white.svg" : "images/google.svg"
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: googleButton.verticalCenter
            anchors.horizontalCenter: googleButton.horizontalCenter
          }

          HoverHandler {
            acceptedDevices: PointerDevice.Mouse
            cursorShape: Qt.PointingHandCursor
          }
        }

        FluText {
          id: utilizarEmail
          text: qsTr("o utiliza tu email y contraseña")
          font.pixelSize: 18
          font.weight: 200
          font.family: fuenteSecundaria.font.family
          anchors.top: googleButton.bottom
          anchors.topMargin: 20
          anchors.horizontalCenter: googleButton.horizontalCenter
          color: (FluTheme.dark) ? '#FFFFFF' : '#1a2228'
        }

        FluTextBox {
          id: email
          width: parent.width / 2
          height: 40
          font.pixelSize: 12
          font.family: fuentePrincipal.font.family
          placeholderText: qsTr("Correo electrónico")
          onTextChanged: Login.email = text
          anchors.top: utilizarEmail.bottom
          anchors.topMargin: 20
          anchors.horizontalCenter: utilizarEmail.horizontalCenter
          bottomPadding: 10
          topPadding: 10
          leftPadding: 10
        }

        FluPasswordBox {
          id: clave
          width: parent.width / 2
          height: 40
          placeholderText: qsTr("Contraseña")
          font.pixelSize: 12
          font.family: fuentePrincipal.font.family
          anchors.top: email.bottom
          anchors.topMargin: 20
          onTextChanged: Login.password = text
          anchors.horizontalCenter: email.horizontalCenter
          bottomPadding: 10
          topPadding: 10
          leftPadding: 10
        }

        Button {
          id: loginButton
          width: parent.width / 4
          height: 40
          onClicked: {
            Login.loguearse()
            if (!Login.status_server) {
              showError("Error para conectarse al servidor", 3000)
            }

            if (!Login.status_form && Login.status_server) {
              showError("Favor revisar sus credenciales", 3000)
            }

            if (Login.status_form) {
              showSuccess("Has iniciado sesión exitosamente", 3000)
              User.obtenerDatos()
              stack.push('app/qml/window/MainWindow.qml')
            }
          }

          topPadding: 10
          contentItem: Text {
            text: "Iniciar sesión"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#FFFFFF"
            font.family: fuentePrincipal.font.family
            font.bold: true
          }

          background: Rectangle {
            color: "#493299"
            border.color: "#493299"
            radius: 10
          }

          HoverHandler {
            acceptedDevices: PointerDevice.Mouse
            cursorShape: Qt.PointingHandCursor
          }

          anchors.top: clave.bottom
          flat: true
          anchors.topMargin: 30
          anchors.horizontalCenter: clave.horizontalCenter
          bottomPadding: 10
        }
      }
    }
  }
}
