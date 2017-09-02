#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QResource>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QResource::registerResource("images.rcc");
    engine.load(QUrl(QStringLiteral("qrc:/main_window.qml")));
    return app.exec();
}
