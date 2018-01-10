_landSpawn = missionNamespace getVariable "GARAGE_LANDSPAWN";
_airSpawn = missionNamespace getVariable "GARAGE_AIRSPAWN";
_seaSpawn = missionNamespace getVariable "GARAGE_SEASPAWN";

_originalCamView = cameraView;
player switchCamera "internal";
showHud false;
_ok = createDialog "garageDialog";

_cam = "camera" camcreate position _landSpawn;
_cam cameraeffect ["internal","back"];
_cam campreparefocus [-1,-1];
_cam campreparefov 0.35;
_cam camcommitprepared 0;
showCinemaBorder false;

waitUntil{!dialog};

_cam cameraEffect ["terminate","back"];
camDestroy _cam;
player switchCamera _originalCamView;
showHud true;
hint "BLAH";