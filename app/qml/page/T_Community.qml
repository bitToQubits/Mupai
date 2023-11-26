import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import FluentUI
import "qrc:app/qml/global/"

FluContentPage {

  title: "Plantillas de conversación creadas por la comunidad"

  leftPadding: 10
  rightPadding: 10
  bottomPadding: 20

  Component {
    id: com_item
    Item {
      width: 320
      height: 120
      FluArea {
        radius: 8
        width: 300
        height: 100
        anchors.centerIn: parent
        Rectangle {
          anchors.fill: parent
          radius: 8
          color: {
            if (FluTheme.dark) {
              if (item_mouse.containsMouse) {
                return Qt.rgba(1, 1, 1, 0.03)
              }
              return Qt.rgba(0, 0, 0, 0)
            } else {
              if (item_mouse.containsMouse) {
                return Qt.rgba(0, 0, 0, 0.03)
              }
              return Qt.rgba(0, 0, 0, 0)
            }
          }
        }
        Image {
          id: item_icon
          height: 40
          width: 40
          source: modelData.image
          anchors {
            left: parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
          }
        }

        FluText {
          id: item_title
          text: modelData.title
          fontStyle: FluText.BodyStrong
          anchors {
            left: item_icon.right
            leftMargin: 20
            top: item_icon.top
          }
        }

        FluText {
          id: item_desc
          text: modelData.desc
          color: FluColors.Grey120
          wrapMode: Text.WrapAnywhere
          elide: Text.ElideRight
          fontStyle: FluText.Caption
          maximumLineCount: 2
          anchors {
            left: item_title.left
            right: parent.right
            rightMargin: 20
            top: item_title.bottom
            topMargin: 5
          }
        }

        Rectangle {
          height: 12
          width: 12
          radius: 6
          color: FluTheme.primaryColor.dark
          anchors {
            right: parent.right
            top: parent.top
            rightMargin: 14
            topMargin: 14
          }
        }

        MouseArea {
          id: item_mouse
          anchors.fill: parent
          hoverEnabled: true
          onClicked: {
            ItemsOriginal.startPageByItem(modelData)
          }
        }
      }
    }
  }

  FluTextBox {
    id: text_box
    placeholderText: "Por favor, introduzca una palabra clave"
    anchors {
      topMargin: 20
      top: parent.top
    }
  }

  GridView {
    Layout.fillWidth: true
    implicitHeight: contentHeight
    cellHeight: 120
    cellWidth: 320
    model: ItemsOriginal.getRecentlyAddedData()
    interactive: false
    delegate: com_item
  }
}
