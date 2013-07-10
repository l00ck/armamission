////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by loock, v1.062, #Fiqeva)
////////////////////////////////////////////////////////


class Capture_Points {

	idd = -1;
	movingEnable =  0;
    enableSimulation = 1;
    enableDisplay = 1;
	duration = 1e+1000; //Time in seconds the resource will stay visible for. 1e+1000 = 1 * 10^1000 = never disappear
	fadeIn = 0; //Length of the fade-in effect (smooth transition from transparent to opaque upon creation) in seconds. 0 = no fade-in, display immediately.
	fadeOut = 0; //Length of the fade-out effect (smooth transition from opaque to transparent once duration elapses) in seconds. 0 = no fade-out, just hide immediately.
	name = "Capture_Points"; //Name of the resource. This is irrelevant for resources defined in the mission.
	onLoad = "uiNamespace setVariable ['Capture_Points_display', _this select 0];"; //A command executed upon the resource's creation. In this case we store this resource's "display" in a variable for later use via a script (such as to change the text of a RscText or read the value from RscEdit, etc.), but more on that later. If you don't plan on doing that, you can leave out this line.

	class Controls {


		class Capture_Obj1: RscText{
			idc = 1000;
			text = "Objective A:"; //--- ToDo: Localize;
			x = 0.881562 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class Capture_Obj2: RscText{
			idc = 1001;
			text = "Objective B:"; //--- ToDo: Localize;
			x = 0.881562 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
