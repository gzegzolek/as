class Socket_Reciever {
	tag = "SOCK";
	class SQL_Socket {
		file = "core\session";
		class dataQuery {};
		class insertPlayerInfo {};
		class requestReceived {};
		class syncData {};
		class updatePartial {};
		class updateRequest {};
	};
};

class CHVD
{
	tag = "CHVD";
	class CHVD
	{
		file = "Custom\CHVD";
		class onCheckedChanged {};
		class onSliderChange {};
		class onLBSelChanged {};
		class onEBinput {};
		class onEBterrainInput {};
		class selTerrainQuality {};
		class updateTerrain {};
		class updateSettings {};
		class openDialog {};
		class localize {};
		class init {postInit = 1;};
	};
};

class Life_Client_Core {
	tag = "life";

	class Master_Directory {
		file = "core";
		class initCiv {};
		class initCop {};
		class initMedic {};
		class setupActions {};
		class setupEVH {};
		class survival {};
		class initZeus {};
	};

	class Actions {
		file = "core\actions";
		class arrestAction {};
		class buyLicense {};
		class captureHideout {};
		class catchFish {};
		class dpFinish {};
		class dropFishingNet {};
		class escortAction {};
		class gather {};
		class skyDive {};
		class getDPMission {};
		class gutAnimal {};
		class suicideBomb {};
		class healHospital {};
		class impoundAction {};
		class mine {};
		class packupSpikes {};
		class pickupItem {};
		class pickupMoney {};
		class postBail {};
		class processAction {};
		class pulloutAction {};
		class pushVehicle {};
		class putInCar {};
		class removeContainer {};
		class repairTruck {};
		class restrainAction {};
		class robAction {};
		class searchAction {};
		class searchVehAction {};
		class seizePlayerAction {};
		class serviceChopper {};
		class stopEscorting {};
		class storeVehicle {};
		class surrender {};
		class ticketAction {};
		class unrestrain {};
		class movesMenu {};
		class playsound {};
		class craftAction {};
		class civRestrainAction {};
		class civunrestrain2 {};
		class takeOrgans {};
		class torture {};
		class copCrush {};
		class maskAction {};
		class unmask {};
		class robShops {};
		class ZipTieAction {};
		class seatbelt {};
		};

	class vAH
	{
		file = "core\vAH";
		class vAH_load;
		class vAH_buy;
		class vAH_reciever;
		class vAH_loadInventory;
		class vAH_sell;
		class vAH_checkItem;
		class vAH_takeBack;
		class vAH_select;
	};
       class Ausweis
    {
        file = "core\Ausweis";
        class Lizenzsehen {};
        class Lizenzzeigen {};
		class showLicenses {};
    };
	class CellPhone {
		file = "core\cellphone";
		class cellPhoneCheck {};
		class setupCellPhone {};
		class messagesMenu {};
		class lbChanged {};
		class deleteMessage {};
		class replyMessage {};
	};

	class statusbar
	{
			file = "Custom";
			class statusBar {};
	};

	class Slotmachine
  {
      file = "Custom\Slotmachine";
			class slotSpin {};
			class slotmachine {};
  };

	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};
		class adminSpectate {};
		class adminTeleport {};
		class adminTpHere {};
		class adminCompensate {};
		class adminFreeze {};
		class adminMarkers {};
	};

	class Civilian {
		file = "core\civilian";
		class civLoadout {};
		class civMarkers {};
		class demoChargeTimer {};
		class freezePlayer {};
		class jail {};
		class jailMe {};
		class knockedOut {};
		class knockoutAction {};
		class removeLicenses {};
		class robPerson {};
		class robReceive {};
		class tazed {};
		class civInteractionMenu {};
		class civRestrain {};
		class hasorgan {};
		class zipTie {};
		class throwcar {};
		class removeWeapons {};
		class seizePlayerWeapon {};
		class seizePlayerWeaponAction {};
	};

	class Config {
		file = "core\config";
		class houseConfig {};
		class itemWeight {};
		class vehicleAnimate {};
		class ssf4xvzcgh {};
		class vehicleWeightCfg {};
		class craftCfg {};
	};

	class useitem
	{
		file = "Custom\drugs";
		class Cocaine {};
		class Heroin {};
		class drinkbeer {};
		class drinkwhiskey {};
		class drinkmoonshine {};
		class weed {};
		class addicted {};
		class useheba {};
	};

	class gas
	{
		file = "Custom\gas";
		class teargas {};
	};

	class nitro
	{
		file = "Custom\nitro";
		class nitro {};
		class activateNitro {};
	};

	class CopPlaceables
	{
		file = "core\cop\roadblock";
		class placeablesInit {};
		class placeablesMenu {};
		class placeablesRemoveAll {};
		class placeablePlace {};
		class placeableCancel {};
		class placeablesPlaceComplete {};
		class facinit {};
	};

	class Cop {
		file = "core\cop";
		class bountyReceive {};
		class containerInvSearch {};
		class copInteractionMenu {};
		class copLights {};
		class copLoadout {};
		class copMarkers {};
		class copSearch {};
		class copSiren {};
		class doorAnimate {};
		class fedCamDisplay {};
		class licenseCheck {};
		class licensesRead {};
		class questionDealer {};
		class radar {};
		class repairDoor {};
		class restrain {};
		class searchClient {};
		class seizeClient {};
		class sirenLights {};
		class spikeStripEffect {};
		class ticketGive {};
		class ticketPaid {};
		class ticketPay {};
		class ticketPrompt {};
		class vehInvSearch {};
		class wantedGrab {};
		class callbackup {};
		class backupCall {};
		class copEnter {};
		class copOpener {};
		class seizePlayerWeapon {};
		class seizePlayerWeaponAction {};
	};

	class Dialog_Controls {
		file = "dialog\function";
		class bankDeposit {};
		class bankTransfer {};
		class bankWithdraw {};
		class displayHandler {};
		class gangDeposit {};
		class gangWithdraw {};
		class garageLBChange {};
		class impoundMenu {};
		class progressBar {};
		class safeFix {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class sellGarage {};
		class setMapPosition {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class unimpound {};
		class vehicleGarage {};
		class wireTransfer {};
		class insureCar{};
	};
    class DynMarket
    {
        file = "core\DynMarket";
        class bought {};
        class update {};
        class DisplayPrices {};
        class LoadIntoListbox {};
        class ForcePrice {};
        class DYNMARKET_getPrice {};
    };
	class Functions	{
		file = "core\functions";
		class accType {};
		class actionKeyHandler {};
		class animSync {};
		class calWeightDiff {};
		class clearVehicleAmmo {};
		class dropItems {};
		class escInterupt {};
		class fetchCfgDetails {};
		class fetchDeadGear {};
		class fetchVehInfo {};
		class isDamaged {};
		class giveDiff {};
		class handleDamage {};
		class handleInv {};
		class handleItem {};
		class hideObj {};
		class hudSetup {};
		class hudUpdate {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isnumeric {};
		class isUIDActive {};
		class keyHandler {};
		class loadDeadGear {};
		class loadGear {};
		class nearATM {};
		class nearestDoor {};
		class nearUnits {};
		class numberText {};
		class onFired {};
		class onTakeItem {};
		class playerCount {};
		class playerSkins {};
		class playerTags {};
		class pullOutVeh {};
		class pushObject {};
		class receiveItem {};
		class receiveMoney {};
		class revealObjects {};
		class saveGear {};
		class searchPosEmpty {};
		class simDisable {};
		class stripDownPlayer {};
		class tazeSound {};
		class teleport {};
		class whereAmI {};
		class lockDown {};
		class autoSave {};
		class nearestobjects {};
		class globalSoundClient {};
		class abortAction {};
		class seizeObjects {};
		class masked {};
		class autoMessages {};
	};

	class Gangs	{
		file = "core\gangs";
		class createGang {};
		class gangCreated {};
		class gangDisband {};
		class gangDisbanded {};
		class gangInvite {};
		class gangInvitePlayer {};
		class gangKick {};
		class gangLeave {};
		class gangMenu {};
		class gangNewLeader {};
		class gangUpgrade {};
		class initGang {};
	};

	class Housing {
		file = "core\housing";
		class buyHouse {};
		class containerMenu {};
		class copBreakDoor {};
		class copHouseOwner {};
		class garageRefund {};
		class getBuildingPositions {};
		class houseMenu {};
		class initHouses {};
		class lightHouse {};
		class lightHouseAction {};
		class lockHouse {};
		class lockupHouse {};
		class placeContainer {};
		class PlayerInBuilding {};
		class raidHouse {};
		class sellHouse {};
	};

	class Items	{
		file = "core\items";
		class blastingCharge {};
		class boltcutter {};
		class defuseKit {};
		class flashbang {};
		class jerryRefuel {};
		class lockpick {};
		class placestorage {};
		class spikeStrip {};
		class storageBox {};
		class gpsTracker {};
	};

	class Medical_System {
		file = "core\medical";
		class deathScreen {};
		class medicLights {};
		class medicLoadout {};
		class medicMarkers {};
		class medicRequest {};
		class medicSiren {};
		class medicSirenLights {};
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class requestMedic {};
		class respawned {};
		class revived {};
		class revivePlayer {};
		class deadBloodEffect {};
		class newLifeRule {};
		class pInteraction_med {};
		class Therapieaction {};
		class therapie {};
		class ticketGivemedic {};
		class medicrestrain {};
		class ticketPaymedic {};
		class ticketPromptmedic {};
		class ticketPaidmedic {};
		class medEnter {};
	};

	class Network {
		file = "core\functions\network";
		class broadcast {};
		class corpse {};
		class jumpFnc {};
		class say3D {};
		class setFuel {};
		class soundDevice {};
		class globalSound {};
	};

	class Player_Menu {
		file = "core\pmenu";
		class cellphone {};
		class giveItem {};
		class giveMoney {};
		class keyDrop {};
		class keyGive {};
		class keyMenu {};
		class p_openMenu {};
		class p_updateMenu {};
		class pardon {};
		class removeItem {};
		class s_onChar {};
		class s_onCheckedChange {};
		class s_onSliderChange {};
		class settingsMenu {};
		class updateViewDistance {};
		class useItem {};
		class wantedAddP {};
		class wantedInfo {};
		class wantedList {};
		class wantedMenu {};
		class wantedMenuCiv {};
		class licenses {};
		class inventory {};
		class smartphone {};
		class infomenu {};
		class craft {};
		class craft_update {};
		class craft_updateFilter {};
		class money {};
	};

	class Shops	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class clothingFilter {};
		class clothingMenu {};
		class fuelLBchange {};
		class fuelStatOpen {};
		class vehicleShop3DPreview {};
		class vehicleShopBuy {};
		class vehicleShopEnd3DPreview {};
		class vehicleShopInit3DPreview {};
		class vehicleShopLBChange {};
		class vehicleShopMenu {};
		class virt_buy {};
		class virt_menu {};
		class virt_sell {};
		class virt_update {};
		class weaponShopAccs {};
		class weaponShopBuySell {};
		class weaponShopFilter {};
		class weaponShopMags {};
		class weaponShopMenu {};
		class weaponShopSelection {};
	};

	class Vehicle {
		file = "core\vehicle";
		class addVehicle2Chain {};
		class colorVehicle {};
		class deviceMine {};
		class FuelRefuelcar {};
		class fuelStore {};
		class fuelSupply {};
		class lockVehicle {};
		class openInventory {};
		class vehiclecolor3DRefresh {};
		class vehicleOwners {};
		class vehicleWeight {};
		class vehInventory {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vInteractionMenu {};
	};
	
	 class Emp
	{
		file = "core\emp";
		class openEmpMenu {};
		class isEmpOperator {};
		class scanVehicles {};
		class warnVehicle {};
		class empVehicle {};
		class vehicleWarned {};
		class vehicleEmpd {};
	};
	
	class armageddon
	{
		file = "scripts\events\restart";
		class armageddon {};
		class earthquake {};
	};
};
