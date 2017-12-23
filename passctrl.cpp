#include <QDebug>
#include <QObject>
#include <QQuickView>
#include <QtQuick>
#include "passctrl.h"
#include "dbmanager.h"

PassCTRL::PassCTRL(QObject *parent)
{
}
// Properties Emplementierung
int PassCTRL::getEntryCounter()
{
    return m_countEtries;
}
void PassCTRL::setEntryCounter(const int &counter)
{
    if(counter==m_countEtries)
        return;
    m_countEtries=counter;
    emit countEtriesChanged();
}
int PassCTRL::getItemId()
{
    return m_itemId;
     qDebug() << "das ist die m_itemId: " << m_itemId;
}
void PassCTRL::setItemId(const int &itemid)
{
    if(itemid == m_itemId)
        return;
    m_itemId = itemid;
    emit itemIdChanged();
     qDebug() << "das ist die itemid: " << itemid;
}
int PassCTRL::getUserId()
{
    return m_userId;
     qDebug() << "das ist die m_userId: " << m_userId;

}
void PassCTRL::setUserId(const int &userid)
{
    if(userid == m_userId)
        return;
    m_userId = userid;
    emit userIdChanged();
    qDebug() << "das ist die userid: " << userid;

}
QString PassCTRL::getItemName()
{
    qDebug() << "das ist der m_ItemName: " << m_ItemName;
    return m_ItemName;
}
void PassCTRL::setItemName(const QString &itemName)
{
    if(itemName == m_ItemName)
        return;

    m_ItemName = itemName;
    emit itemNameChanged();
    //Das wird aus dem Textfeld an die Variable übergeben.

    qDebug() << "das ist der itemName: " << itemName;

}
QString PassCTRL::getNickName()
{
    qDebug() << "das ist der m_NickName: " << m_NickName;
    return m_NickName;
}
void PassCTRL::setNickName(const QString &nickName)
{
    if(nickName == m_NickName)
        return;

    m_NickName = nickName;
    emit nickNameChanged();

    qDebug() << "das ist der nickName: " << nickName;
}
QString PassCTRL::getPassword()
{
    qDebug() << "das ist der m_Password: " << m_Password;
    return m_Password;
}
void PassCTRL::setPassword(const QString &password)
{
    if(password == m_Password)
        return;

    m_Password = password;
    emit passwordChanged();

    qDebug() << "das ist der password: " << password;
}
QString PassCTRL::getDomain()
{
    qDebug() << "das ist der m_Domain: " << m_Domain;
    return m_Domain;

}
void PassCTRL::setDomain(const QString &domain)
{
    if(domain == m_Domain)
        return;

    m_Domain = domain;
    emit domainChanged();

    qDebug() << "das ist der domain: " << domain;
}
//Signals Implementierung
bool PassCTRL::saveEntry()
{
    bool success = false;
    DbManager dbm;
    if(((m_itemId = dbm.insertEntry(m_ItemName, m_NickName, m_Password, m_Domain, m_userId))) !=0)
    {
            success = true;
            qDebug() << "Entry saved!!!";
    }
    else
    {   qDebug() << "Entry save failed!! ";
        return success;
    }
    return success;
}
bool PassCTRL::updateEntry()
{
    bool success = false;
    DbManager dbm;
    if( dbm.updateEntry(m_ItemName, m_NickName, m_Password, m_Domain, m_itemId, m_userId)){
            success = true;
            qDebug() << "Entry updated!!!";
    }
    else
    {   qDebug() << "Entry update failed!! ";
        return success;
    }
    return success;
}
bool PassCTRL::deleteEntry()
{
    bool success = false;
    DbManager dbm;
    if(dbm.deleteEntry(m_itemId)){
        success = true;
        qDebug() << "Entry deleted!!!";
    }
    else
    {   qDebug() << "Entry delete failed!! ";
        return success;
    }
    return success;

}
bool PassCTRL::getEntryList()
{
    bool success = false;
    DbManager dbm;
    m_entrySet = dbm.getEntrySet(this->getUserId());
    this->setEntryCounter(m_entrySet.length());
    qDebug() << "Counter gesetzt! " << this->getEntryCounter();

    /*if(!m_entrySet.empty()){
        for(int x = 0; x<= m_entrySet.length();x++){
         m_entryMap.insert(m_entrySet[x].getId(), m_entrySet[x].getItemName());
         qDebug() << "Key: " << m_entrySet[x].getId();
         qDebug() << "Value: "<< m_entrySet[x].getItemName() ;
        }
      success = true;
    }
    else{
        qDebug() << "Get EntrySet is empty! ";
        return success;
    }*/

    return success;
}
QString PassCTRL::getItemIdAt(const int index)
{
    int itemid;
    itemid = m_entrySet[index].getId();
    qDebug() << "getID from Entrie" << itemid;

    QString itemidS = QString::number(itemid);
    qDebug() << "Transform into String" << itemidS;

    return itemidS;
}
QString PassCTRL::getItemNameAt(const int index)
{
    QString itemname;
    itemname = m_entrySet[index].getItemName();
    qDebug() << "get ItemName from Entrie" << itemname;
    return itemname;
}
bool PassCTRL::loadEntry(const int m_itemId)
{
    bool success = false;
    qDebug() << "Entry Set länge = "<< m_entrySet.length();
    qDebug() << "Entry an der Stelle 0 = "<< m_entrySet[0].getId();
     //qDebug() << "Entry an der Stelle 0 = "<< m_entrySet[0].getId();

     for(int i = 0; i<m_entrySet.length();i++){
         if(m_entrySet[i].getId() == m_itemId){
            qDebug() << "Bedingung erfüllt ";
            m_ItemName = m_entrySet[i].getItemName();
            qDebug() << "Itemname:  "<< m_entrySet[i].getItemName();
            m_NickName = m_entrySet[i].getNickName();
            qDebug() << "Nickname:  "<< m_entrySet[i].getNickName();
            m_Password = m_entrySet[i].getPassword();
            qDebug() << "Password:  "<< m_entrySet[i].getPassword();
            m_Domain = m_entrySet[i].getDomain();
            qDebug() << "Domain: "<< m_entrySet[i].getDomain();
         }
      success = true;
     }
    return success;
}





