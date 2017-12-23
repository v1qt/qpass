#ifndef ENTRY_H
#define ENTRY_H

#include <QString>

class Entry
{

 public:
    //Konstruktor
    Entry();
    //Destruktor
    ~Entry();

    //*******************************************
    void setId(const int _id);
    int getId();
    //*******************************************
    void setUserId(const int u_id);
    int getUserId();
    //*******************************************
    void setItemName(const QString i_name);
    QString getItemName();
    //*******************************************
    void setNickName(const QString n_name);
    QString getNickName();
    //*******************************************
    void setPassword(const QString p_word);
    QString getPassword();
    //*******************************************
    void setDomain(const QString dom);
    QString getDomain();


private:
    int id;
    int userId;
    QString itemName;
    QString nickName;
    QString password;
    QString domain;

};










#endif // ENTRY_H
