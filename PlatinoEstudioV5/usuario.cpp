#include "usuario.h"

Usuario::Usuario(QObject *parent) : QObject(parent)
{

}

int Usuario::getId() const
{
    return id;
}

void Usuario::setId(int value)
{
    id = value;
}

QString Usuario::getNombre() const
{
    return nombre;
}

void Usuario::setNombre(const QString &value)
{
    nombre = value;
}

QString Usuario::getClave() const
{
    return clave;
}

void Usuario::setClave(const QString &value)
{
    clave = value;
}

bool Usuario::buscarUsuario(QString valorNombre)
{
    bool bandera = false;
    conectarBD(true);
    QSqlQuery buscar("SELECT * FROM usuario WHERE(nombre='"+valorNombre+"')", bd);
    while(buscar.next()){
        if (valorNombre == buscar.value(1).toString()){
            id = buscar.value(0).toInt();
            nombre = buscar.value(1).toString();
            clave = buscar.value(2).toString();
            bandera = true;
        }
    }
    conectarBD(false);
    return bandera;
}

bool Usuario::cargarUsuario()
{
    bool bandera = false;
    conectarBD(true);
    QSqlQuery cargar("SELECT * FROM usuario WHERE(nombre='"+nombre+"');", bd);
    while(cargar.next()){
        if (nombre == cargar.value(1).toString()){
            id = cargar.value(0).toInt();
            nombre = cargar.value(1).toString();
            clave = cargar.value(2).toString();
            bandera = true;
        }
    }
    conectarBD(false);
    return bandera;
}

bool Usuario::cargarIdUsuario(int indice)
{
    bool bandera = false;
    conectarBD(true);
    QSqlQuery cargar("SELECT * FROM usuario WHERE (idusuario = "+QString::number(indice)+");", bd);
    while(cargar.next()){
        if (indice == cargar.value(0).toInt()){
            id = cargar.value(0).toInt();
            nombre = cargar.value(1).toString();
            clave = cargar.value(2).toString();
            bandera = true;
        }
    }
    conectarBD(false);
    return bandera;
}

void Usuario::registrarUsuario()
{

    conectarBD(true);
    int contador = 0;
    QSqlQuery contar("SELECT *FROM vistausuario;", bd);  // vistausuario
    while(contar.next()){
        contador = contar.value(0).toInt();
        contador = contador+1;
   }
    QSqlQuery insertar("INSERT INTO usuario( "
                     "idusuario,"
                     "nombre,"
                     "clave)"
                     "VALUES("+QString::number(contador)+","
                     "'"+nombre+"',"
                     "'"+clave+"'"
                     ");", bd);
    if(insertar.exec()){

        qDebug()<<"el usuario se ha registrado con exito";
    }else{
        qDebug()<<"el usuario no se ha podido registrar";
    }
    conectarBD(false);
}

int Usuario::contarUsuario(){
    conectarBD(true);
    int contador = 0;
    QSqlQuery contar("SELECT *FROM vistausuario;", bd);
    while(contar.next()){
        contador = contar.value(0).toInt();
        contador = contador+1;
    }
    conectarBD(false);
    return contador;
}

void Usuario::conectarBD(bool accion){
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



