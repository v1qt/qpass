#include <QDebug>
#include "entry.h"
#include <QString>


Entry::Entry(){

}
Entry::~Entry(){

}


    //*******************************************
    void Entry::setId(const int _id){
        this->id = _id;
    }
    int Entry::getId(){
        return id;
    }
    //*******************************************
    void Entry::setUserId(const int u_id){
        this->userId = u_id;
    }
    int Entry::getUserId(){
        return userId;
    }
    //*******************************************
    void Entry::setItemName(const QString i_name){
        this->itemName = i_name;
    }
    QString Entry::getItemName(){
        return itemName;
    }
    //*******************************************
    void Entry::setNickName(const QString n_name){
        this->nickName = n_name;
    }
    QString Entry::getNickName(){
        return nickName;
    }
    //*******************************************
    void Entry::setPassword(const QString p_word){
        this->password = p_word;
    }
    QString Entry::getPassword(){
        return password;
    }
    //*******************************************
    void Entry::setDomain(const QString dom){
        this->domain = dom;
    }
    QString Entry::getDomain(){
        return domain;
    }

