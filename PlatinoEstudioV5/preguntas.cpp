#include "preguntas.h"


Preguntas::Preguntas(QObject *parent) : QObject(parent)
{

}

int Preguntas::getIdpreguntas() const
{
    return idpreguntas;
}

void Preguntas::setIdpreguntas(int value)
{
    idpreguntas = value;
}

QString Preguntas::getCategoria() const
{
    return categoria;
}

void Preguntas::setCategoria(const QString &value)
{
    categoria = value;
}

QString Preguntas::getEnunciado() const
{
    return enunciado;
}

void Preguntas::setEnunciado(const QString &value)
{
    enunciado = value;
}

QString Preguntas::getOpcion1() const
{
    return opcion1;
}

void Preguntas::setOpcion1(const QString &value)
{
    opcion1 = value;
}

QString Preguntas::getOpcion2() const
{
    return opcion2;
}

void Preguntas::setOpcion2(const QString &value)
{
    opcion2 = value;
}

QString Preguntas::getOpcion3() const
{
    return opcion3;
}

void Preguntas::setOpcion3(const QString &value)
{
    opcion3 = value;
}

QString Preguntas::getOpcion4() const
{
    return opcion4;
}

void Preguntas::setOpcion4(const QString &value)
{
    opcion4 = value;
}

QString Preguntas::getRespuesta() const
{
    return respuesta;
}

void Preguntas::setRespuesta(const QString &value)
{
    respuesta = value;
}

bool Preguntas::cargarPreguntas()
{
    bool bandera = false;
    conectarBD(true);
    QSqlQuery cargar("SELECT * FROM preguntas WHERE(idpreguntas ='"+QString::number(idpreguntas)+"');", bd);
    while(cargar.next()){
        if (idpreguntas == cargar.value(0).toInt()){
            idpreguntas = cargar.value(0).toInt();
            categoria = cargar.value(1).toString();
            enunciado = cargar.value(2).toString();
            opcion1 = cargar.value(3).toString();
            opcion2 = cargar.value(4).toString();
            opcion3 = cargar.value(5).toString();
            opcion4 = cargar.value(6).toString();
            respuesta = cargar.value(7).toString();
            bandera = true;
        }
    }
    conectarBD(false);
    return bandera;
}



void Preguntas::conectarBD(bool accion){
    if (accion){
        if(QSqlDatabase::contains("bdplatino")){
            bd = QSqlDatabase::database("bdplatino");
        }
        else {
            bd = QSqlDatabase::addDatabase("QODBC", "bdplatino");
            bd.setHostName("localhost");
            bd.setDatabaseName("bdplatino");
            bd.setUserName("root");
            bd.setPassword("25663720");
            bd.setPort(3306);
        }
        if(!bd.open()){
            qDebug()<<"No se ha conectado a la base de datos";
        }
        else {
            //qDebug()<<"Se ha conectado a la base de datos.";
        }
    }
    else {
        bd.close();;
    }
}

