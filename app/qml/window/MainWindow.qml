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
        //ItemsOriginal.create_item(nombre.trim(), ID)
        console.log(ItemsOriginal.children.length)
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
    }
  }
}
