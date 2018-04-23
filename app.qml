/*** @using { src.PersonalPage } **/
/*** @using { src.Journal } **/

Rectangle {
    id: app;
    anchors.fill: parent;
    color: "#f5f5f5";
    
    LeftPanel {  
    }
    
    property string page: "PersonalPage";
    Loader {
        source: "src." + parent.page;
        anchors.left: panel.right;
        anchors.right: parent.right;
        height: 100%;
    }
}