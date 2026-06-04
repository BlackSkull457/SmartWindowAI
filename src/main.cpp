#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "SmartAI.h"

int main(int argc,char *argv[])
{
    QGuiApplication app(argc,argv);

    SmartAI ai;

    QQmlApplicationEngine engine;

    engine.rootContext()
            ->setContextProperty(
                "smartAI",
                &ai);

    engine.load(
        QUrl(
        QStringLiteral(
        "qrc:/Main.qml")));

    return app.exec();
}