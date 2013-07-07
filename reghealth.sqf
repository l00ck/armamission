while {true} do{
	while {damage player >= 0.51 && alive player } do {

		player setDamage ((  damage player) - 0.03);
		hintSilent format ["%1",damage player];
		sleep 1;
	};
};