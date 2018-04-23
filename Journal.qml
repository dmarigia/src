Item {
    id: journal;
    anchors.fill: rect;

    Column {    
        spacing: 20;       
        Rectangle {
            id: topCol;
            height: 80;
            width: rect.width;
            color: "white";
            Text {                
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: panel.right;
                anchors.leftMargin: 30;
                text: "Личная информация";
                font.pixelSize: 18;
                color: "#212121";
                font.family: "century gothic";
                font.bold: true;
            }
        }
    }
}