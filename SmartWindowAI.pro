QT += quick quickcontrols2 charts

CONFIG += c++17

TARGET = SmartWindowAI

OBJECTS_DIR = build/obj
MOC_DIR = build/moc
RCC_DIR = build/rcc
UI_DIR = build/ui

SOURCES += \
    /src/main.cpp \
    /src/SmartAI.cpp

HEADERS += \
    /src/SmartAI.h

RESOURCES += /src/qml.qrc
