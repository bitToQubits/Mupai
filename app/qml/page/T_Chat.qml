import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import FluentUI
import "../component"
import app.chat

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

    Component {
      id: com_image
      Image {
        id: item_image
        source: "data:image/png;base64," + message
        asynchronous: true
        fillMode: Image.PreserveAspectFit
        width: Math.min(list_message.width - 200, 600, implicitWidth)
        height: Math.min(list_message.width - 200, 600, implicitHeight)
        TapHandler {
          acceptedButtons: Qt.RightButton
          onTapped: {
            menu_item.showMenu(item_image.source)
          }
        }
      }
    }

    //Make a connection when response data changed
    Connections {
      target: Chat
      function onNuevoMensaje() {
        appendMessage(false, Chat.responseData)
      }

      function onNuevaImagen() {
        //Convertir el QVariant Object a Javascript Object
        appendImage(false, Chat.responseImages)
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
            property var message: model.content
            property bool isMy: model.isMy
            anchors.centerIn: parent
            sourceComponent: (!model.is_image) ? com_text : com_image
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
          console.log("T_Chat: ", Chat.AI)
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
          Keys.onPressed: event => {
                            if (event.key == '16777220'
                                && textbox.key != '16777248') {

                              var text = textbox.text.trim()
                              if (text == '') {
                                return
                              }

                              if (Chat.AI == 'davinci') {
                                if (text.includes("/generar")) {
                                  appendMessage(true, text)
                                  text = text.replace("/generar", "")
                                  Chat.sendPrompt(text)
                                  textbox.clear()
                                } else {
                                  appendMessage(true, text)
                                  Chat.sendMessage(text, "user")
                                  textbox.clear()
                                }
                              } else {
                                appendMessage(true, text)
                                Chat.sendMessage(text, "user")
                                textbox.clear()
                              }
                            }
                            if (event.key != '16777220') {
                              textbox.key = event.key
                            }
                          }
        }
      }

      FluIconButton {
        id: button_send
        iconSource: FluentIcons.SendFill
        disabled: Chat.isLoading
        iconSize: 15
        anchors {
          bottom: parent.bottom
          right: parent.right
          bottomMargin: 8
          rightMargin: 10
        }
        onClicked: {
          var text = textbox.text.trim().toLowerCase()
          if (text == '') {
            return
          }

          if (Chat.AI == 'davinci') {
            if (text.includes("/generar")) {
              appendMessage(true, text)
              text = text.replace("/generar", "")
              Chat.sendPrompt(text)
              textbox.clear()
              return
            }
          }

          appendMessage(true, text)
          Chat.sendMessage(text, "user")
          textbox.clear()
        }

        Timer {
          id: timer_loading
          property int count: 0
          property string loadingText: ""
          interval: 500
          running: Chat.isLoading
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
        Chat.clipText(menu_item.selectedText)
        showSuccess("Copiado correctamente")
      }
    }
    function showMenu(text) {
      menu_item.selectedText = text
      menu_item.popup()
    }
  }

  Component.onCompleted: {
    console.log(Chat.ID)
    if (Chat.ID !== 0) {
      Chat.obtenerMensajes(Chat.ID)
      for (var i = 0; i < Chat.messages.length; i++) {
        console.log(Chat.messages[i].role)
        if (Chat.messages[i].role === "user") {
          model_message.append({
                                 "isMy": true,
                                 "is_image": false,
                                 "content": Chat.messages[i].content
                               })
        } else if (Chat.messages[i].role === "assistant") {
          model_message.append({
                                 "isMy": false,
                                 "is_image": false,
                                 "content": Chat.messages[i].content
                               })
        }
      }
      list_message.positionViewAtEnd()
    }
  }

  function appendMessage(isMy, text) {
    model_message.append({
                           "isMy": isMy,
                           "is_image": false,
                           "content": text
                         })
    list_message.positionViewAtEnd()
  }

  function appendImage(isMy, image64) {

    //Recorrer a traves de un bucle for las imagenes para agregarlas individualmente
    for (var i = 0; i < image64.length; i++) {
      model_message.append({
                             "isMy": isMy,
                             "is_image": true,
                             "content": image64[i].b64_json
                           })
    }
    list_message.positionViewAtEnd()
  }
}
