#include "receiver.h"

Receiver::Receiver(QObject *parent)
    :QTcpServer(parent)
{
if(listen(QHostAddress::Any, 1000))
{
    // server started
     qDebug()<<"Server started";
}
}

void Receiver::incomingConnection(qintptr handle)
{
    qDebug()<<"Incomming connection....";
    socket = new QTcpSocket(this);
    if(!socket->setSocketDescriptor(handle))
    {
        qDebug()<<"SOCKET ERROR...............";
        return;
       /* connect(socket, &QTcpSocket::connected,[=]
    {
         qDebug()<<"connection successful";
        // connection successful
    }
                );*/

    // connect(socket, &QTcpSocket::disconnected, this, &Receiver::disconnected);

    }
    else
    {
            qDebug()<<"SOCKET CONNECTED";
    }
        connect(socket, &QTcpSocket::readyRead, this, &Receiver::processIncommingData);

}

void Receiver::createOutputFile(QString filename, QByteArray data)
{
  QFile file(filename);
  if(file.open(QFile::WriteOnly|QFile::Append))
  {
      file.write(data);
      file.close();
  }
}

void Receiver::appendInOutputFile(QString filename, QByteArray data)
{
    QFile file(filename);
    if(file.open(QFile::WriteOnly|QFile::Append))
    {
        file.write(data);
        file.close();
    }
}

void Receiver::processIncommingData()
{

qint32 datasize;
/*QString filename="";

QDataStream stream(socket);
stream.setVersion( QDataStream::Qt_5_13 );
stream >> filename;
stream >> datasize;
qDebug()<<filename;
*/
QFile file("data.fsd");
if(file.open(QFile::WriteOnly|QFile::Append))
{
    file.write(socket->readAll());
    file.close();
}
/*
if(lastFilename == "")
{
// first packet
    lastFilename = filename;
    QByteArray data = socket->readAll();
    createOutputFile(filename, data);
}
else
{
    while (filename=="") {
        QByteArray data = socket->readAll();
        appendInOutputFile(filename, data);
    }
  //  lastFilename = "";
}*/
}

void Receiver::disconnected()
{

}

void Receiver::transfertError(QAbstractSocket::SocketError err)
{

}
