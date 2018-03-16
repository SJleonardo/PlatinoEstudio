#ifndef NIVELJUEGO_H
#define NIVELJUEGO_H

#include <QObject>
#include <QString>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>

class NivelJuego : public QObject
{
    Q_OBJECT
public:
    explicit NivelJuego(QObject *parent = 0);
    int getIdniveljuego() const;
    void setIdniveljuego(int value);

    QString getNombrenivel() const;
    void setNombrenivel(const QString &value);

    int getNota() const;
    void setNota(int value);


private:
    Q_PROPERTY(int idniveljuego READ getIdniveljuego WRITE setIdniveljuego)
    Q_PROPERTY(QString nombrenivel READ getNombrenivel WRITE setNombrenivel)
    Q_PROPERTY(int nota READ getNota WRITE setNota)
    int idniveljuego;
    QString nombrenivel;
    int nota;
    QSqlDatabase bd;

};

#endif // NIVELJUEGO_H
