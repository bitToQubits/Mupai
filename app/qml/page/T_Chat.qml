import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import FluentUI
import Controller
import "../component"
import app.chat
import "chat.js" as Logic

Item {
  id: pagina
  clip: true
  Rectangle {
    anchors.fill: parent
    color: 'transparent'
    border.width: 1
    border.color: FluTheme.dark ? Window.active ? Qt.rgba(
                                                    55 / 255, 55 / 255,
                                                    55 / 255,
                                                    1) : Qt.rgba(45 / 255, 45 / 255, 45
                                                                 / 255, 1) : Qt.rgba(
                                                    226 / 255, 229 / 255,
                                                    234 / 255, 1)
    anchors.rightMargin: -border.width
    anchors.bottomMargin: -border.width

    Component {
      id: com_text
      TextEdit {
        id: item_text
        text: message
        wrapMode: Text.WrapAnywhere
        readOnly: true
        selectByMouse: true
        font.pixelSize: 15
        selectByKeyboard: true
        selectedTextColor: Qt.rgba(51, 153, 255, 1)
        color: {
          if (isMy) {
            if (FluTheme.dark) {
              return '#FFFFFF'
            } else {
              return '#030303'
            }
          } else {
            switch (Chat.AI) {
            case "chaplin":
              return "#030303"
            case "neumann":
              return "#030303"
            default:
              return "#FFFFFF"
            }
          }
        }
        selectionColor: {
          if (FluTheme.dark) {
            return FluTheme.primaryColor.lighter
          } else {
            return FluTheme.primaryColor.dark
          }
        }
        width: Math.min(list_message.width - 200, 600, implicitWidth)
        TapHandler {
          acceptedButtons: Qt.RightButton
          onTapped: {
            menu_item.showMenu(item_text.selectedText)
          }
        }
      }
    }

    ChatController {
      id: controller

      onResponseDataChanged: {
        appendMessage(false, responseData)
      }
    }

    ListModel {
      id: model_message
    }

    ListView {
      id: list_message
      model: model_message
      anchors.fill: parent
      anchors.bottom: layout_bottom.top
      anchors.bottomMargin: 60
      clip: true
      ScrollBar.vertical: FluScrollBar {}
      preferredHighlightBegin: 0
      preferredHighlightEnd: 0
      highlightMoveDuration: 0
      header: Item {
        width: list_message.width
        height: 20
      }
      footer: Item {
        width: list_message.width
        height: 20
      }
      delegate: Item {
        width: ListView.view.width
        height: childrenRect.height

        FluRectangle {
          id: item_avatar
          width: 30
          height: 30
          radius: [15, 15, 15, 15]
          anchors {
            right: isMy ? parent.right : undefined
            rightMargin: isMy ? 20 : undefined
            left: isMy ? undefined : parent.left
            leftMargin: isMy ? undefined : 20
            top: parent.top
          }
          Image {
            asynchronous: true
            anchors.fill: parent
            sourceSize: Qt.size(100, 100)
            source: {
              if (isMy) {
                return "qrc:app/res/svg/avatar_7.svg"
              } else {
                switch (Chat.AI) {
                case "davinci":
                  return "qrc:images/Davinci.svg"
                case "chaplin":
                  return "qrc:images/Chaplin.svg"
                case "neumann":
                  return "qrc:images/Neumann.svg"
                default:
                  return "qrc:images/Mupiii.svg"
                }
              }
            }
          }
        }

        Rectangle {
          id: item_layout_content
          color: {
            if (isMy) {
              if (FluTheme.dark)
                return '#262c36'
              else
                return '#fbfbfd'
            } else {
              switch (Chat.AI) {
              case "davinci":
                return "#e85072"
              case "chaplin":
                return "#a3dce5"
              case "neumann":
                return "#f7a96c"
              default:
                return "#7D11F8"
              }
            }
          }
          width: item_msg_loader.width + 10
          height: item_msg_loader.height + 10
          radius: 3
          anchors {
            top: item_avatar.top
            right: isMy ? item_avatar.left : undefined
            rightMargin: isMy ? 10 : undefined
            left: isMy ? undefined : item_avatar.right
            leftMargin: isMy ? undefined : 10
          }

          Loader {
            id: item_msg_loader
            property var message: model.text
            property bool isMy: model.isMy
            anchors.centerIn: parent
            sourceComponent: com_text
          }
        }

        Item {
          id: item_layout_bottom
          width: parent.width
          anchors.top: item_layout_content.bottom
          height: 20
        }
      }
    }

    Rectangle {
      id: bienvenida
      anchors.fill: parent
      color: 'transparent'
      visible: {
        if (model_message.count > 0) {
          return false
        } else {
          return true
        }
      }
      FluArea {
        id: iconoMupi
        width: 60
        height: 60
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 65

        Image {
          height: iconoMupi.width / 2
          source: {
            switch (Chat.AI) {
            case "davinci":
              return "qrc:images/Davinci.svg"
            case "chaplin":
              return "qrc:images/Chaplin.svg"
            case "neumann":
              return "qrc:images/Neumann.svg"
            default:
              return "qrc:images/Mupiii.svg"
            }
          }
          fillMode: Image.PreserveAspectFit
          y: 15
          x: 13
          smooth: true
        }
      }
      FluText {
        id: subencabezado
        text: {
          switch (Chat.AI) {
          case "davinci":
            return "Imagina y comparte ideas con Davinci"
          case "chaplin":
            return "Diviertete con Chaplin"
          case "neumann":
            return "Haz las tareas con Neumann"
          default:
            return "Chatea con Mupi"
          }
        }

        fontStyle: FluText.SubTitle
        font.bold: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: iconoMupi.bottom
        anchors.topMargin: 20
      }
      FluText {
        id: encabezado
        text: {
          if (Chat.AI == 'chaplin') {
            return '¿Que hay de nuevo?'
          } else {
            return '¿En qué te puedo ayudar?'
          }
        }
        fontStyle: FluText.Title
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: subencabezado.bottom
        anchors.topMargin: 20
      }
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
          property string key: "-1"
          placeholderText: "Empieza a escribir .."
          focus: true
          font.pixelSize: 14
          Keys.onPressed: event => Logic.verificarInput(event.key)
        }
      }

      FluIconButton {
        id: button_send
        iconSource: FluentIcons.SendFill
        disabled: controller.isLoading
        iconSize: 15
        anchors {
          bottom: parent.bottom
          right: parent.right
          bottomMargin: 8
          rightMargin: 10
        }
        onClicked: {
          var text = textbox.text.trim()
          if (text == '') {
            return
          }
          appendMessage(true, text)
          controller.sendMessage(text)
          textbox.clear()
        }

        Timer {
          id: timer_loading
          property int count: 0
          property string loadingText: ""
          interval: 500
          running: controller.isLoading
          repeat: true
          onTriggered: {
            switch (count % 3) {
            case 0:
              loadingText = "."
              break
            case 1:
              loadingText = ".."
              break
            case 2:
              loadingText = "..."
              break
            default:
              loadingText = ""
              break
            }
            count++
          }
        }
      }
    }
  }
  FluMenu {
    id: menu_item
    focus: false
    property string cutText: "Cortar"
    property string copyText: "Copiar"
    property string pasteText: "Pegar"
    property string selectAllText: "Seleccionar"
    property string selectedText
    FluMenuItem {
      text: "Copiar"
      onClicked: {
        controller.clipText(menu_item.selectedText)
        showSuccess("Copiado correctamente")
      }
    }
    function showMenu(text) {
      menu_item.selectedText = text
      menu_item.popup()
    }
  }

  function appendMessage(isMy, text) {
    model_message.append({
                           "isMy": isMy,
                           "text": text
                         })
    list_message.positionViewAtEnd()
  }
}
