#ifndef DBMANAGER_H
#define DBMANAGER_H
#include <QSqlDatabase>
#include <QString>
#include <QList>
#include <stdlib.h>
#include <entry.h>
#include "profile.h"


class DbManager
{
public:
    //Konstruktor mit absolutem DB Pfad
    DbManager();
    //Destruktor
    ~DbManager();

    bool isOpen() const;
    bool isUserName(const QString& username);
    bool isPassword(const QString& password);
    int getUserID(const QString &userName);

    //hier noch das QImage miteinbauen bzw. das ByteArray was in die DB abgelegt wird
    int insertProfile(const QString& m_NameCreate,
                       const QString& m_SurnameCreate,
                       const QString& m_EmailCreate,
                       const QString& m_PasswordCreate);

    bool updateProfile(const QString &m_Name,
                       const QString &m_Surname,
                       const QString &m_Email,
                       const QString &m_Password,
                       const int &m_userID);

    bool deleteProfile(const int &m_UserID);
    Profile getProfile(const int &m_UserID);

    int insertEntry(const QString &m_ItemName,
                     const QString &m_NickName,
                     const QString &m_Password,
                     const QString &m_Domain,
                     const int &m_userid );

    bool updateEntry(const QString &m_ItemName,
                     const QString &m_NickName,
                     const QString &m_Password,
                     const QString &m_Domain,
                     const int &m_id,
                     const int &m_userid);

    bool deleteEntry(const int m_id);

    QList<Entry> getEntrySet(const int &m_userid);


private:
    QSqlDatabase m_db;

};



#endif // DBMANAGER_H
