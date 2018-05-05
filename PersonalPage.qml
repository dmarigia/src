Rectangle {
    id: psPage;
    width: 100%;
    height: grid.height;
    color: "#f5f5f5";

    Grid {
        id: grid;
        anchors.centerIn: parent;
        width: (psPage.width - 20) > 820 ? insideRect.width * 0.7 : psPage.width - 20;
        //idth: (psPage.width - 20) > 820 ? 410 * 2 + 10 : psPage.width - 20;
        spacing: 10;

        Rectangle {
            id: mainInfo;            
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.topMargin: 40;
            height: 220;
            width: grid.width > 820 ? insideRect.width * 0.7 : grid.width;
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
                            font.bold: true;
                        }
                    }
                    Row {
                        anchors.topMargin: 15;
                        spacing: 5;
                        Text {
                            text: "Звание: ";
                            font.pixelSize: 14;
                            color: "#757575";
                        }
                        Text {
                            text: "звание";
                            font.pixelSize: 14;
                            color: "#212121";
                        }
                    }
                    Row {
                        spacing: 5;
                        Text {
                            text: "Степень: ";
                            font.pixelSize: 14;
                            color: "#757575";
                        }
                        Text {
                            text: "степень";
                            font.pixelSize: 14;
                            color: "#212121";
                        }
                    }
                }
                Column {
                    anchors.left: mainAvatar.right;
                    anchors.leftMargin: (mainInfo.width - mainAvatar.width) * 0.55;
                    spacing: 5;
                    Text {
                        id: nameSurnameEng;
                        text: "Name Surname";
                        color: "#212121";
                        font.pixelSize: 16;
                        font.bold: true;
                    }
                    Row {
                        anchors.topMargin: 15;
                        spacing: 5;
                        Text {
                            text: "Специальность: ";
                            font.pixelSize: 14;
                            color: "#757575";
                        }
                        Text {
                            text: "специальность";
                            font.pixelSize: 14;
                            color: "#212121";
                        }
                    }
                    Row {
                        spacing: 5;
                        Text {
                            text: "Кафедра: ";
                            font.pixelSize: 14;
                            color: "#757575";
                        }
                        Text {
                            text: "кафедра";
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
                    width: (mainInfo.width - mainAvatar.width) * 0.86;
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
                        }
                        Text {
                            anchors.centerIn: parent;
                            text: "9";
                            color: "#f48fb1";
                            font.pixelSize: 24;
                            //font.bold: true;
                        }
                    }
                    Column {
                        spacing: 15;
                        Text {
                            text: "Рейтинг";
                            color: "#757575";
                            font.pixelSize: 14;
                        }
                        Text {
                            anchors.centerIn: parent;
                            text: "2";
                            color: "#f48fb1";
                            font.pixelSize: 24;
                        }
                    }
                }
            }
        }

        Rectangle {
            clip: true;
            id: infoEdu;
            anchors.topMargin: 40;
            width: grid.width > 800 ? mainInfo.width / 3 : grid.width;
            height: contactText.height + 40;
            color: "white";
            border.width: 1;
            border.color: "#EAEAEA";
            radius: 5;
            Image {
                source: "images/edit.png";
                width: 20;
                height: 20;
                anchors.right: parent.right;
                anchors.top: parent.top;
                anchors.topMargin: 15;
                anchors.rightMargin: 15;
                opacity: 0.6;
            }
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
                    }
                    
                    Text {
                        text: "2";
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Тема научной работы";
                        color: "#757575";
                        font.pixelSize: 14;
                    }
                    
                    Text {
                        text: "тема научной работы";
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Основа обучения";
                        color: "#757575";
                        font.pixelSize: 14;
                    }
                    Text {
                        text: "Дневная";
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Форма обучения";
                        color: "#757575";
                        font.pixelSize: 14;
                    }
                    Text {
                        text: "Бюджет";
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
            }
        }

        Rectangle {
            clip: true;
            id: info;
            anchors.topMargin: 40;
            width: grid.width > 800 ? mainInfo.width / 3 - 20 : grid.width;
            height: contactText.height + 40;
            color: "white";
            border.width: 1;
            border.color: "#EAEAEA";
            radius: 5;
            Image {
                source: "images/edit.png";
                width: 20;
                height: 20;
                anchors.right: parent.right;
                anchors.top: parent.top;
                anchors.topMargin: 15;
                anchors.rightMargin: 15;
                opacity: 0.6;
            }
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
                    }
                    Text {
                        text: "13.10.1990";
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Семейное положение";
                        color: "#757575";
                        font.pixelSize: 14;
                    }
                    Text {
                        text: "Не замужем";
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Дети";
                        color: "#757575";
                        font.pixelSize: 14;
                    }
                    Text {
                        text: "Нет";
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
            }
        }

        Rectangle {
            clip: true;
            id: contactInfo;
            anchors.topMargin: 40;
            width: grid.width > 800 ? mainInfo.width / 3 : grid.width;
            height: contactText.height + 40;
            color: "white";
            border.width: 1;
            border.color: "#EAEAEA";
            radius: 5;
            Image {
                source: "images/edit.png";
                width: 20;
                height: 20;
                anchors.right: parent.right;
                anchors.top: parent.top;
                anchors.topMargin: 15;
                anchors.rightMargin: 15;
                opacity: 0.6;
            }
            Column {      
                id: contactText;          
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
                    }
                    Text {
                        text: "+380639170208";
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "e-mail";
                        color: "#757575";
                        font.pixelSize: 14;
                    }
                    Text {
                        text: "myemail@email.my";
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Место работы";
                        color: "#757575";
                        font.pixelSize: 14;
                    }
                    Text {
                        text: "Место работы";
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Адрес проживания";
                        color: "#757575";
                        font.pixelSize: 14;
                    }
                    Text {
                        text: "Адрес проживания";
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
            }
        }

        Row {
            spacing: 40;
            anchors.topMargin: 60;
            anchors.horizontalCenter: parent.horizontalCenter;
            opacity: 0.6;
            Image {
                source: "images/orcid.svg";
                width: 60;
                height: 60;
                
            }
            Image {
                source: "images/scopus.svg";
                width: 60;
                height: 60;
            }
            Image {
                source: "images/ResearcherID.svg";
                width: 60;
                height: 60;
            }
            Image {
                source: "images/gscholar.png";
                width: 60;
                height: 60;
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
        //                 font.pixelSize: 14;
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "Не замужем";
        //                 font.pixelSize: 14;
        //                 color: "#212121";
        //             }
        //         }
        //         Row {
        //             spacing: 15;
        //             Text {                        
        //                 text: "Дети: ";
        //                 font.pixelSize: 14;
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "нет";
        //                 font.pixelSize: 14;
        //                 color: "#212121";
        //             }
        //         }
        //         Row {
        //             spacing: 15;
        //             Text {                        
        //                 text: "Место работы: ";
        //                 font.pixelSize: 14;
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "место работы";
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
        //                 font.pixelSize: 14;
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "+980635698574";
        //                 font.pixelSize: 14;
        //                 color: "#212121";
        //             }
        //         }
        //         Row {
        //             spacing: 15;
        //             Text {                        
        //                 text: "e-mail: ";
        //                 font.pixelSize: 14;
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "myemail@email.my";
        //                 font.pixelSize: 14;
        //                 color: "#212121";
        //             }
        //         }
        //         Row {
        //             spacing: 15;
        //             Text {                        
        //                 text: "Адрес проживания: ";
        //                 font.pixelSize: 14;
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "ул. Уличиная, д. 8, кв. 5";
        //                 font.pixelSize: 14;
        //                 color: "#212121";
        //             }
                    
        //         }
        //     }
        //     // телефон, мыло, адрес
        // }        
    }
     Text {
        anchors.bottom: infoEdu.top;
        anchors.bottomMargin: 5;
        anchors.left: infoEdu.left;
        text: "ОБУЧЕНИЕ";
        font.pixelSize: 14;
        color: "#757575";
        //font.bold: true;
    }
    Text {
        anchors.bottom: info.top;
        anchors.bottomMargin: 5;
        anchors.left: info.left;
        text: "О СЕБЕ";
        font.pixelSize: 14;
        color: "#757575";
        //font.bold: true;
    }
    Text {
        anchors.bottom: contactInfo.top;
        anchors.bottomMargin: 5;                
        anchors.left: contactInfo.left;
        text: "КОНТАКТНАЯ ИНФОРМАЦИЯ";
        font.pixelSize: 14;
        color: "#757575";
        //font.bold: true;
    }
}