import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import FluentUI
import "../component"

FluScrollablePage {

  title: "Menu"
  leftPadding: 10
  rightPadding: 10
  bottomPadding: 20
  spacing: 0

  FluArea {
    Layout.fillWidth: true
    height: 100
    paddings: 10
    Layout.topMargin: 20
    Column {
      id: layout_column
      spacing: 15
      anchors {
        verticalCenter: parent.verticalCenter
        left: parent.left
      }

      FluButton {
        text: "lalala"
        Layout.topMargin: 20
        onClicked: {
          menu.popup()
        }
      }

      FluButton {
        text: "lololo"
        Layout.topMargin: 20
        onClicked: {
          showSuccess("2222")
        }
        MouseArea {
          anchors.fill: parent
          acceptedButtons: Qt.RightButton
          onClicked: {
            menu.popup()
          }
        }
      }
    }
  }

  CodeExpander {
    Layout.fillWidth: true
    Layout.topMargin: -1
    code: 'FluMenu{
property string cutText : "Cortar"
property string copyText : "Copiar"
property string pasteText : "Pegar"
property string selectAllText : "Seleccionar todo"
id:menu
FluMenuItem:{
text:"Borrar"
onClicked: {
showError("Borrado")
}
}
FluMenuItem:{
text:"Pegar"
onClicked: {
showInfo"修改")
}
}
}
menu.popup()
'
  }

  FluMenu {
    id: menu
    FluMenuItem {
      text: "Borrar"
      onClicked: {
        showError("删除")
      }
    }
    FluMenuItem {
      text: "Pegar"
      onClicked: {
        showInfo("修改")
      }
    }
  }
}
