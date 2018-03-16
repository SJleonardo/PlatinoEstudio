#ifndef PREGUNTAS_H
#define PREGUNTAS_H

#include <QObject>
#include <QString>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>


class Preguntas : public QObject
{
    Q_OBJECT
public:
    explicit Preguntas(QObject *parent = 0);

    int getIdpreguntas() const;
    void setIdpreguntas(int value);

    QString getCategoria() const;
    void setCategoria(const QString &value);

    QString getEnunciado() const;
    void setEnunciado(const QString &value);

    QString getOpcion1() const;
    void setOpcion1(const QString &value);

    QString getOpcion2() const;
    void setOpcion2(const QString &value);

    QString getOpcion3() const;
    void setOpcion3(const QString &value);

    QString getOpcion4() const;
    void setOpcion4(const QString &value);

    QString getRespuesta() const;
    void setRespuesta(const QString &value);

    Q_INVOKABLE bool cargarPreguntas();

private:
    Q_PROPERTY(int idpreguntas READ getIdpreguntas WRITE setIdpreguntas)
    Q_PROPERTY(QString categoria READ getCategoria WRITE setCategoria)
    Q_PROPERTY(QString enunciado READ getEnunciado WRITE setEnunciado)
    Q_PROPERTY(QString opcion1 READ getOpcion1 WRITE setOpcion1)
    Q_PROPERTY(QString opcion2 READ getOpcion2 WRITE setOpcion2)
    Q_PROPERTY(QString opcion3 READ getOpcion3 WRITE setOpcion3)
    Q_PROPERTY(QString opcion4 READ getOpcion4 WRITE setOpcion4)
    Q_PROPERTY(QString respuesta READ getRespuesta WRITE setRespuesta)
    int idpreguntas;
    QString categoria;
    QString enunciado;
    QString opcion1;
    QString opcion2;
    QString opcion3;
    QString opcion4;
    QString respuesta;
    QSqlDatabase bd;
    void conectarBD(bool accion);

};


#endif
