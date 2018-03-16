import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.0
import QtMultimedia 5.6


Pane {
    id: pane
   // visible: true
    Universal.theme: Universal.Dark
    property alias labelZona1: labelZona1
    property int desplazar: 5

    Rectangle{
        anchors.fill: parent
        color: "#4CAF50"
        height: 520
        width: 680
    }

        Rectangle {
            id: mapaescuela
            height: 480
            width: 640
            color: "#1BA1E2"
            anchors.centerIn: parent
            Image {
                id: mapa
                anchors.centerIn: parent
                source: "qrc:/Imagenes/mapaescuela.png"
            }

            Button {
                id: botonpausa
                x: 548
                y: 20
                text: "Menú"
                visible: false
                onClicked: menuPausa.open()
            }

            Button {
                id: introduccion
                height: mapaescuela.height
                width: mapaescuela.width
                anchors.centerIn: parent
                Label{
                text: "Bienvenido al Salón Virtual de clases. Cuando quieras empezar a explorar el salón, haz click en la ventana."
                wrapMode: Text.WordWrap
                font.pixelSize: 35
                anchors.fill: parent
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                }
                highlighted: true
                onClicked: {
                    zonanivel1.visible = true
                    zonanivel2.visible = true
                    zonanivel3.visible = true
                    zonanivel4.visible = true
                    botonpausa.visible = true
                    introduccion.visible = false
                }
            }

            Rectangle {
                id: zonanivel1
                width: 120
                height: 130
                x: 20
                y: 30
                visible: false
                color: "transparent"


                Label{
                    id: labelZona1
                    text: "Clase 1: Lengua"
                    color: "White"
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    font.pixelSize: 15
                }


                function validarZona1(x, y, longitud)
                {
                    if(x >= 10 && x <= 120){
                        if(y >= 30 && y <=120 ) {
                            labelZona1.text = "Entrado"
                            //Keys.onEnterPressed(sistemaTrivia.visible = true)
                        }
                        else{
                            labelZona1.text = "Clase 1: Lengua"
                        }
                    }
                    // cerca de la zona
                    else if(y >= 30 && y <= 120){
                        if(x >= 120 && x <=10 ) {
                            labelZona1.text = "Entrado"
                            // Keys.onEnterPressed(vistaApilada.replace("qrc:/SistemaTrivia.qml"))
                        }
                        else{
                            labelZona1.text = "Clase 1: Lengua"
                        }
                    }
                }
            }

            Rectangle {
                id: zonanivel2
                width: 120
                height: 130
                x: 147
                y: 30
                visible: false
                color: "transparent"

                Label{
                    id: labelZona2
                    text: "Clase 2:"
                    color: "White"
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    font.pixelSize: 15
                }

                function validarZona2(x, y, longitud)
                {
                    if(x >= 130 && x <= 250){
                        if(y >= 30 && y <=120 ) {
                            labelZona2.text = "Entrado"
                        }
                        else{
                            labelZona2.text = "Clase 2:"
                        }
                    }
                    // cerca de la zona
                    else if(y >= 30 && y <= 120){
                        if(x >= 250 && x <=130 ) {
                            labelZona2.text = "Entrado"
                        }
                        else{
                            labelZona2.text = "Clase 2:"
                        }
                    }
                }
            }

            Rectangle {
                id: zonanivel3
                width: 120
                height: 130
                x: 275
                y: 30
                visible: false
                color: "transparent"

                Label{
                    id: labelZona3
                    text: "Clase 3:"
                    color: "White"
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    font.pixelSize: 15
                }

                function validarZona3(x, y, longitud)
                {
                    if(x >= 260 && x <= 380){
                        if(y >= 30 && y <=120 ) {
                            labelZona3.text = "Entrado"
                        }
                        else{
                            labelZona3.text = "Clase 3:"
                        }
                    }
                    // cerca de la zona
                    else if(y >= 30 && y <= 120){
                        if(x >= 380 && x <=260 ) {
                            labelZona3.text = "Entrado"
                        }
                        else{
                            labelZona3.text = "Clase 3:"
                        }
                    }
                }
            }

            Rectangle {
                id: zonanivel4
                width: 120
                height: 130
                x: 405
                y: 30
                visible: false
                color: "transparent"

                Label{
                    id: labelZona4
                    text: "Clase 4:"
                    color: "White"
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    font.pixelSize: 15
                }


                function validarZona4(x, y, longitud)
                {
                    if(x >= 390 && x <= 520){
                        if(y >= 30 && y <=120 ) {
                            labelZona4.text = "Entrado"
                        }
                        else{
                            labelZona4.text = "Clase 4:"
                        }
                    }
                    // cerca de la zona
                    else if(y >= 30 && y <= 120){
                        if(x >= 520 && x <=390 ) {
                            labelZona4.text = "Entrado"
                        }
                        else{
                            labelZona4.text = "Clase 4:"
                        }
                    }
                }
            }

            Rectangle {
                x: 550
                y: 400
                id: personaje
                width: 32; height: 48
                color: "transparent"
                z: 200

                SpriteSequence {

                    id: spriteabajo
                    visible: true
                    height: 48
                    width: 32
                    goalSprite: ""
                    interpolate: true
                    running: false
                    Sprite {

                        name: "abajo"
                        source: "qrc:/Imagenes/personaje.png"
                        frameCount: 4
                        frameHeight: 48
                        frameWidth: 32
                        frameDuration: 170
                        to: {"abajo":1}
                    }
                }

                SpriteSequence{
                    id: spritearriba
                    visible: false
                    height: 48
                    width: 32
                    goalSprite: ""
                    interpolate: true
                    running: false
                    Sprite {

                        name: "arriba"
                        source: "qrc:/Imagenes/personaje.png"
                        frameCount: 4
                        frameX: 0
                        frameY: 144
                        frameHeight: 48
                        frameWidth: 32
                        frameDuration: 170
                        to: {"arriba":1}
                    }
                }

                SpriteSequence {
                    id: spriteizquierda
                    visible: false
                    height: 48
                    width: 32
                    goalSprite: ""
                    interpolate: true
                    running: false

                    Sprite {
                        name: "izquierda"
                        source: "qrc:/Imagenes/personaje.png"
                        frameCount: 4
                        frameX: 0
                        frameY: 48
                        frameHeight: 48
                        frameWidth: 32
                        frameDuration: 170
                        to: {"izquierda":1}
                    }
                }

                SpriteSequence {
                    id: spritederecha
                    visible: false
                    height: 48
                    width: 32
                    goalSprite: ""
                    interpolate: true
                    running: false

                    Sprite {
                        name: "derecha"
                        source: "qrc:/Imagenes/personaje.png"
                        frameCount: 4
                        frameX: 0
                        frameY: 96
                        frameHeight: 48
                        frameWidth: 32
                        frameDuration: 170
                        to: {"abajo":1}
                    }
                }
            }
            Keys.onPressed: {

                zonanivel1.validarZona1(personaje.x, personaje.y, personaje.width)
                zonanivel2.validarZona2(personaje.x, personaje.y, personaje.width)
                zonanivel3.validarZona3(personaje.x, personaje.y, personaje.width)
                zonanivel4.validarZona4(personaje.x, personaje.y, personaje.width)

                objetoPupitre1.procesarChoqueHorizontal(personaje.x, personaje.y, personaje.width)
                objetoPupitre1.procesarChoqueVertical(personaje.x, personaje.y, personaje.height)

                objetoPupitre2.procesarChoqueHorizontal(personaje.x, personaje.y, personaje.width)
                objetoPupitre2.procesarChoqueVertical(personaje.x, personaje.y, personaje.height)

                objetoPupitre3.procesarChoqueHorizontal(personaje.x, personaje.y, personaje.width)
                objetoPupitre3.procesarChoqueVertical(personaje.x, personaje.y, personaje.height)

                objetoPupitre4.procesarChoqueHorizontal(personaje.x, personaje.y, personaje.width)
                objetoPupitre4.procesarChoqueVertical(personaje.x, personaje.y, personaje.height)

                objetoPupitre5.procesarChoqueHorizontal(personaje.x, personaje.y, personaje.width)
                objetoPupitre5.procesarChoqueVertical(personaje.x, personaje.y, personaje.height)

                objetoMesa.procesarChoqueHorizontal(personaje.x, personaje.y, personaje.width)
                objetoMesa.procesarChoqueVertical(personaje.x, personaje.y, personaje.height)

                if (event.key === Qt.Key_Down) {
                    personaje.y+=desplazar
                    spriteabajo.visible = true
                    spritearriba.visible = false
                    spriteizquierda.visible = false
                    spritederecha.visible = false

                    spriteabajo.running = true
                    event.accepted = true

                }
                else if (event.key === Qt.Key_Left) {

                    personaje.x-=desplazar
                    spriteizquierda.visible = true
                    spritederecha.visible = false
                    spritearriba.visible = false
                    spriteabajo.visible = false

                    spriteizquierda.running = true
                    event.accepted = true
                }
                else if (event.key === Qt.Key_Right) {
                    personaje.x+=desplazar
                    spritederecha.visible = true
                    spriteizquierda.visible = false
                    spritearriba.visible = false
                    spriteabajo.visible = false

                    spritederecha.running = true
                    event.accepted = true

                }
                else if (event.key === Qt.Key_Up) {
                    personaje.y-=desplazar
                    spritearriba.visible = true
                    spriteabajo.visible = false
                    spriteizquierda.visible = false
                    spritederecha.visible = false
                    spritearriba.running = true
                    event.accepted = true
                }

                else if(event.key === Qt.Key_Space){
                    if( labelZona1.text === "Entrado"){
                        stackView.replace("qrc:/SistemaTrivia.qml")
                        event.accepted = true
                    }
                    else if( labelZona2.text === "Entrado"){
                        stackView.replace("qrc:/SistemaTrivia.qml")
                        event.accepted = true
                    }
                    else if( labelZona3.text === "Entrado"){
                        stackView.replace("qrc:/SistemaTrivia.qml")
                        event.accepted = true
                    }
                    else if( labelZona4.text === "Entrado"){
                        stackView.replace("qrc:/SistemaTrivia.qml")
                        event.accepted = true
                    }
                }

                if(personaje.x < 7){
                    personaje.x = 7;
                }
                else if(personaje.x > 600){
                    personaje.x = 600;
                }
                else if(personaje.y < 80){
                    personaje.y = 80;
                }

                else if(personaje.y > 425){
                    personaje.y = 425;
                }
            }

            Keys.onReleased:{
                if (event.key === Qt.Key_Down) {
                    spriteabajo.running = false
                }
                else if (event.key === Qt.Key_Up) {
                    spritearriba.running = false
                }
                else if (event.key === Qt.Key_Left) {
                    spriteizquierda.running = false
                }
                else if (event.key === Qt.Key_Right) {
                    spritederecha.running = false
                }

            }

        }




    Item {
        id: objetoPupitre1
        width: 40
        height: 240
        x: 57
        y: 175
        Rectangle {
            id: obstaculo1
            anchors.fill: parent
            color: "transparent"
        }
        function procesarChoqueHorizontal(x, y, longitud){
            if(x >= 50 && x <= 95){
                if(y >= 140 && y <=390 ) {
                    personaje.x+=5
                }
            }
            // cerca de la planta
            else if(x >= 35 && x <= 65){
                if(y >= 140 && y <=390 ) {
                    personaje.x-=5
                }
            }
        }
        function procesarChoqueVertical(x, y, alto){
            if(y >= 130 && y <=385){
                if( x >= 40 && x <= 85) {
                    personaje.y-=5
                }
            }
            else if(y >= 230 && y <=400 ) {
                if(x >= 40 && x <= 85) {
                    personaje.y+=5
                }
            }
        }
    }

    Item {
        id: objetoPupitre2
        width: 40
        height: 240
        x: 157
        y: 175
        Rectangle {
            id: obstaculo2
            anchors.fill: parent
            color: "transparent"
        }
        function procesarChoqueHorizontal(x, y, longitud){
            if(x >= 150 && x <= 195){
                if(y >= 140 && y <=390 ) {
                    personaje.x+=5
                }
            }
            else if(x >= 130 && x <= 160){
                if(y >= 140 && y <=390 ) {
                    personaje.x-=5
                }
            }
        }
        function procesarChoqueVertical(x, y, alto){
            if(y >= 130 && y <=385){
                if( x >= 140 && x <= 185) {
                    personaje.y-=5
                }
            }
            else if(y >= 230 && y <=400 ) {
                if(x >= 140 && x <= 185) {
                    personaje.y+=5
                }
            }
        }
    }

    Item {
        id: objetoPupitre3
        width: 40
        height: 240
        x: 257
        y: 175
        Rectangle {
            id: obstaculo3
            anchors.fill: parent
            color: "transparent"
        }
        function procesarChoqueHorizontal(x, y, longitud){
            if(x >= 250 && x <= 295){
                if(y >= 140 && y <=390 ) {
                    personaje.x+=5
                }
            }
            else if(x >= 230 && x <= 260){
                if(y >= 140 && y <=390 ) {
                    personaje.x-=5
                }
            }
        }
        function procesarChoqueVertical(x, y, alto){
            if(y >= 130 && y <=385){
                if( x >= 240 && x <= 285) {
                    personaje.y-=5
                }
            }
            else if(y >= 230 && y <=400 ) {
                if(x >= 240 && x <= 285) {
                    personaje.y+=5
                }
            }
        }
    }

    Item {
        id: objetoPupitre4
        width: 40
        height: 240
        x: 357
        y: 175
        Rectangle {
            id: obstaculo4
            anchors.fill: parent
            color: "transparent"
        }
        function procesarChoqueHorizontal(x, y, longitud){
            if(x >= 350 && x <= 395){
                if(y >= 140 && y <=390 ) {
                    personaje.x+=5
                }
            }
            else if(x >= 330 && x <= 360){
                if(y >= 140 && y <=390 ) {
                    personaje.x-=5
                }
            }
        }
        function procesarChoqueVertical(x, y, alto){
            if(y >= 130 && y <=385){
                if( x >= 340 && x <= 385) {
                    personaje.y-=5
                }
            }
            else if(y >= 230 && y <=400 ) {
                if(x >= 340 && x <= 385) {
                    personaje.y+=5
                }
            }
        }
    }

    Item {
        id: objetoPupitre5
        width: 40
        height: 240
        x: 457
        y: 175
        Rectangle {
            id: obstaculo5
            anchors.fill: parent
            color: "transparent"
        }
        function procesarChoqueHorizontal(x, y, longitud){
            if(x >= 450 && x <= 495){
                if(y >= 140 && y <=390 ) {
                    personaje.x+=5
                }
            }
            else if(x >= 430 && x <= 460){
                if(y >= 140 && y <=390 ) {
                    personaje.x-=5
                }
            }
        }
        function procesarChoqueVertical(x, y, alto){
            if(y >= 130 && y <=385){
                if( x >= 440 && x <= 485) {
                    personaje.y-=5
                }
            }
            else if(y >= 230 && y <=400 ) {
                if(x >= 440 && x <= 485) {
                    personaje.y+=5
                }
            }
        }
    }

    Item {
        id: objetoMesa
        width: 95
        height: 40
        x: 537
        y: 88
        Rectangle {
            id: obstaculoMesa
            anchors.fill: parent
            color: "transparent"
            opacity: 0.5
        }
        function procesarChoqueHorizontal(x, y, longitud){
            if(x >= 600 && x <= 560){
                if(y >= 140 && y <=390 ) {
                    personaje.x+=5
                }
            }
            else if(x >= 510 && x <= 550){
                if(y >= 70 && y <=90 ) {
                    personaje.x-=5
                }
            }
        }
        function procesarChoqueVertical(x, y, alto){
            if(y >= 40 && y <=90){
                if( x >= 520 && x <= 600) {
                    personaje.y-=5
                }
            }
            else if(y >= 70 && y <=100 ) {
                if(x >= 520 && x <= 600) {
                    personaje.y+=5
                }
            }
        }
    }

    Drawer {
        id: menuPausa
        width: ventanaMenuInicial.width // Math.min(ventanaMenuInicial.width, ventanaMenuInicial.height) / 1.5 * 2
        height: ventanaMenuInicial.height


        Rectangle{
            id: rectanguloPausa
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            width: parent.width
            height: parent.height / 3.5
            color: "#1BA1E2" // Universal.Cyan
            Image {
                id: imagenPausa
                source: "qrc:/Imagenes/banner pausa.png"
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
                text: "Menu Pausa"
                font.pixelSize: 60
                color: "white"
            }
        }

        ListView {
            id: visorPausa
            currentIndex: -1
            anchors.top: rectanguloPausa.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            delegate: ItemDelegate {
                width: parent.width
                height: 70

                    Rectangle {
                        width: parent.width
                        height: 70
                        color: "transparent"
                        opacity: 0.8
                        border.width: 1
                        border.color: "transparent"
                        Rectangle{
                            id: iconobarra
                            height: parent.height
                            width: 70
                            anchors.left: parent.left
                            color: "green"
                            radius: 50
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
                    if (visorPausa.currentIndex != index) {
                        visorPausa.currentIndex = index
                        stackView.replace(model.codigo)
                    }
                    menuPausa.close()
                }
            }

            model: ListModel {
                ListElement { titulo: "Volver al juego"; }
                ListElement { titulo: "Mejores jugadores"; }
                ListElement { titulo: "Salir del Juego"; codigo: "qrc:/MenuInicio.qml"}
            }
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    SoundEffect{
        id: sonidoBienvenida
        source: "qrc:/Sonidos/Biennvenida.wav"
    }

    Component.onCompleted: {
        sonidoBienvenida.play()
    }

}



