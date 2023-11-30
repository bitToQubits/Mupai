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
    FluMenuItem {
      text: "Editar nombre"
      onClicked: {
        FluApp.navigate("/standardWindow")
      }
    }

    FluMenuItem {
      text: "Eliminar"
      onClicked: {
        confirmacion_eliminacion.open()
      }
    }
    function showMenu(id) {
      menu_item.selectedChat = id
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
      nav_view.setCurrentIndex(1, 'footer_list')
      nav_view.push("qrc:app/qml/page/T_Home.qml")
      ItemsOriginal.navigationView = nav_view
      ItemsFooter.navigationView = nav_view
      ItemsOriginal.menuDesplegable = menu_item
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

      if (deleted_id == chat_id) {
        console.log("Se fue por alla")
        Chat.setear("mupi", true, false)
        nav_view.push("qrc:app/qml/page/T_Home.qml")
        nav_view.setCurrentIndex(1, 'footer_list')
      } else {
        console.log("Son unos comentarios")
        nav_view.setCurrentIndex(id_actual, lista_actual)
      }

      menu_item.close()
      showSuccess("Chat eliminado correctamente")
    }
  }
}
