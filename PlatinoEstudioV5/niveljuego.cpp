#include "niveljuego.h"

NivelJuego::NivelJuego(QObject *parent) : QObject(parent)
{

}

int NivelJuego::getIdniveljuego() const
{
    return idniveljuego;
}

void NivelJuego::setIdniveljuego(int value)
{
    idniveljuego = value;
}

QString NivelJuego::getNombrenivel() const
{
    return nombrenivel;
}

void NivelJuego::setNombrenivel(const QString &value)
{
    nombrenivel = value;
}

int NivelJuego::getNota() const
{
    return nota;
}

void NivelJuego::setNota(int value)
{
    nota = value;
}
