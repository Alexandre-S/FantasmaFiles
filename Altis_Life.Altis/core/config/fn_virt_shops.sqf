/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Market",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","chicken","goat","sheep","excavator","cornmeal","bottles"]]};
	case "bar": {["The Lounge",["bottledbeer","bottledwhiskey"]]};
	case "speakeasy": {["Speakeasy's",["bottledshine"]]};
	// case "speakeasy": {["Speakeasy's",["bottledwhiskey","bottledshine","bottledbeer","moonshine"]]};
	case "house": {["House Market",["storagesmall","storagebig"]]};
	case "station_ser_virt": {["Station Service",["water","rabbit","redgull","tbacon","pickaxe","fuelF","nitro"]]};
	case "rebel": {["Rebel Market",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge","sandbag","sandbagr"]]};
	case "gang": {["Gang Market", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle","dog"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","marijuana","lsd"]]};
	case "oil": {["Oil Trader",["oilp","pickaxe","fuelF"]]};
	case "gaz": {["Gaz Trader",["gazp","pickaxe"]]};
	case "fishmarket": {["Altis Fish Market",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Altis Glass Dealer",["glass"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r"]]};
	// case "diamond": {["Diamond Dealer",["diamond","diamondc"]]};
	case "diamond": {["Diamond Dealer",["diamondc"]]};
	case "salt": {["Salt Dealer",["salt_r"]]};
	case "cop": {["Cop Item Shop",["donuts","coffee","spikeStrip","water","rabbit","tbacon","apple","redgull","fuelF","defusekit","mauer","cone","gpstracker","sandbag","sandbagr"]]};
	case "cement": {["Cement Dealer",["cement"]]};
	case "gold": {["Gold Buyer",["goldbar","diamondf","ruby","pearl","doubloon","silverpiece"]]};
	case "med": {["Med Item Shop",["donuts","coffee","water","rabbit","apple","redgull","fuelF","mauer","cone"]]};
	case "dep": {["Dep Shop",["mauer","cone"]]};
};