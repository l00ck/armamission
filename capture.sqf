fn_winningSide = //takes Object to capture, Name for the Marker
{
	_captureObject = _this select 0;
	_markerName = _this select 1;
	_winningSide = "";
	_captureScore = 0 ;
	
	[_captureObject, _markerName, "ColorRed"]call fn_makeMarker;

	while {_captureScore != 100} do {
	
		sleep 0.3;
		_units =  nearestObjects [_captureObject, ["Man"], 20];
	
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
	_captured = true;
	_captured;
};
[CapturePoint1, "CP1"] spawn fn_winningSide;




fn_makeMarker = {		//takes Object to capture, Markername, Color of the Marker

	_captureObject = _this select 0;
	_markerName = _this select 1;
	_color = _this select 2;

	_marker1 = createMarker [_markerName, position _captureObject];
	_marker1 setMarkerShape "ICON";
	_markerName setMarkerType "mil_circle";
	_markerName setMarkerColor _color;
};