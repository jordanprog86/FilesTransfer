#include "srhandler.h"

SRHandler::SRHandler(QObject *parent) : QObject(parent)
{

}

void SRHandler::setMode(int mode)
{
    if(mode == 0)
    {
        currentMode = RECEIVE;
        filesReceiver = new Receiver(this);
    }
    else
    {
        currentMode = SEND;
        filesSender = new Sender(this);
        connect(filesSender, SIGNAL(sending(qint64, qint64)), this, SLOT(updateProgess(qint64, qint64)));
        //filesSender->connectToServer();
    }
}

void SRHandler::setCurrentFile(QString filepath)
{
    m_currentFile = filepath;
    filesSender->setCurrentFile(filepath);
}

QString SRHandler::currentFile()
{
    return QFileInfo(m_currentFile).fileName();
}

int SRHandler::uploadV()
{
    return current;
}

int SRHandler::uploadMV()
{
    return max;
}

void SRHandler::updateProgress(qint64 a, qint64 b)
{
    qDebug()<<"Handler Upload progress "<<"current:"<<a<<"max:"<<b;

    current = a;
    max=b;
}
