TEMPLATE = app

QT += quick quickcontrols2 \
            sql
CONFIG += c++11

SOURCES += main.cpp \
    usuario.cpp \
    preguntas.cpp \
    niveljuego.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    usuario.h \
    preguntas.h \
    niveljuego.h
