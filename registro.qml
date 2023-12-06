import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.platform
import app.registro
import FluentUI
import Qt5Compat.GraphicalEffects

Item {
  id: paginaRegistro

  FontLoader {
    id: fuentePrincipal
    source: "fonts/Avenir.otf"
  }

  FontLoader {
    id: fuenteSecundaria
    source: "fonts/Avenir_regular.otf"
  }

  GridLayout {
    id: gridLayout
    width: parent.width
    height: parent.height

    Item {
      id: item2
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.alignment: Qt.AlignVCenter

      Rectangle {
        id: rectangle
        width: parent.width
        height: 290
        anchors.verticalCenter: parent.verticalCenter
        color: 'transparent'

        FluText {
          id: registreSuCuenta
          text: qsTr("Crea tu cuenta")
          font.family: fuentePrincipal.font.family
          font.pixelSize: 35
          anchors.topMargin: 10
          anchors.horizontalCenter: parent.horizontalCenter
        }


        /*FluButton {
          id: googleButton
          anchors.top: registreSuCuenta.bottom
          highlighted: false
          flat: true
          focusPolicy: Qt.StrongFocus
          width: 40
          height: 40
          anchors.topMargin: 10
          anchors.horizontalCenter: registreSuCuenta.horizontalCenter
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
        }*/
        FluText {
          id: utilizarEmail
          text: qsTr("o manualmente introduce tus datos")
          font.pixelSize: 18
          font.weight: 200
          font.family: fuenteSecundaria.font.family
          anchors.top: registreSuCuenta.bottom
          anchors.topMargin: 10
          anchors.horizontalCenter: registreSuCuenta.horizontalCenter
        }

        RowLayout {
          id: rowLayout

          width: parent.width / 2
          height: 40
          anchors.top: utilizarEmail.bottom
          anchors.topMargin: 10
          anchors.horizontalCenter: utilizarEmail.horizontalCenter
          spacing: 10

          FluTextBox {
            id: nombre
            Layout.fillWidth: true
            Layout.maximumWidth: parent.width / 2
            font.pixelSize: 12
            font.family: fuentePrincipal.font.family
            placeholderText: qsTr("Nombre")
            onTextChanged: Register.firstName = text
            bottomPadding: 10
            topPadding: 10
            leftPadding: 10
          }

          FluTextBox {
            id: apellido
            Layout.fillWidth: true
            Layout.maximumWidth: parent.width / 2
            font.pixelSize: 12
            font.family: fuentePrincipal.font.family
            placeholderText: qsTr("Apellido")
            onTextChanged: Register.lastName = text
            bottomPadding: 10
            topPadding: 10
            leftPadding: 10
          }
        }

        FluTextBox {
          id: email
          width: parent.width / 2
          height: 40
          font.pixelSize: 12
          font.family: fuentePrincipal.font.family
          placeholderText: qsTr("Correo electrónico")
          onTextChanged: Register.email = text
          anchors.top: rowLayout.bottom
          anchors.topMargin: 10
          anchors.horizontalCenter: rowLayout.horizontalCenter
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
          anchors.topMargin: 10
          onTextChanged: Register.password = text
          anchors.horizontalCenter: email.horizontalCenter
          bottomPadding: 10
          topPadding: 10
          leftPadding: 10
        }

        FluPasswordBox {
          id: clave_confirmar
          width: parent.width / 2
          height: 40
          placeholderText: qsTr("Confirmar contraseña")
          font.pixelSize: 12
          font.family: fuentePrincipal.font.family
          anchors.top: clave.bottom
          anchors.topMargin: 10
          onTextChanged: Register.confirmPassword = text
          anchors.horizontalCenter: clave.horizontalCenter
          bottomPadding: 10
          topPadding: 10
          leftPadding: 10
        }

        FluButton {
          id: registerButton
          width: parent.width / 4
          height: 40
          onClicked: {
            Register.registrarse()

            if (Register.status_form === 1) {
              mensajeRespuesta.visible = false
              showSuccess("¡Te has registrado correctamente!", 3000)
              Register.clear()
              stack.pop()
            } else {
              if (Register.status_server) {
                if (Register.status_form === 0) {
                  showError("Favor rellenar todos los campos", 3000)
                }
              } else {
                showError("Error para conectar al servidor", 3000)
                showError(Register.error_server, 3000)
              }
            }
          }

          topPadding: 10
          contentItem: Text {
            text: "Registrarme"
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

          anchors.top: clave_confirmar.bottom
          flat: true
          anchors.topMargin: 10
          anchors.horizontalCenter: clave_confirmar.horizontalCenter
          bottomPadding: 10
        }

        Text {
          id: mensajeRespuesta
          text: qsTr("Las claves no coinciden")
          color: "#DC3545"
          font.pixelSize: 15
          font.weight: 900
          font.family: fuenteSecundaria.font.family
          anchors.top: registerButton.bottom
          anchors.topMargin: 10
          anchors.horizontalCenter: registerButton.horizontalCenter
          visible: false

          Connections {
            target: Register
            function onConfirmPasswordChanged(cP) {
              if (Register.password !== cP) {
                mensajeRespuesta.visible = true
              } else {
                mensajeRespuesta.visible = false
              }
            }

            function onPasswordChanged(p) {
              if (p !== Register.confirmPassword) {
                mensajeRespuesta.visible = true
              } else {
                mensajeRespuesta.visible = false
              }
            }

            function onEmailExists() {
              showError("Ya existe una cuenta con este correo.", 3000)
            }
          }
        }
      }
    }

    Item {
      id: item1
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.alignment: Qt.AlignVCenter

      FluRectangle {
        width: parent.width
        height: parent.height
        color: "#493299"
        layer.enabled: true
        layer.effect: DropShadow {
          transparentBorder: true
          horizontalOffset: FluTheme.dark ? -6 : -10
          verticalOffset: FluTheme.dark ? 6 : 10
          color: FluTheme.dark ? '#3b3b3b' : '#e6e3ee'
        }
        radius: [90, 0, 0, 90]

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
            text: qsTr("¿Ya tienes una cuenta?")
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
              text: "Inicia sesión"
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
            anchors.topMargin: 20
            anchors.horizontalCenter: texto_registro.horizontalCenter
            bottomPadding: 10
            onClicked: {
              Register.clear()
              stack.pop()
            }
          }
        }
      }
    }
  }
}
