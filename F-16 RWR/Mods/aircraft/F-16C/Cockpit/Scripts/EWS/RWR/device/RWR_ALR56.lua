dofile(LockOn_Options.common_script_path..'AN_ALR_SymbolsBase.lua')

local gettext = require("i_18n")
_ = gettext.translate

device_timer_dt     = 0.2
MaxThreats          = 16
EmitterLiveTime     = 11
EmitterSoundTime    = 0.5
LaunchSoundDelay    = 15.0

RWR_detection_coeff = 0.85

symbols = 
{
    {MiG_23_,       "23"},
    {MiG_29_,       "29"},
    {MIG_29K_,      "29"},
    {MiG_29G_,      "29"},
    {MiG_29C_,      "29"},
    {Su_27_,        "27"},
    {Su_33_,        "27"},
    {F_14_,         "14"},
    {F_15_,         "15"},
	{F_15E_,        "15"},
    {F_16_,         "16"},
    {F_16A_,        "16"},
    {F_2_,          "F2"},
    {Su_30_,        "30"},
    {FA_18_,        "18"},
    {FA_18C_,       "18"},
    {Su_34_,        "30"},
    {Mirage_,       "M2"},
    {F_4E_,         "F4"},
    {F_5E_,         "F5"},
    {Su_24_,        "24"},
    {Su_24MR_,      "24"},
    {AV_8B_,        "AV"},
    {EA_6B_,        "E6"},
    {F_111_,        "11"},
    {Tu_160_,       "BJ"},
    {B_1_,          "B1"},
    {Tu_22M3_,      "22"},
    {MiG_25P_,      "25"},
    {MiG_31_,       "31"},
    {Tu_95_,        "95"},
    {Tu_142_,       "Tu"},
    {B_52_,         "52"},
    {A_50_,         "50"},
    {E_3_,          "E3"},
    {S_3A_,         "S3"},
    {S_3R_,         "S3"},
    {E_2C_,         "E2"},
    {C_17_,         "17"},
    {C_130_,        "13"},
    {IL_76_,        "76"},
    {AN_26B_,       "AN"},
    {AN_30M_,       "AN"},
    {KC_10_,        "KC"},
    {KC_135_,       "KC"},
    {IL_78_,        "78"},
    {Su_39_,        "39"},
    {EWR_1L13_,             "S"},
    {EWR_55G6_,             "S"},
    {S300PS_SR_5N66M,       "CS"},
    {S300PS_SR_64H6E,       "BB"},
    {RLO_9C15MT_,           "BD"},
    {RLO_9C19M2_,           "HS"},
    {Buk_SR_9S18M1,         "SD"},
    {Kub_STR_9S91,          "06"},
    {Dog_Ear,               "DE"},
    {Roland_rdr,            "GR"},
    {Patriot_STR_ANMPQ_53,  "PT"},
    {Hawk_SR_ANMPQ_50,      "HA"},
    {S300PS_TR_30N6,        "10"},
    {RLS_5H63C,             "10"},
    {RLS_9C32_1_,           "12"},
    {Hawk_TR_ANMPQ_46,      "HK"},
    {S300V_9A82_,           "12"},
    {S300V_9A83,            "12"},
    {Buk_LN_9A310M1,        "11"},
    {BUK_LL_,               "11"},
    {Osa_9A33,              "08"},
    {Strela_9A35M3,         "13"},
    {Tor_9A331,             "15"},
    {Roland_ADS,            "RO"},
    {Tunguska_2S6,          "S6"},
    {ZSU_23_4_Shilka,       "A"},
    {Gepard,                "A"},
    {Vulcan_M163,           "A"},
    {Kuznecow_,             "SW"},
    {VINSON_,               "48"},
    {MOSCOW_,               "T2"},
    {GROZNY_,               "HN"},
    {AZOV_,                 "TS"},
    {ALBATROS_,             "HP"},
    {AMETYST_,              "SC"},
    {OREL_,                 "HN"},
    {REZKY_,                "TP"},
    {PERRY_,                "49"},
    {OSA_,                  "DT"},
    {MOLNIYA_,              "PS"},
    {SKORY_,                "HN"},
    {SPRUANCE_,             "40"},
    {TICONDEROGA_,          "AE"},
    {BORA_,                 "CD"},
    {BOBRUISK_,             "CD"},
    {VETER_,                "PP"},
    {NEUSTRASH_,            "TP"},
    {MICA_R_,               "M"},
    {P_27AE_,               "M"},
    {P_77_,                 "M"},
    {P_37_,                 "M"},
    {AIM_54_,               "M"},
    {AIM_120_,              "M"},
    {AIM_120C_,             "M"},
    {S125_SR_P_19,          "FF"},--P-19 		   - "Flat Face" radar (FF),
    {S125_TR_SNR,           "LB"},--SNR S-125 Neva - "Low Blow" radar (LB). 
} 

symbols_strings = {
	['MiG-19P']			= '19',
	['MiG-21Bis']		= '21',
	['F-5E-3']			= 'F5',
	['M-2000C']			= 'M2',
	['F-16C_50']		= '16',
	['FA-18C_hornet']	= '18',
	['AJS37']			= '37',
	['J-11A']			= '11',
	['KJ-2000']			= '50',
	['JF-17']			= '17',
	['HQ-7_LN_SP']		= '7',
	['HQ-7_STR_SP']		= 'HQ',
	['PL-12']			= 'M',
	['SD-10']			= 'M',
	
	['052B']			= '52',
	['052C']			= '52',
	['054A']			= '54',
	
	['rapier_fsa_blindfire_radar'] = 'RS',
	['rapier_fsa_launcher']		   = 'RT',
	['SNR_75V']					   = 'FS',--SAM SA-2 TR SNR-75 Fan Song
	['Hawk cwar']				   = 'HK',
	
	['Stennis']			= '48',
	['LHA_Tarawa']		= '48',
	['CVN_71']			= '48',
	['CVN_72']			= '48',
	['CVN_73']			= '48',
	
	['F-14A']		 = '14',
	['F-14B']		 = '14',
	['F-14D']		 = '14',
	['AIM_54A_Mk60'] = 'M',
	['AIM_54A_Mk47'] = 'M',
	
	['SH-60B'] = '60',
}

-- sounds for radars
--SoundsPath = "Aircrafts/F-16C/Cockpit/RWR/"
SoundsPath = "C:/Users/kayak/Desktop/F-16 RWR/Sounds/Effects/Aircrafts/F-16C/Cockpit/RWR"
 DefaultGuidedSnd = SoundsPath .. "LockNewUS"
 DefaultSearchSnd = SoundsPath .. "LockNewUS"
 DefaultOnboardSnd = SoundsPath .. "LockNewUS"
 DefaultCannonSnd = SoundsPath .. "LockNewUS"

acquisition_sounds = 
{
    {EWR_1L13_,             DefaultSearchSnd},
    {EWR_55G6_,             DefaultSearchSnd},
	{S300PS_SR_5N66M,       DefaultSearchSnd},
    {S300PS_SR_64H6E,       DefaultSearchSnd},
    {RLO_9C15MT_,           DefaultSearchSnd},
    {RLO_9C19M2_,           DefaultSearchSnd},
    {Buk_SR_9S18M1,         DefaultSearchSnd},
    {Kub_STR_9S91,          DefaultSearchSnd},
    {Dog_Ear,               DefaultSearchSnd},
    {Roland_rdr,            DefaultSearchSnd},
    {Patriot_STR_ANMPQ_53,  DefaultSearchSnd},
    {Hawk_SR_ANMPQ_50,      DefaultSearchSnd},
    {S300PS_TR_30N6,        DefaultSearchSnd},
    {RLS_5H63C_,            DefaultSearchSnd},
    {RLS_9C32_1_,           DefaultSearchSnd},
    {Hawk_TR_ANMPQ_46,      DefaultSearchSnd},
    {S300V_9A82_,           DefaultSearchSnd},
    {S300V_9A83,            DefaultSearchSnd},
    {Buk_LN_9A310M1,         SoundsPath .. "SA-11Lock"},
    {BUK_LL_,                SoundsPath .. "SA-11Lock"},
    {Osa_9A33,              DefaultSearchSnd},
    {Tor_9A331,             DefaultSearchSnd},
    {Roland_ADS,            DefaultSearchSnd},
    {Tunguska_2S6,          DefaultSearchSnd},
    {ZSU_23_4_Shilka,       DefaultSearchSnd},
    {Gepard,                DefaultSearchSnd},
    {Vulcan_M163,           DefaultSearchSnd},
	{S125_SR_P_19,          DefaultSearchSnd},
    {S125_TR_SNR,         	DefaultSearchSnd},
	{DEFAULT_TYPE_,         DefaultSearchSnd},
}

DefaultLockSnd = SoundsPath .. "LockNewUS"

lock_sounds = 
{
    {EWR_1L13_,             SoundsPath .. "SpoonRest"},
    {EWR_55G6_,             SoundsPath .. "TallKing"},
    {S300PS_SR_5N66M,       SoundsPath .. "ClamShell"},
    {S300PS_SR_64H6E,       SoundsPath .. "BigBird"},
    {RLO_9C15MT_,           DefaultLockSnd},
    {RLO_9C19M2_,           DefaultLockSnd},
    {Buk_SR_9S18M1,         SoundsPath .. "SnowDrift"},
    {Kub_STR_9S91,          SoundsPath .. "SA-6Lock"},
    {Dog_Ear,               SoundsPath .. "DogEar"},
    {Roland_rdr,            DefaultLockSnd},
    {Patriot_STR_ANMPQ_53,  SoundsPath .. "PatriotLock"},
    {Hawk_SR_ANMPQ_50,      SoundsPath .. "HawkSearchLock"},
    {S300PS_TR_30N6,        DefaultLockSnd},
    {RLS_5H63C_,            SoundsPath .. "KSAM"}, --KSAM
    {RLS_9C32_1_,           SoundsPath .. "KSAM"}, --KSAM
    {Hawk_TR_ANMPQ_46,      SoundsPath .. "HawkLock"},
    {S300V_9A82_,           DefaultLockSnd},
    {S300V_9A83,            DefaultLockSnd},
    {Buk_LN_9A310M1,        SoundsPath .. "SA-11Lock"},
    {BUK_LL_,               SoundsPath .. "SA-11Lock"},
    {Osa_9A33,              SoundsPath .. "SA-8Lock"},
    {Tor_9A331,             SoundsPath .. "SA-15Lock"},
    {Roland_ADS,            DefaultLockSnd},
    {Tunguska_2S6,          SoundsPath .. "KSAM"}, --KSAM
    {ZSU_23_4_Shilka,       SoundsPath .. "Shilka"}, --Firecan
    {Gepard,                SoundsPath .. "Gepard"}, --2s6
    {Vulcan_M163,           SoundsPath .. "KSAM"}, --KSAM
	{S125_SR_P_19,          SoundsPath .. "FlatFace"},
    {S125_TR_SNR,         	SoundsPath .. "SA-3Lock"},
    {DEFAULT_TYPE_,         DefaultLockSnd},    
}



-- RWR sensors: F-16C has four sensors - 2 on nose and 2 in tail
eyes ={}

eyes[1] =
{
    position      = {x = 6.7,y = -0.1,z =  0.35},
    orientation   = {azimuth  = math.rad(45),elevation = math.rad(0.0)},
    field_of_view = math.rad(120) 
}
eyes[2] =
{
    position      = {x = 6.7,y = -0.1,z = 0.35},
    orientation   = {azimuth  = math.rad(-45),elevation = math.rad(0.0)},
    field_of_view = math.rad(120) 
}
eyes[3] =
{
    position      = {x = -5.5,y = 0.15,z =  0.6},
    orientation   = {azimuth  = math.rad(135),elevation = math.rad(0.0)},
    field_of_view = math.rad(120) 
}
eyes[4] =
{
    position      = {x = -5.5,y = 0.15,z =  -0.6},
    orientation   = {azimuth  = math.rad(-135),elevation = math.rad(0.0)},
    field_of_view = math.rad(120) 
}

AN_ALR56_FAILURE_SENSOR_NOSE_RIGHT = 0
AN_ALR56_FAILURE_SENSOR_NOSE_LEFT  = 1
AN_ALR56_FAILURE_SENSOR_TAIL_RIGHT = 2
AN_ALR56_FAILURE_SENSOR_TAIL_LEFT  = 3
AN_ALR56_FAILURE_TOTAL         = 4

Damage = {  {Failure = AN_ALR56_FAILURE_SENSOR_NOSE_RIGHT,	Failure_name =  "AN_ALR56_FAILURE_SENSOR_NOSE_RIGHT",	Failure_editor_name = _("AN/ALR-56 sensor nose right"),	Element = 0,  Integrity_Treshold = 0.0,  work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300},
			{Failure = AN_ALR56_FAILURE_SENSOR_NOSE_LEFT,	Failure_name =  "AN_ALR56_FAILURE_SENSOR_NOSE_LEFT",	Failure_editor_name = _("AN/ALR-56 sensor tail right"),	Element = 0,  Integrity_Treshold = 0.25, work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300},
			{Failure = AN_ALR56_FAILURE_SENSOR_TAIL_RIGHT,	Failure_name =  "AN_ALR56_FAILURE_SENSOR_TAIL_RIGHT",	Failure_editor_name = _("AN/ALR-56 sensor tail left"),	Element = 55, Integrity_Treshold = 0.5,  work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300},
			{Failure = AN_ALR56_FAILURE_SENSOR_TAIL_LEFT,	Failure_name =  "AN_ALR56_FAILURE_SENSOR_TAIL_LEFT",	Failure_editor_name = _("AN/ALR-56 sensor nose left"),	Element = 55, Integrity_Treshold = 0.5,  work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300},
			{Failure = AN_ALR56_FAILURE_TOTAL,				Failure_name =  "AN_ALR56_FAILURE_TOTAL",				Failure_editor_name = _("AN/ALR-56 total failure"),		Element = 4,  Integrity_Treshold = 0.0,  work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300}}

need_to_be_closed = true -- close lua state after initialization 
