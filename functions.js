
// load list data
function loadListData() {
    lmodel.clear();
    var d = dataIo.loadData()
    for (var i = 0; i < d.length; ++i) {
        var j = JSON.parse(d[i])
        lmodel.append(j)
    }
}

// make random color value
function makeHexStr(val) {
    return ('00' + val.toString(16)).slice(-2)
}

// make random color string
function randomColor() {
    var r = Math.random() * 256;
    var g = Math.random() * 256;
    var b = Math.random() * 256;
    return '#' + makeHexStr(r) + makeHexStr(g) + makeHexStr(b);
}
