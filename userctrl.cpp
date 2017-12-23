#include "userctrl.h"
#include <QQuickView>
#include <QObject>
#include <QDebug>
#include "dbmanager.h"
#include "profile.h"

UserCTRL::UserCTRL(QObject *parent) : QObject(parent)
{
}


//Implementierung der Properties


int UserCTRL::getUserID()
{
    return m_userID;
}
void UserCTRL::setUserID(const int &uid)
{
    if(uid == m_userID)
        return;

    m_userID = uid;
    emit useridChanged();
}

QString UserCTRL::getName()
{
    qDebug() << "das ist der m_UserName: " << m_Name;
    return m_Name;
}
void UserCTRL::setName(const QString &name)
{
    if(name == m_Name)
        return;

    m_Name = name;
    emit nameChanged();
    //Das wird aus dem Textfeld an die Variable übergeben.

    qDebug() << "das ist der userName: " << name;
}

QString UserCTRL::getSurname()
{
    qDebug() << "das ist der m_UserName: " << m_Surname;
    return m_Surname;
}
void UserCTRL::setSurname(const QString &surname)
{
    if(surname == m_Surname)
        return;

    m_Surname = surname;
    emit surnameChanged();
    //Das wird aus dem Textfeld an die Variable übergeben.

    qDebug() << "das ist der userName: " << surname;
}

QString UserCTRL::getEmail(){
    qDebug() << "das ist das m_Passwort: " << m_Email;
    return m_Email;
}
void UserCTRL::setEmail(const QString &email)
{
    if(email == m_Email)
        return;
    m_Email = email;
    emit emailChanged();
    qDebug() << "das ist das passw: " << email;
}

QString UserCTRL::getPassword()
{
    qDebug() << "das ist das m_Passwort: " << m_Password;
    return m_Password;

}
void UserCTRL::setPassword(const QString &password)
{
    if(password == m_Password)
        return;
    m_Password = password;
    emit passwordChanged();
    qDebug() << "Passwort set Funktion: " << password;
}

QString UserCTRL::getImageUrl()
{
//muss evtl. einen Cast machen von QObject zu QImage

    return m_imageUrl;
     qDebug() << "Image get funktion";
}

void UserCTRL::setImageUrl(const QString &imageUrlString)
{
    //nehme String und erstelle daraus eine QUrl und lege
    //sie in Variable Ab.
    if(imageUrlString == 0)
        return;
    m_imageUrl = imageUrlString;
    emit imageUrlChanged();


    qDebug() << "QUrl erstellt"<< m_imageUrl ;

    if(loadQImage())
             qDebug() << "ImageLoad successfull" ;

}

//slots implementation
bool UserCTRL::createProfile()
{
    DbManager dbm;
    bool success=false;

    if( 0 != (m_userID=dbm.insertProfile(m_Name, m_Surname, m_Email, m_Password))){
            success = true;
            qDebug() << "Profile created!!!";
    }
    else
    {   qDebug() << "Profile creation failed!! ";
        return success;
    }
    return success;
}

bool UserCTRL::updateProfile()
{
    DbManager dbm;
    bool success=false;
    if( (dbm.updateProfile(m_Name, m_Surname, m_Email, m_Password, m_userID))){
            success = true;
            qDebug() << "Profile created!!!";
    }
    else
    {   qDebug() << "Profile creation failed!! ";
        return success;
    }
    return success;
}

bool UserCTRL::deleteProfile()
{

    DbManager dbm;
    bool success=false;
    if( (dbm.deleteProfile(m_userID))){
            success = true;
            qDebug() << "Profile created!!!";
    }
    else
    {   qDebug() << "Profile creation failed!! ";
        return success;
    }
    return success;
}

bool UserCTRL::getProfile()
{
    DbManager dbm;
    bool success=false;
    if((this->m_userID) !=0)
    {
        Profile prof = dbm.getProfile(m_userID);
        this->setName(prof.getName());
        this->setSurname(prof.getSurname());
        this->setEmail(prof.getEmail());
        this->setPassword(prof.getPassword());
        success = true;
        qDebug() << "Profile created!!!";
    }
    else
    {   qDebug() << "Profile creation failed!! m_userid is null ";
        return success;
    }
    return success;


}


//diese Funtkion wurde nicht getestet
int UserCTRL::getUserID(const QString &userName)
{
    int userid = 0;
    bool success = false;
    DbManager dbm;
    try{
        if( (userid = dbm.getUserID(userName)) !=0 ){
             return userid;
             //success = true;
        }
        else{
             return userid;
        }
    }
    catch(std::exception &e){

        qDebug() << "Finding User Id failed!! ";
         qDebug() << "Exception: "<< e.what();
    }
    return success;

}

//Erstelle QImage und bereite für DB vor
bool UserCTRL::loadQImage(){

    const QUrl url = m_imageUrl;

    if (url.isValid()) {
        qDebug() << "Valid URL: " ;
        QString test = url.path();
        QImage myImage(test);
        qDebug() << "url.paht"<< test;
        qDebug() << "Image Size " << myImage.size();
    }
    else{
        qDebug() << "the url is invalid";
    }
}

















