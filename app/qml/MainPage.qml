import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtWorldSummit 1.5
import ui 1.5 as UI
import "."

FocusScope {
    Header {
        id: _header

        z: 2

        Image {
            id: _imageLogo

            anchors {
                left: parent.left; leftMargin: UI.Theme.dp(20)
                verticalCenter: parent.verticalCenter
            }

            width: UI.Theme.dp(156)

            fillMode: Image.PreserveAspectFit
            smooth: true
            source: "qrc:/images/logo-qws.png"
        }
    }

    Schedule {
        id: schedule

        clip: true
    }

    ScrollView {
        id: map

        flickableItem.focus: true
        flickableItem.interactive: true

        Rectangle {
            anchors.fill: parent
        }

        Flickable {
            id: _Flickable

            anchors.fill: parent

            contentHeight: image.height
            contentWidth: image.width

            Image {
                id: image

                source: "qrc:/images/floorplan-bcc.png"
                smooth: true
                fillMode: Image.PreserveAspectFit
                height: map.height * 1.5
                width: map.width * 1.5
            }
        }
    }

    Information {
        id: information
    }

    StackView {
        id: stackView

        property string currentView: "schedule"

        anchors {
            left: parent.left
            right: parent.right
            top: _header.bottom
            bottom: rowTabs.top
        }

        initialItem: schedule
    }

    RowLayout {
        id: rowTabs

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        height: UI.Theme.tabHeight
        spacing: 0

        Button {
            Layout.fillWidth: true
            Layout.fillHeight: true

            checkable: true
            checked: true
            exclusiveGroup: group

            style: TabButtonStyle {
                imageSource: "qrc:/images/home" + (control.checked ? "_active" : "") + ".svg"
            }

            onClicked: {
                if (stackView.currentView !== "schedule") {
                    stackView.currentView = "schedule"
                    stackView.replace({item: schedule, destroyOnPop: false, replace: true})
                }
            }
        }

        Button {
            Layout.fillWidth: true
            Layout.fillHeight: true

            checkable: true
            exclusiveGroup: group

            style: TabButtonStyle {
                imageSource: "qrc:/images/location" + (control.checked ? "_active" : "") + ".svg"
            }

            onClicked: {
                if (stackView.currentView !== "map") {
                    stackView.currentView = "map"
                    stackView.push({item: map, destroyOnPop: false, replace: true})
                }
            }
        }

        Button {
            Layout.fillWidth: true
            Layout.fillHeight: true

            checkable: true
            exclusiveGroup: group

            style: TabButtonStyle {
                imageSource: "qrc:/images/info" + (control.checked ? "_active" : "") + ".svg"
            }

            onClicked: {
                if (stackView.currentView !== "information") {
                    stackView.currentView = "information"
                    stackView.push({item: information, destroyOnPop: false, replace: true})
                }
            }
        }
    }

    ExclusiveGroup {
        id: group
    }

    UI.TrackDetailSheet {
        id: _trackDetailSheet
        z: 3
    }
}
