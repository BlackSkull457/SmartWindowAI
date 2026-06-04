#include "SmartAI.h"

#include <QtMath>

SmartAI::SmartAI(QObject *parent)
    : QObject(parent)
{
    m_insideTemp = 30;
    m_outsideTemp = 26;
    m_humidity = 70;
    m_rain = 0;

    m_ventilationPriority = 80;
    m_rainSensitivity = 80;
    m_humidityThreshold = 70;

    evaluateAI();
}

double SmartAI::insideTemp() const
{
    return m_insideTemp;
}

double SmartAI::outsideTemp() const
{
    return m_outsideTemp;
}

double SmartAI::humidity() const
{
    return m_humidity;
}

int SmartAI::rain() const
{
    return m_rain;
}

double SmartAI::ventilationPriority() const
{
    return m_ventilationPriority;
}

double SmartAI::rainSensitivity() const
{
    return m_rainSensitivity;
}

double SmartAI::humidityThreshold() const
{
    return m_humidityThreshold;
}

double SmartAI::windowOpen() const
{
    return m_windowOpen;
}

QString SmartAI::decision() const
{
    return m_decision;
}

void SmartAI::setInsideTemp(double v)
{
    m_insideTemp = v;
    evaluateAI();
    emit dataChanged();
}

void SmartAI::setOutsideTemp(double v)
{
    m_outsideTemp = v;
    evaluateAI();
    emit dataChanged();
}

void SmartAI::setHumidity(double v)
{
    m_humidity = v;
    evaluateAI();
    emit dataChanged();
}

void SmartAI::setRain(int v)
{
    m_rain = v;
    evaluateAI();
    emit dataChanged();
}

void SmartAI::setVentilationPriority(double v)
{
    m_ventilationPriority = v;
    evaluateAI();
    emit dataChanged();
}

void SmartAI::setRainSensitivity(double v)
{
    m_rainSensitivity = v;
    evaluateAI();
    emit dataChanged();
}

void SmartAI::setHumidityThreshold(double v)
{
    m_humidityThreshold = v;
    evaluateAI();
    emit dataChanged();
}

void SmartAI::evaluateAI()
{
    double score = 50;

    double tempDelta =
            m_insideTemp -
            m_outsideTemp;

    score +=
            tempDelta *
            (m_ventilationPriority / 20.0);

    if(m_humidity >
       m_humidityThreshold)
    {
        score += 20;
    }

    if(m_rain > 0)
    {
        double penalty =
            (m_rain * 30) *
            (m_rainSensitivity / 100.0);

        score -= penalty;
    }

    score = qBound(
                0.0,
                score,
                100.0);

    m_windowOpen = score;

    if(score >= 80)
    {
        m_decision =
                "Strong Ventilation";
    }
    else if(score >= 50)
    {
        m_decision =
                "Moderate Ventilation";
    }
    else if(score >= 20)
    {
        m_decision =
                "Slight Ventilation";
    }
    else
    {
        m_decision =
                "Keep Closed";
    }
}