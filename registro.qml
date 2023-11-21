import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.platform
import app.registro
import FluentUI
import "qrc:app/qml/global/"

FluWindow {
  id: paginaRegistro
  width: 1224
  height: 620
  closeDestory: false
  minimumWidth: 520
  minimumHeight: 460

  FontLoader {
    id: fuentePrincipal
    source: "fonts/Avenir.otf"
  }

  FontLoader {
    id: fuenteSecundaria
    source: "fonts/Avenir_regular.otf"
  }

  closeFunc: function (event) {
    close_app.open()
    event.accepted = false
  }

  Connections {
    target: appInfo
    function onActiveWindow() {
      window.show()
      window.raise()
      window.requestActivate()
    }
  }

  FluAppBar {
    id: appbar
    z: 9
    showDark: true
    width: parent.width
    darkText: lang.dark_mode
  }

  signal registroExitoso(string txt)
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
        height: 350
        anchors.verticalCenter: parent.verticalCenter

        Text {
          id: registreSuCuenta
          text: qsTr("Crea tu cuenta")
          font.family: fuentePrincipal.font.family
          font.pixelSize: 35
          anchors.topMargin: 10
          anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
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
            source: "images/google.svg"
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: googleButton.verticalCenter
            anchors.horizontalCenter: googleButton.horizontalCenter
          }

          background: Rectangle {
            border.color: "#495057"
            radius: 10
          }

          HoverHandler {
            acceptedDevices: PointerDevice.Mouse
            cursorShape: Qt.PointingHandCursor
          }
        }

        Text {
          id: utilizarEmail
          text: qsTr("o manualmente introduce tus datos")
          font.pixelSize: 18
          font.weight: 200
          font.family: fuenteSecundaria.font.family
          anchors.top: googleButton.bottom
          anchors.topMargin: 10
          anchors.horizontalCenter: googleButton.horizontalCenter
        }

        RowLayout {
          id: rowLayout

          width: parent.width / 2
          height: 40
          anchors.top: utilizarEmail.bottom
          anchors.topMargin: 10
          anchors.horizontalCenter: utilizarEmail.horizontalCenter
          spacing: 10

          TextField {
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
            background: Rectangle {
              color: "#EEEDEF"
              radius: 10
            }
          }

          TextField {
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
            background: Rectangle {
              color: "#EEEDEF"
              radius: 10
            }
          }
        }

        TextField {
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
          background: Rectangle {
            color: "#EEEDEF"
            radius: 10
          }
        }

        TextField {
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
          background: Rectangle {
            color: "#EEEDEF"
            radius: 10
          }
        }

        TextField {
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
          background: Rectangle {
            color: "#EEEDEF"
            radius: 10
          }
        }

        Button {
          id: registerButton
          width: parent.width / 4
          height: 40
          onClicked: {
            Register.registrarse()
            mensajeRespuestaServer.visible = !(Register.status_server)

            if (Register.status_form === 1) {
              mensajeRespuesta.visible = false
              paginaRegistro.registroExitoso(
                    "¡Te has registrado exitosamente! Solo hace falta iniciar sesión.")
              loader.source = "login.qml"
              Register.clear()
            } else {
              if (Register.status_server) {
                mensajeRespuesta.visible = true
                if (Register.status_form === 0) {
                  mensajeRespuesta.text = qsTr(
                        "Favor rellenar todos los campos")
                }
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
          text: qsTr("Favor rellenar todos los campos")
          color: "#B41E23"
          font.pixelSize: 15
          font.weight: 200
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
                mensajeRespuesta.text = qsTr("La claves no coinciden")
              } else {
                mensajeRespuesta.text = qsTr("Favor rellenar todos los campos")
                mensajeRespuesta.visible = false
              }
            }

            function onPasswordChanged(p) {
              if (p !== Register.confirmPassword) {
                mensajeRespuesta.visible = true
                mensajeRespuesta.text = qsTr("La claves no coinciden")
              } else {
                mensajeRespuesta.text = qsTr("Favor rellenar todos los campos")
                mensajeRespuesta.visible = false
              }
            }

            function onEmailExists() {
              mensajeRespuesta.visible = true
              mensajeRespuesta.text = qsTr(
                    "Ya existe una cuenta con este correo. Inicie sesión.")
            }
          }
        }

        Text {
          id: mensajeRespuestaServer
          text: qsTr("Error para conectar con el servidor")
          color: "#FDEF0A"
          font.pixelSize: 15
          font.weight: 200
          font.family: fuenteSecundaria.font.family
          anchors.top: mensajeRespuesta.bottom
          anchors.topMargin: 10
          anchors.horizontalCenter: mensajeRespuesta.horizontalCenter
          visible: false
        }
      }
    }

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
              loader.source = "login.qml"
            }
          }
        }
      }
    }
  }
}
