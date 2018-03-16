import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Qusuario 1.0
import QtQuick.Controls.Universal 2.0
import QtMultimedia 5.6

Pane {
    id: pane

    Universal.accent: Universal.Cobalt

    Rectangle{
        width: pane.width
        height: pane.height
        color: "transparent"
        anchors.centerIn: parent

        Image {
            id: imagenUsuarios
            source: "qrc:/Imagenes/fondobarra.png"
            width: pane.width
            height: pane.height
            anchors.centerIn: parent
            opacity: 0.6
        }

        ColorAnimation on color { to: "#2196F3"; duration: 600 }

        Rectangle {
            id: tituloUsuarioRegistrados
            width: pane.width //ventanaMenuInicial.width/1.8
            height: 70//pane.height/6
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            //anchors.topMargin: 10
            //border.width: 2
            //border.color: "white"
            color: "transparent" //Teal #3E65FF

            Image {
                id: banertitulo3
                source: "qrc:/Imagenes/banner3.png"
                anchors.fill: parent
            }

            Image {
                id: iconoTitulo
                source: "qrc:/Imagenes/icono usuarios.png"
                height: parent.height
                width: 70
                smooth: true
                anchors.left: parent.left
                anchors.leftMargin: 10
            }

            Label {
                anchors.centerIn: parent
                text: "Escoge tu Usuario"
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

        ListModel{
            id: modeloDeUsuarios
            // en listElement se puede crear cualquier tipo de propiedad
            ListElement { nombre: "" }

        }

        Component{
            id: componenteDelegado

            ItemDelegate {

                width: visor.width /1.03
                height: 80

                Rectangle {
                    id: cuadrofila
                    width: parent.width
                    height: parent.height
                    color: "#FFFFFF"
                    border.width: 3
                    border.color: "#1BA1E2"
                    anchors.bottomMargin: 15

                    Button{
                        id: botonUsuario
                        anchors.fill: parent
                    Row {
                        spacing: 10
                        anchors.margins: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Label {
                            id: labelNumero
                            text: ""
                            font.pixelSize: 30
                            font.bold: true
                        }

                        Image {
                            id: iconoNombre
                            source: "qrc:/Imagenes/icono usuario.png"
                            width: 80
                            height: cuadrofila.height
                        }
                        Label {
                            id: labelNombre
                            text: "Nombre:"
                            font.bold: true
                            font.pixelSize: 30
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Label {
                            id: labelNombre2
                            text: nombre
                            font.pixelSize: 30
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
                MouseArea{
                    hoverEnabled: true
                    anchors.fill: parent
                    onEntered: {botonUsuario.highlighted = true;
                        botonUsuario.opacity = 0.8}
                    onExited: {botonUsuario.highlighted = false;
                        botonUsuario.opacity = 1.0}
                    onReleased: botonUsuario.opacity = 1.0
                    onPressed: botonUsuario.opacity = 0.7
                    onClicked: {
                        if (visor.currentIndex != index) {
                            visor.currentIndex = index
                            cuadroClave.open()
                            console.log(index)

                            // mostrar nombre en cuadro user
                            var indice = Number()
                            indice = visor.currentIndex
                            //labelNumero.text = indice
                            var nombreU = String()
                            nombreU = modeloDeUsuarios.get(indice).nombre
                            nombreUser.text = nombreU
                            introducirClave.placeholderText = "Contraseña"
                        }
                    }
                }
                }


            }
        }


        ListView{
            id: visor
            currentIndex: -1
            width: pane.width/3
            height: pane.height/5
            anchors.margins: 60
            anchors.top: tituloUsuarioRegistrados.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            model: modeloDeUsuarios
            delegate: componenteDelegado
            spacing: 10
            ScrollIndicator.vertical: ScrollIndicator { } //ScrollBar.vertical: ScrollBar { }
            Component.onCompleted: {
                var contador = Number()
                contador = 1
                modeloDeUsuarios.clear()
                while (contador < objetoUsuario.contarUsuario())
                {
                    objetoUsuario.cargarIdUsuario(contador)
                    modeloDeUsuarios.append({nombre: objetoUsuario.nombre })
                    contador = contador+1;
                }
            }
        }
    }

    Popup {
        id: cuadroClave
        modal: true
        focus: true
        x: (pane.width - width) / 2
        y: pane.height / 6
        width: pane.width/1.3 //Math.min(pane.width, pane.height) / 2 * 2
        contentHeight: columnaClave.height

        Column {
            id: columnaClave
            spacing: 10

            Image {
                id: iconoUser
                source: "qrc:/Imagenes/icono cuenta.png"
                width: 100
                height: 100
                fillMode: Image.PreserveAspectCrop
                antialiasing: true
                smooth: true
                Label {
                    id: nombreUser
                    text: ""
                    anchors.left: iconoUser.right
                    anchors.leftMargin: 10
                    font.pixelSize: 30
                }
            }
            Label {
                id: bold
                text: "Introduce tu Contraseña"
                font.bold: true
                font.pixelSize: 35
            }
            Rectangle{
                width: cuadroClave.width / 1.05
                height: 3
                color: "#3E65FF"
            }

            TextField {
                id: introducirClave
                placeholderText: "Contraseña"
                maximumLength: 30
                font.pixelSize: 25
                width: cuadroClave.width / 1.05 //Math.max(implicitWidth, Math.min(implicitWidth * 2, pane.availableWidth / 2.5))
                echoMode: TextInput.Password //para que no se vea la contraseña
            }

            Rectangle{
                id: botonEmpezarAJugar
                width: cuadroClave.width / 1.05 // Math.max(implicitWidth, Math.min(implicitWidth * 2, pane.availableWidth / 3))
                height: 90
                color: "transparent"
                border.width: 3
                border.color: "#3E65FF"
                Button{
                    id: botonEAJ
                    anchors.fill: parent
                    text: "Cargar mi Partida"
                    font.pixelSize: 30
                }
                MouseArea{
                    hoverEnabled: true
                    anchors.fill: parent
                    onEntered: {botonEAJ.highlighted = true;
                        botonEAJ.opacity = 0.8}
                    onExited: {botonEAJ.highlighted = false;
                        botonEAJ.opacity = 1.0}
                    onReleased: botonEmpezarAJugar.opacity = 1.0
                    onPressed: botonEmpezarAJugar.opacity = 0.7
                    onClicked: aceptarClave()
                }
            }
        }
    }

    Usuario{
        id: objetoUsuario
    }

    SoundEffect{
        id: sonidoContraseñaI
        source: "qrc:/Sonidos/ContraseñaIncorrecta.wav"
    }

    function aceptarClave(){
        var index = Number()
        index = visor.currentIndex
        var nombreDeUsuario = String()
        nombreDeUsuario = modeloDeUsuarios.get(index).nombre
        objetoUsuario.nombre = nombreDeUsuario
        objetoUsuario.cargarUsuario()
        console.log(objetoUsuario.clave)
        if ( objetoUsuario.clave == introducirClave.text  )
        {
            console.log("aceptado")
            stackView.replace("qrc:/MapaNivel.qml")
            cuadroClave.close()
            //ventanaMenuInicial.visible = false
        }
        else{
            introducirClave.placeholderText = "Contraseña Incorrecta"
            sonidoContraseñaI.play()
        }
        introducirClave.text = ""
    }
}

