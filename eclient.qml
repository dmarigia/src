MainItem {
    id: app;
    anchors.fill: parent;
    title: "E926 Client";

    GridView {
        id: listView;
        anchors.fill: parent;
        cellWidth: 200;
        cellHeight: 200;
        spacing: 10;
        nativeScrolling: true;

        property bool atXBeginning: !contentX;
        property bool atXEnd: contentX >= contentWidth - width;
        property bool atYBeginning: !contentY;
        property bool atYEnd ;//count > 0 && contentY >= contentHeight - height;
        property int contentX;
        property int contentY;
        property int contentWidth;
        property int contentHeight;
        function _updateScrollProperties() {
            var element = this.element.dom
            this.contentX = element.scrollLeft
            this.contentY = element.scrollTop
            this.contentWidth = element.scrollWidth
            this.contentHeight = element.scrollHeight
            this.atYEnd = this.contentY >= this.contentHeight - this.height
        }

        onCompleted: { this.element.dom.onscroll = context.wrapNativeCallback(this._updateScrollProperties.bind(this)) }

        model: ListModel {
            id: postListModelQML;
        }

        delegate: Image {
            source: model.preview_url;
            height: 200;
            width: 200;
            fillMode: Image.PreserveAspectCrop;

            Rectangle {
                anchors.fill: parent;
                color: "lightgray";
                opacity: parent.status === Image.Ready ? 0 : 1;
                Behavior on opacity { Animation { duration: 200; } }
            }

            MouseArea {
                id: mouse;
                anchors.fill: parent;
                onClicked: { window.open(model.source) }
                cursor: "pointer";
            }
        }

        onAtYEndChanged: {
            if (this.atYEnd && !busy.visible) app.loadPage(++app.lastPage)
        }
    }

    Rectangle { anchors.fill: label; color: "black"; opacity: 0.6; }
    Text {
        id: label;
        anchors.right: parent.right; color: "white";
        text: "Pages: <b>" + app.lastPage + "</b>";
    }

    Item {
        id: busy;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.bottom: parent.bottom;
    }

    onCompleted: {
        this.loadPage(this.lastPage++)
    }

    property int lastPage: 0;



    function loadPage(page) {
        console.log("load page")
        var url = 'https://api.draqony.xyz/temp01/?page=' + page
        var xhr = new XMLHttpRequest()
        xhr.open("GET", url, true)
        busy.visible = true
        xhr.onreadystatechange = context.wrapNativeCallback(function() {
            if (xhr.readyState != xhr.DONE) return
            if (xhr.status == 200) {
                var jsonObject = JSON.parse(xhr.responseText)
                postListModelQML.append(jsonObject)
            } else {
                console.error("Load error")
            }
            busy.visible = false
        })
        xhr.send();
    }
}
