import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.platform
import FluentUI
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
    Component.onCompleted: {
      ItemsOriginal.navigationView = nav_view
      ItemsFooter.navigationView = nav_view
      nav_view.setCurrentIndex(0)
    }
  }
}
