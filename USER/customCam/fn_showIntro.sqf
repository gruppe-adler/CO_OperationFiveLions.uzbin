
private _vehicle = vehicle player;

if (!isNull (objectParent player) && {(driver _vehicle) != player}) then {
	[{
		params ["_vehicle"];

		private _camera = "camera" camCreate (getPos _vehicle);

		showCinemaBorder true;

		_camera cameraEffect ["internal", "BACK"];
		_camera camCommand "inertia on";
		_camera camSetTarget vehicle player;
		_camera camSetFOV 1;
		_camera camCommit 0;

		_camera attachTo [_vehicle, [5, -50, 5]];

		[{
			params ["_vehicle"];

			private _tex = createVehicle ["UserTexture10m_F", [0,0,0], [], 0, "NONE"];
			_tex attachTo [_vehicle, [-25, 40, 0]];

			_tex setObjectMaterial [0, "USER\transpMaterials\005.rvmat"];
			_tex setObjectTexture [0, "data\fivelions.paa"];
			
			[{
				[_this, false] call grad_user_fnc_animateTexture;
			}, _tex, 0.5] call CBA_fnc_waitAndExecute;

		}, [_camera, _vehicle], 1] call CBA_fnc_waitAndExecute;
	}, [_vehicle], 1] call CBA_fnc_waitAndExecute;
};