// by commy2

terminate (missionNamespace getVariable ["AGM_waitForAnimationHandle", scriptNull]);

AGM_waitForAnimationHandle = _this spawn {
	waitUntil {!([_this select 0] call AGM_Core_fnc_inTransitionAnim)};

	_this call AGM_Core_fnc_doAnimation;
};
