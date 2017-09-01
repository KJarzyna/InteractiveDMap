import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Window {
    visible: true
    width: 1920
    height: 1080
    x: 0
    y: 0

    MouseArea {
        id: windowArea
        anchors.fill: parent

        Image {
            id: mapImg
            source: "files/images/optimized/background_op8.png"
            x: -(sourceSize.width/2 - parent.width/2)
            y: -(sourceSize.height/2 - parent.height/2)

            transform: Scale {
                id: imgScale
            }

            MouseArea {
                id: imageArea
                hoverEnabled: true
                propagateComposedEvents: true
                anchors.fill: mapImg

                property real zoomFactor: 1.5

                drag.target: mapImg
                drag.axis: Drag.XAndYAxis

                onClicked: {
                    mouse.accepted = false
                    console.log('Image.x: ', imageArea.mouseX)
                    console.log('Image.y: ', imageArea.mouseY)
                    }
                onWheel: {
                        if(wheel.angleDelta.y > 0 && imgScale.xScale < 1.2)                             // zoom in
                        {
                            var zoom = imageArea.zoomFactor
                            var realX = wheel.x * imgScale.xScale
                            var realY = wheel.y * imgScale.yScale
                            mapImg.x += (1-zoom)*realX
                            mapImg.y += (1-zoom)*realY
                            imgScale.xScale *=zoom
                            imgScale.yScale *=zoom
                            }
                        else if(wheel.angleDelta.y < 0 && imgScale.xScale > 0.5)
                        {                                                                               // zoom out
                            zoom = 1/imageArea.zoomFactor
                            realX = wheel.x * imgScale.xScale
                            realY = wheel.y * imgScale.yScale
                            mapImg.x += (1-zoom)*realX
                            mapImg.y += (1-zoom)*realY
                            imgScale.xScale *=zoom
                            imgScale.yScale *=zoom
                            }
                        }
                }
            }

        onClicked: {

            console.log('Window.x: ', windowArea.mouseX)
            console.log('Window.y: ', windowArea.mouseY)
        }
    }
}
