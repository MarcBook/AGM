// by commy2

_wall = _this select 0;

if (local _wall) then {
	_paper = "UserTexture_1x2_F" createVehicle position _wall;

	_paper attachTo [_wall, [0,-0.02,0.6]];
	_paper setDir getDir _wall;

	_paper setObjectTextureGlobal [0, "\AGM_Ballistics\textures\target_ca.paa"];
};
