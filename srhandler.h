#ifndef SRHANDLER_H
#define SRHANDLER_H

#include <QObject>
#include "sender.h"
#include "receiver.h"

class SRHandler : public QObject
{
    Q_OBJECT
public:
    explicit SRHandler(QObject *parent = nullptr);

signals:

public slots:
     void setMode(int mode);
     void setCurrentFile(QString filepath);
     QString currentFile();
     int uploadV();
     int uploadMV();

private slots:
     void updateProgress(qint64 a, qint64 b);
private:
    Sender *filesSender;
    QString m_currentFile="";
    int current, max=0;
    Receiver *filesReceiver;
    int currentMode = -1;
    enum modes
    {
        SEND,
        RECEIVE
    };
};

#endif // SRHANDLER_H
