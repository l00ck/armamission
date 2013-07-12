captureSum = 0; 					//sum of all captured Objects


fn_winningSide = 													//takes Object to capture, Name for the Marker
{
	_captureObject = _this select 0;
	_markerName = _this select 1;
	_winningSide = "";
	_captureScore = 0 ;
	
		//////// Hud Anzeige/////////
	disableSerialization;
	cutRSC ["Capture_Points", "PLAIN"];
		//////// Hud Anzeige/////////
	
	[_captureObject, _markerName, "ColorRed"]call fn_makeMarker; //Makes a marker on the Map with the color Red ant the position from the Object "_captureobject" 


	while {_captureScore != 100} do {								// this while loop is looking for the dominant team near the Position from the Capture Spot
	
		sleep 0.1;
		
	
		_units =  nearestObjects [_captureObject, ["AllVehicles"], 20];  	// looks up which units are near the object (20 meters)
	
		if (west countside _units > opfor countside _units) then {
			_winningSide = west;
			_captureScore = _captureScore +1;
		};
	
		if (west countside _units < opfor countside _units) then {
			_winningSide = opfor;
			if (_captureScore !=0) then {
				_captureScore = _captureScore -1;
			};
		};

		if  (west countside _units == opfor countside _units) then {
			_winningSide = "neutral";
		};
		
		//////// Hud Anzeige/////////
		_display = uiNamespace getVariable "Capture_Points_display"; //Get its display		
		_ctrlA = _display displayCtrl 1000; 
		_ctrlB = _display displayCtrl 1001; 
		
			if (_markerName == "CP1") then {
			_ctrlA ctrlSetText format["Object A: %1", _captureScore]; 
			};
		
			if (_markerName == "CP2") then {
			_ctrlB ctrlSetText format["Object B: %1", _captureScore];
			};
			
			if (_markerName == "CP3") then {
			_ctrlA ctrlSetText format["Object C: %1", _captureScore]; 
			};
		
			if (_markerName == "CP4") then {
			_ctrlB ctrlSetText format["Object D: %1", _captureScore];
			};
			
			if (_markerName == "CP5") then {
			_ctrlB ctrlSetText format["Object E: %1", _captureScore];
			};
			
			if (_markerName == "CP6") then {
			_ctrlB ctrlSetText format["Object D: %1", _captureScore];
			};
		
		

		//////// Hud Anzeige/////////

	};
	
	[_captureObject, _markerName, "ColorBlue"]call fn_makeMarker;
	captureSum = captureSum +1;										// adds one to the capture sum
	
	if (captureSum == 2) then {
		[CapturePoint3, "CP3", CapturePoint4, "CP4"] call fn_callCapture;
		 
		 
		"respawn_west" setMarkerPos getMarkerPos "respawn_west_2";
		"respawn_east" setMarkerPos getMarkerPos "respawn_east_2";
	};
	if (captureSum == 4) then {
		[CapturePoint5, "CP5", CapturePoint6, "CP6"] call fn_callCapture;
		
		"respawn_west" setMarkerPos getMarkerPos "respawn_west_3";
		"respawn_east" setMarkerPos getMarkerPos "respawn_east_3";
	};
};

fn_callCapture = {   // takes Captureobject and Markername.
	_capturePoint1 = _this select 0;
	_markerName1 = _this select 1;
	_capturePoint2 = _this select 2;
	_markerName2 = _this select 3;
	

	[_capturePoint1, _markerName1] spawn fn_winningSide;
	[_capturePoint2, _markerName2] spawn fn_winningSide;


};
[CapturePoint1,"CP1",CapturePoint2,"CP2"] call fn_callCapture;


fn_makeMarker = {		//takes  the object which is to capture ( needed for the coords), Markername, Color of the Marker

	_captureObject = _this select 0;
	_markerName = _this select 1;
	_color = _this select 2;
	
	_marker = createMarker [_markerName, position _captureObject];
	_marker setMarkerShape "ICON";
	_markerName setMarkerType "mil_circle";
	_markerName setMarkerColor _color;
};