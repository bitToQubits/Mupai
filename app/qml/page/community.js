var modelo = ""

function buscar(keyword) {
  var arr = []
  for (var i = 0; i < modelo.length; i++) {
    if (!keyword || keyword.trim().length === 0) {
      arr.push(modelo[i])
    } else {
      if (keyword && modelo[i].nombre.toLowerCase().includes(keyword)) {
        arr.push(modelo[i])
      }
    }
  }
  arr.sort(function (o1, o2) {
    return o2.order - o1.order
  })
  return arr
}
