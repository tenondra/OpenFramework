//=====================================================================================
// TFRF Cold Start - Init
// Credits: Brebera
// Dokumentace: https://www.github.com/tenondra/TFRFramework/wiki
//=====================================================================================

//Jestli neexistuje "coldstart" var, vytvořit ji - nastavit true
if (isNil "coldstart") then {
	missionNamespace setVariable ["coldstart", true];
};

//Pokud coldstart = true
if (coldstart) then
{
	// Server se postará o loop a notifikace
	if (isServer) then {
		[] execVM "tfrf\coldstart\coldStartLoop.sqf";
	};
  "COLD START" remoteExec ["hint"];

	// Povolit nesmrtelnost pro hráče
	if (!isDedicated) then {
		[true] call tfrf_fnc_safety;
	};
};
