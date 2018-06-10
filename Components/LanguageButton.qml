WebItem {
    //anchors.right: parent.right;
    //anchors.rightMargin: 20;
    width: textLang.width;
    height: 14;
    property string lang;

    onClicked: { this.lang === "uk" ? this.lang = "ru" : this.lang = "uk" }
    onLangChanged: { log("lang", value); context.language = value; localStorage.set("lang", value, function() { log("lang error") }) }

    onCompleted: {
        var lang
        localStorage.getOrDefault("lang", function(arg) { lang = arg }, context.language)
        if (lang === "ru-ru") lang = "ru"
        this.lang = lang
    }

    Image {
        id: textLang;
        source: parent.lang === "uk" ? "images/ukr.png" : "images/ukr.png";
        height: 25;
        width: 35;
        //text: parent.lang === "uk" ? "українська" : "русский";
        //color: "#adb1ba";
        z: -1;
    }
}