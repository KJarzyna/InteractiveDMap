import QtQuick 2.0
import QtQuick.Window 2.2

Window {
    id: window_splash
    width: Screen.width
    height: 400
    visible: true
    flags: Qt.FramelessWindowHint
    color: "#84d8c8"

    x: Screen.width / 2 - width / 2
    y: Screen.height / 2 - height / 2

    AnimatedImage {
        source: "images/images/fox.gif"
        anchors.centerIn: parent
        //anchors.verticalCenter: parent
    }

    Loader {
        id: loader
        asynchronous: true
        source: "main_window.qml"

        onLoaded: window_splash.visible = false
    }

//    Timer {
//            interval: 5000; running: true;
//            onTriggered: {
//                loader.source = "main_window.qml"
//                window.visible = false
//            }
//        }
}
