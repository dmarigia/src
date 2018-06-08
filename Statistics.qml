Rectangle {
    anchors.fill: parent
    color: '#fbfcfd'

    ChartBar {
        anchors.fill: parent
        legend: true
        labels: ['Аспирант 1', 'Аспирант 2', 'Аспирант 3']
        title: 'Статистика'

        BarData {
            data: [6, 3, 1]
            color: ['green', 'blue', 'pink']
            label: 'Заданий в процессе'
        }

        BarData {
            data: [10, 5, 8]
            color: ['crimson', 'violet', 'red']
            label: 'Заданий выполнено'
        }
    }
}