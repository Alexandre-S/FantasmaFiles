/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/

private["_action","_action2"];

life_firstSpawn = false;

_action = [
	"Vous êtes ici sur un serveur entièrement RôlePlay (RP) ce qui signifie que nous inventons un passé, une histoire et des traits de caractères propres à nos personnages afin de les transposer dans le jeu et atteindre un réalisme encore plus immersif.<br/>
	Sur Fantasma vous devez donc incarner votre personnage, non pas comme s'il s'agissait d'un jeu vidéo, mais tout simplement vous comporter comme s'il s'agissait ""de la vraie vie"". Il est donc inconcevable, par exemple, de prendre des risques démesurés et de ne pas craindre la mort en jeu.<br/><br/>

	Ne jamais commettre de ""tir à vue"".<br/><br/>

	Par ""tir à vue"" on entend ""tirer sur une personne sans raison"". En d'autre terme cela signifie tirer sur un autre joueur sans provocation ou interaction préalable. Rappelez-vous, Fantasma est un jeu de rôle avant tout, pas uniquement un FPS. Vous devez avoir établi une interaction avec une personne, ou être directement menacé, avant d'ouvrir le feu.",
	"Bienvenue sur Altis Life Fantasma - Serveur RôlePlay 1/2",
	"Suite",
	"Non"
] call BIS_fnc_guiMessage;


if(!_action) then {
	player enableSimulation false;
	["ServerRP",false,true] call BIS_fnc_endMission;
	sleep 35;
};

_action2 = [
	"Par exemple si une personne tente de vous piller, ""Mettez les mains sur la tête ou vous allez mourir."" vous avez alors plusieurs choix qui s'offre à vous, soit coopérer pour garder la vie sauve, soit vous enfuir au risque de vous faire abattre si vous ne courrez pas assez vite ou que vous ne tirez pas le premier.<br/>
	Il existe une exception à cette règle pour les zones illégales, les lieux marqués sur votre carte par des marqueurs rouges sont considérés comme des zones illégales. la règle de ""tir à vue"" ne s'applique pas dans ces zones qui sont par définitions dangereuses!",
	"Bienvenue sur Altis Life Fantasma - Serveur RôlePlay 2/2",
	"OK",
	"Non"
] call BIS_fnc_guiMessage;


if(!_action2) then {
	player enableSimulation false;
	["ServerRP",false,true] call BIS_fnc_endMission;
	sleep 35;
};
/*
format["Bienvenue sur Fantasma %1, Le serveur Jeu de Rôle Altis Life Francophone!",profileName] hintC
[
	"Bienvenue sur Fantasma! Le serveur de Jeu de Rôle sur Altis Life!",
	"Le serveur est interdit aux moins de 18ans - Les trolls ne sont pas les bienvenus - Freekill interdit - Respectez les autres joueurs - Pas d'insultes - Jouez de manière Rôle-Play - 
	Merci de lire les règles sur le forum [www.altisrp.fr]. Faites des sommations, restez dans un contexte de Jeu de Rôle.",
	"Actuellement, pour interagir avec votre environnement, vous devrez utiliser la touche [Windows Gauche] à la place de la roulette de la souris.",
	"Dans un premier temps, essayez de rencontrer les gens qui vous entourent, de discuter avec eux et de connaitre l'environnement qui vous entoure. Écouter est un bon atout au début pour éviter les zones dangeureuse et trouver les zones paisibles. 
	Essayez toujours de vous entourer de personne dans vos périples. Les routes sont dangeureuses, et l'union fait la force.",
	"Concentrez-vous sur une ressource simple au départ, comme les pommes ou les pêches par exemple, pour ensuite partir se concentrer sur des ressources plus importantes.",
	"Méfiez-vous des terroristes, ils sont imprévisibles et aller vers eux peut vous attirer beaucoup d'ennui. Si vous souhaitez rencontrer l'un d'eux, réfléchissez à un plan de secours.",
	"La Gendarmerie est là pour vous aider. Coopérez avec et vous vous en tirerez toujours bien. Ils sont puissants et bienveillants. Tachez de les respecter. Ils représentent la vraie loi sur l'île."	
];*/


