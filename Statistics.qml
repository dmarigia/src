Rectangle {
    anchors.fill: parent
    color: '#FBFCFD'
    Text {
        anchors.horizontalCenter: parent
        text: 'Статистика виконання завдань'
        color: '#2b3857'
        anchors.bottom: chartBar.top
        font.pixelSize: 16
        font.bold: true
        anchors.bottomMargin: 25
    }

    NetworkRequest {
        id: networkStat
        url: 'https://marigia.top/api/stat'
        onLoaded: {
            let json = this.toJson()
            chartBar.categories = json['emplList']
            barData1.values = json['values']
            barData2.values = json['valuesFinal']
        }
    }

    onCompleted: {
        networkStat.send()
    }

    ChartBar {
        id: chartBar
        anchors.verticalCenter: parent
        height: parent.height / 1.4
        categories: ['Аспірант 1', 'Аспірант 2', 'Аспірант 3', 'Аспірант 4', 'Аспірант 5']
        // ['Фамілія Ім`я По батькові', 'Фамілія Ім`я По батькові', 'Фамілія Ім`я По батькові'] // тоже не надо
        opacity: 0.8

        BarData {
            id: barData1
            values: 5 // это не надо копировать (мы будем values с сервера ТИПА ТЯГАТЬ)
            color: '#B0C5EF'
            label: 'Завдань у процесі'
        }

        BarData {
            id: barData2
            values: 5 // это не надо копировать
            color: '#D6A7DF'
            label: 'Завдань виповнено'
        }
    }
}
