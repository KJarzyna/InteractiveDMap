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
        id: zoomableArea
        hoverEnabled: true
        property real zoom: 1
        property real zoomX: 0
        property real zoomY: 0
        anchors.fill: parent

        Image {
            id: backgrnd
            source: "files/images/optimized/background_op8.png"
            x: -(sourceSize.width/2 - parent.width/2)
            y: -(sourceSize.height/2 - parent.height/2)

//            transform: Scale {
//                origin.x: zoomableArea.zoomX// - backgrnd.x
//                origin.y: zoomableArea.zoomY// - backgrnd.y
//                xScale: zoomableArea.zoom
//                yScale: zoomableArea.zoom
//                }
            }

        onWheel: {
            //backgrnd.scale += 0.1 * wheel.angleDelta.y / 120
//            zoomableArea.zoom += 0.1 * wheel.angleDelta.y / 120

//            backgrnd.x += -(mouseX - zoomableArea.zoomX)
//            backgrnd.y += -(mouseY - zoomableArea.zoomY)

//            zoomableArea.zoomX = zoomableArea.mouseX
//            zoomableArea.zoomY = zoomableArea.mouseY

            //backgrnd.x += -(mouseX - width/2)
            //backgrnd.y += -(mouseY - height/2)

            zoomableArea.zoom = 0.1 * wheel.angleDelta.y / 120
            backgrnd.width = backgrnd.width*(1+zoomableArea.zoom)
            backgrnd.height = backgrnd.height*(1+zoomableArea.zoom)


            if(zoomableArea.zoom < 0.2)
                zoomableArea.zoom = 0.2
            if(zoomableArea.zoom > 1.2)
                zoomableArea.zoom = 1.2

            if(backgrnd.scale < 0.2)
                backgrnd.scale = 0.2
            if(backgrnd.scale > 1)
                backgrnd.scale = 1

            console.log('Background.x: ', backgrnd.x)
            console.log('Background.y: ', backgrnd.y)
        }

        onClicked: {
            console.log('PosXBefore: ', backgrnd.x)
            console.log('PosYBefore: ', backgrnd.y)
            backgrnd.x += -(mouseX - width/2)
            backgrnd.y += -(mouseY - height/2)

            console.log('PosXAfter: ', backgrnd.x)
            console.log('PosYAfter: ', backgrnd.y)
        }
    }
}
