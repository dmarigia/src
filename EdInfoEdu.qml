Item {
    id: edInfoEdu;
    fixed: true;
    width: app.width;
    height: parent.parent.height;
    
    Rectangle {
        anchors.fill: parent;
        color: "#5D6578";
        opacity: 0.7;
        MousePressMixin {
            onPressedChanged: { editLoader.source = '' }
        }
    }

    Rectangle {   
        id: edEduRect;
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
                    text: "Год обучения";
                }
                TextInputMaterial {
                    width: edEduRect.width - 70;
                    placeholder.text: "Год обучения";
                    materialColor: "#A8AEEC";
                }
            }
            Column {
                spacing: 10;
                Text {
                    color: "#A7B0C4";
                    text: "Тема научной работы";
                }
                TextInputMaterial {
                    width: edEduRect.width - 70;
                    placeholder.text: "Тема научной работы";
                    materialColor: "#A8AEEC";
                }
            }
            Column {
                spacing: 10;
                Text {
                    color: "#A7B0C4";
                    text: "Основа обучения";
                }
                TextInputMaterial {
                    width: edEduRect.width - 70;
                    placeholder.text: "Основа обучения";
                    materialColor: "#A8AEEC";
                }
            }
            
            Column {
                spacing: 10;
                Text {
                    color: "#A7B0C4";
                    text: "Форма обучения";
                }
                TextInputMaterial {
                    width: edEduRect.width - 70;
                    placeholder.text: "Форма обучения";
                    materialColor: "#A8AEEC";
                }
            }
        }

        Row {
            spacing: 60;
            anchors.top: column.bottom;
            anchors.topMargin: 35;
            anchors.right: edEduRect.right;
            anchors.rightMargin: 35;
            AbstractButton {
                colors.default: "#C9D1EC";
                text: "Отмена";
                radius: 50;
                height: 40;
                width: 120;
                onClicked:  { editLoader.source = '' }
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