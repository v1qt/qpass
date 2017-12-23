#ifndef PROFILE_H
#define PROFILE_H
#include <QString>

class Profile
{

 public:
    //Konstruktor
    Profile();
    //Destruktor
    ~Profile();

    //*******************************************
    void setUserId(const int u_id);
    int getUserId();
    //*******************************************
    void setName(const QString &name);
    QString getName();
    //*******************************************
    void setSurname(const QString &surname);
    QString getSurname();
    //*******************************************
    void setEmail(const QString &email);
    QString getEmail();
    //*******************************************
    void setPassword(const QString &password);
    QString getPassword();


private:
    int userId;
    QString p_Name;
    QString p_Surname;
    QString p_email;
    QString p_password;



};
#endif // PROFILE_H
