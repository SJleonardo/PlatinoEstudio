import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Qusuario 1.0
import QtQuick.Controls.Universal 2.0
import QtMultimedia 5.6

Pane {
    id: pane

    Universal.theme: Universal.Light
    Universal.accent: Universal.Cobalt

    Rectangle{
        width: pane.width
        height: pane.height
        color: "transparent"
        anchors.centerIn: parent

        Image {
            id: imagenRegistro
            source: "qrc:/Imagenes/fondobarra.png"
            width: pane.width
            height: pane.height
            anchors.centerIn: parent
            opacity: 0.6
        }

        ColorAnimation on color { to: "#03A9F4"; duration: 600 }

        Rectangle {
            id: tituloRegistrarUsuario
            width: pane.width //ventanaMenuInicial.width/1.8
            height: 70//pane.height/6
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            //anchors.topMargin: 20
            //border.width: 2
            //border.color: "white"
            color: "transparent" //Teal #3E65FF

            ColorAnimation on color { to: "#3E65FF"; duration: 700 }

            Image {
                id: banertitulo2
                source: "qrc:/Imagenes/banner3.png"
                anchors.fill: parent
            }

            Image {
                id: iconoTituloR
                source: "qrc:/Imagenes/icono nuevoUsuario.png"
                height: parent.height
                width: 70
                smooth: true
                anchors.left: parent.left
                anchors.leftMargin: 10
            }

            Label {
                anchors.centerIn: parent
                text: "Crear Usuario"
                font.pixelSize: 40
                color: "white"
            }

            Button {
                contentItem: Image {
                    source: "qrc:/Imagenes/drawer.png"
                    fillMode: Image.PreserveAspectFit
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter

                }
                width: 80
                height: parent.height
                anchors.right: parent.right
                onClicked: drawer.open()

            }
        }

        Rectangle{
            id: cuadroRegistro
            width: pane.width/3
            height: 350
            anchors.margins: 50
            anchors.top: tituloRegistrarUsuario.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            color: "transparent"
            border.width: 3
            border.color: "#3E65FF"

            ColorAnimation on color { to: "#F2F2F2"; duration: 600 }

            Column{
                id: com
                anchors.margins: 10
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: 10

                Label {
                    id: labelUsuario
                    text: "Escribe tu nombre"
                    font.pixelSize: 30
                    color: "black"
                }
                Rectangle{
                    width: cuadroRegistro.width / 1.05
                    height: 3
                    color: "#3E65FF"
                }

                TextField {
                    id: textInputUsuario
                    placeholderText: "Nombre"
                    maximumLength: 30
                    validator: RegExpValidator{
                        regExp: /[a-zA-Z\-'\s]+/
                    }

                    font.pixelSize: 25
                    width: cuadroRegistro.width / 1.05//Math.max(implicitWidth, Math.min(implicitWidth * 2, pane.availableWidth / 3))
                }

                Label {
                    id: labelClave
                    text: "Escribe tu contraseña"
                    font.pixelSize: 30
                    color: "black"
                }
                Rectangle{
                    width: cuadroRegistro.width / 1.05
                    height: 3
                    color: "#3E65FF"
                }
                TextField {
                    id: textInputClave
                    placeholderText: "Contraseña"
                    maximumLength: 30
                    font.pixelSize: 25
                    width: cuadroRegistro.width / 1.05 //Math.max(implicitWidth, Math.min(implicitWidth * 2, pane.availableWidth / 3))
                    echoMode: TextInput.Password //para que no se vea la contraseña
                    onAccepted: {
                        registrarJugador()
                    }

                }

                Rectangle {
                    id: botonCrear
                    width: cuadroRegistro.width/1.05 // Math.max(implicitWidth, Math.min(implicitWidth * 2, pane.availableWidth / 3))
                    height: 80
                    color: "transparent"
                    border.width: 3
                    border.color: "#3E65FF"
                    Button{
                        id: botonC
                        anchors.fill: parent
                        text: "Crear mi Usuario"
                        font.pixelSize: 30
                    }
                    MouseArea{
                        hoverEnabled: true
                        anchors.fill: parent
                        onEntered: {botonC.highlighted = true;
                                    botonC.opacity = 0.8}
                        onExited: {botonC.highlighted = false;
                                   botonC.opacity = 1.0}
                        onReleased: botonCrear.opacity = 1.0
                        onPressed: botonCrear.opacity = 0.7
                        onClicked: registrarJugador()
                    }
                }
            }
        }
    }

    Usuario {
        id: objetoJugador

    }

    SoundEffect{
        id: sonidoCE
        source: "qrc:/Sonidos/FaltaNoC.wav"
    }

    function registrarJugador(){

        if ( textInputUsuario.text !== "" && textInputClave.text  !== "" )
        {
            objetoJugador.nombre = textInputUsuario.text
            objetoJugador.clave = textInputClave.text
            objetoJugador.registrarUsuario()

            stackView.replace("qrc:/MapaNivel.qml")
        }
        else{
            textInputUsuario.placeholderText = "Falta el nombre"
            textInputClave.placeholderText = "Falta la Contraseña"
            sonidoCE.play()
        }
        textInputUsuario.text = ""
        textInputClave.text = ""
    }
}
