/*** @using { src.PersonalPage } **/
/*** @using { src.Journal } **/

Rectangle {
    id: app;
    anchors.fill: parent;
    color: "#f5f5f5";
    property string page: "PersonalPage";
    
    Item {
        // for Desktop
        anchors.centerIn: parent;
        width: 90%;
        height: 95%;
        
        LeftPanel {
            id: leftPanel;
        }
        Loader {
            source: "src." + app.page;
            anchors.left: leftPanel.right;
            anchors.right: parent.right;
            height: 100%;
        }
    }
}