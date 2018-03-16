import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.0

Pane {
    id: pane

    Image {
        id: fondo
        source: "qrc:/Imagenes/fondomenu.png"
        width: pane.width
        height: pane.height
        anchors.centerIn: parent
        antialiasing: true
        smooth: true
    }

    Rectangle {
        id: tituloJuego
        width: pane.width //ventanaMenuInicial.width/1.8
        height: ventanaMenuInicial.height/4.9
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        border.width: 2
        border.color: "white"
        //radius: 10
        color: "Transparent" //Teal #3E65FF
        //opacity: 0.5
        Image {
            id: banertitulo
            source: "qrc:/Imagenes/banner2.png"
            anchors.fill: parent
        }
        Button {
            anchors.fill: parent
            text: "Platino Estudio"
            font.pixelSize: 65
            Universal.foreground: "black"
        }
    }

    Column {
        id: botonesDelMenu
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20

        Rectangle{
            id: botonIniciarJuego
            anchors.horizontalCenter: parent.horizontalCenter
            width: ventanaMenuInicial.width/1.6 // Math.max(implicitWidth, Math.min(implicitWidth * 2, pane.availableWidth / 3))
            height: 90 //ventanaMenuInicial.height/5.5
            color: "transparent"
            border.width: 2
            border.color: "white"

            Rectangle{
                id: iconoI
                height: 80
                width: 80
                anchors.left: botonIniciarJuego.left
                anchors.leftMargin: 10
                anchors.top: botonIniciarJuego.top
                anchors.topMargin: 5
                color: "transparent"
                Image {
                    id: imagenI
                    source: "qrc:/Imagenes/icono jugar.png"
                    anchors.fill: iconoI
                }
            }
            Button {
                id: botonI
                anchors.fill: parent
                text: "Iniciar Juego"
                font.pixelSize: 30
                Universal.theme: Universal.Dark
            }

            MouseArea{
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {botonI.highlighted = true;
                            botonI.opacity = 0.8}
                onExited: {botonI.highlighted = false;
                           botonI.opacity = 1.0}
                onReleased: botonIniciarJuego.opacity = 1.0
                onPressed: botonIniciarJuego.opacity = 0.7
                onClicked: {
                    drawer.open()
                    sonidoOpcion.play()
                }
            }
        }

        Rectangle{
            id: botonComoSeJuega
            anchors.horizontalCenter: parent.horizontalCenter
            width: ventanaMenuInicial.width/1.6  // Math.max(implicitWidth, Math.min(implicitWidth * 2, pane.availableWidth / 3))
            height: 90
            color: "transparent"
            border.width: 2
            border.color: "white"
            Rectangle{
                id: iconoCSJ
                height: 80
                width: 80
                anchors.left: botonComoSeJuega.left
                anchors.leftMargin: 10
                anchors.top: botonComoSeJuega.top
                anchors.topMargin: 5
                color: "transparent"
                Image {
                    id: imagenCSJ
                    source: "qrc:/Imagenes/icono CSJ.png"
                    anchors.fill: iconoCSJ
                }
            }
            Button {
                id: botonCSJ
                anchors.fill: parent
                text: "Como se juega"
                font.pixelSize: 30
                Universal.theme: Universal.Dark
            }
            MouseArea{
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {botonCSJ.highlighted = true;
                            botonCSJ.opacity = 0.8}
                onExited: {botonCSJ.highlighted = false;
                           botonCSJ.opacity = 1.0}
                onReleased: botonComoSeJuega.opacity = 1.0
                onPressed: botonComoSeJuega.opacity = 0.7
                onClicked: {
                    comoSeJuega.open()
                    sonidoComoJugar.play()
                }
            }
        }

        Rectangle{
            id: botonSalir
            anchors.horizontalCenter: parent.horizontalCenter
            width: ventanaMenuInicial.width/1.6  // Math.max(implicitWidth, Math.min(implicitWidth * 2, pane.availableWidth / 3))
            height: 90
            color: "transparent"
            border.width: 2
            border.color: "white"

            Rectangle{
                id: iconoSalir
                height: 80
                width: 80
                anchors.left: botonSalir.left
                anchors.leftMargin: 10
                anchors.top: botonSalir.top
                anchors.topMargin: 5
                color: "transparent"
                Image {
                    id: imagenS
                    source: "qrc:/Imagenes/icono salir.png"
                    anchors.fill: iconoSalir

                }
            }
            Button {
                id: botonS
                anchors.fill: parent
                text: "Salir del juego"
                font.pixelSize: 30
                Universal.theme: Universal.Dark
            }
            MouseArea{
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {botonS.highlighted = true;
                            botonS.opacity = 0.8}
                onExited: {botonS.highlighted = false;
                           botonS.opacity = 1.0}
                onReleased: botonSalir.opacity = 1.0
                onPressed: botonSalir.opacity = 0.7
                onClicked: Qt.quit();
            }
        }

    }

}
