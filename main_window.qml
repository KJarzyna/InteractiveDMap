import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Window {
    id: window
    visible: true
    width: Screen.width //1920
    height: Screen.height//1080
    minimumHeight: 500
    minimumWidth: 500
    x: 0
    y: 0
    visibility: "Maximized"

    Image {
        id: background
        source: "images/background.png"
        anchors.fill: parent
    }

    MouseArea {
        id: windowArea
        width: 4524
        height: 4211
        x: -(2034 - parent.width/2)
        y: -(1817 - parent.height/2)
        hoverEnabled: true
        propagateComposedEvents: true

        Image {
            id: morza
            //asynchronous: true
            source: "images/morza_op.png"
            x: 0
            y: 0
            opacity: 1

        }
        Image {
            id: kolor
            //asynchronous: true
            source: "images/kolor.png"
            x: 98
            y: 0
            opacity: 1
        }
        Image {
            id: obwodka_kontynentu
            source: "images/obwodka_kontynentu_op2.png"
            x: 142
            y: 0
            opacity: 1
        }
        Image {
            id: rzeki
            source: "images/rzeki_op.png"
            x: 0
            y: 1
            opacity: 1
        }
        Image {
            id: kropki_stolice
            source: "images/kropki_stolice_op.png"
            x: -2
            y: -1
            opacity: 1
        }
        Image {
            id: kropki_miasta
            source: "images/kropki_miasta_op.png"
            x: 331
            y: 126
            opacity: 1
        }
        Image {
            id: granice
            source: "images/granice_op.png"
            x: 337
            y: 369
            opacity: 1
        }
        Image {
            id: sigile
            source: "images/sigile_op.png"
            x: 1151
            y: -4
            opacity: 1
        }
        Image {
            id: roza
            source: "images/róża.png"
            x: 3042
            y: 2443
            opacity: 1
        }
        Image {
            id: kraje
            source: "images/kraje_op.png"
            x: 433
            y: 60
            opacity: 1
        }
        Image {
            id: inne_nazwy
            source: "images/inne_nazwy_op.png"
            x: 884
            y: 184
            opacity: 1
        }
        Image {
            id: morza_i_oceany
            source: "images/morza_i_oceany_op.png"
            x: 310
            y: 116
            opacity: 1
        }
        Image {
            id: rzeki_nazwy
            source: "images/rzeki_nazwy_op.png"
            x: 317
            y: 321
            opacity: 1
        }
        Image {
            id: gory
            source: "images/gory_op.png"
            x: 600
            y: 367
            opacity: 1
        }
        Image {
            id: miasta
            source: "images/miasta_op.png"
            x: 345
            y: 126
            opacity: 1
        }
        Image {
            id: stolice
            source: "images/stolice_op.png"
            x: 418
            y: 375
            opacity: 1
        }
        Image {
            id: dm
            source: "images/dm.png"
            x: 2028
            y: 1811
            opacity: 1
        }
        Image {
            id: rozawiatrow
            source: "images/rozawiatrow_op.png"
            x: 3860
            y: 54
            opacity: 1
        }

        transform: Scale {
            id: imgScale
        }

        MouseArea {
            id: imageArea
            hoverEnabled: true
            propagateComposedEvents: true
            anchors.fill: windowArea

            property real zoomFactor: 1.5

            drag.target: windowArea
            drag.axis: Drag.XAndYAxis

            onClicked: {
                mouse.accepted = false
                console.log('Image.x: ', imageArea.mouseX)
                console.log('Image.y: ', imageArea.mouseY)
            }
            onWheel: {
                if(wheel.angleDelta.y > 0 && imgScale.xScale < 1)                             // zoom in
                {
                    var zoom = imageArea.zoomFactor
                    var realX = wheel.x * imgScale.xScale
                    var realY = wheel.y * imgScale.yScale
                    windowArea.x += (1-zoom)*realX
                    windowArea.y += (1-zoom)*realY
                    imgScale.xScale *=zoom
                    imgScale.yScale *=zoom
                }
                else if(wheel.angleDelta.y < 0 && imgScale.xScale > 0.3)
                {                                                                               // zoom out
                    zoom = 1/imageArea.zoomFactor
                    realX = wheel.x * imgScale.xScale
                    realY = wheel.y * imgScale.yScale
                    windowArea.x += (1-zoom)*realX
                    windowArea.y += (1-zoom)*realY
                    imgScale.xScale *=zoom
                    imgScale.yScale *=zoom
                }
            }
        }

        onClicked: {

            console.log('Window.x: ', windowArea.mouseX)
            console.log('Window.y: ', windowArea.mouseY)
        }
    }

    ToolBar {
        id: toolBar
        height: 62
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        CheckBox {
            id: checkBox_inne
            x: 0
            y: 11
            width: 88
            height: 40
            text: "Inne"
            anchors.left: checkBox_miasta.right
            anchors.leftMargin: 6
            checked: true
            clip: false
            autoExclusive: false

            onCheckedChanged: {
                if(checked == true) {
                    inne_nazwy.visible = true
                    gory.visible = true
                    rzeki_nazwy.visible = true
                    morza_i_oceany.visible = true
                }
                else {
                    inne_nazwy.visible = false
                    gory.visible = false
                    rzeki_nazwy.visible = false
                    morza_i_oceany.visible = false
                }
            }
        }

        CheckBox {
            id: checkBox_miasta
            x: 226
            y: 11
            width: 150
            height: 40
            text: "Mniejsze miasta"
            anchors.left: checkBox_stolice.right
            anchors.leftMargin: 6
            clip: false
            checked: true
            autoExclusive: false

            onCheckedChanged: {
                if(checked == true) {
                    miasta.visible = true
                    kropki_miasta.visible = true
                }
                else {
                    miasta.visible = false
                    kropki_miasta.visible = false
                }
            }
        }

        CheckBox {
            id: checkBox_stolice
            x: 134
            y: 11
            width: 94
            height: 40
            text: "Stolice"
            anchors.left: checkBox_panstwa.right
            anchors.leftMargin: 6
            clip: false
            autoExclusive: false
            checked: true

            onCheckedChanged: {
                if(checked == true) {
                    stolice.visible = true
                    kropki_stolice.visible = true
                }
                else {
                    stolice.visible = false
                    kropki_stolice.visible = false
                }
            }
        }

        CheckBox {
            id: checkBox_panstwa
            x: 9
            y: 11
            width: 145
            height: 40
            text: "Nazwy państw"
            checked: true
            clip: false
            autoExclusive: false

            onCheckedChanged: {
                if(checked == true) {
                    kraje.visible = true
                }
                else {
                    kraje.visible = false
                }
            }
        }

    }
}
