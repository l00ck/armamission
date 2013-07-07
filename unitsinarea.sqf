fn_UnitsCaptureArray ={
	_nearUnits = [];
	{
		_CapturePoint = _this;
		if (((position _x) distance (position _CapturePoint) < 15)) then {
_		nearUnits = _nearUnits +[_x];
		};
	}foreach allUnits;
	
	hint format ["%1",west countside _nearUnits];
	_nearUnits;
};
CapturePoint1 call FNC_UnitsCaptureArray;

