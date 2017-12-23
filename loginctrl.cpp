#include "loginctrl.h"
#include <QQuickView>
#include <QObject>
#include <QDebug>
#include "dbmanager.h"
#include "profile.h"

LoginCTRL::LoginCTRL(QObject *parent) : QObject(parent)
{
}

QString LoginCTRL::getUserName()
{
    qDebug() << "das ist der m_UserName: " << m_UserName;
    return m_UserName;
}

void LoginCTRL::setUserName(const QString &userName)
{
    if(userName == m_UserName)
        return;

    m_UserName = userName;
    emit userNameChanged();
    //Das wird aus dem Textfeld an die Variable übergeben.

    qDebug() << "das ist der userName: " << userName;
}

QString LoginCTRL::getPassword()
{
    qDebug() << "das ist das m_Passwort: " << m_Password;
    return m_Password;

}
void LoginCTRL::setPassword(const QString &passw)
{
    if(passw == m_Password)
        return;
    m_Password = passw;
    emit passwortChanged();
    qDebug() << "das ist das passw: " << passw;
}

bool LoginCTRL::verifyUser()
{
    DbManager dbm;

    bool success=false;

    if(dbm.isUserName(m_UserName) && dbm.isPassword(m_Password))
     {
        qDebug() << "UserName und Passwort verifiziert: ";
        m_userid = dbm.getUserID(m_UserName);
        success = true;
     }

    else
    {   qDebug() << "UserName und Passwort nicht verifiziert: ";
        return success;
    }
    return success;

}

int LoginCTRL::getUserID()
{
    return m_userid;
}





















