Rectangle {
    id: loginPage;
    anchors.fill: parent;
    color: "#e7eaef";
    //opacity: 0.9; // temp

    function clearLoginData() {
        email.text = ''
        password.text = ''
    }

    Rectangle {
        id: rect;
        height: 375;
        width: 360;
        anchors.centerIn: parent;
        color: "#FBFCFD";
            
    
        Column {
            anchors.centerIn: parent;
            spacing: 15;

            Text {
                anchors.top: rect;
                anchors.topMargin: 20;
                anchors.horizontalCenter: parent.horizontalCenter;
                text: qsTr("Авторизация");
                font.pixelSize: 22;
                color: "#A7B0C4";
                //color: "#8BC34A";
            }

            TextInputMaterial {
                id: email;                
                width: 250;  
                //materialColor: "#8BC34A";
                materialColor: valid || !text ? "#A8AEEC" : "#F44336"; // NEW
                Behavior on materialColor { ColorAnimation { duration: 500; } }
                font.pixelSize: 18;
                placeholder.text: "e-mail";
                text: "test@test.net";
                //textInput.horizontalAlignment: TextInput.AlignHCenter; // NEW

                property bool valid; // NEW
                onTextChanged: { // NEW
                    if (!this.re)
                        this.re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                    this.valid = this.re.test(value)
                }
            }

            // Text {
            //     id: emailCheck;
            //     //visible: false;
            //     text: qsTr("Неверный e-mail");
            //     font.pixelSize: 14;
            //     color: "#F44336";
            // }

            TextInputMaterial {
                id: password;
                materialColor: "#A8AEEC";
                width: 250;
                font.pixelSize: 18;
                placeholder.text: qsTr("пароль");
                echoMode: TextInput.Password; // NEW
                text: "test";
                //textInput.horizontalAlignment: TextInput.AlignHCenter; // NEW
            }

            Image {
                id: captcha;
                anchors.horizontalCenter: parent;
                source: Math.random() >= 0.5 ? "images/xyz.svg" : "images/zyx.svg";
            }
            TextInputMaterial {
                //anchors.top: captcha.bottom;
                materialColor: "#A8AEEC";
                anchors.horizontalCenter: parent;
                width: captcha.width;
            }

            AbstractButton {
                id: loginPageButton;
                anchors.horizontalCenter: password.horizontalCenter;
                width: 100;
                height: 40;
                text: qsTr("Войти");
                font.pixelSize: 18;
                colors.text: "white";
                colors.default: "#A7B0C4";
                onClicked: {
                    this.enabled = false
                    networkReqAuth.send()
                    loginPage.visible = false
                }
            }
        }
    //     AbstractButton {
    //     anchors.right: password.right;
    //     //anchors.verticalCenter: password.verticalCenter;
    //     anchors.rightMargin: 15;
    //     icon.source: "images/watch.png";
    //     icon.width: 20;
    //     icon.height: 20;
    //     colors.hovered: "#A7B0C4";
    //     radius: 100;
    //     opacity: 0.5;
    //     onClicked: {  }
    // }
    }

    NetworkRequest {
        id: networkReqAuth;
        url: "https://marigia.top/api/auth";
        body: "email=" + email.text + "&password=" + password.text;
        method: NetworkRequest.Post;

        onLoaded: {
            var authJson = this.toJson()
            var auth = authJson["auth"]
            var error = authJson["error"]
            if (auth) {
                loginPage.visible = false
                log("auth true!")
                localStorage.qset("token", authJson["token"])
                localStorage.qset("email", email.text)
                settings.email = email.text
                settings.token = authJson["token"]
                loginPage.clearLoginData()
            } else {
                console.warn("auth error: " + error)
                loginPageButton.enabled = true
            }
        }

        onError: {
            console.warn("Error connection!")
            loginPageButton.enabled = true
            tempErrorRect.visible = true
        }
    }
}
