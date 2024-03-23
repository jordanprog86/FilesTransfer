#include "sender.h"

Sender::Sender(QObject *parent)
    :QObject(parent)
{
   /* connectTimer = new QTimer(this);
    connect(connectTimer, SIGNAL(timeout()), this, SLOT(connectToServer()));
    connectTimer->start(5000);*/
    // QTimer::singleShot(3000, this, SLOT(connectToServer()));
}

void Sender::setCurrentFile(QString currentFile)
{
m_currentFile = currentFile;
sendCurrentFile(m_currentFile);
}

void Sender::connectToServer()
{
    /*
connectToHost("127.0.0.1",80);
connect(this, SIGNAL(connected()),this,SLOT(connectionOk()));
connect(this, SIGNAL(error(QAbstractSocket::SocketError)), this, SLOT(errorHappened(QAbstractSocket::SocketError)));*/
}

void Sender::posted()
{

}

void Sender::sendingProgress(qint64 a, qint64 b)
{
qDebug()<<"Upload progress "<<"current:"<<a<<"max:"<<b;
emit sending(a, b);
}

void Sender::error(QNetworkReply::NetworkError)
{

}

QString Sender::currentFile()
{
    return m_currentFile;
}

void Sender::sendCurrentFile(QString filename)
{
  /* qDebug()<<filename;
   qDebug()<<filename.mid(8,filename.length());*/
   filename = filename.mid(8,filename.length());
 /*  QFile file(filename);

   if(!file.open(QFile::ReadOnly))
   {
       qDebug()<<"Error opening the file";
       return;
   }*/

   qnam = new QNetworkAccessManager;
   QFile *file = new QFile(filename);
   QFileInfo *info = new QFileInfo(*file);
   QMimeDatabase db;
   QMimeType mimeType = db.mimeTypeForFile(filename);
   qDebug()<<mimeType.name();
   QNetworkRequest request(QUrl("Http://127.0.0.1:80"));
   QHttpMultiPart *dta = new QHttpMultiPart(QHttpMultiPart::FormDataType);


     QHttpPart mPart;
     mPart.setHeader(QNetworkRequest::ContentTypeHeader, QVariant(mimeType.name()));
     mPart.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant(QString("multipart/form-data; name=\"%1\"").arg(info->fileName())));

     if(file->open(QIODevice::ReadOnly))
     {
     }

     mPart.setBodyDevice(file);
     dta->append(mPart);



   rp = qnam->put(request, dta)  ;
   connect(rp, SIGNAL(finished()), this, SLOT(posted()));
   connect(rp, SIGNAL(uploadProgress(qint64,qint64)), this, SLOT(sendingProgress(qint64,qint64)));
   connect(rp, SIGNAL(error(QNetworkReply::NetworkError)), this, SLOT(error(QNetworkReply::NetworkError)));
   //ui->console->append("<em>uploading...</em>");
 /*  QFileInfo info(filename);
   QBuffer buffer;
   if(buffer.open(QIODevice::WriteOnly))
   {
       buffer.write(file.readAll());
   }
   qDebug()<<buffer.data();
   QByteArray data;

   QDataStream stream(&data, QIODevice::WriteOnly);
   stream.setVersion(QDataStream::Qt_5_13);
   stream << info.fileName();
   stream << (qint32) buffer.data().size();
   data.append(buffer.data());
   write(data);
   disconnectFromHost();
   waitForDisconnected();*/

   /*while (!file.atEnd()) {
       QString line = file.readLine();
       write(line.toLatin1());
   }*/


}

void Sender::connectionOk()
{
 qDebug()<<"New connection ok";
 connectTimer->stop();
}

void Sender::errorHappened(QAbstractSocket::SocketError err)
{
qDebug()<<"Error occured"<<err;


}
