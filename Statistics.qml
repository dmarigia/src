Rectangle {
    anchors.fill: parent
    color: '#FBFCFD'
    Text {        
        anchors.horizontalCenter: parent
        text: "Статистика виконання завдань"
        color: "#2b3857"
        anchors.bottom: chartBar.top;
        font.pixelSize: 16;
        font.bold: true;
        anchors.bottomMargin: 25;
    }

    ChartBar {       
        id: chartBar
        anchors.verticalCenter: parent
        height: parent.height / 1.4
        categories: ['Аспирант 1', 'Аспирант 2', 'Аспирант 3']
        opacity: 0.8

        BarData {
            values: [6, 3, 1]
            color: '#B0C5EF'
            label: 'Заданий в процессе'
        }

        BarData {
            values: [10, 5, 8]
            color: '#D6A7DF'
            label: 'Заданий выполнено'
        }
    }
}