Rectangle {
    anchors.fill: parent

    ChartBar {
        anchors.fill: parent
        categories: ['Аспирант 1', 'Аспирант 2', 'Аспирант 3']
        title: 'Статистика'

        BarData {
            values: [6, 3, 1]
            color: ['green', 'blue', 'pink']
            label: 'Заданий в процессе'
        }

        BarData {
            values: [10, 5, 8]
            color: ['crimson', 'violet', 'red']
            label: 'Заданий выполнено'
        }
    }
}