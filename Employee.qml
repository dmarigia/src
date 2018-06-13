/*** @using { src.EditUser} **/

Rectangle {
    id: employee
    width: 100%
    color: '#fbfcfd'
    height: listik.height + 50 * 3 + addButton.height + listRect.height

    Loader {
        id: emplLoader
        anchors.fill: parent
        z: 1
        mouseEnabled: !!source
    }

    Rectangle {
        id: search
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 40
        anchors.leftMargin: 40
        height: 40
        width: 60 + tSearch.width
        radius: 50
        border.width: 1
        border.color: '#f5f5f9'
        color: 'white'

        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 10

            AbstractButton {
                anchors.verticalCenter: parent.verticalCenter
                id: searchButton
                anchors.left: search.left
                anchors.leftMargin: 5
                opacity: 0.6
                icon.source: 'images/search.png'
                height: 37
                width: 37
                icon.width: 30
                icon.height: 30
                colors.hovered: '#A8AEEC'
                radius: 100

                onClicked: {
                    textSearch.width = textSearch.width === 180 ? 40 : 180
                    search.width = search.width === (67 + textSearch.width) ? (60 + tSearch.width) : (67 + textSearch.width)
                    textSearch.visible = !textSearch.visible
                    tSearch.visible = !tSearch.visible
                }
            }

            // Rectangle {
            //     id: line
            //     anchors.verticalCenter: parent.verticalCenter
            //     height: 30
            //     width: 1
            //     color: 'lightgray'
            // }

            Text {
                id: tSearch
                visible: true
                anchors.verticalCenter: parent.verticalCenter
                text: 'Пошук'
                color: '#A7B0C4'
            }

            TextInputMaterial {
                clip: true
                visible: false
                id: textSearch
                width: 0
                anchors.bottom: search.bottom
                anchors.bottomMargin: -4
                materialColor: '#A8AEEC'
                font.pixelSize: 14
                placeholder.text: 'Пошук'
                Behavior on x { Animation { duration: 1000; } }
                Behavior on width { Animation { duration: 1000; } }

                onTextChanged: {
                	searchTimer.restart()
                }

                Timer {
                    id: searchTimer
                    interval: 400
                    onTriggered: {
                        elistProxy.setFilter(function(item) { return item.name.toLowerCase().indexOf(textSearch.text.toLowerCase()) > -1 })
                    }
                }
            }
        }

        Behavior on width { Animation { duration: 500; } }
    }

    // AbstractButton {
    //     id: sortButton
    //     anchors.top: parent.top
    //     anchors.topMargin: 40
    //     anchors.horizontalCenter: parent
    //     colors.default: 'white'
    //     text: 'Сортування'
    //     radius: 50
    //     height: 40
    //     width: 120
    // }

    Text {
        text: ''
    }

    AbstractButton {
        id: addButton
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 40
        anchors.rightMargin: 40
        colors.default: 'transparent'
        //colors.hovered: 'lightgrey'
        colors.hovered: '#eff3fb'
        text: 'Додати користувача'
        radius: 50
        height: 40
        width: 180

        onClicked: {
            emplLoader.source = 'src.EditUser'
        }
    }

    Rectangle {
        anchors.bottom: addButton.bottom
        anchors.horizontalCenter: addButton
        width: addButton.width - 36
        height: 1
        color: '#B0C5EF'
    }

    ListView {
        id: listik
        anchors.top: listRect.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.85
        // effects.shadow.color: '#efefef'
        // effects.shadow.blur: 10
        // effects.shadow.spread: 10
        height: contentHeight
        spacing: 2

        model: ProxyModel {
            id: elistProxy

            target: ListModel {
                id: elistModel
            }
        }

        onCompleted: {
            elistModel.append({name: "Батраков Олександр Олегович" , role: "Аспірант"})
            elistModel.append({name: "Баранюк Христина Олександрівна" , role: "Аспірант"})
            elistModel.append({name: "Ольшевська Ольга Володимірівна", role: "Адміністратор"})
        }

        NetworkRequest {
            id: networkEmplRemove
            url: 'https://marigia.top/api/user?id=' + emplId
            property int emplId
            method: NetworkRequest.Delete

            onError: {
                employee.error = true
                log('Error: remove for employee for ' + this.emplId)
            }
        }

        delegate: Rectangle { //
            id: deleg
            width: 100%
            height: 100
            x: -300
            radius: 5
            //color: '#FBFCFD'
            border.width: 2
            border.color: '#f5f5f9'
            color: (model.index % 2) ? '#FBFCFD' : '#f5f5f9'
            Behavior on x { Animation { duration: 150; } }
            onCompleted: { this.x = 0 }

            function remove() {
                networkEmplRemove.emplId = model.index
                networkEmplRemove.send()
                elistModel.remove(model.index)
            }

            function openEditUser() {
                editUser.visible = !editUser.visible;
            }


            Row {
                width: parent.width;

                Item {
                    height: 100;
                    width: parent.width / 5;

                    Image {
                        id: av
                        anchors.centerIn: parent;
                        source: 'images/avatarbig45.png'
                        height: 45;
                        width: 45;
                        opacity: 0.4;
                    }
                    Image {
                        anchors.fill: av
                        source: model.index == 2 ? settings.avatarPath : settings.avatarPath !== ''
                        visible: settings.avatarPath !== ''
                        height: 45
                        width: 45
                        radius: 100
                        fillMode: Image.PreserveAspectCrop
                    }
                }

                Item {
                    height: 100;
                    width: parent.width / 2.7;

                    Text {
                        anchors.centerIn: parent;
                        text: model.name; // 'Прізвище Ім'я По Батькові'
                    }
                }

                Item {
                    height: 100;
                    width: parent.width / 4;

                    Text {
                        anchors.centerIn: parent;
                        text: model.role; // 'Аспірант'
                    }
                }

                Item {
                    height: 100;
                    width: parent.width / 5;

                    AbstractButton {
                        z: 1;
                        id: opt;
                        anchors.centerIn: parent;
                        width: 30;
                        height: 30;
                        icon.source: 'images/options.png'
                        icon.width: 25;
                        icon.height: 25;
                        colors.hovered: '#A8AECC'
                        colors.pressed: '#5D6578'
                        radius: 50;
                        opacity: 0.5;
                        onClicked: { optMenu.visible = !optMenu.visible; /* menuItem3.visible = !menuItem3.visible */ }
                    }

                    OptionMenu {
                        id: optMenu;
                        anchors.top: opt.bottom;
                        anchors.topMargin: 20;
                        anchors.horizontalCenter: opt.horizontalCenter;
                        visible: false;
                        profile: true
                        z: 2
                    }
                }
            }

            AbstractButton {
                anchors.fill: parent;
                colors.hovered: '#dcdce0'
                opacity: 0.2;
                onClicked: {
                    app.page = 'Journal'
                }
            }
        }
    }

    Rectangle {
        id: listRect;
        anchors.top: addButton.bottom;
        anchors.topMargin: 40;
        color: '#FBFCFD'
        anchors.horizontalCenter: parent.horizontalCenter;
        width: parent.width * 0.85;
        height: 50;
        // radius: 5;
        // effects.shadow.color: '#efefef'
        // effects.shadow.blur: 10;
        // effects.shadow.spread: 2;

        Rectangle {
            width: 100%
            height: 2;
            anchors.bottom: parent;
            color: '#f5f5f9'
        }

        Row {
            anchors.fill: parent;

            Item {
                height: 50;
                width: parent.width / 5;
            }

            Item {
                height: 50;
                width: parent.width / 2.7;

                Text {
                    anchors.fill: parent;
                    verticalAlignment: Text.AlignVCenter;
                    horizontalAlignment: Text.AlignHCenter;
                    text: 'ІМ\'Я'
                    font.pixelSize: 14;
                    color: '#73818e'
                    font.bold: true;
                }
            }

            Item {
                height: 50;
                width: parent.width / 4;

                Text {
                    anchors.fill: parent;
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: 'ПРАВА ДОСТУПУ'
                    font.pixelSize: 14
                    color: '#73818e'
                    font.bold: true
                }
            }

            Item {
                height: 50;
                width: parent.width / 5;

                Text {
                    anchors.fill: parent;
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: 'ОПЦІЇ'
                    font.pixelSize: 14
                    color: '#73818e'
                    font.bold: true
                }
            }
        }
    }
}
