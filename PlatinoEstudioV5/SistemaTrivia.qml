import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.0
import Qpreguntas 1.0
import QtMultimedia 5.6



Pane {
    id: pane

    Universal.theme: Universal.Light
    Universal.accent: Universal.Cyan

    //property bool asignarPregunta: objPreguntas.cargarPreguntas()
    property string respuesta

    ToolBar {

            RowLayout {
                spacing: 20
                anchors.fill: parent

                Label {
                    id: titleLabel
                    text: "Menu Inicio"
                    font.pixelSize: 20
                    elide: Label.ElideRight
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    Layout.fillWidth: true
                }

            }
    }

    Preguntas {
        id: objPreguntas
        idpreguntas: 1
    }

    Rectangle {
        anchors.centerIn: parent
        id: fondoVentanaPreguntas
        width: pane.width
        height: pane.height
        color: "#008A00"
        Image {
            id: fondoPreguntas
            fillMode: Image.PreserveAspectCrop
            anchors.fill: parent
            source: "qrc:/Imagenes/fondopreguntas.png"
        }
    }
    Rectangle {
        id: enunciado
        anchors.top: parent.top
        anchors.topMargin: 20
        width: parent.width
        height: parent.height/3.6
        color: "#1BA1E2"
        radius: 10
        opacity: 0.9

        Label{
            id: textEnunciado
            wrapMode: Text.WordWrap
            anchors.fill: parent
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            anchors.leftMargin:  10
            anchors.rightMargin: 10
            font.pointSize: 30
            text: "Este es el enunciado"
        }
    }

    Grid {
         columns: 2
         spacing: 15

         anchors.horizontalCenter: parent.horizontalCenter
         anchors.bottom: parent.bottom
         anchors.bottomMargin: 20

    Rectangle {
        id: opcion1
        width: pane.width /2.3
        height: 100
        color: "#39cbc3"
        radius: 10
        opacity: 0.9
        Label {
            id: textOpcion1
            wrapMode: Text.WordWrap
            anchors.fill: parent
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            anchors.leftMargin:  10
            anchors.rightMargin: 10
            color: "black"
            font.pixelSize: 28
            text: "Opcion 1"
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                opcion1.color = "#39efe9"
                textOpcion1.color = "blue"
            }
            onExited: {
                opcion1.color = "#39cbc3"

                textOpcion1.color = "black"
            }
            onClicked: {
                if (textOpcion1.text === objPreguntas.respuesta)
                {
                    opcion1.color = "green"
                    sonidoCorrecto.play()
                    objPreguntas.idpreguntas = 2
                }
                else{
                    opcion1.color = "red"
                    sonidoErroneo.play()
                    objPreguntas.idpreguntas = 2
                }

            }
        }
    }

    Rectangle {
        id: opcion2
        width: pane.width /2.3
        height: 100
        color: "#39cbc3"
        radius: 10
        opacity: 0.9
        Label{
            id: textOpcion2
            wrapMode: Text.WordWrap
            anchors.fill: parent
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            anchors.leftMargin:  10
            anchors.rightMargin: 10
            color: "black"
            font.pixelSize: 28
            text: "Opcion 2"
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                opcion2.color = "#39efe9"
               // opcion2.width = 260
               // opcion2.height = 110
                textOpcion2.color = "blue"
            }
            onExited: {
                opcion2.color = "#39cbc3"
               // opcion2.width = 250
               // opcion2.height = 100
                textOpcion2.color = "black"
            }
            onClicked: {
                if (textOpcion2.text === objPreguntas.respuesta)
                {
                    opcion2.color = "green"
                    sonidoCorrecto.play()
                }
                else{
                    opcion2.color = "red"
                    sonidoErroneo.play()
                }
            }
        }
    }

    Rectangle {
        id: opcion3
        width: pane.width /2.3
        height: 100
        color: "#39cbc3"
        radius: 10
        opacity: 0.9
        Label{
            id: textOpcion3
            wrapMode: Text.WordWrap
            anchors.fill: parent
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            anchors.leftMargin:  10
            anchors.rightMargin: 10
            color: "black"
            font.pixelSize: 28
            text: "Opcion 3"
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                opcion3.color = "#39efe9"
               // opcion3.width = 260
               // opcion3.height = 110
                textOpcion3.color = "blue"
            }
            onExited: {
                opcion3.color = "#39cbc3"
              //  opcion3.width = 250
              //  opcion3.height = 100
                textOpcion3.color = "black"
            }
            onClicked: {
                if (textOpcion3.text === objPreguntas.respuesta)
                {
                    opcion3.color = "green"
                    sonidoCorrecto.play()
                }
                else{
                    opcion3.color = "red"
                    sonidoErroneo.play()
                }
            }
        }
    }

    Rectangle {
        id: opcion4
        width: pane.width /2.3
        height: 100
        color: "#39cbc3"
        radius: 10
        opacity: 0.9
        Label{
            id: textOpcion4
            wrapMode: Text.WordWrap
            anchors.fill: parent
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            anchors.leftMargin:  10
            anchors.rightMargin: 10
            color: "black"
            font.pixelSize: 28
            text: "Opcion 4"
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                opcion4.color = "#39efe9"
              //  opcion4.width = 260
              //  opcion4.height = 110
                textOpcion4.color = "blue"
            }
            onExited: {
                opcion4.color = "#39cbc3"
              //  opcion4.width = 250
              //  opcion4.height = 100
                textOpcion4.color = "black"
            }
            onClicked: {
                if (textOpcion4.text === objPreguntas.respuesta)
                {
                    opcion4.color = "green"
                    sonidoCorrecto.play()
                }
                else{
                    opcion4.color = "red"
                    sonidoErroneo.play()
                }
            }
        }
    }
    }

    SoundEffect {
        id: sonidoCorrecto
        source: "qrc:/Sonidos/correcto.wav"
        volume: 0.8
    }
    SoundEffect {
        id: sonidoErroneo
        source: "qrc:/Sonidos/error.wav"
        volume: 0.8
    }


    function validarRespuesta(){
    }

    Component.onCompleted: {

        objPreguntas.cargarPreguntas()
        textEnunciado.text = objPreguntas.enunciado
        textOpcion1.text = objPreguntas.opcion1
        textOpcion2.text = objPreguntas.opcion2
        textOpcion3.text = objPreguntas.opcion3
        textOpcion4.text = objPreguntas.opcion4

    }
}



