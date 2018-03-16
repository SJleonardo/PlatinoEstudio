#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QtSql>
#include <QtQml>
#include <Preguntas.h>
#include <Usuario.h>
#include <NivelJuego.h>


int main(int argc, char *argv[])
{
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    qmlRegisterType<Usuario>("Qusuario", 1, 0, "Usuario");
    qmlRegisterType<Preguntas>("Qpreguntas", 1, 0, "Preguntas");
    qmlRegisterType<NivelJuego>("Qniveljuego", 1, 0, "NivelJuego");

    QQuickStyle::setStyle("Universal");

    QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:/main.qml"));

    return app.exec();
}
