Rectangle {
    id: psPage;
    width: 100%;
    height: grid.height;
    color: "#f5f5f9";

    EdContactInfo {
        id: editContact;
        anchors.centerIn: parent;
        visible: false;
        z: 1;
    }
    EdInfo {
        id: editInfo;
        anchors.centerIn: parent;
        visible: false;
        z: 1;
    }
    EdInfoEdu {
        id: editEdu;
        anchors.centerIn: parent;
        visible: false;
        z: 1;
    }

    Grid {
        id: grid;
        anchors.centerIn: parent;
        width: (psPage.width - 20) > 820 ? insideRect.width * 0.7 : psPage.width - 20;
        //idth: (psPage.width - 20) > 820 ? 410 * 2 + 10 : psPage.width - 20;
        spacing: 70;

        Rectangle {
            id: mainInfo;            
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.topMargin: 60;
            height: 220;
            width: grid.width > 820 ? insideRect.width * 0.7 : grid.width;
            color: "#FBFCFD";
            clip: true;
            effects.shadow.color: "#efeff7";
		    effects.shadow.blur: 15;
		    effects.shadow.spread: 15;

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
                        source: settings.avatarPath;
                        radius: 60;
                        visible: settings.avatarPath !== "";
                        fillMode: Image.PreserveAspectCrop;
                        Border {
                            width: 2;
                            color: "#5d6578";
                        }
                    }
                }
                OurButton {
                    anchors.horizontalCenter: parent.horizontalCenter;
                    text: qsTr("Добавить фото");
                    height: 20;
                    color: "#ff5252";
                    radius: 50;
                    textColor: "white";
                    onClicked: { this.text += "!" }
                }
            }

            Row {
                id: mainInfoRow;
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
                            text: settings.name;
                            color: "#212121";
                            font.pixelSize: 16;
                            font.bold: true;
                        }
                    }
                    Row {
                        anchors.topMargin: 15;
                        spacing: 5;
                        Text {
                            text: qsTr("Звание: ");
                            color: "#757575";
                        }
                        Text {
                            text: qsTr("звание");
                            color: "#212121";
                        }
                    }
                    Row {
                        spacing: 5;
                        Text {
                            text: "Степень: ";
                            color: "#757575";
                        }
                        Text {
                            text: qsTr("степень");
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
                            text: qsTr("Специальность: ");
                            color: "#757575";
                        }
                        Text {
                            text: ("специальность");
                            color: "#212121";
                        }
                    }
                    Row {
                        spacing: 5;
                        Text {
                            text: qsTr("Кафедра: ");
                            color: "#757575";
                        }
                        Text {
                            text: qsTr("кафедра");
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
                            text: qsTr("Заданий");
                            color: "#757575";
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
                            text: qsTr("Рейтинг");
                            color: "#757575";
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

        Row { spacing: 40;
        Rectangle {
            clip: true;
            id: infoEducation;
            //anchors.topMargin: 60;
            width: grid.width > 750 ? mainInfo.width / 2.1 : grid.width;
            height: contactText.height + 40;
            color: "#FBFCFD";
            effects.shadow.color: "#f2f2f9";
		    effects.shadow.blur: 10;
		    effects.shadow.spread: 10;
            Column {                
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 20;
                spacing: 20;
                Column {
                    spacing: 5;
                    Text {
                        text: "Факультет";
                        color: "#757575";
                    }
                    Text {
                        text: qsTr("Факультет технологии и товароведения пищевых продуктов и продовольственного бизнеса");
                        color: "#212121"; 
                        width: infoEducation.width - 30;                           
                        wrapMode: Text.Wrap;
                        font.pixelSize: 15;
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Институт";
                        color: "#757575";
                    }
                    Text {
                        text: qsTr("Технологический институт пищевой промышленности");
                        color: "#212121";                            
                        width: infoEducation.width - 30;                           
                        wrapMode: Text.Wrap;
                        font.pixelSize: 15;
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: "Руководитель";
                        color: "#757575";
                    }
                    Text {
                        text: qsTr("Фамилия Имя Отчество");
                        color: "#212121";                            
                        width: infoEducation.width - 30;                           
                        wrapMode: Text.Wrap;
                        font.pixelSize: 15;
                    }
                }
            }
        }

        Rectangle {
            clip: true;
            id: infoEdu;
            //anchors.topMargin: 60;
            width: grid.width > 750 ? mainInfo.width / 2.1 : grid.width;
            height: contactText.height + 40;
            color: "#FBFCFD";
            effects.shadow.color: "#f2f2f9";
		    effects.shadow.blur: 10;
		    effects.shadow.spread: 10;

            AbstractButton {
                icon.source: "images/edit.png";
                radius: 50;
                icon.width: 20;
                icon.height: 20;
                anchors.right: parent.right;
                anchors.top: parent.top;
                anchors.topMargin: 15;
                anchors.rightMargin: 15;
                opacity: 0.4;
                colors.hovered: "#A8AEEC";
                onClicked: { editEdu.visible = !editEdu.visible }
            }
            Column {                
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 20;
                spacing: 20;
                Column {
                    spacing: 5;
                    Text {
                        text: qsTr("Год обучения");
                        color: "#757575";
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
                        text: qsTr("Тема научной работы");
                        color: "#757575";
                    }
                    
                    Text {
                        text: qsTr("тема научной работы");
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: qsTr("Основа обучения");
                        color: "#757575";
                    }
                    Text {
                        text: qsTr("Дневная");
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: qsTr("Форма обучения");
                        color: "#757575";
                    }
                    Text {
                        text: qsTr("Бюджет");
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
            }
        } }

        Row { spacing: 40;
            Rectangle {
            clip: true;
            id: info;
            //anchors.topMargin: 60;
            width: grid.width > 750 ? mainInfo.width / 2.1 : grid.width;
            height: contactText.height + 40;
            color: "#FBFCFD";
            effects.shadow.color: "#f2f2f9";
		    effects.shadow.blur: 10;
		    effects.shadow.spread: 10;

            AbstractButton {
                icon.source: "images/edit.png";
                radius: 50;
                icon.width: 20;
                icon.height: 20;
                anchors.right: parent.right;
                anchors.top: parent.top;
                anchors.topMargin: 15;
                anchors.rightMargin: 15;
                opacity: 0.4;
                colors.hovered: "#A8AEEC";
                onClicked: { editInfo.visible = !editInfo.visible }
            }
            Column {                
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 20;
                spacing: 20;
                Column {
                    spacing: 5;
                    Text {
                        text: qsTr("Дата рождения");
                        color: "#757575";
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
                        text: qsTr("Семейное положение");
                        color: "#757575";
                    }
                    Text {
                        text: qsTr("Не замужем");
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: qsTr("Дети");
                        color: "#757575";
                    }
                    Text {
                        text: qsTr("Нет");
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
            }
        } 

        Rectangle {
            clip: true;
            id: contactInfo;
            //anchors.topMargin: 60;
            width: grid.width > 750 ? mainInfo.width / 2.1 : grid.width;
            height: contactText.height + 40;
            color: "#FBFCFD";
            effects.shadow.color: "#f2f2f9";
		    effects.shadow.blur: 10;
		    effects.shadow.spread: 10;

            AbstractButton {
                icon.source: "images/edit.png";
                radius: 50;
                icon.width: 20;
                icon.height: 20;
                anchors.right: parent.right;
                anchors.top: parent.top;
                anchors.topMargin: 15;
                anchors.rightMargin: 15;
                opacity: 0.4;
                colors.hovered: "#A8AEEC";
                onClicked: { editContact.visible = !editContact.visible }
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
                        text: qsTr("Телефон");
                        color: "#757575";
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
                        text: qsTr("Место работы");
                        color: "#757575";
                    }
                    Text {
                        text: qsTr("Место работы");
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
                Column {
                    spacing: 5;
                    Text {
                        text: qsTr("Адрес проживания");
                        color: "#757575";
                    }
                    Text {
                        text: qsTr("Адрес проживания");
                        color: "#212121";
                        font.pixelSize: 15;
                    }
                }
            }
        } }

        Row {
            height: 90;
            spacing: 40;
            //anchors.topMargin: 60;
            anchors.horizontalCenter: parent.horizontalCenter;
            opacity: 0.6;
            AbstractButton {
                icon.source: "images/orcid.svg";
                width: 55;
                height: 55;
                radius: 100;
                icon.width: 50;
                icon.height: 50;
                //onClicked: { //"https://orcid.org" }
            }
            AbstractButton {
                icon.source: "images/scopus.svg";
                width: 55;
                height: 55;
                radius: 100;
                icon.width: 50;
                icon.height: 50;
            }
            AbstractButton {
                icon.source: "images/ResearcherID.svg";
                width: 55;
                height: 55;
                radius: 100;
                icon.width: 50;
                icon.height: 50;
            }
            AbstractButton {
                icon.source: "images/gscholar.png";
                width: 55;
                height: 55;
                radius: 100;
                icon.width: 50;
                icon.height: 50;
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
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "Не замужем";
        //                 color: "#212121";
        //             }
        //         }
        //         Row {
        //             spacing: 15;
        //             Text {                        
        //                 text: "Дети: ";
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "нет";
        //                 color: "#212121";
        //             }
        //         }
        //         Row {
        //             spacing: 15;
        //             Text {                        
        //                 text: "Место работы: ";
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "место работы";
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
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "+980635698574";
        //                 color: "#212121";
        //             }
        //         }
        //         Row {
        //             spacing: 15;
        //             Text {                        
        //                 text: "e-mail: ";
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "myemail@email.my";
        //                 color: "#212121";
        //             }
        //         }
        //         Row {
        //             spacing: 15;
        //             Text {                        
        //                 text: "Адрес проживания: ";
        //                 color: "#757575";
        //             }
        //             Text {
        //                 text: "ул. Уличиная, д. 8, кв. 5";
        //                 color: "#212121";
        //             }
                    
        //         }
        //     }
        //     // телефон, мыло, адрес
        // }        
    }
     Text {
        anchors.bottom: infoEducation.top;
        anchors.bottomMargin: 10;
        anchors.left: infoEducation.left;
        text: qsTr("ОБУЧЕНИЕ");
        color: "#757575";
        font.bold: true;
    }
    Text {
        anchors.bottom: info.top;
        anchors.bottomMargin: 10;
        anchors.left: info.left;
        text: qsTr("О СЕБЕ");
        color: "#757575";
        font.bold: true;
    }
    // Text {
    //     anchors.bottom: contactInfo.top;
    //     anchors.bottomMargin: 5;                
    //     anchors.left: contactInfo.left;
    //     text: qsTr("КОНТАКТНАЯ ИНФОРМАЦИЯ");
    //     color: "#757575";
    //     //font.bold: true;
    // }

    NetworkRequest {
        id: networkReqPP;
        onLoaded: {
            var json = this.toJson()
            log("current profile", json, json.email)
            if (!json.email) return
            
            settings.firstName = json.firstname
            settings.lastName = json.lastname
            settings.middleName = json.middlename
            settings.role = json.role
        }
        onError: {
            console.warn("Error connection!")
            tempErrorRect.visible = true
        }
    }

    function getProfile() {
        if (!settings.email) return
        networkReqPP.url = "https://marigia.top/api/profile?email=" + settings.email;
        networkReqPP.send()
    }
}