import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Window {
    id: window
    visible: true
    width: 1920
    height: 1080
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
        x: -(2034 - parent.width/2)//-(4524/2 - parent.width/2)
        y: -(1817 - parent.height/2)//-(4211/2 - parent.height/2)
        hoverEnabled: true
        propagateComposedEvents: true

        Image {
                id: morza
                source: "images/morza_op.png"
                x: 0
                y: 0
                opacity: 1
            }
            Image {
                id: kolor
                source: "images/kolor_op.png"
                x: 98
                y: 0
                opacity: 1
            }
            Image {
                id: obwodka_kontynentu
                source: "images/obwodka_kontynentu_op.png"
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

//        Image {
//            id: mapImg
//            source: "images/background_op8.png"
//            x: -(sourceSize.width/2 - parent.width/2)
//            y: -(sourceSize.height/2 - parent.height/2)
//            visible: false

//            transform: Scale {
//                id: imgScale
//            }

//            MouseArea {
//                id: imageArea
//                hoverEnabled: true
//                propagateComposedEvents: true
//                anchors.fill: mapImg

//                property real zoomFactor: 1.5

//                drag.target: mapImg
//                drag.axis: Drag.XAndYAxis

//                onClicked: {
//                    mouse.accepted = false
//                    console.log('Image.x: ', imageArea.mouseX)
//                    console.log('Image.y: ', imageArea.mouseY)
//                }
//                onWheel: {
//                    if(wheel.angleDelta.y > 0 && imgScale.xScale < 1.2)                             // zoom in
//                    {
//                        var zoom = imageArea.zoomFactor
//                        var realX = wheel.x * imgScale.xScale
//                        var realY = wheel.y * imgScale.yScale
//                        mapImg.x += (1-zoom)*realX
//                        mapImg.y += (1-zoom)*realY
//                        imgScale.xScale *=zoom
//                        imgScale.yScale *=zoom
//                    }
//                    else if(wheel.angleDelta.y < 0 && imgScale.xScale > 0.5)
//                    {                                                                               // zoom out
//                        zoom = 1/imageArea.zoomFactor
//                        realX = wheel.x * imgScale.xScale
//                        realY = wheel.y * imgScale.yScale
//                        mapImg.x += (1-zoom)*realX
//                        mapImg.y += (1-zoom)*realY
//                        imgScale.xScale *=zoom
//                        imgScale.yScale *=zoom
//                    }
//                }
//            }


        onClicked: {

            console.log('Window.x: ', windowArea.mouseX)
            console.log('Window.y: ', windowArea.mouseY)
        }
    }

    ToolBar {
        id: toolBar
        height: 74
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        GroupBox {
            id: groupBox
            x: 0
            y: 0
            width: 526
            height: 74
            title: qsTr("Filtry")

            CheckBox {
                id: checkBox_stolice
                x: 0
                y: -14
                width: 128
                height: 40
                text: "Stolice"
                clip: false
                autoExclusive: false
                checked: true

                onCheckedChanged: {
                    if(checked == true)
                        stolice.visible = true
                    else
                        stolice.visible = false
                }
            }
        }
    }
}
