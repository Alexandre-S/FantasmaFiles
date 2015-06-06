class CfgVehicles {

  class Module_F;
  class ACE_ModuleInteraction: Module_F {
    author = "$STR_ACE_Common_ACETeam";
    category = "ACE";
    displayName = "$STR_ACE_InteractionSystem_Module_DisplayName";
    function = "ACE_Interaction_fnc_moduleInteraction";
    scope = 2;
    isGlobal = 1;
    icon = PATHTOF(UI\Icon_Module_Interaction_ca.paa);
    class Arguments {
      class EnableTeamManagement {
        displayName = "$STR_ACE_InteractionSystem_EnableTeamManagement_DisplayName";
        description = "$STR_ACE_InteractionSystem_EnableTeamManagement_Description";
        typeName = "BOOL";
        defaultValue = 1;
      };
    };
    class ModuleDescription {
      description = "$STR_ACE_InteractionSystem_Module_Description";
    };
  };

    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ACE_Interaction_MainAction";
                distance = 4;
                condition = QUOTE(true);
                statement = "";
                icon = "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa";
                selection = "pelvis";

                /*class ACE_TeamManagement {
                    displayName = "$STR_ACE_Interaction_TeamManagement";
                    condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam) && {GVAR(EnableTeamManagement)});
                    statement = "";
                    showDisabled = 0;
                    priority = 3.2;
                    icon = PATHTOF(UI\team\team_management_ca.paa);
                    hotkey = "M";

                    class ACE_AssignTeamRed {
                        displayName = "$STR_ACE_Interaction_AssignTeamRed";
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam));
                        statement = QUOTE([ARR_2(_target,'RED')] call DFUNC(joinTeam));
                        showDisabled = 1;
                        icon = PATHTOF(UI\team\team_red_ca.paa);
                        priority = 2.4;
                        hotkey = "R";
                    };
                    class ACE_AssignTeamGreen {
                        displayName = "$STR_ACE_Interaction_AssignTeamGreen";
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam));
                        statement = QUOTE([ARR_2(_target,'GREEN')] call DFUNC(joinTeam));
                        showDisabled = 1;
                        icon = PATHTOF(UI\team\team_green_ca.paa);
                        priority = 2.3;
                        hotkey = "G";
                    };
                    class ACE_AssignTeamBlue {
                        displayName = "$STR_ACE_Interaction_AssignTeamBlue";
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam));
                        statement = QUOTE([ARR_2(_target,'BLUE')] call DFUNC(joinTeam));
                        showDisabled = 1;
                        icon = PATHTOF(UI\team\team_blue_ca.paa);
                        priority = 2.2;
                        hotkey = "B";
                    };
                    class ACE_AssignTeamYellow {
                        displayName = "$STR_ACE_Interaction_AssignTeamYellow";
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam));
                        statement = QUOTE([ARR_2(_target,'YELLOW')] call DFUNC(joinTeam));
                        showDisabled = 1;
                        icon = PATHTOF(UI\team\team_yellow_ca.paa);
                        priority = 2.1;
                        hotkey = "Y";
                    };

                    class ACE_UnassignTeam {
                        displayName = "$STR_ACE_Interaction_LeaveTeam";
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam) && {assignedTeam _target != 'MAIN'});
                        statement = QUOTE([ARR_2(_target,'MAIN')] call DFUNC(joinTeam));
                        showDisabled = 1;
                        icon = PATHTOF(UI\team\team_white_ca.paa);
                        priority = 2.5;
                        hotkey = "N";
                    };
                };

                class ACE_JoinGroup {
                    displayName = "$STR_ACE_Interaction_JoinGroup";
                    condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinGroup));
                    statement = QUOTE([_player] joinSilent group _target);
                    showDisabled = 0;
                    priority = 2.6;
                    icon = PATHTOF(UI\team\team_management_ca.paa);
                    hotkey = "J";
                };

                class ACE_GetDown {
                    displayName = "$STR_ACE_Interaction_GetDown";
                    condition = QUOTE([_target] call DFUNC(canInteractWithCivilian));
                    statement = QUOTE([_target] call DFUNC(getDown));
                    showDisabled = 0;
                    priority = 2.2;
                };
                class ACE_SendAway {
                    displayName = "$STR_ACE_Interaction_SendAway";
                    condition = QUOTE([_target] call DFUNC(canInteractWithCivilian));
                    statement = QUOTE([_target] call DFUNC(sendAway));
                    showDisabled = 0;
                    priority = 2.0;
                };
                class ACE_Pardon {
                    displayName = "$STR_ACE_Interaction_Pardon";
                    condition = QUOTE(rating _target < -2000 && {alive _target} && {side group _player == side group _target});
                    statement = QUOTE([ARR_3(_target,'{_this addRating -rating _this}',_target)] call DEFUNC(common,execRemoteFnc));
                    showDisabled = 0;
                    priority = 2.5;
                };*/
				  class ACE_Abattre {
					displayName = "Abattre";
					distance = 4;
					condition = "_target isKindOf 'Man' && {!alive _target}";
					statement = "[_target] spawn life_fnc_abattre";
					exceptions[] = {"isNotSwimming"};
					showDisabled = 0;
					priority = 1.9;
				  };
				  class ACE_Carte {
					displayName = "Présenter carte";
					distance = 4;
					condition = "_target isKindOf 'Man' && {alive _target}";
					statement = "[_target] spawn life_fnc_showId";
					exceptions[] = {"isNotSwimming"};
					showDisabled = 0;
					priority = 2.7;
				  };
				  class ACE_CopAlcool
				  {
					  displayName = "Contrôler Alcool";
					  distance = 4;
					  condition = "alive _target && {isPlayer _target} && {_target isKindOf 'Man'} && {playerSide == west} && {side _target in [civilian,independent,west]}";
					  statement = "[[player],'life_fnc_soufflerBallon',_target,FALSE] spawn life_fnc_MP";
					  showDisabled = 0;
					  priority = 2.3;
					  hotkey = "A";
				  };
				  class ACE_Reanimer {
					displayName = "Réanimer";
					distance = 4;
					condition = "(_target isKindOf 'Man') && {!alive _target} && {playerSide in [west,independent]} && {'Medikit' in (items player)}";
					statement = "[_target] spawn life_fnc_revivePlayer";
					exceptions[] = {"isNotSwimming"};
					showDisabled = 0;
					priority = 2.5;
					hotkey = "R";
				  };
				  class ACE_Copinteraction
				  {
					displayName = "Interaction Gendarme";
					distance = 4;
					condition = "(alive _target) && {isPlayer _target} && {_target isKindOf 'Man'} && {(_target getVariable['ACE_Captives_isHandcuffed',false]) OR (_target getVariable['ACE_Captives_isSurrendering',false])} && {playerSide == west} && {side _target in [civilian,independent]}";
					statement = "";
					showDisabled = 0;
					priority = 3.2;
					subMenu[] = {"ACE_Copinteraction",0};
					hotkey = "C";
					class ACE_CopCheckLicenses
					{
						displayName = "$STR_pInAct_checkLicenses";
						distance = 4;
						condition = "alive _target && {isPlayer _target} && {_target isKindOf 'Man'} && {(_target getVariable['ACE_Captives_isHandcuffed',false]) OR (_target getVariable['ACE_Captives_isSurrendering',false])} && {playerSide == west} && {side _target in [civilian,independent]}";
						statement = "[[player],'life_fnc_licenseCheck',_target,FALSE] spawn life_fnc_MP";
						showDisabled = 1;
						priority = 2.4;
						hotkey = "L";
					};
					class ACE_CopTicket
					{
						displayName = "$STR_pInAct_TicketBtn";
						distance = 4;
						condition = "alive _target && {isPlayer _target} && {_target isKindOf 'Man'} && {(_target getVariable['ACE_Captives_isHandcuffed',false])} && {playerSide == west} && {side _target in [civilian,independent]}";
						statement = "[_target] call life_fnc_ticketAction";
						showDisabled = 1;
						priority = 2.2;
						hotkey = "T";
					};
					class ACE_RevokeLicense
					{
						displayName = "$STR_pInAct_RevokeLicense";
						distance = 4;
						condition = "alive _target && {isPlayer _target} && {_target isKindOf 'Man'} && {(_target getVariable['ACE_Captives_isHandcuffed',false])} && {playerSide == west} && {side _target in [civilian,independent]}";
						statement = "[_target] call life_fnc_revokeLicense";
						showDisabled = 1;
						priority = 2.1;
						hotkey = "R";
					};
					class ACE_Prison
					{
						displayName = "$STR_pInAct_Arrest";
						distance = 4;
						condition = "alive _target && {isPlayer _target} && {_target isKindOf 'Man'} && {(_target getVariable['ACE_Captives_isHandcuffed',false])} && {playerSide == west} && {side _target in [civilian,independent]} && ((player distance (getMarkerPos 'police_hq_1') < 30) OR  (player distance (getMarkerPos 'police_hq_2') < 30) OR (player distance (getMarkerPos 'cop_spawn_3') < 30) OR (player distance (getMarkerPos 'cop_spawn_5') < 30))";
						statement = "[_target] call life_fnc_arrestAction";
						showDisabled = 1;
						priority = 2.5;
						hotkey = "P";
					};
				  };
            };
            class ACE_Torso {
                displayName = "$STR_ACE_Interaction_Torso";
                selection = "spine3";
                distance = 1.50;
                condition = "";
                statement = "";
            };
            class ACE_Head {
                displayName = "$STR_ACE_Interaction_Head";
                selection = "pilot";
                distance = 1.50;
                condition = "";
                statement = "";
            };
            class ACE_ArmLeft {
                displayName = "$STR_ACE_Interaction_ArmLeft";
                selection = "LeftForeArm";
                distance = 1.50;
                condition = "";
                statement = "";
            };
            class ACE_ArmRight {
                displayName = "$STR_ACE_Interaction_ArmRight";
                selection = "RightForeArm";
                distance = 1.50;
                condition = "";
                statement = "";
            };
            class ACE_LegLeft {
                displayName = "$STR_ACE_Interaction_LegLeft";
                selection = "LKnee";
                distance = 1.50;
                condition = "";
                statement = "";
            };
            class ACE_LegRight {
                displayName = "$STR_ACE_Interaction_LegRight";
                selection = "RKnee";
                distance = 1.50;
                condition = "";
                statement = "";
            };
            class ACE_Weapon {
                displayName = "$STR_ACE_Interaction_Weapon";
                position = QUOTE(call FUNC(getWeaponPos));
                distance = 1.50;
                condition = "";
                statement = "";
            };

            class ACE_TapShoulderRight {
                displayName = "$STR_ACE_Interaction_TapShoulder";
                selection = "rightshoulder";
                distance = 2.0;
                condition = QUOTE([ARR_2(_player, _target)] call DFUNC(canTapShoulder));
                statement = QUOTE([ARR_3(_player, _target, 0)] call DFUNC(tapShoulder));
            };
            class ACE_TapShoulderLeft {
                displayName = "$STR_ACE_Interaction_TapShoulder";
                selection = "leftshoulder";
                distance = 2.0;
                condition = QUOTE([ARR_2(_player, _target)] call DFUNC(canTapShoulder));
                statement = QUOTE([ARR_3(_player, _target, 1)] call DFUNC(tapShoulder));
            };
        };

        class ACE_SelfActions {
            class ACE_TeamManagement {
                displayName = "$STR_ACE_Interaction_TeamManagement";
                condition = QUOTE(GVAR(EnableTeamManagement));
                exceptions[] = {"isNotInside"};
                statement = "";
                showDisabled = 1;
                priority = 3.2;
                icon = PATHTOF(UI\team\team_management_ca.paa);
                hotkey = "M";

                class ACE_JoinTeamRed {
                    displayName = "$STR_ACE_Interaction_JoinTeamRed";
                    condition = QUOTE(true);
                    exceptions[] = {"isNotInside"};
                    statement = QUOTE([ARR_2(_player,'RED')] call DFUNC(joinTeam));
                    showDisabled = 1;
                    priority = 2.4;
                    icon = PATHTOF(UI\team\team_red_ca.paa);
                    hotkey = "R";
                };
                class ACE_JoinTeamGreen {
                    displayName = "$STR_ACE_Interaction_JoinTeamGreen";
                    condition = QUOTE(true);
                    exceptions[] = {"isNotInside"};
                    statement = QUOTE([ARR_2(_player,'GREEN')] call DFUNC(joinTeam));
                    showDisabled = 1;
                    priority = 2.3;
                    icon = PATHTOF(UI\team\team_green_ca.paa);
                    hotkey = "G";
                };
                class ACE_JoinTeamBlue {
                    displayName = "$STR_ACE_Interaction_JoinTeamBlue";
                    condition = QUOTE(true);
                    exceptions[] = {"isNotInside"};
                    statement = QUOTE([ARR_2(_player,'BLUE')] call DFUNC(joinTeam));
                    showDisabled = 1;
                    priority = 2.2;
                    icon = PATHTOF(UI\team\team_blue_ca.paa);
                    hotkey = "B";
                };
                class ACE_JoinTeamYellow {
                    displayName = "$STR_ACE_Interaction_JoinTeamYellow";
                    condition = QUOTE(true);
                    exceptions[] = {"isNotInside"};
                    statement = QUOTE([ARR_2(_player,'YELLOW')] call DFUNC(joinTeam));
                    showDisabled = 1;
                    priority = 2.1;
                    icon = PATHTOF(UI\team\team_yellow_ca.paa);
                    hotkey = "Y";
                };

                class ACE_LeaveTeam {
                    displayName = "$STR_ACE_Interaction_LeaveTeam";
                    condition = QUOTE(assignedTeam _player != 'MAIN');
                    exceptions[] = {"isNotInside"};
                    statement = QUOTE([ARR_2(_player,'MAIN')] call DFUNC(joinTeam));
                    showDisabled = 1;
                    priority = 2.5;
                    icon = PATHTOF(UI\team\team_white_ca.paa);
                    hotkey = "N";
                };
                /*class ACE_BecomeLeader {
                    displayName = "$STR_ACE_Interaction_BecomeLeader";
                    condition = QUOTE(_this call DFUNC(canBecomeLeader));
                    exceptions[] = {"isNotInside"};
                    statement = QUOTE(_this call DFUNC(doBecomeLeader));
                    showDisabled = 1;
                    priority = 1.0;
                    icon = PATHTOF(UI\team\team_white_ca.paa);
                    hotkey = "L";
                };
                class ACE_LeaveGroup {
                    displayName = "$STR_ACE_Interaction_LeaveGroup";
                    condition = QUOTE(count (units group _player) > 1);
                    exceptions[] = {"isNotInside"};
                    statement = QUOTE(_oldGroup = units group _player; _newGroup = createGroup side _player; [_player] joinSilent _newGroup; {_player reveal _x} forEach _oldGroup;);
                    showDisabled = 1;
                    priority = 1.2;
                    icon = PATHTOF(UI\team\team_management_ca.paa);
                    hotkey = "M";
                };*/
            };

            class ACE_Gestures {
                displayName = "$STR_ACE_Interaction_Gestures";
                condition = "canStand _target";
                statement = "";
                showDisabled = 1;
                priority = 3.5;
                icon = PATHTOF(UI\gestures_ca.paa);
                hotkey = "G";

                /*class ACE_Gesture_Advance {
                    displayName = "$STR_ACE_Interaction_Gestures_Attack";
                    condition = "canStand _target";
                    statement = "_target playActionNow 'gestureAttack';";
                    showDisabled = 1;
                    priority = 2.0;
                };*/
                class ACE_Gesture_Advance {
                    displayName = "$STR_ACE_Interaction_Gestures_Advance";
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureAdvance';);
                    showDisabled = 1;
                    priority = 1.9;
                    hotkey = "1";
                };
                class ACE_Gesture_Go {
                    displayName = "$STR_ACE_Interaction_Gestures_Go";
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow ([ARR_2('gestureGo','gestureGoB')] select floor random 2););
                    showDisabled = 1;
                    priority = 1.8;
                    hotkey = "2";
                };
                class ACE_Gesture_Follow {
                    displayName = "$STR_ACE_Interaction_Gestures_Follow";
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureFollow';);
                    showDisabled = 1;
                    priority = 1.7;
                    hotkey = "3";
                };
                /*class ACE_Gesture_Point {
                    displayName = "$STR_ACE_Interaction_Gestures_Point";
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gesturePoint';);
                    showDisabled = 1;
                    priority = 1.6;
                };*/
                class ACE_Gesture_Up {
                    displayName = "$STR_ACE_Interaction_Gestures_Up";
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureUp';);
                    showDisabled = 1;
                    priority = 1.5;
                    hotkey = "4";
                };
                class ACE_Gesture_Cover {
                    displayName = "$STR_ACE_Interaction_Gestures_Cover";
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureCover';);
                    showDisabled = 1;
                    priority = 1.4;
                    hotkey = "5";
                };
                class ACE_Gesture_CeaseFire {
                    displayName = "$STR_ACE_Interaction_Gestures_Cease_Fire";
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureCeaseFire';);
                    showDisabled = 1;
                    priority = 1.3;
                    hotkey = "6";
                };
                class ACE_Gesture_Freeze {
                    displayName = "$STR_ACE_Interaction_Gestures_Freeze";
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureFreeze';);
                    showDisabled = 1;
                    priority = 1.2;
                    hotkey = "7";
                };
                class ACE_Gesture_Yes {
                    displayName = "$STR_ACE_Interaction_Gestures_Yes";
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow ([ARR_2('gestureYes','gestureNod')] select floor random 2););
                    showDisabled = 1;
                    priority = 1.1;
                    hotkey = "8";
                };
                class ACE_Gesture_No {
                    displayName = "$STR_ACE_Interaction_Gestures_No";
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureNo';);
                    showDisabled = 1;
                    priority = 1.0;
                    hotkey = "9";
                };
                class ACE_Gesture_Hi {
                    displayName = "$STR_ACE_Interaction_Gestures_Hi";
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow ([ARR_3('gestureHi','gestureHiB','gestureHiC')] select floor random 3););
                    showDisabled = 1;
                    priority = 0.9;
                    hotkey = "0";
                };
            };

            class ACE_Equipment {
                displayName = "$STR_ACE_Interaction_Equipment";
                condition = QUOTE(true);
                exceptions[] = {"isNotInside","notOnMap"};
                statement = "";
                showDisabled = 1;
                priority = 4.5;
                icon = "";  // @todo
                hotkey = "E";
            };
			
			class ACE_Vesteexplo
		    {
				displayName = "Activer veste";
				// condition = QUOTE((vest _target == 'V_HarnessOGL_brn') && {alive _target} && {playerSide == civilian} && {!life_istazed} && {!_target getVariable [QGVAR(isEscorting), false]} && {!(_target getVariable [QGVAR(isHandcuffed), false])} && {!(_target getVariable [QGVAR(isSurrendering), false])} && {!(_target getVariable ["ACE_isUnconscious", false])});
				condition = "(vest _target == 'V_HarnessOGL_brn') && {alive _target} && {playerSide == civilian} && {!life_istazed}";
				// exceptions[] = {"isNotEscorting", "isNotHandcuffed","isNotSurrendering"};
				statement = "[] spawn life_fnc_suicideBomb;";
				showDisabled = 0;
				priority = 0.9;
				hotkey = "B";
		    };
		    /*class ACE_HuntingTrack
		    {
				displayName = "Traquer animaux";
				// condition = QUOTE((alive _target) && {playerSide == civilian} && {!life_istazed} && {!_target getVariable [QGVAR(isEscorting), false]} && {!(_target getVariable [QGVAR(isHandcuffed), false])} && {!(_target getVariable [QGVAR(isSurrendering), false])} && {!(_target getVariable ["ACE_isUnconscious", false])});
				condition = QUOTE((alive _target) && {playerSide == civilian} && {!life_istazed});
				exceptions[] = {"isNotEscorting", "isNotHandcuffed","isNotSurrendering"};
				statement = QUOTE([] spawn life_fnc_trackAnimal;);
				showDisabled = 1;
				priority = 0.5;
				hotkey = "C";
		    };
			class ACE_SkinAnimal
		    {
				displayName = "Dépecer";
				condition = "alive player && playerSide == civilian && !isNull cursorTarget && (player distance cursorTarget) < 4 && !life_istazed && !(player getVariable 'AGM_isEscorting') && !(player getVariable 'ACE_Captives_isHandcuffed') && !(player getVariable 'ACE_Captives_isSurrendering') && (typeOf cursorTarget) in ['Cock_random_F','Hen_random_F','Goat_random_F','Sheep_random_F'] && !alive life_cursorTarget";
				statement = "[] spawn life_fnc_skinAnimal;";
				showDisabled = 1;
				priority = 0.2;
				hotkey = "D";
		    };*/
        };
    };

    class LandVehicle;
    class Car: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ACE_Interaction_MainAction";
                selection = "";
                distance = 10;
                condition = "true";
                class ACE_Passengers {
                    displayName = "$STR_ACE_Interaction_Passengers";
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
                };
				class ACE_repair {
					displayName = "$STR_vInAct_Repair";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(damage _target < 1)}";
					statement = "[_target] spawn life_fnc_repairTruckCheck";
					showDisabled = 1;
					priority = 1.6;
				};
				class ACE_copRegistration {
					displayName = "$STR_vInAct_Registration";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(playerSide == west) OR ((playerSide == civilian) && (player getVariable['life_dep',false])) OR (player getVariable['is_admin',false])}";
					statement = "[_target] spawn life_fnc_searchVehAction";
					showDisabled = 0;
					priority = 1.6;
				};
				class ACE_copPullout {
					displayName = "Sortir tt le monde";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {count crew _target != 0} && {playerSide == west}";
					statement = "[_target] spawn life_fnc_pulloutAction";
					showDisabled = 0;
					priority = 1.6;
				};
				class ACE_Impound {
					displayName = "$STR_vInAct_Impound";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(playerSide == west) OR ((playerSide == civilian) && (player getVariable['life_dep',false])) OR (player getVariable['is_admin',false])}";
					statement = "[_target] spawn life_fnc_impoundAction";
					showDisabled = 0;
					priority = 1.6;
				};
				class ACE_Kart {
					displayName = "$STR_vInAct_GetInKart";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {typeOf (_target) in [""C_Kart_01_Blu_F"",""C_Kart_01_Red_F"",""C_Kart_01_Fuel_F"",""C_Kart_01_Vrana_F""]} && {canMove _target} && {count crew _target != 0} && {locked _target == 0}";
					statement = "player moveInDriver _target";
					showDisabled = 0;
					priority = 1.6;
				};
				class ACE_Unflip {
					displayName = "$STR_vInAct_Unflip";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {!(typeOf (_target) in [""C_Kart_01_Blu_F"",""C_Kart_01_Red_F"",""C_Kart_01_Fuel_F"",""C_Kart_01_Vrana_F""])} && {!(canMove _target)} && {count crew _target == 0}";
					statement = "_target setPos [getPos _target select 0, getPos _target select 1, (getPos _target select 2)+0.5]";
					showDisabled = 0;
					priority = 1.6;
				};
				class ACE_DeviceMine
				{
					displayName = "$STR_vInAct_DeviceMine";
					distance = 4;
					condition = "alive _target && {typeOf _target == ""O_Truck_03_device_F_RP""} && {playerSide != west} && !(!isNil {(_target getVariable ""mining"")} OR !local _target && {_target in life_vehicles})";
					statement = "[_target] spawn life_fnc_deviceMine";
					showDisabled = 0;
					priority = 1.6;
				};
            };
        };
        class ACE_SelfActions {
            class ACE_Passengers {
                displayName = "$STR_ACE_Interaction_Passengers";
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
            };
        };
    };
    class Tank: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ACE_Interaction_MainAction";
                selection = "";
                distance = 10;
                condition = "true";
                class ACE_Passengers {
                    displayName = "$STR_ACE_Interaction_Passengers";
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
                };
				class AGM_repair {
					displayName = "$STR_vInAct_Repair";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(damage _target < 1)}";
					statement = "[_target] spawn life_fnc_repairTruckCheck";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_copRegistration {
					displayName = "$STR_vInAct_Registration";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(playerSide == west) OR ((playerSide == civilian) && (player getVariable['life_dep',false])) OR (player getVariable['is_admin',false])}";
					statement = "[_target] spawn life_fnc_searchVehAction";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_copPullout {
					displayName = "Sortir tt le monde";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {count crew _target != 0} && {playerSide == west}";
					statement = "[_target] spawn life_fnc_pulloutAction";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_Impound {
					displayName = "$STR_vInAct_Impound";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(playerSide == west) OR ((playerSide == civilian) && (player getVariable['life_dep',false])) OR (player getVariable['is_admin',false])}";
					statement = "[_target] spawn life_fnc_impoundAction";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_Unflip {
					displayName = "$STR_vInAct_Unflip";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {!(typeOf (_target) in [""C_Kart_01_Blu_F"",""C_Kart_01_Red_F"",""C_Kart_01_Fuel_F"",""C_Kart_01_Vrana_F""])} && {!(canMove _target)} && {count crew _target == 0}";
					statement = "_target setPos [getPos _target select 0, getPos _target select 1, (getPos _target select 2)+0.5]";
					showDisabled = 0;
					priority = 1.6;
				};
            };
        };
        class ACE_SelfActions {
            class ACE_Passengers {
                displayName = "$STR_ACE_Interaction_Passengers";
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
            };
        };
    };

    class Air;
    class Helicopter: Air {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ACE_Interaction_MainAction";
                selection = "";
                distance = 10;
                condition = "true";
                class ACE_Passengers {
                    displayName = "$STR_ACE_Interaction_Passengers";
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
                };
				class AGM_repair {
					displayName = "$STR_vInAct_Repair";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(damage _target < 1)}";
					statement = "[_target] spawn life_fnc_repairTruckCheck";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_copRegistration {
					displayName = "$STR_vInAct_Registration";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(playerSide == west) OR ((playerSide == civilian) && (player getVariable['life_dep',false])) OR (player getVariable['is_admin',false])}";
					statement = "[_target] spawn life_fnc_searchVehAction";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_copPullout {
					displayName = "Sortir tt le monde";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {count crew _target != 0} && {playerSide == west}";
					statement = "[_target] spawn life_fnc_pulloutAction";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_Impound {
					displayName = "$STR_vInAct_Impound";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(playerSide == west) OR ((playerSide == civilian) && (player getVariable['life_dep',false])) OR (player getVariable['is_admin',false])}";
					statement = "[_target] spawn life_fnc_impoundAction";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_Unflip {
					displayName = "$STR_vInAct_Unflip";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {!(typeOf (_target) in [""C_Kart_01_Blu_F"",""C_Kart_01_Red_F"",""C_Kart_01_Fuel_F"",""C_Kart_01_Vrana_F""])} && {!(canMove _target)} && {count crew _target == 0}";
					statement = "_target setPos [getPos _target select 0, getPos _target select 1, (getPos _target select 2)+0.5]";
					showDisabled = 0;
					priority = 1.6;
				};
            };
        };
        class ACE_SelfActions {
            class ACE_Passengers {
                displayName = "$STR_ACE_Interaction_Passengers";
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
            };
        };
    };
    class Plane: Air {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ACE_Interaction_MainAction";
                selection = "";
                distance = 10;
                condition = "true";
                class ACE_Passengers {
                    displayName = "$STR_ACE_Interaction_Passengers";
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
                };
				class AGM_repair {
					displayName = "$STR_vInAct_Repair";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(damage _target < 1)}";
					statement = "[_target] spawn life_fnc_repairTruckCheck";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_copRegistration {
					displayName = "$STR_vInAct_Registration";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(playerSide == west) OR ((playerSide == civilian) && (player getVariable['life_dep',false])) OR (player getVariable['is_admin',false])}";
					statement = "[_target] spawn life_fnc_searchVehAction";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_copPullout {
					displayName = "Sortir tt le monde";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {count crew _target != 0} && {playerSide == west}";
					statement = "[_target] spawn life_fnc_pulloutAction";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_Impound {
					displayName = "$STR_vInAct_Impound";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(playerSide == west) OR ((playerSide == civilian) && (player getVariable['life_dep',false])) OR (player getVariable['is_admin',false])}";
					statement = "[_target] spawn life_fnc_impoundAction";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_Unflip {
					displayName = "$STR_vInAct_Unflip";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {!(typeOf (_target) in [""C_Kart_01_Blu_F"",""C_Kart_01_Red_F"",""C_Kart_01_Fuel_F"",""C_Kart_01_Vrana_F""])} && {!(canMove _target)} && {count crew _target == 0}";
					statement = "_target setPos [getPos _target select 0, getPos _target select 1, (getPos _target select 2)+0.5]";
					showDisabled = 0;
					priority = 1.6;
				};
            };
        };
        class ACE_SelfActions {
            class ACE_Passengers {
                displayName = "$STR_ACE_Interaction_Passengers";
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
            };
        };
    };

    class Ship;
    class Ship_F: Ship {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ACE_Interaction_MainAction";
                selection = "";
                distance = 10;
                condition = "true";

                class ACE_Push {
                    displayName = "$STR_ACE_Interaction_Push";
                    distance = 6;
                    condition = QUOTE(getMass _target < 1000 && {alive _target});
                    statement = QUOTE([ARR_2(_target, [ARR_3(2 * (vectorDir _player select 0), 2 * (vectorDir _player select 1), 0.5)])] call DFUNC(push););
                    showDisabled = 0;
                    priority = -1;
                };
                class ACE_Passengers {
                    displayName = "$STR_ACE_Interaction_Passengers";
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
                };
				class AGM_repair {
					displayName = "$STR_vInAct_Repair";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(damage _target < 1)}";
					statement = "[_target] spawn life_fnc_repairTruckCheck";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_copRegistration {
					displayName = "$STR_vInAct_Registration";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(playerSide == west) OR ((playerSide == civilian) && (player getVariable['life_dep',false])) OR (player getVariable['is_admin',false])}";
					statement = "[_target] spawn life_fnc_searchVehAction";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_copPullout {
					displayName = "Sortir tt le monde";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {count crew _target != 0} && {playerSide == west}";
					statement = "[_target] spawn life_fnc_pulloutAction";
					showDisabled = 0;
					priority = 1.6;
				};
				class AGM_Impound {
					displayName = "$STR_vInAct_Impound";
					distance = 4;
					condition = "alive _target && {speed _target == 0} && {(playerSide == west) OR ((playerSide == civilian) && (player getVariable['life_dep',false])) OR (player getVariable['is_admin',false])}";
					statement = "[_target] spawn life_fnc_impoundAction";
					showDisabled = 0;
					priority = 1.6;
				};		
            };
        };
        class ACE_SelfActions {
            class ACE_Passengers {
                displayName = "$STR_ACE_Interaction_Passengers";
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
            };
        };
    };

    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ACE_Interaction_MainAction";
                selection = "gunnerview";
                distance = 2;
                condition = "true";
                class ACE_Passengers {
                    displayName = "$STR_ACE_Interaction_Passengers";
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
                };
            };
        };
        class ACE_SelfActions {
            class ACE_Passengers {
                displayName = "$STR_ACE_Interaction_Passengers";
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addPassengersActions));
            };
        };
    };

    class thingX;
    class ReammoBox_F: thingX {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ACE_Interaction_MainAction";
                selection = "";
                distance = 2;
                condition = "true";
            };
        };
        class ACE_SelfActions {};
    };
};
