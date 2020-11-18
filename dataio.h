#ifndef DATAIO_H
#define DATAIO_H

#include <QObject>
#include <QVariantList>

class DataIO : public QObject
{
    Q_OBJECT
public:
    explicit DataIO(QObject *parent = nullptr);
    Q_INVOKABLE void saveData(QVariantList list);
    Q_INVOKABLE QVariantList loadData();
signals:

private:
    static const QString DATA_FILE_NAME;
};

#endif // DATAIO_H
