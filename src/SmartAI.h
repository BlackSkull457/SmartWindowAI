#ifndef SMARTAI_H
#define SMARTAI_H

#include <QObject>

class SmartAI : public QObject
{
    Q_OBJECT

    Q_PROPERTY(double insideTemp
               READ insideTemp
               WRITE setInsideTemp
               NOTIFY dataChanged)

    Q_PROPERTY(double outsideTemp
               READ outsideTemp
               WRITE setOutsideTemp
               NOTIFY dataChanged)

    Q_PROPERTY(double humidity
               READ humidity
               WRITE setHumidity
               NOTIFY dataChanged)

    Q_PROPERTY(int rain
               READ rain
               WRITE setRain
               NOTIFY dataChanged)

    Q_PROPERTY(double ventilationPriority
               READ ventilationPriority
               WRITE setVentilationPriority
               NOTIFY dataChanged)

    Q_PROPERTY(double rainSensitivity
               READ rainSensitivity
               WRITE setRainSensitivity
               NOTIFY dataChanged)

    Q_PROPERTY(double humidityThreshold
               READ humidityThreshold
               WRITE setHumidityThreshold
               NOTIFY dataChanged)

    Q_PROPERTY(double windowOpen
               READ windowOpen
               NOTIFY dataChanged)

    Q_PROPERTY(QString decision
               READ decision
               NOTIFY dataChanged)

public:
    explicit SmartAI(QObject *parent = nullptr);

    double insideTemp() const;
    double outsideTemp() const;
    double humidity() const;
    int rain() const;

    double ventilationPriority() const;
    double rainSensitivity() const;
    double humidityThreshold() const;

    double windowOpen() const;
    QString decision() const;

    void setInsideTemp(double v);
    void setOutsideTemp(double v);
    void setHumidity(double v);
    void setRain(int v);

    void setVentilationPriority(double v);
    void setRainSensitivity(double v);
    void setHumidityThreshold(double v);

signals:
    void dataChanged();

private:
    double m_insideTemp;
    double m_outsideTemp;
    double m_humidity;

    int m_rain;

    double m_ventilationPriority;
    double m_rainSensitivity;
    double m_humidityThreshold;

    double m_windowOpen;

    QString m_decision;

    void evaluateAI();
};

#endif