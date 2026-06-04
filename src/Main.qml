import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window

    visible: true
    width: 1000
    height: 700

    minimumWidth: 500
    minimumHeight: 600

    title: "Smart Window AI"

    Material.theme: Material.Dark
    Material.accent: Material.Teal

    property bool mobile: width < 800

    ScrollView {
        anchors.fill: parent

        ColumnLayout {
            width: parent.width
            spacing: 20

            Label {
                text: "SMART WINDOW AI"
                font.bold: true
                font.pixelSize: Math.max(18, window.width * 0.025)

                Layout.alignment: Qt.AlignHCenter
            }

            GridLayout {
                Layout.fillWidth: true

                columns: mobile ? 1 : 2

                columnSpacing: 20
                rowSpacing: 20

                Frame {
                    Layout.fillWidth: true

                    background: Rectangle {
                        radius: 16
                        color: "#1E1E1E"
                    }

                    ColumnLayout {
                        anchors.fill: parent

                        Label {
                            text: "Sensor Data"
                            font.bold: true
                        }

                        Label {
                            text: "Inside Temp: "
                                  + smartAI.insideTemp.toFixed(1)
                                  + " °C"
                        }

                        Slider {
                            Layout.fillWidth: true

                            from: 0
                            to: 50

                            value: smartAI.insideTemp

                            onMoved:
                                smartAI.insideTemp = value
                        }

                        Label {
                            text: "Outside Temp: "
                                  + smartAI.outsideTemp.toFixed(1)
                                  + " °C"
                        }

                        Slider {
                            Layout.fillWidth: true

                            from: 0
                            to: 50

                            value: smartAI.outsideTemp

                            onMoved:
                                smartAI.outsideTemp = value
                        }

                        Label {
                            text: "Humidity: "
                                  + smartAI.humidity.toFixed(0)
                                  + "%"
                        }

                        Slider {
                            Layout.fillWidth: true

                            from: 0
                            to: 100

                            value: smartAI.humidity

                            onMoved:
                                smartAI.humidity = value
                        }

                        ComboBox {
                            Layout.fillWidth: true

                            model: [
                                "Clear",
                                "Drizzle",
                                "Heavy Rain"
                            ]

                            onCurrentIndexChanged:
                                smartAI.rain = currentIndex
                        }
                    }
                }

                Frame {
                    Layout.fillWidth: true

                    background: Rectangle {
                        radius: 16
                        color: "#1E1E1E"
                    }

                    ColumnLayout {
                        anchors.fill: parent

                        Label {
                            text: "AI Parameters"
                            font.bold: true
                        }

                        Label {
                            text:
                            "Ventilation Priority: "
                            + smartAI.ventilationPriority.toFixed(0)
                        }

                        Slider {
                            Layout.fillWidth: true

                            from: 0
                            to: 100

                            value: smartAI.ventilationPriority

                            onMoved:
                                smartAI.ventilationPriority = value
                        }

                        Label {
                            text:
                            "Rain Sensitivity: "
                            + smartAI.rainSensitivity.toFixed(0)
                        }

                        Slider {
                            Layout.fillWidth: true

                            from: 0
                            to: 100

                            value: smartAI.rainSensitivity

                            onMoved:
                                smartAI.rainSensitivity = value
                        }

                        Label {
                            text:
                            "Humidity Threshold: "
                            + smartAI.humidityThreshold.toFixed(0)
                        }

                        Slider {
                            Layout.fillWidth: true

                            from: 0
                            to: 100

                            value: smartAI.humidityThreshold

                            onMoved:
                                smartAI.humidityThreshold = value
                        }
                    }
                }
            }

            Frame {
                Layout.fillWidth: true

                background: Rectangle {
                    radius: 16
                    color: "#1E1E1E"
                }

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 12

                    Label {
                        text: "Window Opening"
                        font.bold: true
                    }

                    ProgressBar {
                        Layout.fillWidth: true

                        value:
                            smartAI.windowOpen / 100.0
                    }

                    Label {
                        text:
                            smartAI.windowOpen.toFixed(0)
                            + "%"
                    }
                }
            }

            Frame {
                Layout.fillWidth: true

                background: Rectangle {
                    radius: 16
                    color: "#1E1E1E"
                }

                ColumnLayout {
                    anchors.fill: parent

                    Label {
                        text: "AI Decision"
                        font.bold: true
                    }

                    Label {
                        text: smartAI.decision

                        color: "#00FFAA"

                        font.pixelSize: 18
                    }
                }
            }
        }
    }
}