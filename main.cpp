#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuick>
#include <QObject>
#include <QDebug>
#include <QQmlContext>
#include <QSqlDatabase>
#include <QSqlDriver>
#include <QSqlError>
#include <QSqlQuery>
#include "passctrl.h"
#include "loginctrl.h"
#include "userctrl.h"



int main(int argc, char *argv[])
{
    //Qt::AA_EnableHighDpiScaling
    //Qt::AA_DisableHighDpiScaling
    QCoreApplication::setAttribute(Qt::AA_DisableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QIcon icon(":/images/icon.png");
    app.setWindowIcon(icon);

    //Properties
    qmlRegisterType<LoginCTRL>("io.qt.mycontrolls.loginctrl",1,0,"LoginCTRL");
    qmlRegisterType<UserCTRL>("io.qt.mycontrolls.userctrl",1,0,"UserCTRL");
    qmlRegisterType<PassCTRL>("io.qt.mycontrolls.passctrl",1,0,"PassCTRL");


    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
