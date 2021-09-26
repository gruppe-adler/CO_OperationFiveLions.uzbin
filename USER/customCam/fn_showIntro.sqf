params ["_texture", ["_duration", 10], ["_scale", 3]];

private _vehicle = vehicle player;

if (!isNull (objectParent player) && {(driver _vehicle) != player}) then {
	[{
		params ["_vehicle", "_texture", "_duration", "_scale"];

		private _camera = "camera" camCreate (getPos _vehicle);

		showCinemaBorder true;

		_camera cameraEffect ["internal", "BACK"];
		_camera camCommand "inertia on";
		_camera camSetTarget vehicle player;
		_camera camSetFOV 1;
		_camera camCommit 0;

		_camera setPos (_vehicle modelToWorld [5, 50, 5]);

		[{
			params ["_camera", "_vehicle", "_texture", "_duration", "_scale"];

			private _tex = "UserTexture10m_F" createVehicleLocal [0,0,0];
			_tex setPosWorld (_vehicle modelToWorldWorld [0, 100, 10]);

			_tex setObjectMaterial [0, "USER\transpMaterials\005.rvmat"];
			_tex setObjectTexture [0, ("data\" + _texture)];
			_tex setDir (getDir _vehicle);
			_tex setObjectScale _scale;

			
			[{
				[_this, false] call grad_user_fnc_animateTexture;
			}, _tex, 0.5] call CBA_fnc_waitAndExecute;


			[{
				[_tex, true] call grad_user_fnc_animateTexture;
			}, _tex, _duration] call CBA_fnc_waitAndExecute;

			[{
				_this cameraEffect ["terminate","back"];
				camDestroy _this;
			}, _camera, _duration] call CBA_fnc_waitAndExecute;


		}, [_camera, _vehicle, _texture, _duration, _scale], 1] call CBA_fnc_waitAndExecute;
	}, [_vehicle, _texture, _duration, _scale], 1] call CBA_fnc_waitAndExecute;
};