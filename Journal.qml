Item {
    id: journal;
    anchors.fill: parent;

    Column {    
        spacing: 20;       
        Rectangle {
            id: topCol;
            height: 80;
            width: psPage.width;
            color: "white";
            Text {                
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: panel.right;
                anchors.leftMargin: 30;
                text: "Журнал";
                font.pixelSize: 18;
                color: "#212121";
                font.family: "century gothic";
                font.bold: true;
            }
        }
    }
}