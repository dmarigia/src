Rectangle {
    id: psPage;
    width: 100%;
    height: grid.height;
    color: "#f5f5f5";

    Grid {
        id: grid;
        anchors.centerIn: parent;
        width: (psPage.width - 20) > 820 ? 410 * 2 + 10 : psPage.width - 20;
        spacing: 10;

        Rectangle {
            id: mainInfo;            
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.topMargin: 40;
            height: 220;
            width: grid.width > 820 ? insideRect.width * 0.75 : grid.width;
            color: "white";
            radius: 5;
            border.width: 1;
            border.color: "#EAEAEA";
            clip: true;

            Column {
                id: mainAvatar;
                anchors.leftMargin: 30;            
                anchors.left: parent.left;
                anchors.verticalCenter: parent.verticalCenter;
                spacing: 10;
                Rectangle {
                    radius: 100;
                    width: 120;
                    height: 120;
                    Image {
                        anchors.fill: parent;
                        source: "images/avatarbig.png";
                        opacity: 0.4;
                    }
                    Image {
                        anchors.fill: parent;
                        source: global.avatarPath;
                        radius: 60;
                        visible: global.avatarPath !== "";
                        fillMode: Image.PreserveAspectCrop;
                        Border {
                            width: 2;
                            color: "#5d6578";
                        }
                    }
                }
                OurButton {
                    anchors.horizontalCenter: parent.horizontalCenter;
                    text: "Добавить фото";
                    height: 20;
                    color: "#ff5252";
                    radius: 50;
                    textColor: "white";
                    onClicked: { this.text += "!" }
                }
            }

            Row {
                spacing: 90;
                anchors.left: mainAvatar.right;  
                anchors.leftMargin: 40;          
                anchors.top: parent.top;
                anchors.topMargin: 25;
                Column {
                    spacing: 5;
                    Row {
                        spacing: 80;
                        Text {
                            id: nameSurname;
                            text: global.name;
                            color: "#212121";
                            font.pixelSize: 16;
                            font.family: "century gothic";
                            font.bold: true;
                        }
                    }
                    Row {
                        anchors.topMargin: 15;
                        spacing: 5;
                        Text {
                            text: "Звание: ";
                            font.family: "century gothic";
                            font.pixelSize: 14;
                            color: "#757575";
                        }
                        Text {
                            text: "звание";
                            font.family: "century gothic";
                            font.pixelSize: 14;
                            color: "#212121";
                        }
                    }
                    Row {
                        spacing: 5;
                        Text {
                            text: "Степень: ";
                            font.family: "century gothic";
                            font.pixelSize: 14;
                            color: "#757575";
                        }
                        Text {
                            text: "степень";
                            font.family: "century gothic";
                            font.pixelSize: 14;
                            color: "#212121";
                        }
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        id: nameSurnameEng;
                        text: "Name Surname";
                        color: "#212121";
                        font.pixelSize: 16;
                        font.family: "century gothic";
                        font.bold: true;
                    }
                    Row {
                        anchors.topMargin: 15;
                        spacing: 5;
                        Text {
                            text: "Специальность: ";
                            font.family: "century gothic";
                            font.pixelSize: 14;
                            color: "#757575";
                        }
                        Text {
                            text: "специальность";
                            font.family: "century gothic";
                            font.pixelSize: 14;
                            color: "#212121";
                        }
                    }
                    Row {
                        spacing: 5;
                        Text {
                            text: "Кафедра: ";
                            font.family: "century gothic";
                            font.pixelSize: 14;
                            color: "#757575";
                        }
                        Text {
                            text: "кафедра";
                            font.family: "century gothic";
                            font.pixelSize: 14;
                            color: "#212121";
                        } //год рождения, год обучения, форма обучения (дневная, заочная), бюджет/контракт, руководитель +ссылка на его профиль
                    }
                }
            }

            Column {
                spacing: 20;
                anchors.left: mainAvatar.right;
                anchors.leftMargin: 40;
                anchors.bottomMargin: 5;
                anchors.bottom: mainInfo.bottom;
                Rectangle {
                    id: mainLine;
                    width: (mainInfo.width - mainAvatar.width) * 0.83;
                    height: 1;
                    color: "#EAEAEA";
                }
                Row {  
                    spacing: 25;                  
                    anchors.horizontalCenter: mainLine.horizontalCenter;                    
                    Column {
                        spacing: 15;
                        Text {
                            text: "Заданий";
                            color: "#757575";
                            font.pixelSize: 14;
                            font.family: "century gothic";
                        }
                        Text {
                            anchors.centerIn: parent;
                            text: "9";
                            color: "#f48fb1";
                            font.pixelSize: 24;
                            font.family: "century gothic";
                            //font.bold: true;
                        }
                    }
                    Column {
                        spacing: 15;
                        Text {
                            text: "Рейтинг";
                            color: "#757575";
                            font.pixelSize: 14;
                            font.family: "century gothic";                            
                        }
                        Text {
                            anchors.centerIn: parent;
                            text: "2";
                            color: "#f48fb1";
                            font.pixelSize: 24;
                            font.family: "century gothic";
                            //font.bold: true;
                        }
                    }
                }
            }
        }

        Rectangle {
            clip: true;
            id: info;
            anchors.topMargin: 40;
            width: grid.width > 820 ? 260 : grid.width;
            height: 200;
            color: "white";
            border.width: 1;
            border.color: "#EAEAEA";
            radius: 5;

            Column {                
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 20;
                spacing: 20;
                Column {
                    spacing: 5;
                    Text {
                        text: "Год обучения";
                        color: "#757575";
                        font.pixelSize: 14;
                        font.family: "century gothic";
                    }
                    Text {
                        text: "2";
                        color: "#212121";
                        font.pixelSize: 15;
                        font.family: "century gothic";
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Форма обучения";
                        color: "#757575";
                        font.pixelSize: 14;
                        font.family: "century gothic";
                    }
                    Text {
                        text: "Дневная";
                        color: "#212121";
                        font.pixelSize: 15;
                        font.family: "century gothic";
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Бюджетная/контрактная форма обучения";
                        color: "#757575";
                        font.pixelSize: 14;
                        font.family: "century gothic";
                    }
                    Text {
                        text: "Бюджет";
                        color: "#212121";
                        font.pixelSize: 15;
                        font.family: "century gothic";
                    }
                }
            }
        }

        Rectangle {
            clip: true;
            id: info;
            anchors.topMargin: 40;
            width: grid.width > 820 ? 260 : grid.width;
            height: 200;
            color: "white";
            border.width: 1;
            border.color: "#EAEAEA";
            radius: 5;

            Column {                
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 20;
                spacing: 20;
                Column {
                    spacing: 5;
                    Text {
                        text: "Дата рождения";
                        color: "#757575";
                        font.pixelSize: 14;
                        font.family: "century gothic";
                    }
                    Text {
                        text: "13.10.1990";
                        color: "#212121";
                        font.pixelSize: 15;
                        font.family: "century gothic";
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Семейное положение";
                        color: "#757575";
                        font.pixelSize: 14;
                        font.family: "century gothic";
                    }
                    Text {
                        text: "Не замужем";
                        color: "#212121";
                        font.pixelSize: 15;
                        font.family: "century gothic";
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Дети";
                        color: "#757575";
                        font.pixelSize: 14;
                        font.family: "century gothic";
                    }
                    Text {
                        text: "Нет";
                        color: "#212121";
                        font.pixelSize: 15;
                        font.family: "century gothic";
                    }
                }
            }
        }

        Rectangle {
            clip: true;
            id: info;
            anchors.topMargin: 40;
            width: grid.width > 820 ? 260 : grid.width;
            height: 200;
            color: "white";
            border.width: 1;
            border.color: "#EAEAEA";
            radius: 5;

            Column {                
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 20;
                spacing: 20;
                Column {
                    spacing: 5;
                    Text {
                        text: "Телефон";
                        color: "#757575";
                        font.pixelSize: 14;
                        font.family: "century gothic";
                    }
                    Text {
                        text: "+380639170208";
                        color: "#212121";
                        font.pixelSize: 15;
                        font.family: "century gothic";
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "e-mail";
                        color: "#757575";
                        font.pixelSize: 14;
                        font.family: "century gothic";
                    }
                    Text {
                        text: "myemail@email.my";
                        color: "#212121";
                        font.pixelSize: 15;
                        font.family: "century gothic";
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Место работы";
                        color: "#757575";
                        font.pixelSize: 14;
                        font.family: "century gothic";
                    }
                    Text {
                        text: "Место работы";
                        color: "#212121";
                        font.pixelSize: 15;
                        font.family: "century gothic";
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Адрес проживания";
                        color: "#757575";
                        font.pixelSize: 14;
                        font.family: "century gothic";
                    }
                    Text {
                        text: "Адрес проживания";
                        color: "#212121";
                        font.pixelSize: 15;
                        font.family: "century gothic";
                    }
                }
            }
        }
        // Rectangle {
        //     clip: true;
        //     anchors.topMargin: 40;
        //     id: info;
        //     width: grid.width > 820 ? 410 : grid.width;
        //     height: 200;
        //     color: "white";
        //     border.width: 1;
        //     border.color: "#EAEAEA";
        //     radius: 5;
        //     Column {
        //         anchors.verticalCenter: parent.verticalCenter;
        //         anchors.left: parent.left;
        //         anchors.leftMargin: 20;
        //         spacing: 15;
        //         Row {
        //             spacing: 15;
        //             Text {                        
        //                 text: "Семейное положение: ";
        //                 font.family: "century gothic";
        //                 font.pixelSize: 14;
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "Не замужем";
        //                 font.family: "century gothic";
        //                 font.pixelSize: 14;
        //                 color: "#212121";
        //             }
        //         }
        //         Row {
        //             spacing: 15;
        //             Text {                        
        //                 text: "Дети: ";
        //                 font.family: "century gothic";
        //                 font.pixelSize: 14;
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "нет";
        //                 font.family: "century gothic";
        //                 font.pixelSize: 14;
        //                 color: "#212121";
        //             }
        //         }
        //         Row {
        //             spacing: 15;
        //             Text {                        
        //                 text: "Место работы: ";
        //                 font.family: "century gothic";
        //                 font.pixelSize: 14;
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "место работы";
        //                 font.family: "century gothic";
        //                 font.pixelSize: 14;
        //                 color: "#212121";
        //             }
                    
        //         }
        //     } 
        // }
        
        // Rectangle {
        //     clip: true;
        //     anchors.topMargin: 40;
        //     id: contactInfo;
        //     width: grid.width > 820 ? 410 : grid.width;
        //     height: 200;
        //     color: "white";
        //     border.width: 1;
        //     border.color: "#EAEAEA";
        //     radius: 5;
        //     Column {
        //         anchors.verticalCenter: parent.verticalCenter;
        //         anchors.left: parent.left;
        //         anchors.leftMargin: 20;
        //         spacing: 15;
        //         Row {
        //             spacing: 15;
        //             Text {                        
        //                 text: "Телефон: ";
        //                 font.family: "century gothic";
        //                 font.pixelSize: 14;
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "+980635698574";
        //                 font.family: "century gothic";
        //                 font.pixelSize: 14;
        //                 color: "#212121";
        //             }
        //         }
        //         Row {
        //             spacing: 15;
        //             Text {                        
        //                 text: "e-mail: ";
        //                 font.family: "century gothic";
        //                 font.pixelSize: 14;
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "myemail@email.my";
        //                 font.family: "century gothic";
        //                 font.pixelSize: 14;
        //                 color: "#212121";
        //             }
        //         }
        //         Row {
        //             spacing: 15;
        //             Text {                        
        //                 text: "Адрес проживания: ";
        //                 font.family: "century gothic";
        //                 font.pixelSize: 14;
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "ул. Уличиная, д. 8, кв. 5";
        //                 font.family: "century gothic";
        //                 font.pixelSize: 14;
        //                 color: "#212121";
        //             }
                    
        //         }
        //     }
        //     // телефон, мыло, адрес
        // }

        //     Text {
        //         anchors.bottom: info.top;
        //         anchors.bottomMargin: 5;
        //         anchors.left: info.left;
        //         text: "О СЕБЕ";
        //         font.family: "century gothic";
        //         font.pixelSize: 14;
        //         color: "#757575";
        //         //font.bold: true;
        //     }

        //     Text {
        //         anchors.bottom: contactInfo.top;
        //         anchors.bottomMargin: 5;
                
        //         anchors.left: contactInfo.left;
        //         text: "КОНТАКТНАЯ ИФНОРМАЦИЯ";
        //         font.family: "century gothic";
        //         font.pixelSize: 14;
        //         color: "#757575";
        //         //font.bold: true;
        //     }
        
    }
}