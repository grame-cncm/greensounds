import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Rectangle {
	id: main

    function toggle() {
        if (main.state == "user")
            main.state = "ctrl";
        else
            main.state = "user";
    }
    
    property bool mobile: (Qt.platform.os == "android" || Qt.platform.os == "ios")
    

	width:  mobile ? Screen.desktopAvailableWidth : 420;
	height: mobile ? Screen.desktopAvailableHeight : 600;

	SensorUI {
		id: page1
		width: parent.width
		height: parent.height
	}
	User {
		id: page2
		anchors.top: page1.top
		anchors.left: page1.right
		width: parent.width
		height: parent.height
	}

    states: [
        State {
            name: "user"
            PropertyChanges { target: page1; x: -main.width }
        },
        State {
            name: "ctrl"
            PropertyChanges { target: page1; x: 0 }
        }
    ]

	transitions: Transition {
		PropertyAnimation { property: "x"; duration: 500; easing.type: Easing.OutQuad }
	}
}