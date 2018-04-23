Item {
    id: app;
    anchors.fill: parent;
    
    LeftPanel {  
    }
    
    Rectangle {
        id: rect;
        anchors.left: panel.right;
        anchors.right: parent.right;
        height: 100%;
        color: "#f5f5f5";
    }
    
    PersonalPage {
    }
    
    Journal {
        visible: false;
    }
}