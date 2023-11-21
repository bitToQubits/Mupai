import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Universal
import app.Login

Item {
  id: paginaLogin
  width: 1224
  height: 620

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
              loader.source = "registro.qml"
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

        Text {
          id: inicieSesion
          text: qsTr("Inicie sesión")
          font.family: fuentePrincipal.font.family
          font.pixelSize: 35
          anchors.topMargin: 20
          //anchors.top: registroExitosoMsg.bottom
          anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
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
          text: qsTr("o utiliza tu email y contraseña")
          font.pixelSize: 18
          font.weight: 200
          font.family: fuenteSecundaria.font.family
          anchors.top: googleButton.bottom
          anchors.topMargin: 20
          anchors.horizontalCenter: googleButton.horizontalCenter
        }

        TextField {
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
          anchors.topMargin: 20
          onTextChanged: Login.password = text
          anchors.horizontalCenter: email.horizontalCenter
          bottomPadding: 10
          topPadding: 10
          leftPadding: 10
          background: Rectangle {
            color: "#EEEDEF"
            radius: 10
          }
        }

        Button {
          id: loginButton
          width: parent.width / 4
          height: 40
          onClicked: {
            Login.loguearse()
            mensajeRespuestaServer.visible = !(Login.status_server)
            mensajeRespuesta.visible = !(Login.status_form)
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

        Text {
          id: mensajeRespuesta
          text: qsTr("Favor revisar sus credenciales")
          color: "#B41E23"
          font.pixelSize: 15
          font.weight: 200
          font.family: fuenteSecundaria.font.family
          anchors.top: loginButton.bottom
          anchors.topMargin: 20
          anchors.horizontalCenter: loginButton.horizontalCenter
          visible: false
        }

        Text {
          id: mensajeRespuestaServer
          text: qsTr("Error para conectar con el servidor")
          color: "#FDEF0A"
          font.pixelSize: 15
          font.weight: 200
          font.family: fuenteSecundaria.font.family
          anchors.top: mensajeRespuesta.bottom
          anchors.topMargin: 20
          anchors.horizontalCenter: mensajeRespuesta.horizontalCenter
          visible: false
        }

        Text {
          id: registroExitosoMsg
          text: qsTr(root.notificacion)
          font.family: fuenteSecundaria.font.family
          font.pixelSize: 15
          color: "green"
          anchors.topMargin: 20
          anchors.top: mensajeRespuestaServer.bottom
          anchors.horizontalCenter: mensajeRespuestaServer.horizontalCenter
          opacity: 1
          visible: (root.notificacion) ? true : false

          SequentialAnimation {
            id: animationNotificacion
            running: (root.notificacion)

            NumberAnimation {
              target: registroExitosoMsg
              property: "opacity"
              from: 0
              to: 1
              duration: 250
            }

            PauseAnimation {
              duration: 5000
            }

            NumberAnimation {
              target: registroExitosoMsg
              property: "opacity"
              from: 1
              to: 0
              duration: 250
            }

            ScriptAction {
              script: {
                root.notificacion = ""
                registroExitosoMsg.visible = false
              }
            }
          }
        }
      }
    }
  }
}
