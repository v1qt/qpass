#ifndef ENTRYMAP_H
#define ENTRYMAP_H
#include <QDebug>
#include <QObject>
#include <QQuickView>
#include <QtQuick>
#include <QString>

class EntryMap: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString userName READ getUserName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString password READ getPassword WRITE setPassword NOTIFY passwortChanged)


public:
    explicit EntryMap(QObject *parent=nullptr);
    //Getter und Setter der Properties



signals:
    void userNameChanged();
    void passwortChanged();

public slots:



private:

    QList key;
    QString value;
    QMap<int, QString> map;
    QMapIterator<int,QString> iter;
};

#endif // ENTRYMAP_H
