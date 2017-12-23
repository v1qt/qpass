#ifndef PASSCTRL_H
#define PASSCTRL_H

#include <QDebug>
#include <QObject>
#include <QQuickView>
#include <QtQuick>
#include <entry.h>
#include <QStringList>


class PassCTRL : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int entryCounter READ getEntryCounter WRITE setEntryCounter NOTIFY countEtriesChanged)
    Q_PROPERTY(int itemId READ getItemId WRITE setItemId NOTIFY itemIdChanged)
    Q_PROPERTY(int userId READ getUserId WRITE setUserId NOTIFY userIdChanged)
    Q_PROPERTY(QString itemName READ getItemName WRITE setItemName NOTIFY itemNameChanged)
    Q_PROPERTY(QString nickName READ getNickName WRITE setNickName NOTIFY nickNameChanged)
    Q_PROPERTY(QString password READ getPassword WRITE setPassword NOTIFY passwordChanged)
    Q_PROPERTY(QString domain READ getDomain WRITE setDomain NOTIFY domainChanged)
public:
    explicit PassCTRL(QObject *parent=nullptr);
    int getEntryCounter();
    void setEntryCounter(const int &counter);
    int getItemId();
    void setItemId(const int &itemid);
    int getUserId();
    void setUserId(const int &userid);
    QString getItemName();
    void setItemName(const QString &itemName);
    QString getNickName();
    void setNickName(const QString &nickNames);
    QString getPassword();
    void setPassword(const QString &password);
    QString getDomain();
    void setDomain(const QString &domain);
signals:
    void itemIdChanged();
    void userIdChanged();
    void itemNameChanged();
    void nickNameChanged();
    void passwordChanged();
    void domainChanged();
    void countEtriesChanged();
public slots:
    bool loadEntry(const int m_id);
    bool getEntryList();
    bool saveEntry();
    bool updateEntry();
    bool deleteEntry();
    QString getItemIdAt(const int index);
    QString getItemNameAt(const int index);
private:
        QList<Entry> m_entrySet;
        QString m_ItemName;
        QString m_NickName;
        QString m_Password;
        QString m_Domain;
        int m_userId;
        int m_itemId;
        int m_countEtries = 0 ;
};


#endif // PASSCTRL_H
