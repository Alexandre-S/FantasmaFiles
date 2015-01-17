/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
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
	"L'ONU est là pour vous aider. Coopérez avec et vous vous en tirerez toujours bien. Ils sont puissants et bienveillants. Tachez de les respecter. Ils représentent la vraie loi sur l'île."	
];

life_firstSpawn = false;
