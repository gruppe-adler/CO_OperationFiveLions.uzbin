params ["_obj", "_invert"];

private _from = 5;
private _to = 100;

if (_invert) then {
	_from = 100;
	_to = 5;
};

private _return = "";

for "_i" from 5 to 100 step 5 do{

	switch (true) do {
		case (_i < 10) : {
			_return = "00" + str _i + ".rvmat";
		};
		case (_i < 100) : {
			_return = "0" + str _i + ".rvmat";
		};
		case (_i >= 100) : {
			_return = str _i + ".rvmat";
		};
	};

	[{
		params ["_obj", "_rvmat"];

		_obj setObjectMaterial [0, ("USER\transpMaterials\" + _rvmat)];
	}, [_obj, _return], (0.019 * (_i/5))] call CBA_fnc_waitAndExecute;
};
