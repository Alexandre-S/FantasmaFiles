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
					Added: Ajout de voitures banalisees pour les gendarmes et mise à jour des grades de gendarmes<br/>
					Changed: Traduction en FR par altisrp.fr<br/>
					Added: Ajout des Grenades Fumigènes pour les Gendarmes<br/>
					Added: Ajout d'un little bird armé pour les rebels (Sans missiles)<br/>
					Changed: Menu Police wanted. Accès au Pardon pour tous les Gendarmes<br/>
					Changed: Crochetage tentative réduite à 5%<br/>
					Changed: Ajout de messages (spam) si tentative de vol<br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Definitions", 
				"
				1. Les bâtiments importants sont la banque, les superettes, DAB, magasins généraux, etc...<br/><br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"Exploits", 
				"
				Si vous êtes considéré comme utilisateur d'exploits bugs, vous ne serez pas kické, mais bannis. Ceci est votre seul avertissement.<br/><br/>
				
				Il est interdit de :<br/><br/>

				1. Sortir de prison sans avoir purger sa peine, sans avoir payé sa caution ou sans une évacuation aérienne.<br/>
				2. Se suicider ou de se déconnecter afin de sortir d'une situation délicate.<br/>
				3. Écraser des gens sans raison.<br/>
				4. Freekill (tuer une personne sans raison valable est une action GRAVE)<br/>
				5. Dupliquer du matériel et de l'argent, ou d'utiliser des objets provenant de hack.<br/>
				6. De ne pas respecter le code de la route.<br/>
				7. D'insulter à tout va (ex: le Rôle Play racaille/insulte moisi n'est pas toléré).<br/><br/>
				"
		]
	];
					
	
	player createDiaryRecord ["serverrules",
		[
			"Infractions punissables de BAN", 
				"
				Il n'y aura pas d'avertissement, pas de kick, juste un BAN pour activités frauduleuses. Ceci est votre seul avertissement.<br/><br/>
				
				1. Tout piratage, script, flood, attaque réseau et autres activités illégales se traduiront par un BAN permanent et pourra aboutir à l'interdiction de votre plage d'adresses IP.<br/>
				2. Exploiter les lags serveur, des bugs de Arma3 ou utiliser n'importe quelle autre faille du jeu ou du serveur sera puni d'un Ban temporaire, voir permanent. <br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Interraction avec la Gendarmerie", 
				"
				Les éléments de cette liste non exhaustive peuvent entrainer des sanctions sur le serveur.<br/><br/>
				1. Les civils peuvent être arrêtés pour avoir fouillé dans un sac ou un véhicule de la gendarmerie. Si vous êtes surpris à effectuer cette action constamment vous pouvez avoir un BAN sur le serveur.<br/>
				2. Les civils peuvent être arrêtés pour avoir suivi les gendarmes afin de donner leur position aux autres joueurs. Si vous êtes surpris à effectuer cette action constamment vous pouvez avoir un BAN sur le serveur.<br/>
				3. Les civils ou terroristes s'amusant à tuer les gendarmes en ville ou ailleurs sans raison Role Play et valable sera considéré comme du FreeKill.<br/>
				4. Suivre ou harceler les gendarmes durant une longue période sera considéré comme du troll, et ceci entrainera un BAN sur le serveur.<br/>
				5. Bloquer de façon active la gendarmerie peut conduire à votre arrestation. Si vous êtes surpris à effectuer cette action constamment vous pouvez avoir un BAN sur le serveur.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Bateaux", 
				"
				Les éléments de cette liste non exhaustive peuvent entrainer des sanctions sur le serveur.<br/><br/>
				1. Constamment pousser vers le large les bâteaux d'un port sans permission.<br/>
				2. Pousser un bateau dans l'intention de hurter ou de tuer quelqu'un. Ceci n'est en aucun cas Rôle Play !<br/>
				3. Voler un Speedboat de police dans l'intention de tirer en ville ou dans un aéroport. Vue aussi comme du FreeKill.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Aviation", 
				"
				Les éléments de cette liste non exhaustive peuvent entrainer des sanctions sur le serveur.<br/><br/>
				1. Heurter délibérément avec un hélicoptère n'importe quoi (ex : Autre hélico, véhicules, bâtiments)<br/>
				2. Voler de façon constante à moins de 500m ou au-dessus d'une ville. Premièrement c'est illégal, et de plus, vous risquez de vous crasher dans la ville. C'est une question de bon sens.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Véhicules", 
				"
				Les éléments de cette liste non exhaustive peuvent entrainer des sanctions sur le serveur.<br/><br/>
				
				1. Courir délibérément sur la route sans faire attention à la circulation. Vous risquez de vous faire écraser. Si vous êtes surpris à effectuer cette action constamment vous pouvez avoir un BAN sur le serveur.<br/>
				2. Se lancer délibérément vers un véhicule pour être hurté ou pour mourir sans raison Rôle Play valable.<br/>
				3. Heurter d'autres véhicules dans le but de créer une explosion. Ceci n'est en aucun cas Rôle Play !<br/>
				4. Chercher constamment à voler des véhicules qui ne vous appartiennent pas afin de faire rager le propriétaire du véhicule. Ceci n'aide pas au Rôle Play.<br/>
				5. Voler un véhicule dans l'intention de le crasher ou de le jeter dans l'eau.<br/>
				6. Acheter une multitudes de véhicules pour effectuer les actions précédemment cités.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Règles de communications", 
				"
				Les éléments de cette liste non exhaustive peuvent entrainer des sanctions sur le serveur.<br/><br/>
				
				1. Il est interdit d'utiliser le Chat Global en vocal.<br/>
				2. Utiliser excessivement le Chat Global entrainera un BAN sur le serveur.<br/>
				3. Spamer n'importe quel channel entrainera un BAN sur le serveur.<br/>
				4. Les channels TeamSpeak sont séparés pour des raisons précises. Les gendarmes doivent être dans leurs channels en tout temps.<br/>
				5. Les civils ne doivent jamais se trouver dans les channels de police hormis 911 - Secours. Un civil prit dans un chan de police afin d'écouter les conversations se verra recevoir un BAN sur le serveur de jeu et TeamSpeak.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Règle de combat", 
				"
				Les éléments de cette liste non exhaustive peuvent entrainer des sanctions sur le serveur.<br/><br/>
				
				1. Tuer n'importe qui sans raison Rôle Play.<br/>
				2. Déclarer une rébellion n'est pas une cause valable pour tuer n'importe qui, même les gendarmes.<br/>
				3. Gendarmes et civils/terroristes peuvent commencer une fusillade seulement si il y a des raisons liés à un crime.<br/>
				4. Si vous n'êtes pas lié à un crime, et que vous ne souhaitez pas mourir, quittez les lieux des fusillades. Vous ne pourrez pas vous plaindre de mourir si vous trouvez que rester dans une banque en train d'être dérobé par des terroristes est une bonne idée.<br/><br/>
				Toutes ces actions seront jugés au cas par cas par les admins.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"Règle de respawn", 
				"
				Les éléments de cette liste non exhaustive peuvent entrainer des sanctions sur le serveur.<br/><br/>
				1. Si vous êtes prit sur le fait de vous suicider votre compte sera réinitialisé.<br/>
				2. Si vous mourrez, vous ne pouvez pas prendre votre revanche.<br/>
				3. Si vous êtes mourrez dans une ville, vous devez réapparaitre dans une autre ville.<br/>
				4. Si vous vous déconnectez/reconnectez, vous serez toujours recherché en cas de délits.<br/><br/>
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
				dons sécurisés par Paypal<br/><br/>
				https://dons.altisrp.fr<br/><br/>
				"
		]
	];

	player createDiaryRecord ["controls",
		[
			"Contrôles",
				"
				Shift + G: Mettre les mains derrière la tête<br/>
				Shift + H: Ranger son arme (Holster)<br/>
				Ctrl + H: Sortir son arme (Holster)<br/>
				Shift + C: Assomer (utilisé pour voler une personne)<br/>
				Y: Menu Joueur<br/>
				U: Ouvrir et fermer les véhicules, et vos maisons !<br/>
				T: Inventaire vehicule et inventaire maisons !<br/>
				Windows: Interaction principal pour différente situation - Prendre item ou argent - interaction avec les véhicules - interaction police à civil. Peut-être modifié dans vos configuration personnalisable Configure->Controls->Custom->Use Action 10<br/>
				Shift + L: Girophares (Si policier)<br/>
				Shift + F: Sirene (Si policier)<br/>
				Shift + R: Menotter (Si policier)<br/>
				"
		]
	];
		
	/*
// Police Section
	player createDiaryRecord ["policerules",
		[
			"Gendarmerie",
				"
				1. Toutes personnes terroristes ou travaillant avec les terroristes sera considérés comme un criminel et sera recherchés.<br/>
				2. Toutes personnes trouvés portant des vêtements de terroriste, ou conduisant un véhicule terroriste sera considérés comme un terroriste.<br/>
				3. La force léthal contre les terroristes peut-être utilisé si ils représentent une menace direct.<br/>
				4. Le Freekill s'applique aux gendarmes comme aux terroristes.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Braquage de banque",
				"
				1. Si la banque est en train d'être braqué, tous les gendarmes disponibles doivent se déplacer pour arrêter les malfrats.<br/>
				2. En raison des mécaniques de jeu actuelles, la force letale peut-être utilisé pendant le braquage de banque si aucune autre alternative n'est envisageable. Arrêter ou Tazer les malfrats doit être tout de même abordé lors du plan d'attaque.<br/>
				3. Les gendarmes devront à tout prix évacuer les civils du batiment pendant le braquage.<br/>
				4. Tous civils empêchant la police d'entrer dans le bâtiement pourra être tazé et arrêté ou tué si nécessaire.<br/>
				5. L'agent de supervision peut employer un individu ou un groupe d'individus à travailler comme gardes de sécurité à la banque.<br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Aviation",
				"
				1. Aucun hélicoptère ne peut ce poser en ville sans l'autorisation de l'officier le plus haut gradé en ligne.<br/>
				2. L'héliport sur les quais est un le seul espace autorisé pour garer un hélicoptère après autorisation.<br/>
				3. L'héliport peut être fermé pour un court moment si la police est en opération, mais ne peut rester fermé indéfiniment.<br/>
				4. Les hélicoptères ne doivent pas voler au dessous de 500m sauf autorisation d'un officier.<br/>
				5. Les hélicoptères civil ne doivent pas rester en stationnaire au dessus d'une ville.<br/>
				6. Les hélicoptères sont interdit au sol sur les routes !<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Zones illégales", 
				"
				1. Les zones de gang ne sont pas considérés comme illégales. Ainsi, les gendarmes peuvent entrer sans effectuer de raid, mais ne peut pas arrêter une personne à l'intérieur sans raison valable!<br/>
				2. Si vous chassez quelqu'un dans une zone illégale, appelez de l'aide.<br/>
				3. En aucun cas un gendarme ne peut camper une zone illégale.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Patrouilles", 
				"
				1. Un gendarme se doit patrouiller sur les routes et en villes à la recherche de véhicules abandonnés ou d'activités criminelles sur l'île.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Points de contrôles", 
				"
				Les gendarmes sont encouragés à effectuer des points de contrôles à des endroits stratégiques pour aider à combattre le crime sur l'île et promouvoir la sécurité routière.<br/><br/>
				
				1. Un point de contrôle ne peut pas être placé à moins de 300m d'une zone illégale.<br/><br/>


				Suggestion de procédure de points de contrôles :<br/>
				1. Demandez au conducteur dans sa voiture de se garez de façon sécuritaire avec le moteur coupé.<br/>
				2. Demandez au conducteur si des armes sont en leur possession.<br/>
				3. Demandez au conducteur et aux passagers de quitter le véhicule.<br/>
				4. Demandez où est-ce qu'ils se dirigent.<br/>
				5. Demandez si ils sont recherchés.<br/>
				6. Si l'un d'eux est recherché, vous pouvez le menotter et le fouiller.<br/>
				7. Si aucun d'eux n'est recherché, vous devez les laisser passer en ayant vérifier le permis de conduire du conducteur, à moins qu'il y est une faute probable.<br/>
				8. Après une fouille ne donnant aucun résultat, vous pouvez leur permettre de réintégrer leur véhicule et de continuer leur route.<br/>
				9. En cas d'objet illégale sur une personne ou dans le véhicule, la personne peut recevoir une contravension ou être arrêté. La fouille de ses compagnons est de mise.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Vehicule", 
				"
				1. Les véhicules qui semblent abandonnés, cassés, sans conducteur, doivent être mis en fourrière.<br/>
				2. La mise en fourrière est le travail essentiel des gendarmes, vous aiderez à garder le serveur propre et à éviter les lags.<br/>

				Les véhicules illégaux appartiennent aux terroristes. Il est autorisé de les mettre hors service pour procéder ensuite à une arrestation.<br/><br/>

				Véhicules illégaux:<br/>
				1. Tout véhicule terroriste<br/>
				2. Si un civil est au contrôle d'un véhicule de dengarmerie.<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Arrestation et Contravension",
				"
				<br/><br/>

				1. Vous devez informer le suspect du pourquoi est-il arreté avant de proceder à l’arrestion en elle même.<br/>
				2. Si quelqu’un est recherché vous devez l’arreter. Ne le tuez pas sauf si la situation se retrouve dans l’un des cas du chapitre “Utilisation de la force letale”.<br/><br/>


				Mettre une contravension à un civil est considéré comme un avertissement pour les civil.<br/><br/>

				1. La contravension doit suivre la liste que tout gendarme doit avoir en sa possession (Cf. www.altisrp.fr - Section QG POLICE).<br/>
				2. Un refus de payer une contravension légitime est un motif d'arrestation.<br/>
				3. Donner à un civil une contravension illégitime, par exemple 100K€ pour vitesse exessive n'est pas autorisé par le département de la gendarmerie et peut amener à suspendre l'autorisation d'effectuer son travail à un gendarme.<br/><br/>
				"
		]
	];
		
	player createDiaryRecord ["policerules",
		[
			"Armes illégal avec ou sans permis de port d'armes.", 
				"
				Armes légale pour civil avec un permis de port d'arme:<br/>
				1. Rook<br/>
				2. PDW<br/>
				3. ACP.45<br/><br/>
				
				Armes légale pour vigil avec un permis de port d'arme:<br/>
				1. Vermin .45 ACP<br/>
				2. TRG21<br/>

				Toutes les autres armes (Inclus le P07 silencieux [Considéré comme arme de gendarme]) sont illégales.<br/><br/>

				1. Vous ne devez jamais avoir l’arme à la main ou que ce soit. Dans le sac ou le holster.<br/>
				2. Il n’y a qu’en cas de légitime défense que vous pouvez la sortir, dans tous les cas vous devez avoir un permis.<br/><br/>
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
				Un Raid est defini comme l’action de se rendre sur une zone d’activité illégale seulement si un civil vous donne un tuyaux et la position de la zone.<br/><br/>

				1. Toute personne se trouvant dans une zone illégale à ce moment est susceptible d’être fouillée, si rien ne peut être engagé contre elle, vous devez la relâcher.<br/>
				2. Si des substances illicites/illégales sont trouvées vous devez procéder à l’arrestation.<br/>
				3. La force létale est autorisée dans un cas de coup de feu sur les agents des forces de l'ordre - voir chapitre.<br/>
				4. Après inspection les officiers doivent quitter les lieux.<br/>
				5. Les zones de Raid ne doivent pas être campées trop longtemps ou “spammées” régulièrement.<br/>
				6. Si tous les officiers meurent pendant un Raid ils ne doivent pas revenir sur zone.<br/>

				Camper est le fait de rester trop longtemps sur une zone.<br/><br/>

				1. Camper les zones illégales avant ou après un raid de manière abusive est interdit.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Hiérarchie",
				"
				Le plus haut gradé commande les officiers en jeu en cas d’absence admin. Il est aussi chargé de dénoncer tout abus de gendarmes et lui-même suivre ses directives.<br/><br/>

				Hierarchie :<br/>
				1. Gouverneur<br/>
				2. Général<br/>
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
			"Utilisation de la force létale",
				"
				1. Utiliser la force létale est uniquement permis en cas de légitime défense, de protection des forces de l’ordre ou d’autres civils, si et seulement si, d’autres manières n’auraient pas étés efficace.<br/>
				2. Décharger son arme en tirant dans le vide sans être sous la menace ou dans un exercice de tir est interdit. <br/>
				3. Ne pas suivre une discipline stricte quant au port d’arme, vous fera radier des forces de l’ordre et parfois du serveur.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Règles TeamSpeak",
				"
				1. Tous les policiers doivent être sur le TeamSpeak dans les chan prévus à cet effet. Être absent du TS en temps que policier peut vous valoir un kick.<br/>
				2. Rejoignez le TS AVANT d’apparaitre en policier, d’une manière générale avant même de rejoindre le serveur.<br/><br/>
				"
		]
	];
	
	
	
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Règles terroriste",
				"
				Un terroriste est quelqu’un qui a pris les armes face à un gouvernement. Ici on parle de gendarmes. Toujours est-il que dû au faible pourcentage de policiers comparé aux potentiels terroristes, ne les attaquez pas sans raison, soyez intelligent et utiliser votre bon-sens, ne prenez pas le terme terroriste trop litteralement, mais cherchez plutôt a élaborer des scènes RP notamment ou encore créer des situations inédites et amusantes.<br/><br/>

				1. Un terroriste doit premièrement créer un gang, ainsi qu’en déclarer les intentions.<br/>
				2. La rebellion n’excuse pas le FreeKill. (Voir chapitre sur le FreeKill.)<br/>
				3. Les terroristes plus que quiconque doivent jouer RolePlay et faire autre chose qu’attaquer la résèrve fédérale, par exemple.<br/>
				4. Une raison VALABLE doit se trouver derrière chaque attaque.<br/>
				5. L’utilisation d’explosifs si autorisée sur un plan technique, ne doit pas vous donner le droit de tout casser. Essayez de ne pas saboter les batiments importants.<br/>
				6. Pas de placements ni d’utilisation aléatoires des explosifs, si abus, la règle sur le FreeKill sera appliquée.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Les règles des gangs",
				"
				1. Être dans un gang n’est pas illégal. Sauf si des crimes y sont commis.<br/>
				2. Les gangs peuvent tenir et contrôler des zones de gang. Les autres gangs peuvent les attaquer pour contrôler à leur tour la zone.<br/>
				3. Pour déclarer la guerre à un autre gang, le leader doit en faire l’annonce en chat global et tous les membres des deux gangs doivent en etre notifiés. Pour une guerre totale et à plus long terme une declaration doit être faites sur le forum.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Véhicules illegaux",
				"
				Toute personne possédant ou au volant des véhicules suivants est exposée aux conséquences définies dans la loi sur l’interdiction de la possession des véhicules interdits.<br/><br/>

				1. Tout vehicule terroriste.
				2. Tout vehicule Gendarme. (Si personne non-gendarme...)
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Armes illegales",
				"
				Toute personne en possession des armes suivantes est exposée aux conséquences définies dans la loi sur le port d’arme illégal.<br/><br/>

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
	
// Métiers
	player createDiaryRecord ["metiers",
		[
			"Règles : Vigil",
				"
				En tant que vigil vous devez vous conformer à certaines règles ou risquez la suppression de votre licence voir tout simplement être banni du serveur.
				
				1. Vous êtes toujours un civil et devez obéir à toutes les règles qui s'appliquent donc aux civils.<br/>
				2. Tirer sur d'un autre joueurs est toujours considéré comme du freekill si vous ne faite pas de sommations verbales dans un premier temps. (voir section freekill)<br/>
				3. Vous ne devez pas attaquer une personne sans qu'il y ais eu provocation, et toujours leur donner une chance de se rendre avant d'ouvrir le feu.<br/>
				4. En tant que vigil, votre travail consiste à proteger vos clients uniquement des groupuscules terroristes et des criminels.<br/><br/>
				"	
		]
	];
	
	player createDiaryRecord ["metiers",
		[
			"Règles : Médecin",
				"
				En tant que médecin vous devez vous conformer à certaines règles ou risquez la suppression de votre licence voir tout simplement être banni du serveur.
				
				1. Vous êtes toujours un civil et devez obéir à toutes les règles qui s'appliquent donc aux civils.<br/>
				2. Un médecin ne doit pas se promener avec une arme à la main.<br/>
				3. Un médecin n'est pas un soldat.<br/>
				4. En tant que médecin, votre travail consiste à venir au secours de la population et en priorité aux forces de l'ordre.<br/><br/>
				"	
		]
	];
	
	player createDiaryRecord ["metiers",
		[
			"Règles : Dépanneur",
				"
				En tant que Dépanneur vous devez vous conformer à certaines règles ou risquez la suppression de votre licence voir tout simplement être banni du serveur.
				
				1. Vous êtes toujours un civil et devez obéir à toutes les règles qui s'appliquent donc aux civils.<br/>
				2. Un dépanneur ne doit pas se promener avec une arme à la main.<br/>
				3. Un dépanneur n'est pas un soldat.<br/>
				4. En tant que dépanneur, votre travail consiste à venir au secours de la population et en priorité aux forces de l'ordre.<br/><br/>
				"	
		]
	];
	
	*/

	