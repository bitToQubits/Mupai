import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Universal

Window {
  id: root
  width: 1224
  height: 620
  visible: true
  title: qsTr("Mupai")

  property string notificacion

  FontLoader {
    id: fuentePrincipal
    source: "fonts/Avenir.otf"
  }

  FontLoader {
    id: fuenteSecundaria
    source: "fonts/Avenir_regular.otf"
  }

  Rectangle {
    id: mainArea
    width: parent.width
    height: parent.height

    Loader {
      id: loader
      anchors.fill: parent
      source: "login.qml"
      onSourceChanged: {
        animation.running = true
      }

      NumberAnimation {
        id: animation
        target: loader.item
        property: "x"
        from: (loader.source == 'login.qml') ? root.width : -root.width
        to: 0
        duration: 700
        easing.type: Easing.Linear
      }
    }
  }

  Connections {
    target: loader.item
    //ignoreUnknownSignals: true
    ignoreUnknownSignals: true
    function onRegistroExitoso(txt) {
      root.notificacion = txt
    }
  }
}
