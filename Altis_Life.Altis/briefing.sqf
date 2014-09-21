waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["sealteamsloth","Altisrp.fr"];
// player createDiarySubject ["changelog","Changelog"];
// player createDiarySubject ["serverrules","Regles Generales"];
// player createDiarySubject ["policerules","Procedures Gendarmeries"];
// player createDiarySubject ["safezones","Zones Safe (Pas de tirs)"];
//player createDiarySubject ["civrules","Regles Civils"];
// player createDiarySubject ["illegalitems","Activites Illegales"];
//player createDiarySubject ["gangrules","Regles Gang"];
//player createDiarySubject ["terrorrules","Regles Terroristes"];
player createDiarySubject ["controls","Controles"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
/*
	player createDiaryRecord ["changelog",
		[
			"Altis Life v3.0.5",
				"
					Added: Garage functionality, you are now able to store vehicles (so long as you buy a permanent vehicle)<br/>
					Added: More boat shops near the center of the map.<br/>
					Added: More civilian littlebird skin selection.<br/>
					Added: Market to Pyrgos<br/>
					Added: General store to Athira<br/>
					Added: ATM to donator shops and Rebel outposts.<br/>
					Added: Rebel Vehicle Shops and Rebel outposts.<br/>
					Changed: Moved the gun store near Kavala a bit farther away<br/>
					Changed: Adjusted Bruce's Outback Outfits in Kavala so he isn't in a wall.<br/>
					Changed: Realigned the DMV guy in Kavala.<br/>
					Changed: Moved the cocaine field a bit farther north west.<br/>
					Changed: Some other stuff was moved around but I can't remember what.<br/>
					Changed: When cops searches vehicles with drugs they are awarded money from it.<br/>
					Changed: Adjusted the DP Mission structure to try and prevent spamming to exploit the system<br/>
					Changed: When using a item you cannot open the player menu to stop exploits and macros.<br/>
					Changed: Adjusted the donator shop to work in tiers.<br/>
					<br/>
					Notes:<br/>
					The new vehicle storing functionality is a open-beta test. If everything works out fine in the future permanent vehicles will cost more money and getting them from the garage will also cost money. There is no limit of vehicles you can have stored in your garage
					but if you are buying a vehicle just as a 'burner' vehicle then just use the Buy option, only use 'Buy Permanent' from vehicle shops if you truly want it to be stored in the database.<br/><br/>
					If you want to store your permenant vehicle (i.e you are getting off and don't want it to be destroyed or stolen) then you can take it to a garage and store it in your garage. Non-permanent vehicles cannot be stored in garages.
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Altis Life v3.0.4",
				"
					Changed: Repositioned the progress bar calculating the safezone, in short everyone should see it.<br/>
					Changed: The jail timer will now tell you when you are allowed to post bail.<br/>
					Fixed: Bail price was $any (nil).<br/>
					Fixed: Paychecks would say you earned $any but you actually earned something.<br/>
					Added: Donator Shops / Areas<br/>
					Added: Two gun stores have been added back.<br/>
					Changed: PDW at rebel shop swapped for TRG, PDW moved to Gun Store.<br/>
					Added: Heroin is back!<br/>
					Added: Few extra Rebel outposts to prevent camping and douchebags.<br/>
					Added: Ability to repair vehicle at gas pumps for a price, just look at the gas pump and you'll get the action.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Altis Life v3.0.3",
				"
					Fixed: Couldn't pick peaches from the peach field near Athira.<br/>
					Fixed: Cocaine wouldn't show when searching a player / vehicle.<br/>
					Fixed: Using the helicopter service station rapidly would send money into a negative factor.<br/>
					Fixed: When dying during a delivery mission you couldn't get a new mission.<br/>
					Fixed: Cop shops in Athira could get killed.<br/>
					Fixed: Zamak wouldn't texture properly.<br/>
					Fixed: Diamond Training / Processing license should now cost $35,000 as listed.<br/>
					Fixed: Items would disappear from trunk when you take more then you can carry.<br/>
					Fixed: Bounty system should now work again.<br/>
					Removed: Ability to store money in vehicles due to abuse of the system and ARMA's net code.<br/>
					Changed: Moved Truck shop near Pygros to a new location to get rid of spawning issues.<br/>
					Added: Oil Training / Processing license to Oil Trader.<br/>
					Added: Cop whitelist functionality introduced again.<br/>
					Added: Only one person can access the trunk at a time to avoid duping.<br/>
					Added: Reintroduced Server-side cleanup that will run every 45 minutes cleaning up abandon cars, cars with broken wheels or engines along with items dropped.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Altis Life v3.0.2",
				"
					Fixed: Cop Shop NPC's could be killed.<br/>
					Fixed: Drug dealer in NW part of map didn't work<br/>
					Fixed: Extreme FPS loss near Salt and Sand mine (Should improve overall server/client performance anywhere too).<br/>
					Fixed: Clothing Store System could be exploited for free uniforms and duped backpacks on ground.<br/>
					Fixed: DP 8 should work now.<br/>
					Fixed: Marijuana processing now works<br/>
					Fixed: Peaches field near Athira should work again<br/>
					Fixed: Bail system is now working again.<br/>
					Fixed: Truck shop near Kavala should now have an action.<br/>
					Fixed: Cops should be able to see other cops via markers again.<br/>
					Added: Truck shop near Pyrgos.<br/>
					Changed: Diamond mine marker slightly moved so you can mine easier without climbing a giant rock.<br/>
					Removed: Medkits removed from general store because CIV's can't actually use them.<br/>
				"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Altis Life v3.0.6",
				"
					Added: Permanent cars cost more money.<br/>
					Added: Cops can now tase civilians off of quad bikes.<br/>
					Added: There is now a price for getting your vehicle out of the garage<br/>
					Added: Ability to sell your vehicle in the garage for some money.<br/>
					Added: Spike strips for the cops.<br/>
					Added: Respawn timer increased to 35 seconds by default (System to be expanded later).<br/>
					Added: Surprises<br/>
					Added: Dead vehicle cleanup also checks and marks cars as dead in the database.<br/>
					Added: Limited civilian gear persistency (Uniform,backpack,glasses,hats,gps,nvgs,binocs,misc items).<br/>
					Added: Cop Item Shop for food/spikestrips<br/>
					Changed: Changed initial login authorization method to be more efficient and less prone to errors.<br/>
					Changed: Cop levels of uniforms were changed as per requested.<br/>
					Fixed: Cop boat shop spawned vehicles at grid 0000000.<br/>
					Fixed: Cop didn't receive bounties.<br/>
					Fixed: Fish market guy was floating.<br/>
					Fixed: Vehicle cleanup now marks removed vehicles as not-active if they are permanent.<br/>
					Fixed: Permanent vehicles that blew up 90% of the time didn't die in the database making them spawnable after restart.<br/>
					Fixed: Arrested state for civilians in the database now updates, don't go disconnecting when you are in jail... You won't like it..<br/>
					Fixed: Settings menu didn't refresh when turning Side chat on/off.<br/>
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Altis Life v3.0.7",
				"
					Added: Two sets of textures for the Mohawk<br/>
					Added: Federal reserve (The replacement for a bank). Cops can earn money by guarding it.<br/>
					Changed: Weight adjustments to some vehicle trunks to balance them out.<br/>
					Fixed: Fuel cans weren't able to be bought.<br/>
					Removed: Suicide vest, caused more problems then it was worth.<br/>
				"
		]
	];

	player createDiaryRecord["changelog",
		[
			"Altis Life v3.0.8",
				"
					Added: New spawn point for cops near Sofia called Highway Patrol Station<br/>
					Added: Rock mining which turns into cement. Will be used for houses later on.<br/>
					Added: Donators (tiers) get bigger paychecks. 1 = +750 2 = +1500 3 = +2000<br/>
					Added: ATM to Pyrgos Cop Shop.<br/>
					Added: Cop Item Shop to all cop HQ's.<br/>
					Changed: Moved Heroin processing off the main road.<br/>
					Changed: Increased the time before the federal reserve can be robbed to 30 minutes after a successful robbery.<br/>
					Changed: Increased the time before the federal reserve can be robbed to 10 minutes after a failed robbery.<br/>
					Fixed: When the federal reserve was robbed it would take it from the cash in your hand making people go negative.<br/>
					Fixed: When searching a person / vehicle that has unprocessed cocaine/heroin gave reward of $0<br/>
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Altis Life v3.0.9",
				"
					Added: Brought back the radar scanning.<br/>
					Added: Cops can now buy SUV's<br/>
					Added: Black market smugglers have smuggled in M2 Offroads for Rebels.<br/>
					Added: Altis Government has supplied law enforcement with HMG Hunters (Sergeants only).<br/>
					Changed: Adjusted a good portion of the economy for better payouts on distance and time.<br/>
					Changed: The rebels have been hit hard and have had to raise prices for their training program.<br/>
					Changed: Due to an acute rotor blade shortage the prices of large helicopters have been increased.
					Fixed: Players can no longer be god.<br/>
					Fixed: Exploits in the repair script.<br/>
					Fixed: The HUD would sometimes disappear.<br/>
					Fixed: Oil guy has came back from vacation.<br/>
					Fixed: The marijuana processor guy has finally figured out that he was in a wall.<br/>
					Fixed: The government has finally shipped the right clothing for sergeants.<br/>
					Fixed: Disconnecting as a civilian on death doesn't let you keep your clothes, I wouldn't go doing this as you won't be getting a map.<br/>
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Modifie par altisrp.fr",
				"
					Changed: Baisse du court du sel<br/>
					Added: Ajout de voitures banalisees pour les gendarmes et mise � jour des grades de gendarmes<br/>
					Changed: Traduction en FR par altisrp.fr<br/>
					Added: Ajout des Grenades Fumig�nes pour les Gendarmes<br/>
					Added: Ajout d'un little bird arm� pour les rebels (Sans missiles)<br/>
					Changed: Menu Police wanted. Acc�s au Pardon pour tous les Gendarmes<br/>
					Changed: Crochetage tentative r�duite � 5%<br/>
					Changed: Ajout de messages (spam) si tentative de vol<br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Definitions", 
				"
				1. Les b�timents importants sont la banque, les superettes, DAB, magasins g�n�raux, etc...<br/><br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"Exploits", 
				"
				Si vous �tes consid�r� comme utilisateur d'exploits bugs, vous ne serez pas kick�, mais bannis. Ceci est votre seul avertissement.<br/><br/>
				
				Il est interdit de :<br/><br/>

				1. Sortir de prison sans avoir purger sa peine, sans avoir pay� sa caution ou sans une �vacuation a�rienne.<br/>
				2. Se suicider ou de se d�connecter afin de sortir d'une situation d�licate.<br/>
				3. �craser des gens sans raison.<br/>
				4. Freekill (tuer une personne sans raison valable est une action GRAVE)<br/>
				5. Dupliquer du mat�riel et de l'argent, ou d'utiliser des objets provenant de hack.<br/>
				6. De ne pas respecter le code de la route.<br/>
				7. D'insulter � tout va (ex: le R�le Play racaille/insulte moisi n'est pas tol�r�).<br/><br/>
				"
		]
	];
					
	
	player createDiaryRecord ["serverrules",
		[
			"Infractions punissables de BAN", 
				"
				Il n'y aura pas d'avertissement, pas de kick, juste un BAN pour activit�s frauduleuses. Ceci est votre seul avertissement.<br/><br/>
				
				1. Tout piratage, script, flood, attaque r�seau et autres activit�s ill�gales se traduiront par un BAN permanent et pourra aboutir � l'interdiction de votre plage d'adresses IP.<br/>
				2. Exploiter les lags serveur, des bugs de Arma3 ou utiliser n'importe quelle autre faille du jeu ou du serveur sera puni d'un Ban temporaire, voir permanent. <br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Interraction avec la Gendarmerie", 
				"
				Les �l�ments de cette liste non exhaustive peuvent entrainer des sanctions sur le serveur.<br/><br/>
				1. Les civils peuvent �tre arr�t�s pour avoir fouill� dans un sac ou un v�hicule de la gendarmerie. Si vous �tes surpris � effectuer cette action constamment vous pouvez avoir un BAN sur le serveur.<br/>
				2. Les civils peuvent �tre arr�t�s pour avoir suivi les gendarmes afin de donner leur position aux autres joueurs. Si vous �tes surpris � effectuer cette action constamment vous pouvez avoir un BAN sur le serveur.<br/>
				3. Les civils ou rebelles s'amusant � tuer les gendarmes en ville ou ailleurs sans raison Role Play et valable sera consid�r� comme du FreeKill.<br/>
				4. Suivre ou harceler les gendarmes durant une longue p�riode sera consid�r� comme du troll, et ceci entrainera un BAN sur le serveur.<br/>
				5. Bloquer de fa�on active la gendarmerie peut conduire � votre arrestation. Si vous �tes surpris � effectuer cette action constamment vous pouvez avoir un BAN sur le serveur.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Bateaux", 
				"
				Les �l�ments de cette liste non exhaustive peuvent entrainer des sanctions sur le serveur.<br/><br/>
				1. Constamment pousser vers le large les b�teaux d'un port sans permission.<br/>
				2. Pousser un bateau dans l'intention de hurter ou de tuer quelqu'un. Ceci n'est en aucun cas R�le Play !<br/>
				3. Voler un Speedboat de police dans l'intention de tirer en ville ou dans un a�roport. Vue aussi comme du FreeKill.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Aviation", 
				"
				Les �l�ments de cette liste non exhaustive peuvent entrainer des sanctions sur le serveur.<br/><br/>
				1. Heurter d�lib�r�ment avec un h�licopt�re n'importe quoi (ex : Autre h�lico, v�hicules, b�timents)<br/>
				2. Voler de fa�on constante � moins de 500m ou au-dessus d'une ville. Premi�rement c'est ill�gal, et de plus, vous risquez de vous crasher dans la ville. C'est une question de bon sens.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"V�hicules", 
				"
				Les �l�ments de cette liste non exhaustive peuvent entrainer des sanctions sur le serveur.<br/><br/>
				
				1. Courir d�lib�r�ment sur la route sans faire attention � la circulation. Vous risquez de vous faire �craser. Si vous �tes surpris � effectuer cette action constamment vous pouvez avoir un BAN sur le serveur.<br/>
				2. Se lancer d�lib�r�ment vers un v�hicule pour �tre hurt� ou pour mourir sans raison R�le Play valable.<br/>
				3. Heurter d'autres v�hicules dans le but de cr�er une explosion. Ceci n'est en aucun cas R�le Play !<br/>
				4. Chercher constamment � voler des v�hicules qui ne vous appartiennent pas afin de faire rager le propri�taire du v�hicule. Ceci n'aide pas au R�le Play.<br/>
				5. Voler un v�hicule dans l'intention de le crasher ou de le jeter dans l'eau.<br/>
				6. Acheter une multitudes de v�hicules pour effectuer les actions pr�c�demment cit�s.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"R�gles de communications", 
				"
				Les �l�ments de cette liste non exhaustive peuvent entrainer des sanctions sur le serveur.<br/><br/>
				
				1. Il est interdit d'utiliser le Chat Global en vocal.<br/>
				2. Utiliser excessivement le Chat Global entrainera un BAN sur le serveur.<br/>
				3. Spamer n'importe quel channel entrainera un BAN sur le serveur.<br/>
				4. Les channels TeamSpeak sont s�par�s pour des raisons pr�cises. Les gendarmes doivent �tre dans leurs channels en tout temps.<br/>
				5. Les civils ne doivent jamais se trouver dans les channels de police hormis 911 - Secours. Un civil prit dans un chan de police afin d'�couter les conversations se verra recevoir un BAN sur le serveur de jeu et TeamSpeak.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"R�gle de combat", 
				"
				Les �l�ments de cette liste non exhaustive peuvent entrainer des sanctions sur le serveur.<br/><br/>
				
				1. Tuer n'importe qui sans raison R�le Play.<br/>
				2. D�clarer une r�bellion n'est pas une cause valable pour tuer n'importe qui, m�me les gendarmes.<br/>
				3. Gendarmes et civils/rebelles peuvent commencer une fusillade seulement si il y a des raisons li�s � un crime.<br/>
				4. Si vous n'�tes pas li� � un crime, et que vous ne souhaitez pas mourir, quittez les lieux des fusillades. Vous ne pourrez pas vous plaindre de mourir si vous trouvez que rester dans une banque en train d'�tre d�rob� par des rebelles est une bonne id�e.<br/><br/>
				Toutes ces actions seront jug�s au cas par cas par les admins.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"R�gle de respawn", 
				"
				Les �l�ments de cette liste non exhaustive peuvent entrainer des sanctions sur le serveur.<br/><br/>
				1. Si vous �tes prit sur le fait de vous suicider votre compte sera r�initialis�.<br/>
				2. Si vous mourrez, vous ne pouvez pas prendre votre revanche.<br/>
				3. Si vous �tes mourrez dans une ville, vous devez r�apparaitre dans une autre ville.<br/>
				4. Si vous vous d�connectez/reconnectez, vous serez toujours recherch� en cas de d�lits.<br/><br/>
				"
		]
	];	
	
	*/
// Seal Team Sloth Section

	player createDiaryRecord ["sealteamsloth",
		[
			"TeamSpeak",
				"
				Veuillez rejoindre le Teamspeak du serveur:<br/><br/>
				ts.altisrp.fr<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["sealteamsloth",
		[
			"Site web / Forum",
				"
				www.altisrp.fr<br/>
				Merci d'utiliser le forum pour vos demandes.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["sealteamsloth",
		[
			"Wiki",
				"
				wiki.altisrp.fr<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["sealteamsloth",
		[
			"Dons",
				"
				Les dons permettent de garder le serveur en marche, n'importe quelle somme nous aide.<br/>
				dons s�curis�s par Paypal<br/><br/>
				https://dons.altisrp.fr<br/><br/>
				"
		]
	];
		
	/*
// Police Section
	player createDiaryRecord ["policerules",
		[
			"Gendarmerie",
				"
				1. Toutes personnes rebelles ou travaillant avec les rebelles sera consid�r�s comme un criminel et sera recherch�s.<br/>
				2. Toutes personnes trouv�s portant des v�tements de rebelle, ou conduisant un v�hicule rebelle sera consid�r�s comme un rebelle.<br/>
				3. La force l�thal contre les rebelles peut-�tre utilis� si ils repr�sentent une menace direct.<br/>
				4. Le Freekill s'applique aux gendarmes comme aux rebelles.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Braquage de banque",
				"
				1. Si la banque est en train d'�tre braqu�, tous les gendarmes disponibles doivent se d�placer pour arr�ter les malfrats.<br/>
				2. En raison des m�caniques de jeu actuelles, la force letale peut-�tre utilis� pendant le braquage de banque si aucune autre alternative n'est envisageable. Arr�ter ou Tazer les malfrats doit �tre tout de m�me abord� lors du plan d'attaque.<br/>
				3. Les gendarmes devront � tout prix �vacuer les civils du batiment pendant le braquage.<br/>
				4. Tous civils emp�chant la police d'entrer dans le b�tiement pourra �tre taz� et arr�t� ou tu� si n�cessaire.<br/>
				5. L'agent de supervision peut employer un individu ou un groupe d'individus � travailler comme gardes de s�curit� � la banque.<br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Aviation",
				"
				1. Aucun h�licopt�re ne peut ce poser en ville sans l'autorisation de l'officier le plus haut grad� en ligne.<br/>
				2. L'h�liport sur les quais est un le seul espace autoris� pour garer un h�licopt�re apr�s autorisation.<br/>
				3. L'h�liport peut �tre ferm� pour un court moment si la police est en op�ration, mais ne peut rester ferm� ind�finiment.<br/>
				4. Les h�licopt�res ne doivent pas voler au dessous de 500m sauf autorisation d'un officier.<br/>
				5. Les h�licopt�res civil ne doivent pas rester en stationnaire au dessus d'une ville.<br/>
				6. Les h�licopt�res sont interdit au sol sur les routes !<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Zones ill�gales", 
				"
				1. Les zones de gang ne sont pas consid�r�s comme ill�gales. Ainsi, les gendarmes peuvent entrer sans effectuer de raid, mais ne peut pas arr�ter une personne � l'int�rieur sans raison valable!<br/>
				2. Si vous chassez quelqu'un dans une zone ill�gale, appelez de l'aide.<br/>
				3. En aucun cas un gendarme ne peut camper une zone ill�gale.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Patrouilles", 
				"
				1. Un gendarme se doit patrouiller sur les routes et en villes � la recherche de v�hicules abandonn�s ou d'activit�s criminelles sur l'�le.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Points de contr�les", 
				"
				Les gendarmes sont encourag�s � effectuer des points de contr�les � des endroits strat�giques pour aider � combattre le crime sur l'�le et promouvoir la s�curit� routi�re.<br/><br/>
				
				1. Un point de contr�le ne peut pas �tre plac� � moins de 300m d'une zone ill�gale.<br/><br/>


				Suggestion de proc�dure de points de contr�les :<br/>
				1. Demandez au conducteur dans sa voiture de se garez de fa�on s�curitaire avec le moteur coup�.<br/>
				2. Demandez au conducteur si des armes sont en leur possession.<br/>
				3. Demandez au conducteur et aux passagers de quitter le v�hicule.<br/>
				4. Demandez o� est-ce qu'ils se dirigent.<br/>
				5. Demandez si ils sont recherch�s.<br/>
				6. Si l'un d'eux est recherch�, vous pouvez le menotter et le fouiller.<br/>
				7. Si aucun d'eux n'est recherch�, vous devez les laisser passer en ayant v�rifier le permis de conduire du conducteur, � moins qu'il y est une faute probable.<br/>
				8. Apr�s une fouille ne donnant aucun r�sultat, vous pouvez leur permettre de r�int�grer leur v�hicule et de continuer leur route.<br/>
				9. En cas d'objet ill�gale sur une personne ou dans le v�hicule, la personne peut recevoir une contravension ou �tre arr�t�. La fouille de ses compagnons est de mise.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Vehicule", 
				"
				1. Les v�hicules qui semblent abandonn�s, cass�s, sans conducteur, doivent �tre mis en fourri�re.<br/>
				2. La mise en fourri�re est le travail essentiel des gendarmes, vous aiderez � garder le serveur propre et � �viter les lags.<br/>

				Les v�hicules ill�gaux appartiennent aux rebelles. Il est autoris� de les mettre hors service pour proc�der ensuite � une arrestation.<br/><br/>

				V�hicules ill�gaux:<br/>
				1. Tout v�hicule rebelle<br/>
				2. Si un civil est au contr�le d'un v�hicule de dengarmerie.<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Arrestation et Contravension",
				"
				<br/><br/>

				1. Vous devez informer le suspect du pourquoi est-il arret� avant de proceder � l�arrestion en elle m�me.<br/>
				2. Si quelqu�un est recherch� vous devez l�arreter. Ne le tuez pas sauf si la situation se retrouve dans l�un des cas du chapitre �Utilisation de la force letale�.<br/><br/>


				Mettre une contravension � un civil est consid�r� comme un avertissement pour les civil.<br/><br/>

				1. La contravension doit suivre la liste que tout gendarme doit avoir en sa possession (Cf. www.altisrp.fr - Section QG POLICE).<br/>
				2. Un refus de payer une contravension l�gitime est un motif d'arrestation.<br/>
				3. Donner � un civil une contravension ill�gitime, par exemple 100K� pour vitesse exessive n'est pas autoris� par le d�partement de la gendarmerie et peut amener � suspendre l'autorisation d'effectuer son travail � un gendarme.<br/><br/>
				"
		]
	];
		
	player createDiaryRecord ["policerules",
		[
			"Armes ill�gal avec ou sans permis de port d'armes.", 
				"
				Armes l�gale pour civil avec un permis de port d'arme:<br/>
				1. Rook<br/>
				2. PDW<br/>
				3. ACP.45<br/><br/>
				
				Armes l�gale pour vigil avec un permis de port d'arme:<br/>
				1. Vermin .45 ACP<br/>
				2. TRG21<br/>

				Toutes les autres armes (Inclus le P07 silencieux [Consid�r� comme arme de gendarme]) sont ill�gales.<br/><br/>

				1. Vous ne devez jamais avoir l�arme � la main ou que ce soit. Dans le sac ou le holster.<br/>
				2. Il n�y a qu�en cas de l�gitime d�fense que vous pouvez la sortir, dans tous les cas vous devez avoir un permis.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Utilisation de la force non-letale",
				"
				1. Le taser ne doit etre utiliser que pour immobiliser quelqu'un refusant de se soumettre.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Raid/Camp",
				"
				Un Raid est defini comme l�action de se rendre sur une zone d�activit� ill�gale seulement si un civil vous donne un tuyaux et la position de la zone.<br/><br/>

				1. Toute personne se trouvant dans une zone ill�gale � ce moment est susceptible d��tre fouill�e, si rien ne peut �tre engag� contre elle, vous devez la rel�cher.<br/>
				2. Si des substances illicites/ill�gales sont trouv�es vous devez proc�der � l�arrestation.<br/>
				3. La force l�tale est autoris�e dans un cas de coup de feu sur les agents des forces de l'ordre - voir chapitre.<br/>
				4. Apr�s inspection les officiers doivent quitter les lieux.<br/>
				5. Les zones de Raid ne doivent pas �tre camp�es trop longtemps ou �spamm�es� r�guli�rement.<br/>
				6. Si tous les officiers meurent pendant un Raid ils ne doivent pas revenir sur zone.<br/>

				Camper est le fait de rester trop longtemps sur une zone.<br/><br/>

				1. Camper les zones ill�gales avant ou apr�s un raid de mani�re abusive est interdit.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Hi�rarchie",
				"
				Le plus haut grad� commande les officiers en jeu en cas d�absence admin. Il est aussi charg� de d�noncer tout abus de gendarmes et lui-m�me suivre ses directives.<br/><br/>

				Hierarchie :<br/>
				1. Gouverneur<br/>
				2. G�n�ral<br/>
				3. Colonel<br/>
				4. Capitaine<br/>
				5. Lieutenant<br/>
				6. Gendarme<br/>
				7. Adjoint<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Utilisation de la force l�tale",
				"
				1. Utiliser la force l�tale est uniquement permis en cas de l�gitime d�fense, de protection des forces de l�ordre ou d�autres civils, si et seulement si, d�autres mani�res n�auraient pas �t�s efficace.<br/>
				2. D�charger son arme en tirant dans le vide sans �tre sous la menace ou dans un exercice de tir est interdit. <br/>
				3. Ne pas suivre une discipline stricte quant au port d�arme, vous fera radier des forces de l�ordre et parfois du serveur.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"R�gles TeamSpeak",
				"
				1. Tous les policiers doivent �tre sur le TeamSpeak dans les chan pr�vus � cet effet. �tre absent du TS en temps que policier peut vous valoir un kick.<br/>
				2. Rejoignez le TS AVANT d�apparaitre en policier, d�une mani�re g�n�rale avant m�me de rejoindre le serveur.<br/><br/>
				"
		]
	];
	
	
	
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"R�gles rebelle",
				"
				Un rebelle est quelqu�un qui a pris les armes face � un gouvernement. Ici on parle de gendarmes. Toujours est-il que d� au faible pourcentage de policiers compar� aux potentiels rebelles, ne les attaquez pas sans raison, soyez intelligent et utiliser votre bon-sens, ne prenez pas le terme rebelle trop litteralement, mais cherchez plut�t a �laborer des sc�nes RP notamment ou encore cr�er des situations in�dites et amusantes.<br/><br/>

				1. Un rebelle doit premi�rement cr�er un gang, ainsi qu�en d�clarer les intentions.<br/>
				2. La rebellion n�excuse pas le FreeKill. (Voir chapitre sur le FreeKill.)<br/>
				3. Les rebelles plus que quiconque doivent jouer RolePlay et faire autre chose qu�attaquer la r�s�rve f�d�rale, par exemple.<br/>
				4. Une raison VALABLE doit se trouver derri�re chaque attaque.<br/>
				5. L�utilisation d�explosifs si autoris�e sur un plan technique, ne doit pas vous donner le droit de tout casser. Essayez de ne pas saboter les batiments importants.<br/>
				6. Pas de placements ni d�utilisation al�atoires des explosifs, si abus, la r�gle sur le FreeKill sera appliqu�e.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Les r�gles des gangs",
				"
				1. �tre dans un gang n�est pas ill�gal. Sauf si des crimes y sont commis.<br/>
				2. Les gangs peuvent tenir et contr�ler des zones de gang. Les autres gangs peuvent les attaquer pour contr�ler � leur tour la zone.<br/>
				3. Pour d�clarer la guerre � un autre gang, le leader doit en faire l�annonce en chat global et tous les membres des deux gangs doivent en etre notifi�s. Pour une guerre totale et � plus long terme une declaration doit �tre faites sur le forum.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"V�hicules illegaux",
				"
				Toute personne poss�dant ou au volant des v�hicules suivants est expos�e aux cons�quences d�finies dans la loi sur l�interdiction de la possession des v�hicules interdits.<br/><br/>

				1. Tout vehicule Rebelle.
				2. Tout vehicule Gendarme. (Si personne non-gendarme...)
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Armes illegales",
				"
				Toute personne en possession des armes suivantes est expos�e aux cons�quences d�finies dans la loi sur le port d�arme ill�gal.<br/><br/>

				1.Toutes sauf Rook, PDW, ACP.45 pour les civils et Vermin .45 ACP, TRG21 pour vigile.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Objets Illegaux",
				"
				Les objets suivants sont illegaux :<br/><br/>
				1. Toutes substances illicites (drogues)<br/>
				2. PCP<br/><br/>
				"
		]
	];
	
// M�tiers
	player createDiaryRecord ["metiers",
		[
			"R�gles : Vigil",
				"
				En tant que vigil vous devez vous conformer � certaines r�gles ou risquez la suppression de votre licence voir tout simplement �tre banni du serveur.
				
				1. Vous �tes toujours un civil et devez ob�ir � toutes les r�gles qui s'appliquent donc aux civils.<br/>
				2. Tirer sur d'un autre joueurs est toujours consid�r� comme du freekill si vous ne faite pas de sommations verbales dans un premier temps. (voir section freekill)<br/>
				3. Vous ne devez pas attaquer une personne sans qu'il y ais eu provocation, et toujours leur donner une chance de se rendre avant d'ouvrir le feu.<br/>
				4. En tant que vigil, votre travail consiste � proteger vos clients uniquement des groupuscules rebelles et des criminels.<br/><br/>
				"	
		]
	];
	
	player createDiaryRecord ["metiers",
		[
			"R�gles : M�decin",
				"
				En tant que m�decin vous devez vous conformer � certaines r�gles ou risquez la suppression de votre licence voir tout simplement �tre banni du serveur.
				
				1. Vous �tes toujours un civil et devez ob�ir � toutes les r�gles qui s'appliquent donc aux civils.<br/>
				2. Un m�decin ne doit pas se promener avec une arme � la main.<br/>
				3. Un m�decin n'est pas un soldat.<br/>
				4. En tant que m�decin, votre travail consiste � venir au secours de la population et en priorit� aux forces de l'ordre.<br/><br/>
				"	
		]
	];
	
	player createDiaryRecord ["metiers",
		[
			"R�gles : D�panneur",
				"
				En tant que D�panneur vous devez vous conformer � certaines r�gles ou risquez la suppression de votre licence voir tout simplement �tre banni du serveur.
				
				1. Vous �tes toujours un civil et devez ob�ir � toutes les r�gles qui s'appliquent donc aux civils.<br/>
				2. Un d�panneur ne doit pas se promener avec une arme � la main.<br/>
				3. Un d�panneur n'est pas un soldat.<br/>
				4. En tant que d�panneur, votre travail consiste � venir au secours de la population et en priorit� aux forces de l'ordre.<br/><br/>
				"	
		]
	];

	*/
// Controls Section
	player createDiaryRecord ["controls",
		[
			""
				Shift + C : Assomer<br/>
				Y: Open Player Menu<br/>
				U: Lock and unlock cars<br/>
				F: Sirene (Si policier)<br/>
				T: Inventaire vehicule<br/>
				Left Shift + R: Menotter (Si policier)<br/>
				Left Shift + G: Assomer (Civil seulement, utilis� pour voler une personne)<br/>
				Left Windows: Interaction pricnipal pour diff�rente situation - Prendre item ou argent - interaction avec les v�hicules - interaction police � civil. Peut-�tre modifi� dans vos configuration personnalisable Configure->Controls->Custom->Use Action 10<br/>
				Left Shift + L: Girophares (Si policier)<br/>
				Left Shift + H: Ranger sont arme<br/>
				"
		]
	];