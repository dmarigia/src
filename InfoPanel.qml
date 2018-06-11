Rectangle {
    id: infoPanel
    fixed: app.mobile
    z: 1
    height: 70
    anchors.left: parent.left
    anchors.right: parent.right
    color: '#5d6578'

    Row {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 30
        spacing: 10

        MenuButtonMaterial {
            id: menuButton
            visible: app.mobile
            color: 'transparent'
            colorIcon: 'white'
            opacity: 0.4
            onClicked: { leftPanel.active ? leftPanel.close() : leftPanel.open() }
            Behavior on background { ColorAnimation { duration: 200; } }
        }

        Text {
            text: qsTr(app.pageName);
            font.pixelSize: 18
            color: '#adb1ba'
        }
    }

    LanguageButton {
        anchors.top: parent
        anchors.topMargin: 22
        opacity: 0.5
        anchors.right: exitButton.left
        anchors.rightMargin: 15
    }

    Row {
        id: exitButton
        spacing: 0
        anchors.right: infoPanel.right
        anchors.rightMargin: 30
        anchors.verticalCenter: parent.verticalCenter

        Image {
            source: 'images/exit.png'
            height: 25
            width: 25
            opacity: 0.4

            ColorIcon {
                anchors.fill: parent
                source: parent.source
                color: 'white'
            }
        }

        AbstractButton {
            opacity: 0.8
            anchors.top: parent
            anchors.topMargin: 3
            text: qsTr('Выход');
            width: 40
            font.pixelSize: 15
            color: 'transparent'
            font.family: 'Montserrat'
            colors.text: '#adb1ba'
            //font.pixelSize: 16
            //colors.hovered: 'transparent'
            //colors.pressed: 'transparent'
        }
    }
}
