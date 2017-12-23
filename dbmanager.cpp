#include <dbmanager.h>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlRecord>
#include <QDebug>
#include <QString>
#include <entry.h>

DbManager::DbManager()
{
    const QString connectionString = "/home/v1/Qt/Projects/QPass/db/Qpass";
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName(connectionString);

    if (!m_db.open())
    {
        qDebug() << "Error: connection with database fail";
    }
    else
    {
        qDebug() << "Database: connection ok";
    }
}

DbManager::~DbManager()
{
    if (m_db.isOpen())
    {
        m_db.close();
        qDebug() << "Database: closed";
    }
}
bool DbManager::isOpen() const
{
    return m_db.isOpen();
}
bool DbManager::isUserName(const QString &username)
{
    QSqlQuery nameQuery;
    bool success = false;
    if(!username.isEmpty()){
        nameQuery.prepare("SELECT name FROM User WHERE name = (:name)");
        nameQuery.bindValue(":name", username);

        if (nameQuery.exec()){
            if (nameQuery.next())
            {
                success = true;
                qDebug() << " Query isUserName success!";
            }
        }
        else {
            qDebug() << " Fehler 22" << nameQuery.lastError();
        }
    }
     else{
            qDebug() << " Query failed";
        }
    return success;
}
bool DbManager::isPassword(const QString &password)
{
    QSqlQuery passQuery;
    bool success = false;
    if(!password.isEmpty()){
        passQuery.prepare("SELECT password FROM User WHERE password = (:password)");
        passQuery.bindValue(":password", password);
        if (passQuery.exec()) {
            if (passQuery.next())
            {
                success = true;
                qDebug() << " Query isPassword success!";
            }
        }
        else{
            qDebug() << " Fehler 24" << passQuery.lastError();
        }
    }
    else{
            qDebug() << " Query failed";
     }
    return success;
}
int DbManager::getUserID(const QString &userName)
{
    QSqlQuery passQuery;
    int userid = 0;
    if(!userName.isEmpty()){
        passQuery.prepare("SELECT id FROM User WHERE name = (:name)");
        passQuery.bindValue(":name", userName);
        if (passQuery.exec()) {
            while (passQuery.next())
                 {
                     userid = passQuery.value(0).toInt();
                     qDebug()<< " User Id gefunden:" << userid;
                     return userid;
                 }
        }
        else{
            qDebug() << " Fehler 12" << passQuery.lastError();
        }
    }
    else{
            qDebug() << " Password is empty!";
     }
    return userid;
}

//CRUD Profile
int DbManager::insertProfile(const QString &m_NameCreate, const QString &m_SurnameCreate, const QString &m_EmailCreate, const QString &m_PasswordCreate)
{
    int id =0;
    //Hash für listid erstellen und miteinfügen.

     if ((!m_NameCreate.isEmpty()) && (!m_SurnameCreate.isEmpty()) && (!m_EmailCreate.isEmpty()) && (!m_PasswordCreate.isEmpty()))
     {
         qDebug() << " If Statement erfolgreich";
         QSqlQuery queryAdd;
         queryAdd.prepare("INSERT INTO User (name, surname, email, password) VALUES (:name, :surname, :email, :password)");
         qDebug() << " Query Prepared";
         queryAdd.bindValue(":name", m_NameCreate);
         qDebug() << " Query bind m_NameCreate"<< m_NameCreate ;
         queryAdd.bindValue(":surname", m_SurnameCreate);
         qDebug() << " Query bind m_SurnameCreate" << m_SurnameCreate;
         queryAdd.bindValue(":email", m_EmailCreate);
         qDebug() << " Query bind m_EmailCreate" << m_EmailCreate;
         queryAdd.bindValue(":password", m_PasswordCreate);
         qDebug() << " Query bind m_PasswordCreate" << m_PasswordCreate;
         if(queryAdd.exec()){
                 qDebug() << " Query executed";
                 id = this->getUserID(m_NameCreate);
                 qDebug() << " Query UserID extrahiert success!";
         }
         else
         {
             qDebug() << "add Profile failed: " << queryAdd.lastError();
         }
     }
     else
     {
         qDebug() << "add Profile failed: name, surname, e-mail & password cannot be empty";
     }
     return id;
}

bool DbManager::updateProfile(const QString &m_Name, const QString &m_Surname, const QString &m_Email, const QString &m_Password, const int &m_userID){

    bool success = false;

    if ((m_userID !=0))
    {
        qDebug() << " If Statement erfolgreich";
        QSqlQuery queryAdd;
        queryAdd.prepare("UPDATE User SET name=:name, surname=:surname, email=:email, password=:password WHERE id = :id");
        qDebug() << " Query Prepared";
        queryAdd.bindValue(":name", m_Name);
        qDebug() << " Query bind m_Name" <<m_Name;
        queryAdd.bindValue(":surname", m_Surname);
        qDebug() << " Query bind m_Surname"<<m_Surname;
        queryAdd.bindValue(":email", m_Email);
        qDebug() << " Query bind m_Email"<<m_Email;
        queryAdd.bindValue(":password", m_Password);
        qDebug() << " Query bind m_Password"<<m_Password;
        queryAdd.bindValue(":id", m_userID);
        qDebug() << " Query bind m_userID" <<m_userID;
        if(queryAdd.exec()){
                qDebug() << " Query executed";
                success = true;
                qDebug() << " Query Profile updated!";
        }
        else
        {
            qDebug() << "Update Profile failed: " << queryAdd.lastError();
        }
    }
    else
    {
        qDebug() << "Update Profile failed: name or surname or e-mail or password and userID cannot be empty";
    }
    return success;

}

bool DbManager::deleteProfile(const int &m_UserID)
{

     bool success = false;

     if (m_UserID != 0)
     {
         qDebug() << " If Statement erfolgreich";
         QSqlQuery queryAdd;
         queryAdd.prepare("DELETE FROM User WHERE id = :id");
         qDebug() << " Query Prepared";
         queryAdd.bindValue(":id", m_UserID);
         if(queryAdd.exec()){
                 qDebug() << " Query Delete from User executed";
                 QSqlQuery qry;
                 qry.prepare("DELETE FROM Lists WHERE userid=:userid");
                 qry.bindValue(":userid", m_UserID);
                 if(qry.exec()){
                      qDebug() << " Query Delete All from Lists executed";
                      success = true;
                 }
                 else{
                     qDebug() << " Query Delete All from Lists failed";
                     qDebug() << qry.lastError();
                 }
                 qDebug() << " User Profile Deleted !";
         }
         else
         {
             qDebug() << "Delete Profile failed: " << queryAdd.lastError();
         }
     }
     else
     {
         qDebug() << "Delete Profile failed: userID cannot be empty";
     }
     return success;
}

Profile DbManager::getProfile(const int &m_UserID)
{
    qDebug() << " getProfile Parameter:  "<< m_UserID;
    Profile prof;
    QSqlQuery query;
    query.prepare("SELECT id, name, surname, email, password FROM User WHERE id = (:id)");
    query.bindValue(":id", m_UserID);
    qDebug() << " Querie erstellt  ";
    if(query.exec()){
        qDebug() << " Query getProfile ausgeführt:  ";
       while (query.next()) {
            prof.setUserId(query.value(0).toInt());
            qDebug() << "Profile mit id: " << prof.getUserId();
            prof.setName(query.value(1).toString());
            qDebug() << "Profile Name: " << prof.getName();
            prof.setSurname(query.value(2).toString());
            qDebug() << "Profile Surname: " << prof.getSurname();
            prof.setEmail(query.value(3).toString());
            qDebug() << "Profile E-Mail: " << prof.getEmail();
            prof.setPassword(query.value(4).toString());
            qDebug() << "Profile Password " << prof.getPassword();
        }

        return prof;
    }
    else{
        qDebug() << "Query getProfile fehlgeschlagen "<<query.lastError();
    }
}

//CRUD Entry
int DbManager::insertEntry(const QString &m_ItemName, const QString &m_NickName, const QString &m_Password, const QString &m_Domain, const int &m_userid)
{
     int id =0;


     if ((!m_ItemName.isEmpty()) && (!m_NickName.isEmpty()) && (!m_Password.isEmpty()) && (m_userid != 0) )
     {
         qDebug() << " If Statement erfolgreich";
         QSqlQuery queryAdd;
         queryAdd.prepare("INSERT INTO Lists (userid, itemname, nickname, password, domain) VALUES (:userid, :itemname, :nickname, :password, :domain)");
         qDebug() << " Query Prepared";
         queryAdd.bindValue(":userid", m_userid);
         qDebug() << " Query bind m_userid";
         queryAdd.bindValue(":itemname", m_ItemName);
         qDebug() << " Query bind m_ItemName";
         queryAdd.bindValue(":nickname", m_NickName);
         qDebug() << " Query bind m_NickName";
         queryAdd.bindValue(":password", m_Password);
         qDebug() << " Query bind m_Password";
         queryAdd.bindValue(":domain", m_Domain);
         qDebug() << " Query bind m_Domain";

         if(queryAdd.exec()){
                 qDebug() << " Query executed";
                 //funktioniert nicht da die Querie kein Select ist
                 id = queryAdd.value(0).toInt();
                 return id;
                 qDebug() << " ID aus Neuem Eintrag extrahiert";
                 qDebug() << " Query inserProfile success!";
         }
         else
         {
             qDebug() << "add Profile failed: " << queryAdd.lastError();
         }
     }
     else
     {
         qDebug() << "add Profile failed: name, surname, e-mail & password cannot be empty";
     }
     return id;

}

bool DbManager::updateEntry(const QString &m_ItemName, const QString &m_NickName, const QString &m_Password, const QString &m_Domain, const int &m_id, const int &m_userid){

     bool success = false;

     if (m_id != 0 )
     {
         qDebug() << " If Statement erfolgreich";
         QSqlQuery queryAdd;
         queryAdd.prepare("UPDATE Lists SET userid = :userid, itemname = :itemname, nickname = :nickname, password = :password, domain = :domain WHERE id = :id ");
         qDebug() << " Query Prepared";

         queryAdd.bindValue(":userid",m_userid );
         qDebug() << " Query bind m_userid"<<m_userid;

         queryAdd.bindValue(":id", m_id);
         qDebug() << " Query bind m_id"<<m_id;

         queryAdd.bindValue(":itemname", m_ItemName);
         qDebug() << " Query bind m_ItemName" << m_ItemName;

         queryAdd.bindValue(":nickname", m_NickName);
         qDebug() << " Query bind m_NickName"<<m_NickName;

         queryAdd.bindValue(":password", m_Password);
         qDebug() << " Query bind m_Password"<<m_Password;

         queryAdd.bindValue(":domain", m_Domain);
         qDebug() << " Query bind m_Domain"<< m_Domain;

         if(queryAdd.exec()){
                 qDebug() << " Query Update executed";
                 success = true;
                 qDebug() << " Query Update Entry succeed!";
         }
         else
         {
             qDebug() << "Update Entry failed: " << queryAdd.lastError();
         }
     }
     else
     {
         qDebug() << "Update Entry failed: itemname, nickname, password and id cannot be empty";
     }
     return success;
}

bool DbManager::deleteEntry(const int m_id)
{
    bool success = false;
    qDebug() << "Current Item ID in dbmanager function "<< m_id;
    if (m_id != 0)
    {
        qDebug() << " If Statement erfolgreich";
        QSqlQuery queryAdd;
        queryAdd.prepare("DELETE FROM Lists WHERE id = (:id)");
        qDebug() << " Query Prepared";
        queryAdd.bindValue(":id", m_id);

        if(queryAdd.exec()){
                qDebug() << " Query executed";
                success = true;
                qDebug() << " Password Entry deleted !";
        }
        else
        {
            qDebug() << "Delete Password Entry failed: " << queryAdd.lastError();
        }
    }
    else
    {
        qDebug() << "Delete Password Entry: m_id cannot be empty";
    }
    return success;
}

QList<Entry> DbManager::getEntrySet(const int &m_userid)
{
    qDebug() << " getEntrySet Parameter:  "<<m_userid;
    QList<Entry> entryList;
    QSqlQuery query;
    query.prepare("SELECT id, userid, itemname, nickname, password, domain FROM Lists WHERE userid = (:userid)");
    query.bindValue(":userid", m_userid);
    qDebug() << " Querie erstellt  ";
    if(query.exec()){
        qDebug() << " Query getEntrySet ausgeführt:  ";
        while (query.next()) {
            Entry e;
            e.setId(query.value(0).toInt());
            e.setUserId(query.value(1).toInt());
            e.setItemName(query.value(2).toString());
            e.setNickName(query.value(3).toString());
            e.setPassword(query.value(4).toString());
            e.setDomain(query.value(5).toString());
            entryList.append(e);
            qDebug() << "Entrie in Liste eingefügt mit id: " << query.value(0).toInt() ;
        }
    return entryList;
    }
    else{
        qDebug() << "Query fehlgeschlagen "<<query.lastError();
    }
}









/*
 *
 *
 * struct Entry{

    int id;
    QString userId;
    QString itemName;
    QString nickName;
    QString password;
    QString domain;

};


void DbManager::printAllPersons() const
{
    qDebug() << "Persons in db:";
    QSqlQuery query("SELECT * FROM people");
    int idName = query.record().indexOf("name");
    while (query.next())
    {
        QString name = query.value(idName).toString();
        qDebug() << "===" << name;
    }
}

bool DbManager::personExists(const QString& name) const
{
    bool exists = false;

    QSqlQuery checkQuery;
    checkQuery.prepare("SELECT name FROM people WHERE name = (:name)");
    checkQuery.bindValue(":name", name);

    if (checkQuery.exec())
    {
        if (checkQuery.next())
        {
            exists = true;
        }
    }
    else
    {
        qDebug() << "person exists failed: " << checkQuery.lastError();
    }

    return exists;
}

bool DbManager::removeAllPersons()
{
    bool success = false;

    QSqlQuery removeQuery;
    removeQuery.prepare("DELETE FROM people");

    if (removeQuery.exec())
    {
        success = true;
    }
    else
    {
        qDebug() << "remove all persons failed: " << removeQuery.lastError();
    }

    return success;
}
*/
