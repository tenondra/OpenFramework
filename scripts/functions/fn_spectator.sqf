//=====================================================================================
// OMF Spectator script
// Credits: Brebera
// Dokumentace: https://github.com/tenondra/OpenMissionFramework/wiki
//=====================================================================================

private ["_cameraPos","_markerpos","_group","_unit","_camera","_killer1","_killer2"];

_killer1 = "";
_killer2 = "";

//Let player know, who killed him
player addEventHandler ["Killed",{
  _killer1 = (_this select 1);
  _killer2 = (_this select 2);
  hint format ["You were killed by %1 / %2", name _killer1, name _killer2];
  sleep 1;
}];

player removeAllEventHandlers "Killed";

_cameraPos = getPos player; // get position of dead player
_markerpos = getMarkerPos "specpos"; //locate marker
_group = createGroup civilian; // create civilian group
_unit = _group createUnit [ "VirtualSpectator_F", _markerpos, [], 0, "FORM"]; // create the 'spectator' unit at position of marker "specpos"
[_unit] join _group; // join the unit to the civilian group
_unit allowDamage false; // disable damage to new 'spectator' unit
_unit disableAI "ALL"; // disableAI
_unit enableSimulationGlobal false; // disable simulation
selectPlayer _unit; // switch player to the newly created 'spectator' unit

["Initialize", [player, [], true]] call BIS_fnc_EGSpectator; // initialize spectator
_camera = ["GetCamera"] call BIS_fnc_EGSpectator; // get the current camera for spectator
_cameraPos set [2,10]; // set height of camera
_camera setPosASL _cameraPos; // move the camera back to where you died.
[player, true] call TFAR_fnc_forceSpectator;

cutText ["You died. Now you can communicate with your death friends and also hear those still alive.","PLAIN",1,true];
sleep 5;
hintSilent "";

if (isClass (configFile >> "CfgPatches" >> "tfar_core" )) then {

};
if (isClass (configFile >> "CfgPatches" >> "acre2" )) then {

};
