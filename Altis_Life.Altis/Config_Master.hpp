#define true 1
#define false 0

/*
    Master settings for various features and functionality
*/
class Life_Settings {
/* Logging and Security Settings*/
    /* Security Settings */
    spyGlass_toggle = false; //Spyglass On/Off Toggle --> True = On & False = Off

    /* Data Logging Settings */
    battlEye_friendlyLogging = false; //Set to true if you plan to read the data in your BattlEye log files. Otherwise use the SERVER RPT.
    player_advancedLog = false; //Logs the following: Houses(purchase/sale), Vehicle(Purchase/Sale/Chopping), Cop Arrests and Gang Creations. SEARCH USING: advanced_log
    player_moneyLog = false; //Logs player and gang bank(deposits/withdrawals/transfers). Logs money picked up off the ground. Logs player robbery. SEARCH USING: money_log
    player_deathLog = false; //Logs victim and killer when someone dies. SEARCH USING: death_log

/* Database Related Settings */
    /* Player Data Saving */
    save_virtualItems = true; //Save Virtual items (all sides)?

    saved_virtualItems[] = { "pickaxe","fuelEmpty","fuelFull", "spikeStrip", "lockpick", "defuseKit","storageSmall","storageBig","redgull","coffee","waterBottle","apple","peach","tbacon","donuts",
    "defibrillator","toolkit","zipties","knife","pliers","kidney","nitroamine","sight","trigger","boltcutter","nitro","gpstracker","woodaxe" };  //Array of virtual items that can be saved on your player.

    save_playerStats = true; //Save food, water and damage (all sides)?
    save_civilian_weapons = true; //Allow civilians to save weapons on them?
    save_civilian_position = true; //Save civilian location?
    save_civilian_position_restart = false; //Save civilian location only between restarts. After a server restart you'll have to spawn again.
    /* !!!TO SAVE POSITION BETWEEN RESTARTS save_civilian_position MUST BE TRUE!!! */
    save_civilian_positionStrict = false; //Strip the player if possible combat-log?  WARNING: Server crashes and lack of reliable syncing can trigger this.

    /* Vehicle Data Saving */
    save_vehicle_virtualItems = true; //Save virtual items inside the vehicle (all sides)(-- See defined items on next line --)

    save_vehicle_items[] = { "pickaxe","fuelEmpty","fuelFull", "spikeStrip", "lockpick", "defuseKit","storageSmall","storageBig","redgull","coffee","waterBottle","apple","peach","tbacon","donuts",
    "defibrillator","toolkit","zipties","knife","pliers","kidney","nitroamine","sight","trigger","boltcutter","nitro","gpstracker","woodaxe","plank","rubber","goldcoin","steelplate","cloth","gunpowder","glass","diamond_cut","Skarb","cement","salt_refined","iron_refined","copper_refined","oil_processed","whiskey_1","beer_1" }; 

    save_vehicle_inventory = true; //Save Arma inventory of vehicle to the database
    save_vehicle_fuel = true; //Save vehicle fuel level to the database (Impounded/Garaged).
    save_vehicle_damage = true; //Save vehicle damage to the database.
    save_vehicle_illegal = true; //This will allow cops to be advised when a vehicle, with illegal items in it, is impounded. This will also save illegal items as proof of crime, and needs "save_vehicle_virtualItems" set as true. Illegal items don't need to be set in save_vehicle_items[] for being saved, if it's enabled.


/* System Settings */
    /* ATM & Federal Reserve System Configurations */
    global_ATM = true; //Allow users to access any ATM on the map (Marked & Unmarked).
    noatm_timer = 15; //Time in minutes that players cannot deposit money after selling stolen gold.
    minimum_cops = 5; //Minimum cops required online to rob the Federal Reserve

    /* Basic System Configurations */
    donor_level = true; //Enable the donor level set in database (var = life_donorlevel; levels = 0,1,2,3,4,5). ATTENTION! Before enabling, read: https://www.bistudio.com/community/game-content-usage-rules & https://www.bistudio.com/monetization
    enable_fatigue = true; //Set to false to disable the ARMA 3 fatigue system.
    total_maxWTTP = 30; //Static variable for the maximum weight allowed without having a backpack
    respawn_timer = 60; //How many seconds a player should wait, before being able to respawn. Minimum 5 seconds.

    /* Clothing System Configurations */
    civ_skins = true; //Enable or disable civilian skins. Before enabling, you must add all the SEVEN files to textures folder. (It must be named as: civilian_uniform_1.jpg, civilian_uniform_2.jpg...civilian_uniform_6.jpg, civilian_uniform_7.jpg)
    cop_extendedSkins = true; //Enable or disable cop skins by level. Before enabling, you must add all the EIGHT files to textures folder. (It must be named as: cop_uniform.jpg + cop_uniform_1.jpg, cop_uniform_2.jpg...cop_uniform_6.jpg, cop_uniform_7.jpg; meaning cop_uniform = life_coplevel=0, cop_uniform_1 = life_coplevel=1, cop_uniform_2 = life_coplevel=2, etc...)
    clothing_noTP = true;  //Disable clothing preview teleport? (true = no teleport. false = teleport)
    clothing_box = true; //true = teleport to a black box. false = teleport to somewhere on map. (It only affects the game if clothing_noTP is set as false)
    clothing_masks[] = { "U_I_FullGhillie_lsh","U_O_FullGhillie_lsh","U_B_FullGhillie_lsh","U_I_FullGhillie_sard","U_O_FullGhillie_sard","U_B_FullGhillie_sard","U_O_FullGhillie_ard",
    "U_I_FullGhillie_ard","H_CrewHelmetHeli_B","H_Shemag_olive", "H_Shemag_khk", "H_Shemag_tan", "H_Shemag_olive_hs", "H_ShemagOpen_khk", "H_ShemagOpen_tan", "G_Balaclava_blk", "G_Balaclava_combat", "G_Balaclava_lowprofile", "G_Balaclava_oli", "G_Bandanna_aviator", "G_Bandanna_beast", "G_Bandanna_blk", "G_Bandanna_khk", "G_Bandanna_oli", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_tan", "U_O_GhillieSuit", "U_I_GhillieSuit", "U_B_GhillieSuit", "H_RacingHelmet_1_black_F", "H_RacingHelmet_1_red_F", "H_RacingHelmet_1_white_F", "H_RacingHelmet_1_blue_F", "H_RacingHelmet_1_yellow_F", "H_RacingHelmet_1_green_F", "H_RacingHelmet_1_F", "H_RacingHelmet_2_F", "H_RacingHelmet_3_F", "H_RacingHelmet_4_F" };

    /* Fuel System Configurations */
    pump_service = true; //Allow users to use pump service on the map. Default = false
    fuel_cost = 100; //Cost of fuel per liter at fuel stations (if not defined for the vehicle already).
    service_chopper = 6000; //Cost to service chopper at chopper service station(Repair/Refuel).

    /* Gang System Configurations */
    gang_price = 1500000; //Gang creation price. --Remember they are persistent so keep it reasonable to avoid millions of gangs.
    gang_upgradeBase = 1000000; //The base cost for purchasing additional slots in a gang
    gang_upgradeMultiplier = 2.5; //CURRENTLY NOT IN USE

    /* Housing System Configurations */
    house_limit = 4; //Maximum number of houses a player can own.

    /* Hunting & Fishing System Configurations */
    animaltypes_fish[] = { "Salema_F", "Ornate_random_F", "Mackerel_F", "Tuna_F", "Mullet_F", "CatShark_F", "Turtle_F" }; //Classnames of fish you can catch
    animaltypes_hunting[] = { "Sheep_random_F", "Goat_random_F", "Hen_random_F", "Cock_random_F", "Rabbit_F" }; //Classnames of aniamls you can hunt/gut

    /* Item-related Restrictions */
    restrict_medic_weapons = true; //Set to false to allow medics to use any weapon --true will remove ANY weapon they attempt to use (primary,secondary,launcher)
    restrict_clothingPickup = false; //Set to false to allow civilians to pickup/take any uniform (ground/crates/vehicles)
    restrict_weaponPickup = false; //Set to false to allow civilians to pickup/take any weapon (ground/crates/vehicles)
    restricted_uniforms[] = { "U_Rangemaster", "U_B_CombatUniform_mcam_tshirt", "U_B_CombatUniform_mcam_worn", "U_B_survival_uniform" };
    restricted_weapons[] = { "hgun_P07_snds_F", "arifle_MX_F", "arifle_MXC_F" };

    /* Jail System Configurations */
    jail_seize_vItems[] = { "spikeStrip","lockpick","goldbar","blastingcharge","boltcutter","defusekit","heroin_unprocessed","heroin_processed","cannabis","marijuana","cocaine_unprocessed","cocaine_processed","turtle_raw" }; //Define VIRTUAL items you want to be removed from players upon jailing here. Use "jail_seize_inventory" for Arma inventory items.
    jail_seize_inventory = true; //Set to true to run the cop seize script on inmates. False will remove only weapons and magazines otherwise. (Basically used in case cops forget to seize items). [See Lines 106-111 below]

    /* Medical System Configurations */
    revive_cops = true; //true to enable cops the ability to revive everyone or false for only medics/ems.
    revive_fee = 20000; //Revive fee that players have to pay and medics only EMS(independent) are rewarded with this amount.
    hospital_heal_fee = 10000; //Fee to heal at a hospital NPC

    /* Paycheck & Bank System Configurations */
    bank_cop = 50000; //Amount of cash in bank for new cops
    bank_civ = 50000; //Amount of cash in bank for new civillians
    bank_med = 50000; //Amount of cash in bank for new medics

    paycheck_cop = 6000; //Payment for cops
    paycheck_civ = 4000; //Payment for civillians
    paycheck_med = 6000; //Payment for medics

    paycheck_period = 10; //Scaled in minutes
    bank_transferTax = .1; //Tax that player pays when transferring money from ATM. Tax = Amount * multiplier

    /* Player Job System Configurations */
    delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };
    fuelTank_winMultiplier = 1; //Win Multiplier in FuelTank Missions. Increase for greater payout. Default = 1

    /* Search & Seizure System Configurations */
    seize_exempt[] = { "Binocular", "ItemWatch", "ItemCompass", "ItemGPS", "ItemMap", "NVGoggles", "FirstAidKit", "MedKit", "ToolKit", "Chemlight_red", "Chemlight_yellow", "Chemlight_green", "Chemlight_blue", "optic_ACO_grn_smg" };
    //Arma items that will not get seized from player inventories
    seize_uniform[] = { "U_Rangemaster","U_I_FullGhillie_lsh","U_O_FullGhillie_lsh","U_B_FullGhillie_lsh","U_I_FullGhillie_sard","U_O_FullGhillie_sard","U_B_FullGhillie_sard","U_O_FullGhillie_ard",
    "U_I_FullGhillie_ard","U_B_FullGhillie_ard","U_I_GhillieSuit","U_O_GhillieSuit","U_I_G_resistanceLeader_F","U_O_SpecopsUniform_ocamo","U_IG_Guerilla1_1" }; //Any specific uniforms you want to be seized from players

    seize_vest[] = { "V_TacVest_blk_POLICE" }; //Any specific vests you want to be seized from players
    seize_headgear[] = { "H_Cap_police","H_CrewHelmetHeli_B","H_Shemag_olive",
    "H_Shemag_khk", "H_Shemag_tan", "H_Shemag_olive_hs", "H_ShemagOpen_khk", "H_ShemagOpen_tan", "G_Balaclava_blk", "G_Balaclava_combat", "G_Balaclava_lowprofile", "G_Balaclava_oli", "G_Bandanna_aviator",
    "G_Bandanna_beast", "G_Bandanna_blk", "G_Bandanna_khk", "G_Bandanna_oli", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_tan", "H_RacingHelmet_1_black_F",
    "H_RacingHelmet_1_red_F", "H_RacingHelmet_1_white_F", "H_RacingHelmet_1_blue_F", "H_RacingHelmet_1_yellow_F", "H_RacingHelmet_1_green_F", "H_RacingHelmet_1_F", "H_RacingHelmet_2_F", "H_RacingHelmet_3_F", "H_RacingHelmet_4_F" }; //Any hats or helmets you want seized from players
    seize_minimum_rank = 2; //Required minimum CopLevel to be able to seize items from players
	crush_minimum_rank = 3; //Required minimum CopLevel to be able to seize items from players

    /* Vehicle System Configurations */
    chopShop_vehicles[] = { "Car", "Air" }; //Vehicles that can be chopped. (Can add: "Ship" and possibly more -> look at the BI wiki...)
    vehicle_infiniteRepair = false; //Set to true for unlimited repairs with 1 toolkit. False will remove toolkit upon use.
    vehicleShop_rentalOnly[] = { "B_MRAP_01_hmg_F", "B_Boat_Armed_01_minigun_F", "O_MRAP_02_hmg_F" }; //Vehicles that can only be rented and not purchased. (Last only for the session)

        /* Vehicle Purchase Prices */
        vehicle_purchase_multiplier_CIVILIAN = 1.1; //Civilian Vehicle Buy Price = Config_Vehicle price * multiplier
		vehicle_purchase_multiplier_DONATOR_BRONZE   = 1.0; //Doador Vehicle Buy Price = Config_Vehicle price * multiplier
		vehicle_purchase_multiplier_DONATOR_SILVER 	 = 1.0; //Doador Vehicle Buy Price = Config_Vehicle price * multiplier
		vehicle_purchase_multiplier_DONATOR_GOLD   	 = 1.0; //Doador Vehicle Buy Price = Config_Vehicle price * multiplier
		vehicle_purchase_multiplier_DONATOR_PLATINUM = 0.9; //Doador Vehicle Buy Price = Config_Vehicle price * multiplier
		vehicle_purchase_multiplier_DONATOR_DIAMANTE = 0.7; //Doador Vehicle Buy Price = Config_Vehicle price * multiplier
        vehicle_purchase_multiplier_COP = 0.5; //Cop Vehicle Buy Price = Config_Vehicle price * multiplier
        vehicle_purchase_multiplier_MEDIC = 0.5; //Medic Vehicle Buy Price = Config_Vehicle price * multiplier
        vehicle_purchase_multiplier_OPFOR = -1; // -- NOT IN USE -- Simply left in for east support.

        /* Vehicle Rental Prices */
        vehicle_rental_multiplier_CIVILIAN = 1.00; //Civilian Vehicle Rental Price = Config_Vehicle price * multiplier
		vehicle_rental_multiplier_DONATOR_BRONZE   = 0.9;  //Doador Vehicle Rental Price = Config_Vehicle price * multiplier
		vehicle_rental_multiplier_DONATOR_SILVER   = 0.8;  //Doador Vehicle Rental Price = Config_Vehicle price * multiplier
		vehicle_rental_multiplier_DONATOR_GOLD     = 0.7;  //Doador Vehicle Rental Price = Config_Vehicle price * multiplier
		vehicle_rental_multiplier_DONATOR_PLATINUM = 0.7;  //Doador Vehicle Rental Price = Config_Vehicle price * multiplier
		vehicle_rental_multiplier_DONATOR_DIAMANTE = 0.6;  //Doador Vehicle Rental Price = Config_Vehicle price * multiplier
        vehicle_rental_multiplier_COP = 0.2; //Cop Vehicle Rental Price = Config_Vehicle price * multiplier
        vehicle_rental_multiplier_MEDIC = 0.25; //Medic Vehicle Rental Price = Config_Vehicle price * multiplier
        vehicle_rental_multiplier_OPFOR = -1; // -- NOT IN USE -- Simply left in for east support.

        /* Vehicle Sell Prices */
        vehicle_sell_multiplier_CIVILIAN = .5; //Civilian Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
		vehicle_sell_multiplier_DONATOR_BRONZE = .5; //Civilian Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
		vehicle_sell_multiplier_DONATOR_SILVER = .5; //Civilian Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
	    vehicle_sell_multiplier_DONATOR_GOLD = .5; //Civilian Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
		vehicle_sell_multiplier_DONATOR_PLATINUM = .5; //Civilian Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
		vehicle_sell_multiplier_DONATOR_DIAMANTE = .5; //Civilian Vehicle Garage Sell Price = Vehicle Buy Price * multiplier		
        vehicle_sell_multiplier_COP = .3; //Cop Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
        vehicle_sell_multiplier_MEDIC = .3; //Medic Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
        vehicle_sell_multiplier_OPFOR = -1; // -- NOT IN USE -- Simply left in for east support.
		
		/* Vehicle Assure Prices */
        vehicle_assure_multiplier_CIVILIAN = .2; //Civilian Vehicle Garage Sell Price = Vehicle Buy Price * multiplier

        /* "Other" Vehicle Prices */
        vehicle_chopShop_multiplier = .40; //Chop Shop price for vehicles. TO AVOID EXPLOITS NEVER SET HIGHER THAN A PURCHASE/RENTAL multipler!   Payout = Config_vehicle Price * multiplier
        vehicle_storage_fee_multiplier = .01; //Pull from garage cost --> Cost takes the playersides Buy Price * multiplier
        vehicle_cop_impound_multiplier = .04; //TO AVOID EXPLOITS NEVER SET HIGHER THAN A PURCHASE/RENTAL multipler!   Payout = Config_vehicle Price * multiplier

/* Wanted System Settings *
    /* crimes[] = {String, Bounty, Code} */
    crimes[] = {
        {"STR_Crime_187V","16500","187V"},
        {"STR_Crime_187","250000","187"},
        {"STR_Crime_901","155450","901"},
        {"STR_Crime_215","55200","215"},
        {"STR_Crime_213","251000","213"},
        {"STR_Crime_211","111100","211"},
        {"STR_Crime_207","175350","207"},
        {"STR_Crime_207A","88200","207A"},
        {"STR_Crime_390","551500","390"},
        {"STR_Crime_487","60150","487"},
        {"STR_Crime_488","22070","488"},
        {"STR_Crime_480","30100","480"},
        {"STR_Crime_481","170000","481"},
        {"STR_Crime_482","80500","482"},
        {"STR_Crime_483","200950","483"},
        {"STR_Crime_459","150650","459"},
        {"STR_Crime_666","55200","666"},
        {"STR_Crime_667","504500","667"},
        {"STR_Crime_668","71500","668"},
        {"STR_Crime_1","22250","1"},
        {"STR_Crime_2","22100","2"},
        {"STR_Crime_3","23375","3"},
        {"STR_Crime_4","33125","4"},
        {"STR_Crime_5","21250","5"},
        {"STR_Crime_6","11140","6"},
        {"STR_Crime_7","8875","7"},
        {"STR_Crime_8","72500","8"},
        {"STR_Crime_9","82500","9"},
        {"STR_Crime_10","87500","10"},
        {"STR_Crime_11","75000","11"},
        {"STR_Crime_12","21250","12"},
        {"STR_Crime_13","22750","13"},
        {"STR_Crime_14","82250","14"},
        {"STR_Crime_15","111250","15"},
        {"STR_Crime_16","80750","16"},
        {"STR_Crime_17","20050","17"},
        {"STR_Crime_18","11750","18"},
        {"STR_Crime_19","11250","19"},
        {"STR_Crime_20","7250","20"},
        {"STR_Crime_21","5250","21"},
        {"STR_Crime_22","211000","22"},
        {"STR_Crime_23","532500","23"},
        {"STR_Crime_24","200000","24"},
        {"STR_Crime_25","510000","25"}
    };
};

#include "Config\Config_Clothing.hpp"
#include "Config\Config_Licenses.hpp"
#include "Config\Config_Vehicles.hpp"
#include "Config\Config_vItems.hpp"
#include "Config\Config_Weapons.hpp"
#include "Config\Config_Gather.hpp"
#include "Config\Config_SpawnPoints.hpp"
#include "Config\Config_Process.hpp"
