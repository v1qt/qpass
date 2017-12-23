#ifndef LOGINCTRL_H
#define LOGINCTRL_H
#include <QDebug>
#include <QObject>
#include <QQuickView>
#include <QtQuick>

class LoginCTRL : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString userName READ getUserName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString password READ getPassword WRITE setPassword NOTIFY passwortChanged)

public:
    explicit LoginCTRL(QObject *parent=nullptr);

    QString getUserName();
    void setUserName(const QString &userName);
    QString getPassword();
    void setPassword(const QString &passw);

    //Restlichen Eigenschaften, E-Mail usw...

signals:
    void userNameChanged();
    void passwortChanged();

public slots:
    // hier kommen Funkionen hinein die ich über die Property
    //z.B. userName.verifyUser(); aufrufen kann
    bool verifyUser();
    int getUserID();

private:
        QString m_UserName;
        QString m_Password;
        int m_userid;
};
#endif // LOGINCTRL_H
