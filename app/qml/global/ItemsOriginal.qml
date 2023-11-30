pragma Singleton

import QtQuick
import FluentUI
import app.chat

FluObject {
  id: panelNavegacion

  property var navigationView
  property var menuDesplegable

  function create_item(nombre, id) {
    var item = Qt.createQmlObject('import FluentUI;import app.chat; FluPaneItem{
title:"' + nombre + '"
onTap: {
if(panelNavegacion.navigationView != null && panelNavegacion.navigationView != undefined){
if(panelNavegacion.navigationView.mouseButton == 1){
Chat.setear(' + id + ', false, false)
panelNavegacion.navigationView.push("qrc:app/qml/page/T_Chat.qml")
}else if (panelNavegacion.navigationView.mouseButton == 2) {
console.log("Click hecho!!")
if(panelNavegacion.menuDesplegable != null && panelNavegacion.menuDesplegable != undefined){
panelNavegacion.menuDesplegable.showMenu(' + id + ')
}
}
}
}
}', panelNavegacion)
    children.push(item)
  }

  //Busca un item en el panel de navegacion
  function getRecentlyAddedData(keyword) {
    var arr = []
    for (var i = 0; i < children.length; i++) {
      var item = children[i]
      if (item instanceof FluPaneItem && item.recentlyAdded) {
        arr.push(item)
      }
      if (item instanceof FluPaneItemExpander) {
        for (var j = 0; j < item.children.length; j++) {
          var itemChild = item.children[j]
          if (itemChild instanceof FluPaneItem && itemChild.recentlyAdded) {
            if (!keyword || keyword.trim().length === 0) {
              arr.push(itemChild)
            } else {
              if (keyword && itemChild.title.toLowerCase().includes(keyword)) {
                arr.push(itemChild)
              }
            }
          }
        }
      }
    }
    arr.sort(function (o1, o2) {
      return o2.order - o1.order
    })
    return arr
  }

  function getRecentlyUpdatedData() {
    var arr = []
    var items = navigationView.getItems()
    for (var i = 0; i < items.length; i++) {
      var item = items[i]
      if (item instanceof FluPaneItem && item.recentlyUpdated) {
        arr.push(item)
      }
    }
    return arr
  }

  function getSearchData() {
    var arr = []
    var items = navigationView.getItems()
    for (var i = 0; i < items.length; i++) {
      var item = items[i]
      if (item instanceof FluPaneItem) {
        arr.push({
                   "title": item.title,
                   "key": item.key
                 })
      }
    }
    return arr
  }

  function startPageByItem(data) {
    navigationView.startPageByItem(data)
  }
}
