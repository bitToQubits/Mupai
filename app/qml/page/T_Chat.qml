import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import FluentUI
import "../component"

Item {
  FluScrollablePage {
    id: pagina
    title: "Chatea con Mupi"
    leftPadding: 10
    rightPadding: 10
    bottomPadding: 20
    spacing: 0
  }

  FluArea {
    id: layout_bottom
    height: 50
    anchors {
      bottom: parent.bottom
      bottomMargin: 10
      left: parent.left
      right: parent.right
      leftMargin: 10
      rightMargin: 10
    }
    ScrollView {
      id: scrollview
      anchors {
        bottom: parent.bottom
        left: parent.left
        right: button_send.left
        bottomMargin: 10
        leftMargin: 10
        rightMargin: 10
      }
      height: Math.min(textbox.implicitHeight, 64)
      FluMultilineTextBox {
        id: textbox
        focus: true
        placeholderText: "请输入消息"
      }
    }

    FluFilledButton {
      id: button_send
      text: "Problema"
      anchors {
        bottom: parent.bottom
        right: parent.right
        bottomMargin: 10
        rightMargin: 10
      }
      width: 60
    }
  }
}
