/*** @using { src.PersonalPage } **/
/*** @using { src.Journal } **/

Rectangle {
    id: app;
    anchors.fill: parent;
    color: "#f5f5f5";
    property string page: "PersonalPage";
    property string pageName: "Личная информация";
    
    Rectangle {
        // for Desktop
        anchors.centerIn: parent;
        color: "white";
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
            Text {
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: panel.right;
                anchors.leftMargin: 30;
                text: app.pageName;
                font.pixelSize: 18;
                color: "#212121";
                font.family: "century gothic";
                font.bold: true;
            }
        }
        
        Loader {
            source: "src." + app.page;
            anchors.top: infoPanel.bottom;
            anchors.bottom: parent.bottom;
            anchors.left: leftPanel.right;
            anchors.right: parent.right;
        }
    }
}
