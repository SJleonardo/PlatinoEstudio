import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Universal 2.0
import QtQuick.Layouts 1.3
import QtMultimedia 5.6

ApplicationWindow {
    id: ventanaMenuInicial
    visible: true
    width: 640
    height: 480

    Universal.theme: Universal.Light
    Universal.accent: Universal.Cyan
    //Universal.primary: Universal.Green
    //Universal.foreground: Universal.Dark
    //Universal.background: Universal.Teal


    Drawer {
        id: drawer
        width: ventanaMenuInicial.width // Math.min(ventanaMenuInicial.width, ventanaMenuInicial.height) / 1.5 * 2
        height: ventanaMenuInicial.height
        edge: Qt.TopEdge

        Rectangle{
            id: rectanguloLista
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            width: parent.width
            height: parent.height / 3.5
            color: "#1BA1E2" // Universal.Cyan
            Image {
                id: imagenLogo
                source: "qrc:/Imagenes/fondomenu.png"
                height: parent.height
                width: parent.width
                antialiasing: true
                smooth: true
                anchors.top: parent.top
                anchors.left: parent.left
                opacity: 0.5
            }
            Label{
                anchors.centerIn: parent
                text: "Menu Principal"
                font.pixelSize: 60
                color: "white"
            }
        }

        ListView {
            id: listView
            currentIndex: -1
            anchors.top: rectanguloLista.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            delegate: ItemDelegate {
                width: parent.width
                height: 70

                    Rectangle {
                        width: parent.width
                        height: parent.height
                        color: "transparent"
                        opacity: 0.8
                        border.width: 1
                        border.color: "transparent"
                        Rectangle{
                            id: iconobarra
                            height: parent.height
                            width: 70
                            anchors.left: parent.left
                            color: "transparent"
                            Image {
                                id: iconoB
                                source: icono
                                anchors.fill: iconobarra
                            }
                        }
                        Label{
                            text: model.titulo
                            anchors.left: iconobarra.right
                            anchors.leftMargin: 20
                            anchors.top: parent.top
                            anchors.topMargin: 10
                            horizontalAlignment: Label.AlignHCenter
                            font.pixelSize: 35
                        }

                    }

                highlighted: ListView.isCurrentItem
                onClicked: {
                    if (listView.currentIndex != index) {
                        listView.currentIndex = index
                        stackView.replace(model.codigo)
                    }
                    drawer.close()
                }
            }

            model: ListModel {
                ListElement { icono: "qrc:/Imagenes/icono nuevo.png"; titulo: "Crear una nueva partida"; codigo: "qrc:/RegistroUsuario.qml"; }
                ListElement { icono: "qrc:/Imagenes/icono recargar.png"; titulo: "Cargar mi partida"; codigo: "qrc:/VistaUsuarios.qml"; }
                ListElement { icono: "qrc:/Imagenes/icono volver.png"; titulo: "Volver al inicio"; codigo: "qrc:/MenuInicio.qml"; }
            }
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    SoundEffect{
        id: sonidoOpcion
        source: "qrc:/Sonidos/Selecciona.wav"
    }

    SoundEffect{
        id: sonidoComoJugar
        source: "qrc:/Sonidos/ComoJugar.wav"
    }

   // Keys.onEnterPressed(vistaApilada.replace("qrc:/SistemaTrivia.qml"))
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: MenuInicio {}
    }

    Popup {
        id: comoSeJuega
        modal: true
        focus: true
        x: (ventanaMenuInicial.width - width) / 2
        y: ventanaMenuInicial.height / 6
        width: Math.min(ventanaMenuInicial.width, ventanaMenuInicial.height) / 2 * 2
        contentHeight: columnaComoSeJuega.height

        Column {
            id: columnaComoSeJuega
            spacing: 20

            Label {
                text: "Como se juega"
                font.bold: true
                font.pixelSize: 20
            }

            Label {
                width: comoSeJuega.availableWidth
                text: "Para poder jugar, tán solo nesecitas usar: las teclas de navegación, la barra de espacio y el ratón."
                wrapMode: Label.Wrap
                font.pixelSize: 16
            }
            Image {
                id: teclaYraton
                source: "qrc:/Imagenes/TecladoyMouse.png"
            }
        }
    }
}
