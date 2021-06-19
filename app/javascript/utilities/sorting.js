document.addEventListener('turbolinks:load', function () {
    var control = document.querySelector('.sort-by-title')
    if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
    var table = document.querySelector('table')

    //NodeList
    //https://developer.mozilla.org/ru/docs/Web/API/NodeList
    var rows = table.querySelectorAll('tr')
    var sortedRows = []

    //select all table rows except the first one which is the header
    for (var i = 1; i < rows.length; i++) {
        sortedRows.push(rows[i])
    }

    if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc)
        this.querySelector('.octicon-arrow-up').classList.remove('hide')
        this.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
        sortedRows.sort(compareRowsDesc)
        this.querySelector('.octicon-arrow-down').classList.remove('hide')
        this.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    var sortedTable = document.createElement('table')
    var sortedTbody = document.createElement('tbody')

    sortedTable.classList.add('table', 'table-striped')

    sortedTbody.appendChild(rows[0])

    for (var i = 0; i < sortedRows.length; i++) {
        sortedTbody.appendChild(sortedRows[i])
    }
    sortedTable.appendChild(sortedTbody)

    table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(rows1, rows2){
    var testTitle1 = rows1.querySelector('td').textContent
    var testTitle2 = rows2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
}

function compareRowsDesc(rows1, rows2){
    var testTitle1 = rows1.querySelector('td').textContent
    var testTitle2 = rows2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0
}