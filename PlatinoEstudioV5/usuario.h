#ifndef USUARIO_H
#define USUARIO_H

#include <QObject>
#include <QString>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>

class Usuario : public QObject
{
    Q_OBJECT
public:
    explicit Usuario(QObject *parent = 0);

    int getId() const;
    void setId(int value);

    QString getNombre() const;
    void setNombre(const QString &value);

    QString getClave() const;
    void setClave(const QString &value);

    Q_INVOKABLE bool buscarUsuario(QString valorNombre);
    Q_INVOKABLE bool cargarUsuario();
    Q_INVOKABLE void registrarUsuario();
    Q_INVOKABLE bool cargarIdUsuario(int indice);
    Q_INVOKABLE int contarUsuario();
private:
    Q_PROPERTY(int id READ getId WRITE setId)
    Q_PROPERTY(QString nombre READ getNombre WRITE setNombre)
    Q_PROPERTY(QString clave READ getClave WRITE setClave)
    int id;
    QString nombre;
    QString clave;
    QSqlDatabase bd;
    void conectarBD(bool accion);
};
#endif
