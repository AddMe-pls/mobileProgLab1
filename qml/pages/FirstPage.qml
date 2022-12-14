import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column
            property int count: 0
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Clicker!")
            }
            Label {
                id: counter
                anchors.horizontalCenter: parent.horizontalCenter
                color: "green"
                text: column.count
            }

            Button {
                id: button
                text: "Add"
                highlightBackgroundColor: "red"
                highlightColor: "blue"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: column.count += 1
            }
        }
    }
}
