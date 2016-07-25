/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*            3: Custom exit message (Optional)
*
*    items: { Classname, Itemname, BuyPrice, SellPrice }
*
*    Itemname only needs to be filled if you want to rename the original object name.
*
*    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
*    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
*
*/
class WeaponShops {
    //Armory Shops
    class gun {
        name = "Billy Joe's Firearms";
        side = "civ";
        license = "gun";
        level[] = { "", "", -1, "" };
        items[] = {
            { "FirstAidKit", "Apteczka", 5250, 65 },
            { "hgun_Rook40_F", "Rook 9mm", 6500, 500 },
            { "hgun_Pistol_heavy_02_F", "Zubr .45ACP", 9850, -1 },
            { "hgun_ACPC2_F", "ACP .45ACP", 11500, -1 },
            { "hgun_Pistol_01_F", "P07 9mm", 20000, -1 },
			{ "hgun_P07_khk_F", "PM9 9mm", 25000, -1 },
			{ "hgun_PDW2000_F", "PDW 9mm", 25000, -1 },
			{ "SMG_02_F", "Sting 9 mm", 30500, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25 },
            { "6Rnd_45ACP_Cylinder", "", 50 },
            { "9Rnd_45ACP_Mag", "", 45 },
            { "30Rnd_9x21_Mag", "", 75 },
			{ "30Rnd_9x21_Mag_SMG_02", "", 75 },
			{ "30Rnd_9x21_Mag_SMG_02_Tracer_Red", "", 75 },
            { "30Rnd_556x45_Stanag", "", 100 },
            { "11Rnd_45ACP_Mag", "", 60 }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 2500 }
        };
    };

	class bronze {    
        name = "Bronze Armas Shop";
		side = "civ";
        license = "gun";
        level[] = { "life_donorlevel", "SCALAR", 1, "Musisz być na poziomie Bronz, aby uzyskać dostęp do sklepu, odwiedź nasze forum lub Teamspeak celach informacyjnych." };
		items[] = {
            { "FirstAidKit", "Apteczka", 250, 65 },
            { "hgun_Pistol_heavy_02_F", "ACP .45", 9500, 2500 },
			{ "hgun_Rook40_F", "Rook 9mm", 6500, 2500 },
            { "hgun_ACPC2_F", "ACP .45", 6250, 65 },
            { "arifle_TRG20_F", "TRG 5.56mm", 43000, 2500 },
			{ "arifle_TRG21_F", "TRG 5.56mm", 43000, 2500 },
            { "arifle_Katiba_F", "Katiba 6.5mm", 56000, 5000 },
            { "arifle_Katiba_C_F", "Katiba 6.5mm", 56000, 5000 },
            { "arifle_SDAR_F", "SDAR 5.56mm", 22000, 7500 },
            { "SMG_01_F", "Vermin SMG .45ACP", 50000, 7500 },
            { "arifle_Mk20_F", "Mk20 5.56mm", 90000, 7500 },
            { "arifle_Mk20C_F", "Mk20 5.56mm", 90000, 7500 },
            { "arifle_MXC_F", "MXC 6.5 mm", 1703000, 7500 },
            { "arifle_MX_F", "MX 6.5 mm", 1703000, 7500 },
            { "LMG_Mk200_F", "Mk200 6.5 mm", 230000, 7500 },
			{ "LMG_03_F", "LIM-85 5.56", 280000, 7500 },
			{ "arifle_AK12_F", "AK12 7.62 mm", 350000, 7500 },
			{ "arifle_AK12_GL_F", "AK12 GL 7.62", 400000, 7500 },
			{ "arifle_AKS_F", "AKS-74U 5.45", 230000, 7500 },
			{ "arifle_ARX_ghex_F", "Type 115 6.5 mm (Green Hex) mm", 420000, 7500 },
			{ "arifle_CTAR_blk_F", "CAR-95 5.8 mm (Black)", 450000, 7500 },
			{ "arifle_CTAR_GL_blk_F", "CAR-95 GL 5.8 mm (Black)", 330000, 7500 },
			{ "arifle_CTARS_blk_F", "CAR-95-1 5.8mm (Black)", 280000, 7500 },
			{ "arifle_SPAR_01_khk_F", "SPAR-16 5.56 mm (Khaki)", 250000, 7500 },
			{ "srifle_DMR_01_F", "Rahim 7.62 mm", 473000, 7500 }
        };
        mags[] = {
            { "6Rnd_45ACP_Cylinder", "", 725 },
			{ "30Rnd_9x21_Mag", "30rnd 9mm", 725 },
			{ "11Rnd_45ACP_Mag", "11rnd .45", 725 },
			{ "10Rnd_762x54_Mag", "10rnd 7.62mm", 1725 },
            { "30Rnd_45ACP_Mag_SMG_01_tracer_green", "30rnd .45", 750 },
            { "200Rnd_65x39_cased_Box_Tracer", "200rnd 6.5mm", 5650 },
            { "30Rnd_65x39_caseless_green", "30rnd 6.5mm", 1325 },
            { "30Rnd_556x45_Stanag_Tracer_Yellow", "30rnd 5.56mm", 1325 },
			{ "100Rnd_580x42_Mag_F", "100rnd 5.58mm", 1325 },
			{ "150Rnd_556x45_Drum_Mag_Tracer_F", "150rnd 5.56mm", 1325 },
			{ "200Rnd_556x45_Box_Red_F", "200rnd 5.56mm", 1325 },
			{ "20Rnd_650x39_Cased_Mag_F", "20rnd 6.39mm", 1325 },
			{ "30Rnd_545x39_Mag_Green_F", "30rnd 5.45mm", 1325 },	
            { "30Rnd_556x45_Stanag_green", "30rnd 5.45mm", 1325 },
			{ "30Rnd_556x45_Stanag_Tracer_Red", "30rnd 5.80mm", 1325 },
			{ "30Rnd_65x39_caseless_green_mag_Tracer", "30rnd 6.39mm", 1325 },
			{ "30Rnd_762x39_Mag_Green_F", "30rnd 7.62mm", 1325 },
            { "30Rnd_65x39_caseless_mag_Tracer", "30rnd 6.5mm", 1320 }
        };
        accs[] = {
            { "optic_ACO_grn", "Aco", 3000 },
            { "optic_Holosight", "Holosight", 3000 },
            { "optic_Hamr", "Hamr", 9500 },
            { "optic_Holosight_smg", "Holosight Smg", 2000 },
            { "optic_MRCO", "Mrco", 12500 },
            { "optic_Arco", "Arco", 8500 },
            { "acc_pointer_IR", "Laser", 1000 },
            { "acc_flashlight", "Latarka", 8000 }
        };
    };
	
	class silver {
        name = "Silver Armas Shop";
		side = "civ";
        license = "gun";
        level[] = { "life_donorlevel", "SCALAR", 2, "Musisz być na poziomie Silver, aby uzyskać dostęp do sklepu, odwiedź nasze forum lub Teamspeak celach informacyjnych." };
		items[] = {
            { "FirstAidKit", "Apteczka", 250, 65 },
            { "hgun_Pistol_heavy_02_F", "ACP .45", 9000, 2500 },
			{ "hgun_Rook40_F", "Rook 9mm", 6000, 2500 },
            { "hgun_ACPC2_F", "ACP .45", 6050, 65 },
            { "arifle_TRG20_F", "TRG 5.56mm", 41000, 2500 },
			{ "arifle_TRG21_F", "TRG 5.56mm", 41000, 2500 },
            { "arifle_Katiba_F", "Katiba 6.5mm", 83000, 5000 },
            { "arifle_Katiba_C_F", "Katiba 6.5mm", 83000, 5000 },
            { "arifle_SDAR_F", "SDAR 5.56mm", 120000, 7500 },
            { "SMG_01_F", "Vermin SMG .45ACP", 127000, 7500 },
            { "arifle_Mk20_F", "Mk20 5.56mm", 137000, 7500 },
            { "arifle_Mk20C_F", "Mk20 5.56mm", 137000, 7500 },
            { "arifle_MXC_F", "MXC 6.5 mm", 60000, 7500 },
            { "arifle_MX_F", "MX 6.5 mm", 160000, 7500 },
            { "LMG_Mk200_F", "Mk200 6.5 mm", 415000, 7500 },
			{ "arifle_MX_SW_F", "MX SW 6.5 mm", 400000, 7500 },
			{ "arifle_MXM_F", "MXM 6.5 mm", 250000, 7500 },
			{ "srifle_DMR_01_F", "Rahim 7.62 mm", 365000, 7500 }
        };
        mags[] = {
            { "6Rnd_45ACP_Cylinder", "9rnd .45", 725 },
			{ "30Rnd_9x21_Mag", "30rnd 9mm", 725 },
			{ "11Rnd_45ACP_Mag", "11rnd .45", 725 },
			{ "10Rnd_762x54_Mag", "10rnd 7.62mm", 1725 },
            { "30Rnd_45ACP_Mag_SMG_01_tracer_green", "30rnd .45", 750 },
            { "200Rnd_65x39_cased_Box_Tracer", "200rnd 6.5mm", 5650 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "100rnd 6.5mm", 2550 },
            { "30Rnd_65x39_caseless_green", "30rnd 6.5mm", 1325 },
            { "30Rnd_556x45_Stanag_Tracer_Yellow", "30rnd 5.56mm", 1325 },
            { "30Rnd_65x39_caseless_mag_Tracer", "30rnd 6.5mm", 1320 }
        };
        accs[] = {
            { "optic_ACO_grn", "Aco", 3000 },
            { "optic_Holosight", "Holosight", 3000 },
            { "optic_Hamr", "Hamr", 9500 },
            { "optic_Holosight_smg", "Holosight Smg", 2000 },
            { "optic_MRCO", "Mrco", 12500 },
            { "optic_Arco", "Arco", 8500 },
            { "acc_pointer_IR", "Laser", 1000 },
            { "acc_flashlight", "Latarka", 8000 },
			{ "muzzle_snds_Lt", "9mm", 10750 },
			{ "muzzle_snds_M", "5.56mm", 15750 },
			{ "muzzle_snds_H", "6.5mm", 18050 }
        };
    };
	
	class gold {
        name = "Gold Armas Shop";
		side = "civ";
        license = "gun";
        level[] = { "life_donorlevel", "SCALAR", 3, "Musisz być na poziomie Gold, aby uzyskać dostęp do sklepu, odwiedź nasze forum lub Teamspeak celach informacyjnych." };
		items[] = {
            { "FirstAidKit", "Apteczka", 250, 65 },
            { "hgun_Pistol_heavy_02_F", "ACP .45", 8000, 2500 },
			{ "hgun_Rook40_F", "Rook 9mm", 5000, 2500 },
            { "hgun_ACPC2_F", "ACP .45", 5050, 65 },
            { "arifle_TRG20_F", "TRG 5.56mm", 38000, 2500 },
			{ "arifle_TRG21_F", "TRG 5.56mm", 38000, 2500 },
            { "arifle_Katiba_F", "Katiba 6.5mm", 90000, 5000 },
            { "arifle_Katiba_C_F", "Katiba 6.5mm", 90000, 5000 },
            { "arifle_SDAR_F", "SDAR 5.56mm", 118000, 7500 },
            { "SMG_01_F", "Vermin SMG .45ACP", 174000, 7500 },
            { "arifle_Mk20_F", "Mk20 5.56mm", 185000, 7500 },
            { "arifle_Mk20C_F", "Mk20 5.56mm", 175000, 7500 },
            { "arifle_MXC_F", "MXC 6.5 mm", 176000, 7500 },
            { "arifle_MX_F", "MX 6.5 mm", 176000, 7500 },
            { "LMG_Mk200_F", "Mk200 6.5 mm", 200000, 7500 },
			{ "arifle_MX_SW_F", "MX SW 6.5 mm", 290000, 7500 },
			{ "arifle_MXM_F", "MXM 6.5 mm", 245000, 7500 },
			{ "srifle_EBR_F", "Mk18 ABR 7.62 mm", 395000, 7500 },
			{ "srifle_DMR_06_olive_F", "Mk14 7.62mm", 385000, 7500 },
			{ "srifle_DMR_01_F", "Rahim 7.62 mm", 362000, 7500 }
        };
        mags[] = {
            { "6Rnd_45ACP_Cylinder", "9rnd .45", 725 },
			{ "30Rnd_9x21_Mag", "  30rnd 9mm", 725 },
			{ "11Rnd_45ACP_Mag", "  11rnd .45", 725 },
			{ "10Rnd_762x54_Mag", "  10rnd 7.62mm", 1725 },
			{ "20Rnd_762x51_Mag", "  20rnd 7.62mm", 1725 },
            { "30Rnd_45ACP_Mag_SMG_01_tracer_green", "  30rnd .45", 750 },
            { "200Rnd_65x39_cased_Box_Tracer", "  200rnd 6.5mm", 5650 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "  100rnd 6.5mm", 2550 },
            { "30Rnd_65x39_caseless_green", "  30rnd 6.5mm", 1325 },
            { "30Rnd_556x45_Stanag_Tracer_Yellow", "  30rnd 5.56mm", 1325 },
            { "30Rnd_65x39_caseless_mag_Tracer", "  30rnd 6.5mm", 1320 }
        };
        accs[] = {
            { "optic_ACO_grn", "Aco", 3000 },
            { "optic_Holosight", "Holosight", 3000 },
            { "optic_Hamr", "Hamr", 9500 },
            { "optic_Holosight_smg", "Holosight Smg", 2000 },
            { "optic_MRCO", "Mrco", 12500 },
            { "optic_Arco", "Arco", 8500 },
            { "acc_pointer_IR", "Laser", 1000 },
            { "acc_flashlight", "Latarka", 8000 },
			{ "muzzle_snds_Lt", " 9mm", 8750 },
			{ "muzzle_snds_M", " 5.56mm", 10750 },
			{ "muzzle_snds_H", " 6.5mm", 15050 }
        };
    };
    
	class platinum {
        name = "Platinum Armas Shop";
		side = "civ";
        license = "gun";
        level[] = { "life_donorlevel", "SCALAR", 4, "Musisz być na poziomie Platinum, aby uzyskać dostęp do sklepu, odwiedź nasze forum lub Teamspeak celach informacyjnych." };
		items[] = {
            { "FirstAidKit", "Apteczka", 250, 65 },
            { "hgun_Pistol_heavy_02_F", "ACP .45", 7000, 2500 },
			{ "hgun_Rook40_F", "Rook 9mm", 4000, 2500 },
            { "hgun_ACPC2_F", "ACP .45", 4050, 65 },
            { "arifle_TRG20_F", "TRG 5.56mm", 34000, 2500 },
			{ "arifle_TRG21_F", "TRG 5.56mm", 34000, 2500 },
            { "arifle_Katiba_F", "Katiba 6.5mm", 46000, 5000 },
            { "arifle_Katiba_C_F", "Katiba 6.5mm", 46000, 5000 },
            { "arifle_SDAR_F", "SDAR 5.56mm", 16000, 7500 },
            { "SMG_01_F", "Vermin SMG .45ACP", 20000, 7500 },
            { "arifle_Mk20_F", "Mk20 5.56mm", 81000, 7500 },
            { "arifle_Mk20C_F", "Mk20 5.56mm", 131000, 7500 },
            { "arifle_MXC_F", "MXC 6.5 mm", 150000, 7500 },
            { "arifle_MX_F", "MX 6.5 mm", 150000, 7500 },
            { "LMG_Mk200_F", "Mk200 6.5 mm", 110000, 7500 },
			{ "arifle_MX_SW_F", "MX SW 6.5 mm", 180000, 7500 },
			{ "arifle_MXM_F", "MXM 6.5 mm", 141000, 7500 },
			{ "LMG_03_F", "LIM-85 5.56", 200000, 7500 },
			{ "arifle_AK12_F", "AK12 7.62 mm", 280000, 7500 },
			{ "arifle_AK12_GL_F", "AK12 GL 7.62", 240000, 7500 },
			{ "arifle_AKM_F", "AKM 7.62", 280000, 7500 },
			{ "arifle_AKS_F", "AKS-74U 5.45", 180000, 7500 },
			{ "arifle_ARX_blk_F", "Type 115 6.5 mm (Green Hex) mm", 210000, 7500 },
			{ "arifle_CTAR_blk_F", "CAR-95 5.8 mm (Black)", 200000, 7500 },
			{ "arifle_CTAR_GL_blk_F", "CAR-95 GL 5.8 mm (Black)", 200000, 7500 },
			{ "arifle_CTARS_blk_F", "CAR-95-1 5.8mm (Black)", 180000, 7500 },
			{ "arifle_SPAR_01_blk_F", "SPAR-16 5.56 mm (Khaki)", 170000, 7500 },
			{ "arifle_SPAR_01_GL_blk_F", "SPAR-16 GL 5.56 mm (Khaki)", 180000, 7500 },
			{ "srifle_EBR_F", "Mk18 ABR 7.62 mm", 291000, 7500 },
			{ "srifle_DMR_06_olive_F", "Mk14 7.62mm", 281000, 7500 },
			{ "srifle_DMR_01_F", "Rahim 7.62 mm", 258000, 7500 }
        };
        mags[] = {
            { "6Rnd_45ACP_Cylinder", "  9rnd .45", 725 },
			{ "30Rnd_9x21_Mag", "  30rnd 9mm", 725 },
			{ "11Rnd_45ACP_Mag", "  11rnd .45", 725 },
			{ "10Rnd_762x54_Mag", "  10rnd 7.62mm", 1225 },
			{ "20Rnd_762x51_Mag", "  20rnd 7.62mm", 1225 },
            { "30Rnd_45ACP_Mag_SMG_01_tracer_green", "  30rnd .45", 750 },
            { "200Rnd_65x39_cased_Box_Tracer", "  200rnd 6.5mm", 4650 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "  100rnd 6.5mm", 2050 },
            { "30Rnd_65x39_caseless_green", "  30rnd 6.5mm", 1025 },
            { "30Rnd_556x45_Stanag_Tracer_Yellow", "  30rnd 5.56mm", 1025 },
			{ "100Rnd_580x42_Mag_F", "100rnd 5.58mm", 1325 },
			{ "150Rnd_556x45_Drum_Mag_Tracer_F", "150rnd 5.56mm", 1325 },
			{ "200Rnd_556x45_Box_Red_F", "200rnd 5.56mm", 1325 },
			{ "20Rnd_650x39_Cased_Mag_F", "20rnd 6.39mm", 1325 },
			{ "30Rnd_545x39_Mag_Green_F", "30rnd 5.45mm", 1325 },	
            { "30Rnd_556x45_Stanag_green", "30rnd 5.45mm", 1325 },
			{ "30Rnd_556x45_Stanag_Tracer_Red", "30rnd 5.80mm", 1325 },
			{ "30Rnd_65x39_caseless_green_mag_Tracer", "30rnd 6.39mm", 1325 },
			{ "30Rnd_762x39_Mag_Green_F", "30rnd 7.62mm", 1325 },
            { "30Rnd_65x39_caseless_mag_Tracer", "  30rnd 6.5mm", 1020 }
        };
        accs[] = {
            { "optic_ACO_grn", "Aco", 3000 },
            { "optic_Holosight", "Holosight", 3000 },
            { "optic_Hamr", "Hamr", 9500 },
            { "optic_Holosight_smg", "Holosight Smg", 2000 },
            { "optic_MRCO", "Mrco", 12500 },
            { "optic_Arco", "Arco", 8500 },
            { "acc_pointer_IR", "Laser", 1000 },
            { "acc_flashlight", "Latarka", 8000 },
			{ "muzzle_snds_Lt", "  9mm", 6750 },
			{ "muzzle_snds_M", "  5.56mm", 8750 },
			{ "muzzle_snds_B", "  7.62mm", 18750 },
			{ "muzzle_snds_H", "  6.5mm", 12050 }
        };
    };
	
	class diamante {
        name = "Diamante Armas Shop";
        side = "civ";
        license = "gun";
        level[] = { "life_donorlevel", "SCALAR", 5, "Musisz być na poziomie Diament, aby uzyskać dostęp do sklepu, odwiedź nasze forum lub Teamspeak celach informacyjnych." };
		items[] = {
            { "FirstAidKit", "Apteczka", 250, 65 },
            { "hgun_Pistol_heavy_02_F", "ACP .45", 6000, 2500 },
			{ "hgun_Rook40_F", "Rook 9mm", 3000, 2500 },
            { "hgun_ACPC2_F", "ACP .45", 3050, 65 },
            { "arifle_TRG20_F", "TRG 5.56mm", 30000, 2500 },
			{ "arifle_TRG21_F", "TRG 5.56mm", 30000, 2500 },
            { "arifle_Katiba_F", "Katiba 6.5mm", 42000, 5000 },
            { "arifle_Katiba_C_F", "Katiba 6.5mm", 42000, 5000 },
            { "arifle_SDAR_F", "SDAR 5.56mm", 13000, 7500 },
            { "SMG_01_F", "Vermin SMG .45ACP", 18000, 7500 },
            { "arifle_Mk20_F", "Mk20 5.56mm", 28000, 7500 },
            { "arifle_Mk20C_F", "Mk20 5.56mm", 28000, 7500 },
            { "arifle_MXC_F", "MXC 6.5 mm", 48000, 7500 },
            { "arifle_MX_F", "MX 6.5 mm", 48000, 7500 },
            { "LMG_Mk200_F", "Mk200 6.5 mm", 86000, 7500 },
			{ "arifle_MX_SW_F", "MX SW 6.5 mm", 74000, 7500 },
			{ "arifle_MXM_F", "MXM 6.5 mm", 37000, 7500 },
			{ "srifle_EBR_F", "Mk18 ABR 7.62 mm", 85000, 7500 },
			{ "LMG_Zafir_F", "Zafir 7.62 mm", 471000, 7500 },
			{ "srifle_DMR_06_olive_F", "Mk14 7.62mm", 376000, 7500 },
			{ "srifle_DMR_03_khaki_F", "Mk-I EMR 7.62mm", 365000, 7500 },
			{ "srifle_DMR_01_F", "Rahim 7.62 mm", 254000, 7500 }
			
        };
        mags[] = {
            { "6Rnd_45ACP_Cylinder", "  9rnd .45", 725 },
			{ "30Rnd_9x21_Mag", "  30rnd 9mm", 725 },
			{ "11Rnd_45ACP_Mag", "  11rnd .45", 725 },
			{ "10Rnd_762x54_Mag", "  10rnd 7.62mm", 1225 },
			{ "20Rnd_762x51_Mag", "  20rnd 7.62mm", 1225 },
            { "30Rnd_45ACP_Mag_SMG_01_tracer_green", "  30rnd .45", 750 },
            { "200Rnd_65x39_cased_Box_Tracer", "  200rnd 6.5mm", 4650 },
			{ "150Rnd_762x54_Box_Tracer", "  150rnd 7.62mm", 6650 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "  100rnd 6.5mm", 2050 },
            { "30Rnd_65x39_caseless_green", "  30rnd 6.5mm", 1025 },
            { "30Rnd_556x45_Stanag_Tracer_Yellow", "  30rnd 5.56mm", 1025 },
            { "30Rnd_65x39_caseless_mag_Tracer", "  30rnd 6.5mm", 1020 }
        };
        accs[] = {
            { "optic_ACO_grn", "Aco", 3000 },
            { "optic_Holosight", "Holosight", 3000 },
            { "optic_Hamr", "Hamr", 9500 },
            { "optic_Holosight_smg", "Holosight Smg", 2000 },
            { "optic_MRCO", "Mrco", 12500 },
            { "optic_Arco", "Arco", 8500 },
			{ "optic_DMS", "DMS", 28500 },
			{ "optic_SOS", "SOS", 58500 },
            { "acc_pointer_IR", "Laser", 1000 },
            { "acc_flashlight", "Latarka", 8000 },
			{ "muzzle_snds_Lt", "  9mm", 4750 },
			{ "muzzle_snds_M", "  5.56mm", 6750 },
			{ "muzzle_snds_B", "  7.62mm", 15750 },
			{ "muzzle_snds_H", "  6.5mm", 9050 }
        };
       
    };

    class donator1 {
        name = "Donator 1 Shop";
        side = "civ";
        license = "rebel";
        level[] = { "life_donorlevel", "SCALAR", 1, "You need to be a donator level 1 to access this shop, join our teamspeak for information." };
        items[] = {
            { "FirstAidKit", "", 250, 65 },
            { "srifle_DMR_04_F", "", 135000, -1 },
            { "srifle_DMR_05_tan_f", "", 200000 },
            { "5Rnd_127x108_Mag", "", 2025 },
            { "150Rnd_93x64_Mag", "", 3025 },
            { "130Rnd_338_Mag", "", 4025 },
            { "10Rnd_338_Mag", "", 445 },
            { "10Rnd_93x64_DMR_05_Mag", "", 405 },
            { "RPG32_HE_F", "", 225000 }
        };
        mags[] = {
            { "5Rnd_127x108_Mag", "", 2025 },
            { "150Rnd_93x64_Mag", "", 3025 },
            { "130Rnd_338_Mag", "", 4025 },
            { "10Rnd_338_Mag", "", 445 },
            { "10Rnd_93x64_DMR_05_Mag", "", 405 },
            { "10Rnd_127x54_Mag", "", 405 },
            { "RPG32_HE_F", "", 125000 }
        };
        accs[] = {
            { "optic_ACO_grn", "", 3500 },
            { "optic_Holosight", "", 3600 },
            { "optic_Hamr", "", 10500 },
            { "optic_Holosight_smg", "", 2500 },
            { "optic_MRCO", "", 14500 },
            { "optic_Arco", "", 10500 },
            { "optic_KHS_blk", "", 22500 },
            { "optic_AMS", "", 23500 },
            { "optic_DMS", "", 17500 },
            { "optic_SOS", "", 22500 },
            { "optic_NVS", "", 28500 },
            { "optic_LRPS", "", 33500 },
            { "acc_pointer_IR", "", 1500 },
            { "acc_flashlight", "", 1000 }
        };
    };

    class donator2 {
        name = "Donator 2 Shop";
        side = "civ";
        license = "rebel";
        level[] = { "life_donorlevel", "SCALAR", 2, "You need to be a donator level 2 to access this shop, join our teamspeak for information." };
        items[] = {
            { "FirstAidKit", "", 250, 65 },
            { "srifle_DMR_04_F", "", 135000, -1 },
            { "MMG_02_camo_F", "", 250000, -1 },
            { "srifle_DMR_02_sniper_F", "", 180000, 7500 },
            { "srifle_DMR_05_tan_f", "", 200000 },
            { "APERSTripMine_Wire_Mag", "", 120000 },
            { "5Rnd_127x108_Mag", "", 2025 },
            { "150Rnd_93x64_Mag", "", 3025 },
            { "130Rnd_338_Mag", "", 4025 },
            { "10Rnd_338_Mag", "", 445 },
            { "10Rnd_93x64_DMR_05_Mag", "", 405 },
            { "RPG32_HE_F", "", 225000 }
        };
        mags[] = {
            { "5Rnd_127x108_Mag", "", 2025 },
            { "150Rnd_93x64_Mag", "", 3025 },
            { "130Rnd_338_Mag", "", 4025 },
            { "10Rnd_338_Mag", "", 445 },
            { "10Rnd_127x54_Mag", "", 405 },
            { "10Rnd_93x64_DMR_05_Mag", "", 405 },
            { "RPG32_HE_F", "", 125000 }
        };
        accs[] = {
            { "optic_ACO_grn", "", 3500 },
            { "optic_Holosight", "", 3600 },
            { "optic_Hamr", "", 10500 },
            { "optic_Holosight_smg", "", 2500 },
            { "optic_MRCO", "", 14500 },
            { "optic_Arco", "", 10500 },
            { "optic_KHS_blk", "", 22500 },
            { "optic_AMS", "", 23500 },
            { "optic_DMS", "", 17500 },
            { "optic_SOS", "", 22500 },
            { "optic_NVS", "", 28500 },
            { "optic_LRPS", "", 33500 },
            { "acc_pointer_IR", "", 1500 },
            { "acc_flashlight", "", 1000 }
        };
    };

    class donator3 {
        name = "Donator 3 Shop";
        side = "civ";
        license = "rebel";
        level[] = { "life_donorlevel", "SCALAR", 3, "You need to be a donator level 3 to access this shop, join our teamspeak for information." };
        items[] = {
            { "FirstAidKit", "", 250, 65 },
            { "srifle_DMR_04_F", "", 135000, -1 },
            { "MMG_01_hex_F", "", 250000, 5000 },
            { "MMG_02_camo_F", "", 315000, -1 },
            { "srifle_GM6_camo_F", "", 300000, 7500 },
            { "srifle_DMR_02_sniper_F", "", 180000, 7500 },
            { "srifle_DMR_05_tan_f", "", 200000 },
            { "launch_RPG32_F", "", 350000, -1 },
            { "APERSTripMine_Wire_Mag", "", 120000 },
            { "DemoCharge_Remote_Mag", "", 230000 },
            { "5Rnd_127x108_Mag", "", 2025 },
            { "150Rnd_93x64_Mag", "", 3025 },
            { "130Rnd_338_Mag", "", 4025 },
            { "10Rnd_338_Mag", "", 445 },
            { "10Rnd_93x64_DMR_05_Mag", "", 405 },
            { "RPG32_HE_F", "", 225000 }
        };
        mags[] = {
            { "5Rnd_127x108_Mag", "", 2025 },
            { "150Rnd_93x64_Mag", "", 3025 },
            { "130Rnd_338_Mag", "", 4025 },
            { "10Rnd_338_Mag", "", 445 },
            { "10Rnd_127x54_Mag", "", 405 },
            { "10Rnd_93x64_DMR_05_Mag", "", 405 },
            { "RPG32_HE_F", "", 125000 }
        };
        accs[] = {
            { "optic_ACO_grn", "", 3500 },
            { "optic_Holosight", "", 3600 },
            { "optic_Hamr", "", 10500 },
            { "optic_Holosight_smg", "", 2500 },
            { "optic_MRCO", "", 14500 },
            { "optic_Arco", "", 10500 },
            { "optic_KHS_blk", "", 22500 },
            { "optic_AMS", "", 23500 },
            { "optic_DMS", "", 17500 },
            { "optic_SOS", "", 22500 },
            { "optic_NVS", "", 28500 },
            { "optic_LRPS", "", 33500 },
            { "acc_pointer_IR", "", 1500 },
            { "acc_flashlight", "", 1000 }
        };
    };

    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "FirstAidKit", "Apteczka", 250, 65 },
            { "hgun_Pistol_heavy_02_F", "ACP .45", 30500, 2500 },
			{ "hgun_Rook40_FF", "Rook 9mm", 27500, 2500 },
            { "hgun_ACPC2_F", "ACP .45", 27250, 65 },
            { "arifle_TRG20_F", "TRG 5.56mm", 145000, 2500 },
			{ "arifle_TRG21_F", "TRG 5.56mm", 145000, 2500 },
            { "arifle_Katiba_F", "Katiba 6.5mm", 158000, 5000 },
            { "arifle_Katiba_C_F", "Katiba 6.5mm", 158000, 5000 },
            { "arifle_SDAR_F", "SDAR 5.56mm", 55000, 7500 },
            { "SMG_01_F", "Vermin SMG .45ACP", 32000, 7500 },
            { "arifle_Mk20_F", "Mk20 5.56mm", 70000, 7500 },
            { "arifle_Mk20C_F", "Mk20 5.56mm", 72000, 7500 },
            { "arifle_MXC_F", "MXC 6.5 mm", 165000, 7500 },
            { "arifle_MX_F", "MX 6.5 mm", 190000, 7500 },
			{ "srifle_EBR_F", "7.62 mm", 465000, 7500 },
            { "LMG_Mk200_F", "Mk200 6.5 mm", 415000, 7500 },
			{ "LMG_03_F", "LIM-85 5.56", 180000, 7500 },
			{ "arifle_AK12_F", "AK12 7.62 mm", 380000, 7500 },
			{ "arifle_AK12_GL_F", "AK12 GL 7.62", 400000, 7500 },
			{ "arifle_AKM_F", "AKM 7.62", 380000, 7500 },
			{ "arifle_AKS_F", "AKS-74U 5.45", 280000, 7500 },
			{ "arifle_ARX_blk_F", "Type 115 6.5 mm (Green Hex) mm", 220000, 7500 },
			{ "arifle_CTAR_blk_F", "CAR-95 5.8 mm (Black)", 220000, 7500 },
			{ "arifle_CTAR_GL_blk_F", "CAR-95 GL 5.8 mm (Black)", 280000, 7500 },
			{ "arifle_CTARS_blk_F", "CAR-95-1 5.8mm (Black)", 280000, 7500 },
			{ "arifle_SPAR_01_blk_F", "SPAR-16 5.56 mm (Khaki)", 200000, 7500 },
			{ "arifle_SPAR_01_GL_blk_F", "SPAR-16 GL 5.56 mm (Khaki)", 280000, 7500 },
			{ "LMG_Zafir_pointer_F", "Zafur 7.62 mm", 550000, 7500 },
			{ "srifle_DMR_01_F", "Rahim 7.62 mm", 475000, 7500 },
			{ "	launch_RPG32_F", "RPG-42 Alamut", 1075000, 7500 }
        };
        mags[] = {
			{ "6Rnd_45ACP_Cylinder", "  9rnd .45", 1725 },
			{ "30Rnd_9x21_Mag", "  30rnd 9mm", 1725 },
			{ "11Rnd_45ACP_Mag", "  11rnd .45", 1725 },
			{ "10Rnd_762x54_Mag", "  10rnd 7.62mm", 5725 },
            { "30Rnd_45ACP_Mag_SMG_01_tracer_green", "  30rnd .45", 2750 },
            { "200Rnd_65x39_cased_Box_Tracer", "  200rnd 6.5mm", 5950 },
            { "30Rnd_65x39_caseless_green", "  30rnd 6.5mm", 10825 },
            { "30Rnd_556x45_Stanag_Tracer_Yellow", "  30rnd 5.56mm", 3225 },
			{ "20Rnd_762x51_Mag", "  20rnd 7.62mm", 11225 },
			{ "150Rnd_762x54_Box_Tracer", "  150rnd 7.62mm", 11225 },
            { "30Rnd_65x39_caseless_mag_Tracer", "  30rnd 6.5mm", 9820 },
			{ "100Rnd_580x42_Mag_F", "100rnd 5.58mm", 23325 },
			{ "150Rnd_556x45_Drum_Mag_Tracer_F", "150rnd 5.56mm", 7325 },
			{ "200Rnd_556x45_Box_Red_F", "200rnd 5.56mm", 7325 },
			{ "20Rnd_650x39_Cased_Mag_F", "20rnd 6.39mm", 8325 },
			{ "30Rnd_545x39_Mag_Green_F", "30rnd 5.45mm", 4325 },	
            { "30Rnd_556x45_Stanag_green", "30rnd 5.56mm", 5325 },
			{ "30Rnd_556x45_Stanag_Tracer_Red", "30rnd 5.80mm", 11325 },
			{ "30Rnd_65x39_caseless_green_mag_Tracer", "30rnd 6.39mm", 11325 },
			{ "30Rnd_762x39_Mag_Green_F", "30rnd 7.62mm", 41325 },
			{ "RPG32_F", " RPG-42 Alamut", 1000820 }
        };
        accs[] = {
            { "optic_ACO_grn", "Aco", 23500 },
            { "optic_Holosight", "Holosight", 23600 },
            { "optic_Hamr", "Hamr", 30500 },
            { "optic_Holosight_smg", "Holosight Smg", 32500 },
            { "optic_MRCO", "Mrco", 44500 },
            { "optic_Arco", "Arco", 40500 },
			{ "optic_LRPS", "LPRS", 40500 },
			{ "muzzle_snds_M", " 5.56mm", 110750 },
			{ "muzzle_snds_H", " 6.5mm", 115050 },
			{ "muzzle_snds_B", "  7.62mm", 118750 },
            { "acc_pointer_IR", "Laser", 11500 },
            { "acc_flashlight", "Latarka", 11000 }
        };
    };

    class gang {
        name = "Hideout Armament";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
          { "FirstAidKit", "Apteczka", 550, 65 },
          { "hgun_Rook40_F", "Rook 9mm", 9500, 500 },
          { "hgun_Pistol_heavy_02_F", "Heavy .45", 11850, -1 },
          { "hgun_ACPC2_F", "ACP .45", 19500, -1 },
          { "hgun_PDW2000_F", "PDW2000 9 mm", 25000, -1 },
          { "SMG_02_F", "Sting 9 mm", 40000, -1 },
		  { "arifle_TRG20_F", "TRG 5.56mm", 283000, 2500 },
		  { "arifle_AKS_F", "AKS-74U 5.45", 230000, 7500 }
        };
        mags[] = {
          { "16Rnd_9x21_Mag", "  16rnd 9mm", 125 },
          { "6Rnd_45ACP_Cylinder", "  6rnd .45", 350 },
          { "9Rnd_45ACP_Mag", "  9rnd .45", 545 },
          { "30Rnd_9x21_Mag", "  16rnd 9mm", 675 },
          { "11Rnd_45ACP_Mag", "  11rnd .45", 960 },
		  { "30Rnd_556x45_Stanag_Tracer_Yellow", "  30rnd 5.56mm", 3225 },
		  { "30Rnd_545x39_Mag_Green_F", "30rnd 5.45mm", 4325 }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "Aco Smg", 950 },
			 { "optic_MRCO", "Mrco", 44500 }
        };
    };

    //Basic Shops
    class genstore {
        name = "Altis General Store";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Binocular", "Binoculos", 150, -1 },
            { "ItemGPS", "GPS", 1500, 45 },
            { "ItemMap", "Mapa", 50, 35 },
            { "ItemCompass", "Kompas", 50, 25 },
            { "ItemWatch", "Zegaros", 50, -1 },
            { "FirstAidKit", "Apteczka", 5550, 650 },
            { "NVGoggles", "Nokto", 6000, 980 },
            { "Chemlight_red", "", 300, -1 },
            { "Chemlight_yellow", "", 300, 50 },
            { "Chemlight_green", "", 300, 50 },
            { "Chemlight_blue", "", 300, 50 }
        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store {
        name = "Altis Fuel Station Store";
        side = "";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Binocular", "Binoculos", 5750, -1 },
            { "ItemGPS", "GPS", 1500, 45 },
            { "ItemMap", "Mapa", 250, 35 },
            { "ItemCompass", "Kompas", 250, 25 },
            { "ItemWatch", "Zegarek", 250, -1 },
            { "FirstAidKit", "Apteczka", 5750, 65 },
            { "NVGoggles", "Nokto", 10000, 980 },
            { "Chemlight_red", "", 1500, -1 },
            { "Chemlight_yellow", "", 1500, 50 },
            { "Chemlight_green", "", 1500, 50 },
            { "Chemlight_blue", "", 1500, 50 }
        };
        mags[] = {};
        accs[] = {};
    };

    //Cop Shops
    class cop_recruta {
        name = "Altis Recruta Shop";
        side = "cop";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "SMG_02_F", "Sting 9 mm", 15000, 750 },
			{ "PDW2000 9 mm", "Submachine 9x21 mm", 13000, 750 },
            { "hgun_P07_snds_F", "Pistola Tazer", 200, 60 },
            { "hgun_P07_F", "P07 9mm", 750, 150 },
            { "NVGoggles", "Nokto", 200, 90 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "  16rnd 9mm", 25 },
			{ "30Rnd_9x21_Mag", "  30rnd 9mm", 25 },
            { "30Rnd_65x39_caseless_mag_Tracer", "Stun Magazine", 45 }
        };
        accs[] = {
            { "acc_pointer_IR", "Laser", 1660 },
            { "optic_Holosight", "Holosight", 1120, 20 },
			{ "acc_flashlight", "Latarka", 120, 20 },
			{ "optic_Aco", "Aco", 120, 20 },
			{ "ItemGPS", "", 100, 45 },
            { "Binocular", "", 150, -1 },
            { "FirstAidKit", "", 50, 65 },
            { "Medikit", "", 55, 35 },
            { "NVGoggles", "", 120, 80 },
			{ "ItemMap", "Mapa", 50, 35 }
        };
    };

    class cop_soldado {
        name = "Altis Soldado Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 2, "Musisz być żołnierzem!" };
        items[] = {
            
			{ "arifle_TRG21_F", "TRG-21 5.56 mm", 15000, 750 },
			{ "SMG_05_F", "TRG-21 5.56 mm", 15000, 750 },
			{ "arifle_TRG20_F", "TRG-20 5.56 mm", 15000, 750 },
			{ "arifle_Mk20_F", "Mk20 5.56 mm", 15000, 750 },
			{ "arifle_Mk20C_F", "Mk20C 5.56 mm", 15000, 750 },
			{ "arifle_SPAR_01_khk_F", "AKS-74U 5.45", 15000, 750 },
            { "SMG_02_F", "Sting 9 mm", 14000, 750 },
			{ "PDW2000 9 mm", "Submachine 9x21 mm", 12000, 750 },
            { "hgun_P07_snds_F", "Tazer", 200, 60 },
            { "hgun_P07_F", "P07 9mm", 750, 150 },
            { "FirstAidKit", "Apteczka", 50, 5 },
            { "NVGoggles", "Nokto", 200, 90 },
			{ "ItemMap", "Mapa", 50, 35 }
        };
        mags[] = {
            { "30Rnd_65x39_caseless_mag_Tracer", "Stun Magazine 30rnd", 45 },
            { "16Rnd_9x21_Mag", "  16rnd 9mm", 25 },
			{ "30Rnd_9x21_Mag", "  30rnd 9mm", 25 },
			{ "30Rnd_9x21_Mag_SMG_02", "  30rnd 9mm", 25 },
			{ "150Rnd_556x45_Drum_Mag_F", "  150rnd 5.56mm", 25 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "  30rnd 5.56mm", 25 }
        };
        accs[] = {
            { "acc_flashlight", "Latarka", 750 },
            { "optic_Holosight", "Holosight", 120 },
            { "optic_Arco", "Arco", 250 },
            { "acc_pointer_IR", "Laser", 275 }
        };
    };

    class cop_cabo {
        name = "Altis Cabo Officer Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 3, "Musisz być ? żołnierzem!" };
        items[] = {
           
			{ "arifle_TRG21_F", "TRG-21 5.56 mm", 13000, 750 },
			{ "arifle_TRG20_F", "TRG-20 5.56 mm", 13000, 750 },
			{ "LMG_Mk200_F", "Mk200 6.5 mm", 50000, 750 },
		
			{ "arifle_Mk20C_F", "Mk20C 5.56 mm", 13000, 750 },
			
            { "SMG_02_F", "Sting 9 mm", 11000, 750 },
			{ "PDW2000 9 mm", "Submachine 9x21 mm", 10000, 750 },
            { "hgun_P07_snds_F", "Pistola Tazer", 2500, 60 },
            { "hgun_P07_F", "P07 9mm", 4750, 150 },
            { "FirstAidKit", "Apteczka", 50, 5 },
            { "NVGoggles", "Nokto", 200, 90 },
			{ "ItemMap", "Mapa", 50, 35 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "  16rnd 9mm", 25 },
			{ "30Rnd_9x21_Mag", "  30rnd 9mm", 25 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "  30rnd 5.56mm", 25 },
			
			{ "200Rnd_65x39_cased_Box_Tracer", "  200rnd 6.5mm", 25 },
			{ "150Rnd_556x45_Drum_Mag_F", "  150rnd 5.6mm", 25 },
            { "30Rnd_65x39_caseless_mag_Tracer", "  30rnd 6.5mm", 10 }
        };
        accs[] = {
            { "acc_flashlight", "Latarka", 750 },
            { "optic_Holosight", "Holosight", 120 },
            { "optic_Arco", "Arco", 250 },
            { "acc_pointer_IR", "Laser", 275 },
			{ "optic_MRCO", "Mrco", 275 },
			{ "optic_Hamr", "Hamr", 275 }
        };
    };

    class cop_SWAT {
        name = "Altis SWAT Shop";
        side = "cop";
        license = "swat";
        level[] = { "life_coplevel", "SCALAR", 3, "Musisz być sierżantem Swat!" };
        items[] = {
            { "arifle_MXC_Black_F", "Rifle Tazer", 10000, 750 },
			{ "srifle_GM6_F", "", 335500, -1 },
            { "LMG_Zafir_F", "", 55000, -1 },
			{ "arifle_CTAR_GL_khk_F", "", 65000, -1 },
			{ "arifle_MX_GL_Black_F", "", 65000, -1 },
			{ "srifle_EBR_ACO_F", "", 65000, -1 },
			{ "srifle_DMR_07_ghex_F", "", 65000, -1 },
            { "srifle_DMR_01_SOS_F", "", 85000, -1 },
            { "launch_RPG32_F", "", 150000, -1 },
            { "HandGrenade_Stone", "Flashbang", 170, -1 },
            { "optic_MRCO", "", 1450 },
            { "optic_Arco", "", 1050 },
            { "optic_KHS_blk", "", 2250 },
            { "optic_AMS", "", 12350 },
            { "optic_DMS", "", 11750 },
			{ "optic_ERCO_khk_F", "", 11750 },
            { "optic_SOS", "", 12250 },
            { "optic_NVS", "", 12850 },
            { "muzzle_snds_B", "", 1275 },
			{ "muzzle_snds_H_MG_khk_F", "", 1275 },
			{ "muzzle_snds_65_TI_ghex_F", "", 1275 },
			{ "muzzle_snds_B_snd_F", "", 1275 },
            { "bipod_01_F_blk", "", 11250 },
            { "bipod_02_F_blk", "", 11200 },
            { "bipod_03_F_blk", "", 11250 },
            { "1Rnd_SmokeGreen_Grenade_shell", "Tear Gas", 150 },
            { "RPG32_HE_F", "", 15000 }
        };
        mags[] = {
            { "5Rnd_127x108_Mag", "", 100 },
            { "150Rnd_762x54_Box_Tracer", "", 40 },
			{ "100Rnd_580x42_Mag_F", "", 40 },
			{ "10Rnd_762x54_Mag", "", 2140 },
			{ "20Rnd_762x51_Mag", "", 1140 },
			{ "20Rnd_650x39_Cased_Mag_F", "", 1140 },
			{ "30Rnd_65x39_caseless_mag_Tracer", "  30rnd 6.5mm", 10 },
			{ "20Rnd_762x51_Mag", "", 1140 },
            { "10Rnd_762x54_Mag", "", 5300 }
        };
        accs[] = {
            { "optic_Arco", "", 250 },
            { "optic_MRCO", "", 350, -1 },
			{ "muzzle_snds_B", "", 275 }
        };
    };

    class cop_sargento {
        name = "Altis Sargento Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 4, "Musisz być Sierżantem!" };
        items[] = {
            { "arifle_MXC_Black_F", "Rifle Tazer", 8000, 750 },
			{ "arifle_TRG21_F", "TRG-21 5.56 mm", 12000, 750 },
			{ "arifle_TRG20_F", "TRG-20 5.56 mm", 12000, 750 },
			{ "LMG_Mk200_F", "Mk200 6.5 mm", 48000, 750 },
			{ "arifle_MXC_F", "MXC 6.5 mm", 18000, 750 },
			{ "arifle_MXM_Black_F", "MXM 6.5 mm", 18000, 750 },
			{ "arifle_MX_SW_Black_F", "MX 6.5 mm", 48000, 750 },
			{ "arifle_MX_Black_F", "MX 6.5 mm", 18000, 750 },
			{ "arifle_Mk20_F", "Mk20 5.56 mm", 12000, 750 },
			{ "arifle_Mk20C_F", "Mk20C 5.56 mm", 12000, 750 },
            { "SMG_02_F", "Sting 9 mm", 10000, 750 },
			{ "PDW2000 9 mm", "Submachine 9x21 mm", 9000, 750 },
            { "hgun_P07_snds_F", "Pistola Tazer", 1500, 60 },
            { "hgun_P07_F", "P07 9mm", 3750, 150 },
            { "FirstAidKit", "Apteczka", 50, 5 },
            { "Rangefinder", "Rangefinder", 12200, 90 },
			{ "ItemMap", "Mapa", 50, 35 }
			
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "  16rnd 9mm", 25 },
			{ "30Rnd_9x21_Mag", "  30rnd 9mm", 25 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "  30rnd 5.56mm", 25 },
			{ "200Rnd_65x39_cased_Box_Tracer", "  200rnd 6.5mm", 25 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "  100rnd 6.5mm", 25 },
            { "30Rnd_65x39_caseless_mag_Tracer", "  30rnd 6.5mm", 10 }
        };
        accs[] = {
            { "acc_flashlight", "Latarka", 750 },
            { "optic_Holosight", "Holosight", 120 },
            { "optic_Arco", "Arco", 250 },
            { "acc_pointer_IR", "Laser", 275 },
			{ "optic_MRCO", "Mrco", 275 },
			{ "optic_DMS", "DMS", 275 },
			{ "optic_Hamr", "Hamr", 275 },
			{ "muzzle_snds_Lt", "  9mm", 750 },
			{ "muzzle_snds_M", "  5.56mm", 750 }
        };
    };

    class cop_tenente {
        name = "Altis Tenente Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 5, "Musisz być Porucznikiem!" };
        items[] = {
            { "arifle_MXC_Black_F", "Rifle Tazer", 80000, 750 },
			{ "arifle_TRG21_F", "TRG-21 5.56 mm", 11000, 750 },
			{ "arifle_TRG20_F", "TRG-20 5.56 mm", 11000, 750 },
			{ "LMG_Mk200_F", "Mk200 6.5 mm", 45000, 750 },
			{ "arifle_MXC_F", "MXC 6.5 mm", 17000, 750 },
			{ "arifle_MXM_Black_F", "MXM 6.5 mm", 17000, 750 },
			{ "arifle_MX_SW_Black_F", "MX 6.5 mm", 45000, 750 },
			{ "srifle_EBR_F", "Mk18 ABR 7.62 mm", 45000, 750 },
			{ "arifle_MX_Black_F", "MX 6.5 mm", 17000, 750 },
			{ "arifle_Mk20_F", "Mk20 5.56 mm", 11000, 750 },
			{ "arifle_Mk20C_F", "Mk20C 5.56 mm", 11000, 750 },
            { "SMG_02_F", "Sting 9 mm", 9000, 750 },
			{ "PDW2000 9 mm", "Submachine 9x21 mm", 9000, 750 },
            { "hgun_P07_snds_F", "Pistola Tazer", 1500, 60 },
            { "hgun_P07_F", "P07 9mm", 3750, 150 },
            { "FirstAidKit", "Apteczka", 50, 5 },
            { "Rangefinder", "Rangefinder", 12200, 90 },
			{ "ItemMap", "Mapa", 50, 35 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "  16rnd 9mm", 25 },
			{ "30Rnd_9x21_Mag", "  30rnd 9mm", 25 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "  30rnd 5.56mm", 25 },
			{ "200Rnd_65x39_cased_Box_Tracer", "  200rnd 6.5mm", 25 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "  100rnd 6.5mm", 25 },
			{ "20Rnd_762x51_Mag", "  20rnd 7.62mm", 25 },
            { "30Rnd_65x39_caseless_mag_Tracer", "  30rnd 6.5mm", 10 }
        };
        accs[] = {
            { "acc_flashlight", "Latarka", 750 },
            { "optic_Holosight", "Holosight", 120 },
            { "optic_Arco", "Arco", 250 },
            { "acc_pointer_IR", "Laser", 275 },
			{ "optic_MRCO", "Mrco", 275 },
			{ "optic_DMS", "DMS", 275 },
			{ "optic_Hamr", "Hamr", 275 },
			{ "muzzle_snds_Lt", "  9mm", 750 },
			{ "muzzle_snds_M", "  5.56mm", 750 },
			{ "muzzle_snds_H", "  6.5mm", 750 }
        };
    };
	
	class cop_capitao {
        name = "Altis Capitão Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 6, "Musisz być Kapitanem!" };
        items[] = {
            { "arifle_MXC_Black_F", "Rifle Tazer", 8000, 750 },
			{ "arifle_TRG21_F", "TRG-21 5.56 mm", 10000, 750 },
			{ "arifle_TRG20_F", "TRG-20 5.56 mm", 10000, 750 },
			{ "LMG_Mk200_F", "Mk200 6.5 mm", 40000, 750 },
			{ "arifle_MXC_F", "MXC 6.5 mm", 16000, 750 },
			{ "arifle_MXM_Black_F", "MXM 6.5 mm", 16000, 750 },
			{ "arifle_MX_SW_Black_F", "MX 6.5 mm", 40000, 750 },
			{ "srifle_EBR_F", "Mk18 ABR 7.62 mm", 45000, 750 },
			{ "arifle_MX_Black_F", "MX 6.5 mm", 16000, 750 },
			{ "arifle_Mk20_F", "Mk20 5.56 mm", 10000, 750 },
			{ "arifle_Mk20C_F", "Mk20C 5.56 mm", 10000, 750 },
            { "SMG_02_F", "Sting 9 mm", 8000, 750 },
			{ "PDW2000 9 mm", "Submachine 9x21 mm", 8000, 750 },
            { "hgun_P07_snds_F", "Pistola Tazer", 1500, 60 },
            { "hgun_P07_F", "P07 9mm", 3750, 150 },
            { "FirstAidKit", "Apteczka", 50, 5 },
            { "Rangefinder", "Rangefinder", 12200, 90 },
			{ "ItemMap", "Mapa", 50, 35 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "  16rnd 9mm", 25 },
			{ "30Rnd_9x21_Mag", "  30rnd 9mm", 25 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "  30rnd 5.56mm", 25 },
			{ "200Rnd_65x39_cased_Box_Tracer", "  200rnd 6.5mm", 25 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "  100rnd 6.5mm", 25 },
			{ "20Rnd_762x51_Mag", "  20rnd 7.62mm", 25 },
            { "30Rnd_65x39_caseless_mag_Tracer", "  30rnd 6.5mm", 10 }
        };
        accs[] = {
            { "acc_flashlight", "Latarka", 750 },
            { "optic_Holosight", "Holosight", 120 },
            { "optic_Arco", "Arco", 250 },
            { "acc_pointer_IR", "Laser", 275 },
			{ "optic_MRCO", "Mrco", 275 },
			{ "optic_DMS", "DMS", 275 },
			{ "optic_Hamr", "Hamr", 275 },
			{ "muzzle_snds_Lt", "  9mm", 750 },
			{ "muzzle_snds_M", "  5.56mm", 750 },
			{ "muzzle_snds_H", "  6.5mm", 750 }
        };
    };
	
	class cop_major {
        name = "Altis Major Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 7, "Musisz być Majorem!" };
        items[] = {
            { "arifle_MXC_Black_F", "Rifle Tazer", 7000, 750 },
			{ "arifle_TRG21_F", "TRG-21 5.56 mm", 9000, 750 },
			{ "arifle_TRG20_F", "TRG-20 5.56 mm", 9000, 750 },
			{ "LMG_Mk200_F", "Mk200 6.5 mm", 35000, 750 },
			{ "arifle_MXC_F", "MXC 6.5 mm", 15000, 750 },
			{ "arifle_MXM_Black_F", "MXM 6.5 mm", 15000, 750 },
			{ "arifle_MX_SW_Black_F", "MX 6.5 mm", 35000, 750 },
			{ "srifle_EBR_F", "Mk18 ABR 7.62 mm", 40000, 750 },
			{ "arifle_MX_Black_F", "MX 6.5 mm", 16000, 750 },
			{ "arifle_Mk20_F", "Mk20 5.56 mm", 9000, 750 },
			{ "arifle_Mk20C_F", "Mk20C 5.56 mm", 9000, 750 },
            { "SMG_02_F", "Sting 9 mm", 7000, 750 },
			{ "srifle_DMR_06_camo_F", "Mk14 7.62mm", 65000, 750 },
			{ "PDW2000 9 mm", "Submachine 9x21 mm", 7000, 750 },
            { "hgun_P07_snds_F", "Pistola Tazer", 1500, 60 },
            { "hgun_P07_F", "P07 9mm", 3750, 150 },
            { "FirstAidKit", "Apteczka", 50, 5 },
            { "Rangefinder", "Rangefinder", 12200, 90 },
			{ "ItemMap", "Mapa", 50, 35 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "  16rnd 9mm", 25 },
			{ "30Rnd_9x21_Mag", "  30rnd 9mm", 25 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "  30rnd 5.56mm", 25 },
			{ "200Rnd_65x39_cased_Box_Tracer", "  200rnd 6.5mm", 25 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "  100rnd 6.5mm", 25 },
			{ "20Rnd_762x51_Mag", "  20rnd 7.62mm", 25 },
            { "30Rnd_65x39_caseless_mag_Tracer", "  30rnd 6.5mm", 10 }
        };
        accs[] = {
            { "acc_flashlight", "Latarka", 750 },
            { "optic_Holosight", "Holosight", 120 },
            { "optic_Arco", "Arco", 250 },
            { "acc_pointer_IR", "Laser", 275 },
			{ "optic_MRCO", "Mrco", 275 },
			{ "optic_DMS", "DMS", 275 },
			{ "optic_Hamr", "Hamr", 275 },
			{ "muzzle_snds_Lt", "  9mm", 750 },
			{ "muzzle_snds_M", "  5.56mm", 750 },
			{ "muzzle_snds_B", "  7.62mm", 750 },
			{ "muzzle_snds_H", "  6.5mm", 750 }
        };
    };
	
class cop_tenente_coronel {
        name = "Altis Major Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 8, "Musisz być Majorem!" };
        items[] = {
            { "arifle_MXC_Black_F", "Rifle Tazer", 7000, 750 },
			{ "arifle_TRG21_F", "TRG-21 5.56 mm", 9000, 750 },
			{ "arifle_TRG20_F", "TRG-20 5.56 mm", 9000, 750 },
			{ "LMG_Mk200_F", "Mk200 6.5 mm", 35000, 750 },
			{ "arifle_MXC_F", "MXC 6.5 mm", 15000, 750 },
			{ "arifle_MXM_Black_F", "MXM 6.5 mm", 15000, 750 },
			{ "arifle_MX_SW_Black_F", "MX 6.5 mm", 35000, 750 },
			{ "srifle_EBR_F", "Mk18 ABR 7.62 mm", 40000, 750 },
			{ "srifle_DMR_06_camo_F", "Mk14 7.62mm", 65000, 750 },
			{ "arifle_MX_Black_F", "MX 6.5 mm", 16000, 750 },
			{ "arifle_Mk20_F", "Mk20 5.56 mm", 9000, 750 },
			{ "arifle_Mk20C_F", "Mk20C 5.56 mm", 9000, 750 },
            { "SMG_02_F", "Sting 9 mm", 7000, 750 },
			{ "srifle_DMR_03_F", "Mk-I EMR 7.62mm", 65000, 750 },
			{ "launch_O_Titan_ghex_F", "Titan MPRL (Green Hex)mm", 165000, 750 },
			{ "PDW2000 9 mm", "Submachine 9x21 mm", 7000, 750 },
            { "hgun_P07_snds_F", "Tazer", 1500, 60 },
            { "hgun_P07_F", "P07 9mm", 3750, 150 },
            { "FirstAidKit", "Apteczka", 50, 5 },
            { "Rangefinder", "Rangefinder", 12200, 90 },
			{ "ItemMap", "Mapa", 50, 35 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "  16rnd 9mm", 25 },
			{ "30Rnd_9x21_Mag", "  30rnd 9mm", 25 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "  30rnd 5.56mm", 25 },
			{ "200Rnd_65x39_cased_Box_Tracer", "  200rnd 6.5mm", 25 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "  100rnd 6.5mm", 25 },
			{ "20Rnd_762x51_Mag", "  20rnd 7.62mm", 25 },
            { "30Rnd_65x39_caseless_mag_Tracer", "  30rnd 6.5mm", 10 },
			{ "M_Titan_AA", "  AA", 1000 }
        };
        accs[] = {
            { "acc_flashlight", "Latarka", 750 },
            { "optic_Holosight", "Holosight", 120 },
            { "optic_Arco", "Arco", 250 },
            { "acc_pointer_IR", "Laser", 275 },
			{ "optic_MRCO", "Mrco", 275 },
			{ "optic_DMS", "DMS", 275 },
			{ "optic_Hamr", "Hamr", 275 },
			{ "muzzle_snds_Lt", "  9mm", 750 },
			{ "muzzle_snds_B", "  7.62mm", 750 },
			{ "muzzle_snds_M", "  5.56mm", 750 },
			{ "muzzle_snds_H", "  6.5mm", 750 }
        };
    };
	
	class cop_coronel {
        name = "Altis Major Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 9, "Musisz być Majorem!" };
        items[] = {
            { "arifle_MXC_Black_F", "Rifle Tazer", 7000, 750 },
			{ "arifle_TRG21_F", "TRG-21 5.56 mm", 9000, 750 },
			{ "arifle_TRG20_F", "TRG-20 5.56 mm", 9000, 750 },
			{ "LMG_Mk200_F", "Mk200 6.5 mm", 35000, 750 },
			{ "arifle_MXC_F", "MXC 6.5 mm", 15000, 750 },
			{ "LMG_Zafir_F", "Zafir 7.62 mm", 100000, 750 },
			{ "arifle_MXM_Black_F", "MXM 6.5 mm", 15000, 750 },
			{ "arifle_MX_SW_Black_F", "MX 6.5 mm", 35000, 750 },
			{ "srifle_EBR_F", "Mk18 ABR 7.62 mm", 40000, 750 },
			{ "srifle_DMR_06_camo_F", "Mk14 7.62mm", 65000, 750 },
			{ "arifle_MX_Black_F", "MX 6.5 mm", 16000, 750 },
			{ "arifle_Mk20_F", "Mk20 5.56 mm", 9000, 750 },
			{ "arifle_Mk20C_F", "Mk20C 5.56 mm", 9000, 750 },
            { "SMG_02_F", "Sting 9 mm", 7000, 750 },
			{ "srifle_DMR_03_F", "Mk-I EMR 7.62mm", 65000, 750 },
			{ "PDW2000 9 mm", "Submachine 9x21 mm", 7000, 750 },
            { "hgun_P07_snds_F", "Tazer", 1500, 60 },
            { "hgun_P07_F", "P07 9mm", 3750, 150 },
            { "FirstAidKit", "Apteczka", 50, 5 },
            { "Rangefinder", "Rangefinder", 12200, 90 },
			{ "ItemMap", "Mapa", 50, 35 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "  16rnd 9mm", 25 },
			{ "30Rnd_9x21_Mag", "  30rnd 9mm", 25 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "  30rnd 5.56mm", 25 },
			{ "200Rnd_65x39_cased_Box_Tracer", "  200rnd 6.5mm", 25 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "  100rnd 6.5mm", 25 },
			{ "20Rnd_762x51_Mag", "  20rnd 7.62mm", 25 },
            { "30Rnd_65x39_caseless_mag_Tracer", "  30rnd 6.5mm", 10 }
        };
        accs[] = {
            { "acc_flashlight", "Latarka", 750 },
            { "optic_Holosight", "Holosight", 120 },
            { "optic_Arco", "Arco", 250 },
            { "acc_pointer_IR", "Laser", 275 },
			{ "optic_MRCO", "Mrco", 275 },
			{ "optic_DMS", "DMS", 275 },
			{ "optic_Hamr", "Hamr", 275 },
			{ "muzzle_snds_Lt", "  9mm", 750 },
			{ "muzzle_snds_B", "  7.62mm", 750 },
			{ "muzzle_snds_M", "  5.56mm", 750 },
			{ "muzzle_snds_H", "  6.5mm", 750 }
        };
    };
	
    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemGPS", "", 100, 45 },
            { "Binocular", "", 150, -1 },
            { "FirstAidKit", "", 50, 65 },
            { "Medikit", "", 55, 35 },
			{ "toolkit", "", 55, 35 },
            { "NVGoggles", "", 120, 80 },
			{ "ItemMap", "Mapa", "toolkit", "fuelFull","", 50, 35 }
        };
        mags[] = {};
        accs[] = {};
    };
};