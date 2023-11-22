import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Basic
import FluentUI
import app.user
import "qrc:app/qml/global/"

FluWindow {
  id: window
  title: "Mupia"
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

  Connections {
    target: appInfo
    function onActiveWindow() {
      window.show()
      window.raise()
      window.requestActivate()
    }
  }


  /*FluAppBar {
    id: appbar
    z: 9
    showDark: true
    width: parent.width
    darkText: qsTr("Luces apagadas")
  }*/
  StackView {
    id: stack
    initialItem: (User.ID === 0) ? "login.qml" : "app/qml/window/MainWindow.qml"
    anchors.fill: parent
  }
}
