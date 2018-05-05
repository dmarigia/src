Item {
    id: app;
    anchors.fill: parent;
    
    Rectangle {
        Rectangle {
            id: rect;
            height: 300;
            width: 325;
            anchors.centerIn: parent;
            color: "white";
            
            Column {
                anchors.centerIn: parent;
                spacing: 15;
                
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter;
                    text: "Авторизация";
                    font.pixelSize: 22;
                    color: "#757575";
                    //color: "#8BC34A";
                }
                
                TextInputMaterial {
                    id: email;
                    width: 250;
                    //materialColor: "#8BC34A";
                    materialColor: valid || !text ? "#757575" : "#F44336"; // NEW
                    Behavior on materialColor { ColorAnimation { duration: 500; } }
                    font.pixelSize: 18;
                    placeholder.text: "e-mail";
                    //textInput.horizontalAlignment: TextInput.AlignHCenter; // NEW
                    
                    property bool valid; // NEW
                    onTextChanged: { // NEW
                        if (!this.re)
                            this.re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                        this.valid = this.re.test(value)
                    }
                }
                
                TextInputMaterial {
                    id: password;
                    materialColor: "#757575";
                    width: 250;
                    font.pixelSize: 18;
                    placeholder.text: "пароль";
                    echoMode: TextInput.Password; // NEW
                    //textInput.horizontalAlignment: TextInput.AlignHCenter; // NEW
                }
                
                Button {
                    anchors.horizontalCenter: password.horizontalCenter;
                    width: 100;
                    height: 40;
                    text: "Войти";
                    font.pixelSize: 18;
                    textColor: "white";
                    color: "#757575";
                }
            }
        }
        
        width: app.width;
        height: app.height;
        color: "#9e9e9e";
    }
}