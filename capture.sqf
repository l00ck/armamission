captureSum = 0; 													//sum of all captured Objects

fn_winningSide = 													//takes Object to capture, Name for the Marker
{
	_captureObject = _this select 0;
	_markerName = _this select 1;
	_winningSide = "";
	_captureScore = 0 ;
	
	
	[_captureObject, _markerName, "ColorRed"]call fn_makeMarker;  	//Makes a marker on the Map with the color Red ant the position from the Object "_captureobject" 

	while {_captureScore != 100} do {								// this while loop is looking for the dominant team near the Position from the Capture Spot
	
		sleep 0.1;
		_units =  nearestObjects [_captureObject, ["Man"], 20];  	// looks up which units are near the object (20 meters)
	
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
		
		hintSilent format["Dominant:%1 Punktestand: %2", _winningSide, _captureScore]; 
	};
	
	[_captureObject, _markerName, "ColorBlue"]call fn_makeMarker;
	captureSum = captureSum +1;										// adds one to the capture sum
	
	if (captureSum == 2) then {
		[CapturePoint3, "CP3", CapturePoint4, "CP4"] call fn_callCapture;
	};
	if (captureSum == 4) then {
		[CapturePoint5, "CP5", CapturePoint6, "CP6"] call fn_callCapture;
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

	_marker1 = createMarker [_markerName, position _captureObject];
	_marker1 setMarkerShape "ICON";
	_markerName setMarkerType "mil_circle";
	_markerName setMarkerColor _color;
};

