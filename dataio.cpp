#include <QFile>
#include <QVariantList>
#include <QVariant>
#include <QDebug>

#include "dataio.h"

const QString DataIO::DATA_FILE_NAME = "test.dat";

DataIO::DataIO(QObject *parent) : QObject(parent)
{

}

void DataIO::saveData(QVariantList list)
{
    QFile file(DATA_FILE_NAME);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qDebug() << "file open failed.";
        return;
    }
//    file.write(QString::number(list.count()).toUtf8() + "\n");
    for (const auto& j : list)
        file.write(j.toString().toUtf8() + "\n");
    file.close();
}

QVariantList DataIO::loadData()
{
    QVariantList r;

    QFile file(DATA_FILE_NAME);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "file open failed.";
        return r;
    }

    while (true) {
        QString j = file.readLine();
        if (j.isEmpty())
            break;
        r.append(j);
    }
    file.close();

    return r;
}
