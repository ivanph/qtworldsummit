import QtQuick 2.5
import QtQuick.Controls 1.3
import "qrc:/qml/qml/ui" 1.5 as UI

Rectangle {
    id: root

    signal skipTutorial

    Label {
        id: labelTitle

        anchors {
            top: parent.top; topMargin: UI.Theme.tutorialTitleMargins
            left: parent.left; leftMargin: UI.Theme.tutorialTitleMargins
            right: parent.right; rightMargin: UI.Theme.tutorialTitleMargins
        }

        font {
            pixelSize: UI.Theme.tutorialTitleFontSize
            weight: Font.Light
        }

        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.85
        text: qsTr("Welcome to Qt DevDays '15")
    }

    ListView {
        id: listViewTutorial

        anchors {
            top: labelTitle.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        clip: true
        orientation: ListView.Horizontal

        snapMode: ListView.SnapToItem

        highlightRangeMode: ListView.StrictlyEnforceRange

        model: ListModel {
            ListElement { description: "This schedule view allows you to quickly glance at all available sessions.\nSwipe left and right to navigate between days." }
            ListElement { description: "This schedule view allows you to quickly glance at all available sessions.\nSwipe left and right to navigate between days." }
            ListElement { description: "This schedule view allows you to quickly glance at all available sessions.\nSwipe left and right to navigate between days." }
            ListElement { description: "This schedule view allows you to quickly glance at all available sessions.\nSwipe left and right to navigate between days." }
        }

        delegate: Item {
            width: ListView.view.width
            height: ListView.view.height

            Label {
                anchors {
                    left: parent.left
                    right: parent.right
                    top: parent.top

                    margins: UI.Theme.tutorialContentMargin
                }

                font.pixelSize: UI.Theme.fontSizeSmall
                text: model.description
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        color: "#eef3f3f3"

        height: 50

        PaginationDots {
            id: paginationDots

            anchors.horizontalCenter: parent.horizontalCenter

            view: listViewTutorial
        }

        Button {
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            text: "Skip"

            onClicked: root.skipTutorial()
        }
    }
}