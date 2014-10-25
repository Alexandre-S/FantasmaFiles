_pathtotools = "admintools\tools\";
_pathtovehicles = "admintools\vehicles\";
_EXECscript1 = 'player execVM "'+_pathtotools+'%1"';
_EXECscript2 = 'player execVM "'+_pathtovehicles+'%1"';
//customise these menus to fit your server
if ((getPlayerUID player) in ["76561197971054451","76561197997451635","76561197971043903","76561197998367571","76561198047154722","76561197998925717","76561198075817952","76561197978210303","76561198010101889","76561198069512255","76561198075789125","76561197962128881","76561197985429466"]) then { //all admins
	if ((getPlayerUID player) in ["76561197971043903","76561197998925717","76561198075817952","76561197978210303","76561198069512255","76561197962128881"]) then { //mods
        adminmenu =
        [
			["",true],
				["Tools Menu", [2], "#USER:ModToolsMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
	/*if ((getPlayerUID player) in ["","","","","","","","",""]) then { //admins
        adminmenu =
        [
			["",true],
				["Tools Menu", [2], "#USER:AdminToolsMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};*/
	if ((getPlayerUID player) in ["76561197971054451","76561197997451635","76561197998367571","76561198047154722","76561198010101889","76561197985429466","76561198075789125"]) then { // super admins
		adminmenu =
		[
			["",true],
				["Tools Menu", [2], "#USER:ToolsMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]		
		];};
};
//customise to fit
ModToolsMenu =
[
	["",true],
		["God Mode", [2],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		["Car God", [3],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		//["Spectate Player", [4],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		//["Teleport To Me", [5], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],
		//["ESP", [6], "", -5, [["expression", format[_EXECscript1, "ESP.sqf"]]], "1", "1"],
		["Teleport", [7], "", -5, [["expression", format[_EXECscript1, "Tele.sqf"]]], "1", "1"],
		["Camera", [8], "", -5, [["expression", format[_EXECscript1, "camera.sqf"]]], "1", "1"],
		["Heal", [9], "", -5, [["expression", format[_EXECscript1, "heal.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
//customise to fit
AdminToolsMenu =
[
	["",true],
		["God Mode", [2],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		["Car God", [3],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		["Spectate Player", [4],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["Teleport To Me", [5], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],
		["ESP", [6], "", -5, [["expression", format[_EXECscript1, "ESP.sqf"]]], "1", "1"],
		["Teleport", [7], "", -5, [["expression", format[_EXECscript1, "Tele.sqf"]]], "1", "1"],
		["Camera", [8], "", -5, [["expression", format[_EXECscript1, "camera.sqf"]]], "1", "1"],
		["Heal", [9], "", -5, [["expression", format[_EXECscript1, "heal.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
ToolsMenu =
[
	["",true],
		["God Mode", [2],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		["Car God", [3],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		["Spectate Player", [4],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["Teleport To Me", [5], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],
		["ESP", [6], "", -5, [["expression", format[_EXECscript1, "ESP.sqf"]]], "1", "1"],
		["Teleport", [7], "", -5, [["expression", format[_EXECscript1, "Tele.sqf"]]], "1", "1"],
		["Camera", [8], "", -5, [["expression", format[_EXECscript1, "camera.sqf"]]], "1", "1"],
		["Heal", [9], "", -5, [["expression", format[_EXECscript1, "heal.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:adminmenu";