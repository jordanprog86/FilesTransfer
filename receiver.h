#ifndef RECEIVER_H
#define RECEIVER_H

#include <QObject>
#include <QtNetwork>
#include <QtCore>

class Receiver:public QTcpServer
{
      Q_OBJECT
public:
    Receiver(QObject*parent=nullptr);
protected:
    void incomingConnection(qintptr handle);
private:
    QTcpSocket *socket;
    QString lastFilename="";
    void createOutputFile(QString filename, QByteArray data);
    void appendInOutputFile(QString filename, QByteArray data);
private slots:
    void processIncommingData();
    void disconnected();
    void transfertError(QAbstractSocket::SocketError err);
};

#endif // RECEIVER_H
