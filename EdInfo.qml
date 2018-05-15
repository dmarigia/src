Item {
    id: edInfo;
    anchors.fill: insideRect;
    effects.shadow.blur: 6;  
    effects.shadow.color: "#5D6578";
    
    Rectangle {
        anchors.fill: parent;  
        color: "#5D6578";
        opacity: 0.7;
    }

    Rectangle {   
        id: edInfoRect;
        color: "#FBFCFD";
        radius: 4;
        anchors.centerIn: parent;
        effects.shadow.color: "#5D6578";
        effects.shadow.blur: 10;
        effects.shadow.spread: 2;
        width: 450;
        height: 410;

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
                    text: "Дата рождения";
                }
                TextInputMaterial {
                    width: edInfoRect.width - 70;
                    placeholder.text: "Дата рождения";
                    materialColor: "#A8AEEC";
                    font.family: "century gothic";
                }
            }
            Column {
                spacing: 10;
                Text {
                    color: "#A7B0C4";
                    text: "Семейное положение";
                }
                TextInputMaterial {
                    width: edInfoRect.width - 70;
                    placeholder.text: "Семейное положение";
                    materialColor: "#A8AEEC";
                    font.family: "century gothic";
                }
            }
            Column {
                spacing: 10;
                Text {
                    color: "#A7B0C4";
                    text: "Дети";
                }
                TextInputMaterial {
                    width: edInfoRect.width - 70;
                    placeholder.text: "Дети";
                    materialColor: "#A8AEEC";
                    font.family: "century gothic";
                }
            }
        }

        Row {
            spacing: 60;
            anchors.top: column.bottom;
            anchors.topMargin: 35;
            anchors.right: edInfoRect.right;
            anchors.rightMargin: 35;
            AbstractButton {
                colors.default: "#C9D1EC";
                text: "Отмена";
                radius: 50;
                height: 40;
                width: 120;
                onClicked: { }
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