/*** @using { src.PersonalPage } **/
/*** @using { src.Journal } **/

MainItem {
    id: app;
    anchors.fill: parent;
    color: "#BDBDBD";
    title: "Личный кабинет - " + pageName;
    property string page: "PersonalPage";
    property string pageName: "Личная информация";

    GlobalSettings {
        id: global;
        firstName: "Евгений";
        lastName: "Кошевой";
        middleName: "Викторович";
        avatarPath: "http://gordonua.com/img/article/2003/67_tn.jpg";
        job: "Комик";
    }

    onMobileChanged: {
        if (!this.mobile) leftPanel.close()
    }

    MainItemDebug { visible: true; }

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
                MenuButton { 
                    opacity: 0.4;
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
                }
                Text {
                    text: "Выход";
                    font.pixelSize: 16;
                    font.family: "century gothic";
                    color: "#adb1ba";
                }
            }
        }

        Loader {
            id: loader;
            source: "src." + app.page;
            anchors.top: infoPanel.bottom;
            anchors.bottom: parent.bottom;
            anchors.left: app.mobile ? parent.left : leftPanel.right;
            anchors.right: parent.right;
        }
    }
    
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
}
