#ifndef USERCTRL_H
#define USERCTRL_H

#include <QDebug>
#include <QObject>
#include <QQuickView>
#include <QtQuick>
#include <QImage>
#include <QUrl>

class UserCTRL : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int UserID READ getUserID WRITE setUserID NOTIFY useridChanged)
    Q_PROPERTY(QString Name READ getName WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString Surname READ getSurname WRITE setSurname NOTIFY surnameChanged)
    Q_PROPERTY(QString Email READ getEmail WRITE setEmail NOTIFY emailChanged)
    Q_PROPERTY(QString Password READ getPassword WRITE setPassword NOTIFY passwordChanged)
    Q_PROPERTY(QString ImageUrl READ getImageUrl WRITE setImageUrl NOTIFY imageUrlChanged)
    //Q_PROPERTY(QString userId READ getUserId WRITE setUserId NOTIFY userIdChanged)


public:
    explicit UserCTRL(QObject *parent=nullptr);

    int getUserID();
    void setUserID(const int &uid);

    QString getName();
    void setName(const QString &name);

    QString getSurname();
    void setSurname(const QString &surname);

    QString getEmail();
    void setEmail(const QString &email);

    QString getPassword();
    void setPassword(const QString &password);

    QString getImageUrl();
    void setImageUrl(const QString &imageUrlString);

   // QString getUserID();
    //void setUserID(const QString &userID);
    bool loadQImage();


signals:
    void useridChanged();
    void nameChanged();
    void surnameChanged();
    void emailChanged();
    void passwordChanged();
    void imageUrlChanged();


public slots:

    bool createProfile();
    bool updateProfile();
    bool deleteProfile();
    bool getProfile();
    int getUserID(const QString &userName);

private:
        QString m_imageUrl;
        QString m_Name;
        QString m_Surname;
        QString m_Email;
        QString m_Password;
        int m_userID;
};

#endif // USERCTRL_H
