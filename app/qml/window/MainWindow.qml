import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.platform
import FluentUI
import app.chat
import "qrc:app/qml/global/"

Item {

  id: window

  SystemTrayIcon {
    id: system_tray
    visible: true
    icon.source: "qrc:/images/Icon.png"
    tooltip: "Mupia"
    menu: Menu {
      MenuItem {
        text: "Cerrar"
        onTriggered: {
          window.destoryWindow()
          FluApp.closeApp()
        }
      }
    }
    onActivated: reason => {
                   if (reason === SystemTrayIcon.Trigger) {
                     window.show()
                     window.raise()
                     window.requestActivate()
                   }
                 }
  }
  FluMenu {
    id: menu_item
    focus: false
    property string selectedChat
    property string __title
    FluMenuItem {
      text: "Editar nombre"
      onClicked: {
        FluApp.navigate("/standardWindow")
        //Crear señal
        Chat.editarChat(menu_item.selectedChat, menu_item.__title)
      }
    }

    FluMenuItem {
      text: "Eliminar"
      onClicked: {
        confirmacion_eliminacion.open()
      }
    }
    function showMenu(id, title) {
      menu_item.selectedChat = id
      menu_item.__title = title
      menu_item.popup()
    }
  }

  FluNavigationView {
    id: nav_view
    anchors.fill: parent
    items: ItemsOriginal
    footerItems: ItemsFooter
    z: 11
    displayMode: MainEvent.displayMode
    logo: "qrc:/images/Icon.png"
    title: "Mupia"
    autoSuggestBox: FluAutoSuggestBox {
      width: 280
      anchors.centerIn: parent
      iconSource: FluentIcons.Search
      items: ItemsOriginal.getSearchData()
      placeholderText: "Buscar"
      onItemClicked: data => {
                       ItemsOriginal.startPageByItem(data)
                     }
    }

    function populateChatList() {
      let chats = Chat.getChats()

      for (var i = 0; i < chats.length; i++) {
        ItemsOriginal.create_item(chats[i].nombre.trim(), chats[i].ID)
      }
    }

    Connections {
      target: Chat
      function onNuevoChat(nombre, ID) {
        ItemsOriginal.children.length = 0
        nav_view.populateChatList()
        nav_view.setCurrentIndex(ItemsOriginal.children.length - 1, 'nav_list')
      }
    }
    Component.onCompleted: {
      populateChatList()
      nav_view.setCurrentIndex(-1, 'nav_list')
      nav_view.push("qrc:app/qml/page/T_Home.qml")
      ItemsOriginal.navigationView = nav_view
      ItemsFooter.navigationView = nav_view
      ItemsOriginal.menuDesplegable = menu_item
    }
  }

  Item {
    x: 309
    y: 15

    FluButton {
      id: inicio_boton
      anchors.left: parent.left
      width: 70

      Text {
        font.family: "Segoe Fluent Icons"
        font.pixelSize: 14
        //horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.centerIn: parent
        color: FluTheme.dark ? Qt.rgba(1, 1, 1, 1) : Qt.rgba(0, 0, 0, 1)
        text: (String.fromCharCode(FluentIcons.Home).toString(12)) + " Inicio"
      }

      onClicked: {
        ItemsOriginal.navigationView.push("qrc:app/qml/page/T_Home.qml")
      }
    }

    FluButton {
      id: nuevo_chat
      anchors.left: inicio_boton.right
      anchors.leftMargin: 10
      width: 110

      Text {
        font.family: "Segoe Fluent Icons"
        font.pixelSize: 14
        //horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.centerIn: parent
        color: FluTheme.dark ? Qt.rgba(1, 1, 1, 1) : Qt.rgba(0, 0, 0, 1)
        text: (String.fromCharCode(FluentIcons.DictionaryAdd).toString(
                 12)) + " Nuevo Chat"
      }
      onClicked: {
        Chat.setear("mupi", true, false)
        ItemsOriginal.navigationView.push("qrc:app/qml/page/T_Chat.qml")
      }
    }
  }

  FluContentDialog {
    id: confirmacion_eliminacion
    title: "Eliminar este chat"
    message: "¿Estas seguro de querer eliminarlo?"
    buttonFlags: FluContentDialog.NegativeButton | FluContentDialog.PositiveButton
    negativeText: "No, cancelar"
    positiveText: "Si"
    onPositiveClicked: {
      Chat.removeChat(menu_item.selectedChat)
      window.repopular()
      menu_item.close()
      showSuccess("Chat eliminado correctamente")
    }
  }

  Connections {
    target: Chat
    function onTituloCambiado() {
      window.repopular("actualizar")
    }
  }

  function repopular(accion = 'eliminar') {
    let id_actual
    let lista_actual
    let chat_id = Chat.ID
    let deleted_id = menu_item.selectedChat
    if (nav_view.getCurrentIndex('footer_list') < 0) {
      id_actual = nav_view.getCurrentIndex('nav_list')
      lista_actual = 'nav_list'
    } else {
      id_actual = nav_view.getCurrentIndex('footer_list')
      lista_actual = 'footer_list'
    }

    ItemsOriginal.children.length = 0
    nav_view.populateChatList()

    if (deleted_id == chat_id && accion == 'eliminar') {
      Chat.setear("mupi", true, false)
      nav_view.push("qrc:app/qml/page/T_Home.qml")
      //nav_view.setCurrentIndex(1, 'footer_list')
    } else {
      console.log("Son unos comentarios")
      nav_view.setCurrentIndex(id_actual, lista_actual)
    }
  }
}
