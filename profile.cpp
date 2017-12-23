#include <QString>
#include <profile.h>


Profile::Profile()
{

}

Profile::~Profile()
{

}
//*******************************************
void Profile::setUserId(const int u_id)
{
    this->userId = u_id;
}
int Profile::getUserId()
{
    return userId;
}
//*******************************************
void Profile::setName(const QString &name)
{
    this->p_Name = name;
}
QString Profile::getName()
{
    return p_Name;
}
//*******************************************
void Profile::setSurname(const QString &surname)
{
    this->p_Surname = surname;
}
QString Profile::getSurname()
{
    return p_Surname;
}
//*******************************************
void Profile::setEmail(const QString &email)
{
    this->p_email = email;
}
QString Profile::getEmail()
{
    return p_email;
}
//*******************************************
void Profile::setPassword(const QString &password)
{
    this->p_password = password;
}
QString Profile::getPassword()
{
    return p_password;
}
//*******************************************
