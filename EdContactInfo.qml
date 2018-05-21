Item {
    id: edContactInfo;
    anchors.fill: insideRect;
    effects.shadow.blur: 6;  
    effects.shadow.color: "#5D6578";
    
    Rectangle {
        anchors.fill: parent;  
        color: "#5D6578";
        opacity: 0.7;
    }

    Rectangle {   
        id: edContactRect;
        color: "#FBFCFD";
        radius: 4;
        anchors.centerIn: parent;
        effects.shadow.color: "#5D6578";
        effects.shadow.blur: 10;
        effects.shadow.spread: 2;
        width: 450;
        height: 490;

        Column {
            id: column;
            spacing: 20;
            anchors.top: parent.top;
            anchors.topMargin: 50;
            anchors.left: parent.left;
            anchors.leftMargin: 35;
            Column {
                spacing: 10;
                Text {
                    color: "#A7B0C4";
                    text: "Teлефон";
                }
                TextInputMaterial {
                    width: edContactRect.width - 70;
                    placeholder.text: "Телефон";
                    materialColor: "#A8AEEC";
                    font.family: "century gothic";
                }
            }
            Column {
                spacing: 10;
                Text {
                    color: "#A7B0C4";
                    text: "e-mail";
                }
                TextInputMaterial {
                    width: edContactRect.width - 70;
                    placeholder.text: "e-mail";
                    materialColor: "#A8AEEC";
                    font.family: "century gothic";
                }
            }
            Column {
                spacing: 10;
                Text {
                    color: "#A7B0C4";
                    text: "Место работы";
                }
                TextInputMaterial {
                    width: edContactRect.width - 70;
                    placeholder.text: "Место работы";
                    materialColor: "#A8AEEC";
                    font.family: "century gothic";
                }
            }
            
            Column {
                spacing: 10;
                Text {
                    color: "#A7B0C4";
                    text: "Адрес проживания";
                }
                TextInputMaterial {
                    width: edContactRect.width - 70;
                    placeholder.text: "Адрес проживания";
                    materialColor: "#A8AEEC";
                    font.family: "century gothic";
                }
            }
        }

        Row {
            spacing: 60;
            anchors.top: column.bottom;
            anchors.topMargin: 35;
            anchors.right: edContactRect.right;
            anchors.rightMargin: 35;
            AbstractButton {
                colors.default: "#C9D1EC";
                text: "Отмена";
                radius: 50;
                height: 40;
                width: 120;
                onClicked:  { edContactInfo.visible = !edContactInfo.visible }
            }
            AbstractButton {
                colors.default: "#B0C5EF";
                text: "Сохранить";
                radius: 50;
                height: 40;
                width: 120;
            }
        }

    }
}