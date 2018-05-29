Item {
    id: editUser;
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
        color: "#f5f5f9";
        //color: "#FBFCFD";
        radius: 4;
        anchors.centerIn: parent;
        effects.shadow.color: "#5D6578";
        effects.shadow.blur: 10;
        effects.shadow.spread: 2;
        width: 900;
        height: 900;        
        OverflowMixin {}
        Column {             
            anchors.horizontalCenter: parent;
            spacing: 60;
            Rectangle { 
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: edInfoRect;
                anchors.topMargin: 60;
                width: 650;
                height: 250;
                color: "#FBFCFD";
                effects.shadow.color: "#F5F5F5";
                effects.shadow.blur: 10;
                effects.shadow.spread: 2;
                    Row {
                        anchors.centerIn: parent;
                        spacing: 60;
                        Column {
                            anchors.verticalCenter: parent.verticalCenter;
                            anchors.left: parent.left;
                            anchors.leftMargin: 15;
                            spacing: 10;
                            Rectangle {
                                radius: 100;
                                width: 100;
                                height: 100;
                                Image {
                                    anchors.fill: parent;
                                    source: "images/avatarbig.png";
                                    opacity: 0.4;
                                }
                            }
                            OurButton {
                                anchors.horizontalCenter: parent.horizontalCenter;
                                text: qsTr("Додати фото");
                                height: 20;
                                color: "#A7B0C4";
                                radius: 50;
                                textColor: "white";
                                onClicked: { this.text += "!" }
                            }
                        }
                        Column {
                            spacing: 15;  
                            Column {
                                spacing: 10;
                                Text {
                                    color: "#A7B0C4";
                                    text: "ПІБ (укр.)";
                                }
                                TextInputMaterial {
                                    placeholder.text: "Прізвище Ім'я По батькові";
                                    materialColor: "#A8AEEC";
                                    font.family: "century gothic";
                                    font.pixelSize: 15;
                                    width: 400;
                                }
                            }
                            Column {
                                spacing: 10;
                                Text {
                                    color: "#A7B0C4";
                                    text: "Name Surname (eng)";
                                }
                                TextInputMaterial {
                                    placeholder.text: "Name Surname";
                                    materialColor: "#A8AEEC";
                                    font.family: "century gothic";
                                    font.pixelSize: 15;
                                    width: 400;
                                }
                            }
                            Column {
                                spacing: 10;
                                Text {
                                    color: "#A7B0C4";
                                    text: "Дата народження";
                                }
                                TextInputMaterial {
                                    placeholder.text: "20.02.1989";
                                    materialColor: "#A8AEEC";
                                    font.family: "century gothic";
                                    font.pixelSize: 15;
                                    width: 400;
                                }
                            }
                        }
                    }            
            }

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter;
                width: 650;
                height: col2.height + 60;
                color: "#FBFCFD";
                Column {
                    id: col2;
                    spacing: 15;            
                    anchors.centerIn: parent;                    
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Інститут";
                        }
                        TextInputMaterial {
                            placeholder.text: "Інститут";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Факультет";
                        }
                        TextInputMaterial {
                            placeholder.text: "Факультет";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Звання";
                        }
                        TextInputMaterial {
                            placeholder.text: "Звання";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Ступінь";
                        }
                        TextInputMaterial {
                            placeholder.text: "Ступінь";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Спеціальность";
                        }
                        TextInputMaterial {
                            placeholder.text: "Спеціальність";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Кафедра";
                        }
                        TextInputMaterial {
                            placeholder.text: "Кафедра";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Рік навчання";
                        }
                        TextInputMaterial {
                            placeholder.text: "2";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Основа навчання";
                        }
                        TextInputMaterial {
                            placeholder.text: "Основа навчання";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Форма навчання";
                        }
                        TextInputMaterial {
                            placeholder.text: "Форма навчання";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Керівник";
                        }
                        TextInputMaterial {
                            placeholder.text: "Керівник";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Тема наукової роботи";
                        }
                        TextInputMaterial {
                            placeholder.text: "Тема наукової роботи";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                }
            }

            Rectangle {
                id: rect3;
                anchors.horizontalCenter: parent.horizontalCenter;
                width: 650;
                height: col3.height + 60;
                color: "#FBFCFD";
                Column {
                    id: col3;
                    spacing: 15;            
                    anchors.centerIn: parent;                    
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Телефон";
                        }
                        TextInputMaterial {
                            placeholder.text: "+38 (063) ";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "e-mail";
                        }
                        TextInputMaterial {
                            placeholder.text: "e-mail";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Місце роботи";
                        }
                        TextInputMaterial {
                            placeholder.text: "Місце роботи";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Адреса проживання";
                        }
                        TextInputMaterial {
                            placeholder.text: "Адреса проживання";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "ScopusID";
                        }
                        TextInputMaterial {
                            placeholder.text: "ScopusID";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "ResearcherID";
                        }
                        TextInputMaterial {
                            placeholder.text: "ResearcherID";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "Google Scholar";
                        }
                        TextInputMaterial {
                            placeholder.text: "Google Scholar";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                    Column {
                        spacing: 10;
                        Text {
                            color: "#A7B0C4";
                            text: "OrcID";
                        }
                        TextInputMaterial {
                            placeholder.text: "OrcID";
                            materialColor: "#A8AEEC";
                            font.family: "century gothic";
                            font.pixelSize: 15;
                            width: 500;
                        }
                    }
                }
            }

            Row {
                height: 100;
                spacing: 90;
                // anchors.top: col3.bottom;
                // anchors.topMargin: 35;
                anchors.right: rect3.right;
                //anchors.rightMargin: 35;
                // anchors.bottom: edInfoRect.bottom;
                // anchors.bottomMargin: 60;
                AbstractButton {
                    colors.default: "#C9D1EC";
                    text: "Скасувати";
                    radius: 50;
                    height: 40;
                    width: 120;
                    onClicked:  {editUser.visible = !editUser.visible }
                }
                AbstractButton {
                    colors.default: "#B0C5EF";
                    text: "Збергти";
                    radius: 50;
                    height: 40;
                    width: 120;
                }
            }
        }
    }

}