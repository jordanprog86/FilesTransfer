#ifndef SENDER_H
#define SENDER_H

#include <QObject>
#include <QtNetwork>
#include <QtCore>

class Sender:public QObject
{
    Q_OBJECT
public:
    Sender(QObject*parent=nullptr);
    void setCurrentFile(QString currentFile);
signals:
    void sending(qint64 current, qint64 max);

private slots:
    void connectionOk();
    void errorHappened(QAbstractSocket::SocketError err);
    void connectToServer();
    void posted();
    void sendingProgress(qint64 a,qint64 b);
    void error(QNetworkReply::NetworkError);
private:
    QTimer*connectTimer;
    QString currentFile();
    QString m_currentFile="";
    QNetworkAccessManager *qnam;
    QNetworkReply *rp;
    QString url;

    void sendCurrentFile(QString filename);

};


#endif // SENDER_H
