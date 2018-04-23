/*** @using { src.PersonalPage } **/
/*** @using { src.Journal } **/

Rectangle {
    id: app;
    anchors.fill: parent;
    color: "#f5f5f5";
    property string page: "PersonalPage";
    property string pageName: "Личная информация";
    property bool mobile: false;

    Button {
        width: 30;
        height: 10;
        text: app.mobile ? "To Desktop" : "To Mobile";
        onClicked: { app.mobile = !app.mobile }
        z: 1;
    }

    Item {
        anchors.centerIn: parent;
        width: app.mobile ? app.width : app.width * 0.9;
        height: app.mobile ? app.height : app.height * 0.95;

        LeftPanel {
            id: leftPanel;
            z: 1;
        }

        Rectangle {
            id: infoPanel;
            height: 80;
            anchors.left: app.mobile ? parent.left : leftPanel.right;
            anchors.right: parent.right;
            Row {
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: panel.right;
                anchors.leftMargin: 30;
                MenuButton { }
                Text {
                    text: app.pageName;
                    anchors.verticalCenter: parent.verticalCenter;
                    font.pixelSize: 18;
                    color: "#212121";
                    font.family: "century gothic";
                    font.bold: true;
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
}
