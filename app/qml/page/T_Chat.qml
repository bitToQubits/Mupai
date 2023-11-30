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
      anchors.bottom: isLoading.top
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
                if (Chat.es_plantilla) {
                  if (Chat.img_plantilla != '0') {
                    return "data:image/png;base64," + Chat.img_plantilla
                  } else {
                    return "qrc:images/Mupiii.svg"
                  }
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
              if (Chat.es_plantilla) {
                return FluTheme.primaryColor.dark
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
        width: 120
        height: 120
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 65

        Image {
          clip: true
          height: iconoMupi.width / 1.5
          source: {
            if (Chat.es_plantilla) {
              if (Chat.img_plantilla != '0') {
                console.log(Chat.img_plantilla)
                return "data:image/png;base64," + Chat.img_plantilla
              } else {
                return "qrc:images/Mupiii.svg"
              }
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
          fillMode: Image.PreserveAspectFit
          anchors.centerIn: parent
          smooth: true
        }
      }
      FluText {
        id: subencabezado
        text: {
          if (Chat.es_plantilla) {
            return "Chatea con " + Chat.nombre_plantilla
          } else {
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
          if (Chat.es_plantilla) {
            return Chat.desc_plantilla
          } else if (Chat.AI == 'chaplin') {
            return '¿Qué hay de nuevo?'
          } else {
            return '¿En qué te puedo ayudar?'
          }
        }
        fontStyle: (Chat.es_plantilla) ? FluText.Caption : FluText.Title
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: subencabezado.bottom
        anchors.topMargin: 20
      }
      RowLayout {
        id: rowLayout

        width: parent.width
        height: 60
        anchors.top: encabezado.bottom
        anchors.topMargin: 60
        anchors.horizontalCenter: encabezado.horizontalCenter
        spacing: 20

        Rectangle {
          visible: (Chat.es_plantilla) ? false : true
          id: sug
          width: parent.width / 2
          height: 60
          color: 'transparent'
          border.color: {
            console.log("Es plantilla", Chat.es_plantilla)
            switch (Chat.AI) {
            case "davinci":
              return "#e85072"
            case "chaplin":
              return "#a3dce5"
            case "neumann":
              return "#f7a96c"
            default:
              return "#c68ff2"
            }
          }
          border.width: 2
          radius: 10
          anchors.left: parent.left
          anchors.leftMargin: 25
          anchors.right: sug_2.left
          anchors.rightMargin: 15
          Text {
            id: sug_titulo
            text: {
              switch (Chat.AI) {
              case "davinci":
                return "Genera ideas creativas"
              case "chaplin":
                return "Disfruta de una conversación casual"
              case "neumann":
                return "Realiza tareas cotidianas"
              default:
                return "Obtén respuestas inmediatas"
              }
            }
            color: FluTheme.dark ? "#FFFFFF" : "#000000"
            font.bold: true
            font.pixelSize: 15
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
          }
          Text {
            id: sug_desc
            text: {
              switch (Chat.AI) {
              case "davinci":
                return "¿Que puedo regalar a mi mamá de cumpleaños?"
              case "chaplin":
                return "Cuentame un chiste para matar el rato"
              case "neumann":
                return "Piensa en estrategias para realizar marketing digital"
              default:
                return "¿En qué consiste la fotosíntesis celular?"
              }
            }
            color: FluTheme.dark ? "#FFFFFF" : "#000000"
            font.pixelSize: 12
            anchors.top: sug_titulo.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 10
          }
        }

        Rectangle {
          visible: (Chat.es_plantilla) ? false : true
          id: sug_2
          width: parent.width / 2
          height: 60
          color: 'transparent'
          border.color: {
            switch (Chat.AI) {
            case "davinci":
              return "#e85072"
            case "chaplin":
              return "#a3dce5"
            case "neumann":
              return "#f7a96c"
            default:
              return "#c68ff2"
            }
          }
          border.width: 2
          radius: 10
          anchors.right: parent.right
          anchors.rightMargin: 25
          anchors.left: sug.right
          anchors.leftMargin: 15
          Text {
            id: sug_titulo_2
            text: {
              switch (Chat.AI) {
              case "davinci":
                return "Crea imagenes con el comando /imagina"
              case "chaplin":
                return "Sorpréndete con sus ocurrencias"
              case "neumann":
                return "Resuelve problemas de naturaleza lógica"
              default:
                return "Aprende algo nuevo"
              }
            }
            color: FluTheme.dark ? "#FFFFFF" : "#000000"
            font.bold: true
            font.pixelSize: 15
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
          }
          Text {
            id: sug_desc_2
            text: {
              switch (Chat.AI) {
              case "davinci":
                return "Imagina un gato con alas surcando a traves de los cielos"
              case "chaplin":
                return "Explicame la teoria de la relatividad como si tuviera 5 años"
              case "neumann":
                return "Escribe un algoritmo que calcule el factorial de un número"
              default:
                return "¿Cómo se dice hola en chino?"
              }
            }
            color: FluTheme.dark ? "#FFFFFF" : "#000000"
            font.pixelSize: 12
            anchors.top: sug_titulo_2.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 10
          }
        }
      }
    }

    Item {
      id: isLoading
      visible: Chat.isLoading
      anchors {
        //bottom sera el ultimo mensaje de la lista
        bottom: layout_bottom.top
        bottomMargin: 10
        left: parent.left
        right: parent.right
      }
      width: 40
      height: 60

      FluRectangle {
        id: item_avatar_loading
        width: 30
        height: 30
        radius: [15, 15, 15, 15]
        anchors {
          right: undefined
          rightMargin: undefined
          left: parent.left
          leftMargin: 20
          top: parent.top
        }
        Image {
          asynchronous: true
          anchors.fill: parent
          sourceSize: Qt.size(100, 100)
          source: {
            if (Chat.es_plantilla) {
              if (Chat.img_plantilla != 0) {
                return "data:image/png;base64," + Chat.img_plantilla
              } else {
                return "qrc:images/Mupiii.svg"
              }
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
        id: item_layout_content_loading
        color: {
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
        width: text_edit_loading.width + 10
        height: text_edit_loading.height + 10
        radius: 3
        anchors {
          top: item_avatar_loading.top
          right: undefined
          rightMargin: undefined
          left: item_avatar_loading.right
          leftMargin: 10
        }

        TextEdit {
          id: text_edit_loading
          text: timer_loading.loadingText
          wrapMode: Text.WrapAnywhere
          readOnly: true
          selectByMouse: true
          leftPadding: 5
          font.pixelSize: 15
          selectByKeyboard: true
          selectedTextColor: Qt.rgba(51, 153, 255, 1)
          color: {
            switch (Chat.AI) {
            case "chaplin":
              return "#030303"
            case "neumann":
              return "#030303"
            default:
              return "#FFFFFF"
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

      Item {
        id: item_layout_bottom_loading
        width: parent.width
        anchors.top: item_layout_content_loading.bottom
        height: 20
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
                                if (text.includes("/imagina")) {
                                  appendMessage(true, text)
                                  text = text.replace("/imagina", "")
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
        disabled: {
          return Chat.isLoading
        }
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
            if (text.includes("/imagina")) {
              appendMessage(true, text)
              text = text.replace("/imagina", "")
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
    if (Chat.ID !== 0) {
      Chat.obtenerMensajes(Chat.ID)
      for (var i = 0; i < Chat.messages.length; i++) {
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
