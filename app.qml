/*** @using { src.PersonalPage } **/
/*** @using { src.Journal } **/

Rectangle {
    id: app;
    anchors.fill: parent;
    color: "#f5f5f5";
    property string page: "PersonalPage";
    property string pageName: "Личная информация";
    
    Item {
        anchors.centerIn: parent;
        width: 90%;
        height: 95%;
        
        LeftPanel {
            id: leftPanel;
        }
        
        Rectangle {
            id: infoPanel;
            height: 80;
            anchors.left: leftPanel.right;
            anchors.right: parent.right;
            Row {
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: panel.right;
                anchors.leftMargin: 30;
                MenuButton {}
                Text {
                    text: app.pageName;
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
            anchors.left: leftPanel.right;
            anchors.right: parent.right;
        }
    }
}
