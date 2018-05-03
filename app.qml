/*** @using { src.PersonalPage } **/
/*** @using { src.Journal } **/

MainItem {
    id: app;
    anchors.fill: parent;
    color: "#BDBDBD";
    title: "Личный кабинет - " + pageName;
    property string page: "PersonalPage";
    property string pageName: "Личная информация"; // TODO: auto

    Rectangle {
        id: insideRect;
        color: "#f5f5f5";
        anchors.centerIn: parent;
        width: app.mobile ? app.width : app.width * 0.9;
        height: app.mobile ? app.height : app.height;

        LeftPanel {
            id: leftPanel;
            z: 1;
            fixed: app.mobile;
        }
        LeftPanelWhiteBottom {}

        Rectangle {
            id: infoPanel;
            fixed: app.mobile;
            z: 1;
            height: 70;
            anchors.left: parent.left;
            anchors.right: parent.right;
            color: "#5d6578";
            Row {
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 30;
                spacing: 10;
                MenuButtonMaterial {
                    id: menuButton;
                    visible: app.mobile;
                    colorIcon: "white";
                    opacity: 0.4;
                    onClicked: { leftPanel.active ? leftPanel.close() :  leftPanel.open() }
                    Behavior on background { ColorAnimation { duration: 200; } }
                }
                Text {
                    text: app.pageName;
                    font.pixelSize: 18;
                    color: "#adb1ba";
                    font.family: "century gothic";
                }
            }

            Row {
                spacing: 10;
                anchors.right: infoPanel.right;
                anchors.rightMargin: 30;
                anchors.verticalCenter: parent.verticalCenter;
                Image {
                    source: "images/exit.png";
                    height: 25;
                    width: 25;
                    opacity: 0.4;
                    ColorIcon {
                        anchors.fill: parent;
                        source: parent.source;
                        color: "white";
                    }
                }
                Text {
                    text: "Выход";
                    font.pixelSize: 16;
                    font.family: "century gothic";
                    color: "#adb1ba";
                }
            }
        }

        Loader { // TODO: change container-like
            id: loader;
            source: "src." + app.page;
            anchors.top: infoPanel.bottom;
            anchors.bottom: parent.bottom;
            anchors.left: app.mobile ? parent.left : leftPanel.right;
            anchors.right: parent.right;
        }
    }

    // background for mobile menu
    Rectangle {
        anchors.fill: parent;
        color: "darkgray";
        opacity: 0.6;
        visible: leftPanel.active;
        fixed: true;
        MouseArea {
            anchors.fill: parent;
            onClicked: { leftPanel.close() }
        }
    }

    onMobileChanged: {
        if (!this.mobile) leftPanel.close()
    }

    // test config
    GlobalSettings {
        id: global; // TODO: rename to settings
        firstName: "Евгений";
        lastName: "Кошевой";
        middleName: "Викторович";
        avatarPath: "https://gordonua.com/img/article/2003/67_tn.jpg";
        job: "Комик";
    }

    MainItemDebug { visible: true; }

    Audio {
        id: audio;
        source: "http://dl1-1.mp3party.net/download/8630";
    }
    Button {
        anchors.right: parent.right;
        color: "transparent";
        z: 12; width: 60; height: 20; text: "🙈";
        onClicked: { !audio.running ? audio.play() : audio.pause() }
    }
}
