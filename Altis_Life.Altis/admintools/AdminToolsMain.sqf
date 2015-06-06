_pathtotools = "admintools\tools\";
_pathtovehicles = "admintools\vehicles\";
_EXECscript1 = 'player execVM "'+_pathtotools+'%1"';
_EXECscript2 = 'player execVM "'+_pathtovehicles+'%1"';

/* GUID LIST
	76561197971054451 : Havena
	76561197997451635 : Raztoux
	76561197971043903 : Blitz
	76561197998367571 : Carnage
	76561198047154722 : Picpus
	76561197998925717 : Kayzze
	76561198075817952 : Erkeo
	76561197978210303 : Heli
	76561198010101889 : Youri
	76561198069512255 : Willzy
	76561198075789125 : Ricardo
	76561197962128881 : Salazar
	76561197985429466 : Doku
	76561198060551250 : Germain De Nevris
	76561197999056075 : Benjamin Durant
	76561198026019944 : Vhaan Garfe
	76561197983740568 : Gaetan Tomat
	76561197969337890 : Schulz Hersmann
	76561198007128754 : Zorinhas
	76561198004672533 : Pearce Lawford
	76561198049343521 : Oleksiy Ilya
*/

//customise these menus to fit your server
if ((getPlayerUID player) in ["76561197971054451","76561197999056075","76561198026019944","76561197983740568","76561198010101889","76561197985429466","76561197969337890","76561198007128754","76561197997451635","76561198004672533"]) then { //all admins
	if ((getPlayerUID player) in ["76561197999056075","76561198026019944","76561197983740568","76561197969337890","76561198007128754","76561198049343521"]) then { //mods
        adminmenu =
        [
			["",true],
				["Tools Menu", [2], "#USER:GMToolsMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];
	};
	if ((getPlayerUID player) in ["76561197985429466","76561197997451635"]) then { //globaux
        adminmenu =
        [
			["",true],
				["Tools Menu", [2], "#USER:ModToolsMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];
	};
	if ((getPlayerUID player) in ["76561198004672533"]) then { //gendarme spy
        adminmenu =
        [
			["",true],
				["Tools Menu", [2], "#USER:AdminToolsMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];
	};
	if ((getPlayerUID player) in ["76561197971054451","76561198010101889"]) then { // super admins
		adminmenu =
		[
			["",true],
				["Tools Menu", [2], "#USER:ToolsMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]		
		];
	};
};
//customise to fit
GMToolsMenu =
[
	["",true],
		//["God Mode", [2],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		//["Car God", [3],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		//["Spectate Player", [4],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["Teleport To Me", [5], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],
		["Teleport Me To Other", [5], "", -5, [["expression", format[_EXECscript1, "TPtoOther.sqf"]]], "1", "1"],
		//["Invisible", [5], "", -5, [["expression", format[_EXECscript1, "fufu.sqf"]]], "1", "1"],
		//["ESP", [6], "", -5, [["expression", format[_EXECscript1, "ESP.sqf"]]], "1", "1"],
		["Teleport", [7], "", -5, [["expression", format[_EXECscript1, "Tele.sqf"]]], "1", "1"],
		["Camera", [8], "", -5, [["expression", format[_EXECscript1, "camera.sqf"]]], "1", "1"],
		//["Heal", [9], "", -5, [["expression", format[_EXECscript1, "heal.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
//customise to fit
ModToolsMenu =
[
	["",true],
		//["God Mode", [2],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		//["Car God", [3],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		//["Spectate Player", [4],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["Teleport To Me", [5], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],
		["Teleport Me To Other", [5], "", -5, [["expression", format[_EXECscript1, "TPtoOther.sqf"]]], "1", "1"],
		//["Invisible", [5], "", -5, [["expression", format[_EXECscript1, "fufu.sqf"]]], "1", "1"],
		["ESP", [6], "", -5, [["expression", format[_EXECscript1, "ESP.sqf"]]], "1", "1"],
		["Teleport", [7], "", -5, [["expression", format[_EXECscript1, "Tele.sqf"]]], "1", "1"],
		["Camera", [8], "", -5, [["expression", format[_EXECscript1, "camera.sqf"]]], "1", "1"],
		//["Heal", [9], "", -5, [["expression", format[_EXECscript1, "heal.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
//customise to fit
AdminToolsMenu =
[
	["",true],
		//["God Mode", [2],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		//["Car God", [3],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		["Spectate Player", [4],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["Teleport To Me", [5], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],
		["Teleport Me To Other", [5], "", -5, [["expression", format[_EXECscript1, "TPtoOther.sqf"]]], "1", "1"],
		["Invisible", [5], "", -5, [["expression", format[_EXECscript1, "fufu.sqf"]]], "1", "1"],
		["ESP", [6], "", -5, [["expression", format[_EXECscript1, "ESP.sqf"]]], "1", "1"],
		["Teleport", [7], "", -5, [["expression", format[_EXECscript1, "Tele.sqf"]]], "1", "1"],
		["Camera", [8], "", -5, [["expression", format[_EXECscript1, "camera.sqf"]]], "1", "1"],
		//["Heal", [9], "", -5, [["expression", format[_EXECscript1, "heal.sqf"]]], "1", "1"],
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
		["Teleport Me To Other", [5], "", -5, [["expression", format[_EXECscript1, "TPtoOther.sqf"]]], "1", "1"],
		["Invisible", [5], "", -5, [["expression", format[_EXECscript1, "fufu.sqf"]]], "1", "1"],
		["ESP", [6], "", -5, [["expression", format[_EXECscript1, "ESP.sqf"]]], "1", "1"],
		["Teleport", [7], "", -5, [["expression", format[_EXECscript1, "Tele.sqf"]]], "1", "1"],
		["Camera", [8], "", -5, [["expression", format[_EXECscript1, "camera.sqf"]]], "1", "1"],
		["Heal", [9], "", -5, [["expression", format[_EXECscript1, "heal.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:adminmenu";