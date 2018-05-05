WebItem {
    anchors.right: parent.right;
    anchors.rightMargin: 20;
    width: textLang.width;
    height: 14;
    property string lang;

    onClicked: { this.lang === "ru" ? this.lang = "uk" : this.lang = "ru" }
    onLangChanged: { log("lang", value); context.language = value; localStorage.set("lang", value, function() { log("lang error") }) }

    Text {
        id: textLang;
        text: parent.lang === "ru" ? "русский" : "украинский";
        color: "#adb1ba";
        z: -1;
    }

    LocalStorage {
        id: localStorage;
        onCompleted: {
            var lang
            this.getOrDefault("lang", function(arg) { lang = arg }, context.language)
            this.parent.lang = lang
        }
    }
}