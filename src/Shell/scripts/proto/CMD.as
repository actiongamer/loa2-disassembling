package proto
{
   public final class CMD
   {
      
      public static const NONE:int = 0;
      
      public static const HEART_BEAT:int = 1;
      
      public static const PROTOCOL_STATUS:int = 2;
      
      public static const BATTLE_ERROR_NOTI:int = 3;
      
      public static const TEST:int = 4;
      
      public static const LOGIN:int = 2001;
      
      public static const CREATE_PLAYER:int = 2002;
      
      public static const PLAYER_INFO_NOTIFY:int = 2003;
      
      public static const RANDOM_NAME:int = 2004;
      
      public static const GET_PLAYER_ONLINE_DATA:int = 2005;
      
      public static const WEAR_CHANGE_NOTIFY:int = 2006;
      
      public static const SYSTEM_TIME_NOTIFY:int = 2007;
      
      public static const ONLINE_SCENE_NOTIFY:int = 2008;
      
      public static const PLAYER_LEVEL_VIP_INFO_NOTIFY:int = 2009;
      
      public static const P_T_CHAT_PLAYER_INFO:int = 2010;
      
      public static const SYSTEM_SETTINGS:int = 2011;
      
      public static const SYSTEM_SETTINGS_NOTIFY:int = 2012;
      
      public static const BATTLE_SVR_CLOSE_NOTIFY:int = 2013;
      
      public static const P_T_CHAT_EXTRA_NOTIFY:int = 2014;
      
      public static const CLIENT_LOAD_FINISH:int = 2015;
      
      public static const TEAM_CREATE:int = 2020;
      
      public static const TEAM_CREATE_NOTIFY:int = 2021;
      
      public static const TEAM_LIST:int = 2022;
      
      public static const TEAM_KICK:int = 2023;
      
      public static const TEAM_KICK_NOTIFY:int = 2024;
      
      public static const TEAM_ENTER:int = 2025;
      
      public static const TEAM_ENTER_NOTIFY:int = 2026;
      
      public static const TEAM_GET_INFO:int = 2027;
      
      public static const TEAM_INFO_NOTIFY:int = 2028;
      
      public static const TEAM_PANEL_CLOSE:int = 2029;
      
      public static const TEAM_LEAVE:int = 2030;
      
      public static const TEAM_LEAVE_NOTIFY:int = 2031;
      
      public static const TEAM_SETTING:int = 2032;
      
      public static const TEAM_REPLY:int = 2033;
      
      public static const TEAM_REPLY_NOTIFY:int = 2034;
      
      public static const TEAM_COUNT_CHANGE_NOTIFY:int = 2035;
      
      public static const TEAM_AUTO:int = 2036;
      
      public static const TEAM_MEMBER_SYN_NOTIFY:int = 2037;
      
      public static const TEAM_INVITED_NOTIFY:int = 2038;
      
      public static const TEAM_MEM_INFO_NOTIFY:int = 2039;
      
      public static const TEAM_READY:int = 2040;
      
      public static const TEAM_PWD:int = 2041;
      
      public static const TEAM_CHANGEHERO:int = 2042;
      
      public static const TEAM_START:int = 2043;
      
      public static const TEAM_BU_ZHEN:int = 2044;
      
      public static const TEAM_BUZHEN_NOTIFY:int = 2045;
      
      public static const TEAM_DISMISS:int = 2046;
      
      public static const TEAM_DISMISS_NOTIFY:int = 2047;
      
      public static const TEAM_STOP:int = 2048;
      
      public static const TEAM_STOP_NOTIFY:int = 2049;
      
      public static const TEAM_CHANGE_NAME:int = 2054;
      
      public static const TEAM_START_NOTIFY:int = 2055;
      
      public static const BATTLE_ACTION_NOTIFY:int = 2050;
      
      public static const BATTLE_MANUAL:int = 2051;
      
      public static const BATTLE_TEST:int = 2052;
      
      public static const BATTLE_TEST_START_NOTIFY:int = 2053;
      
      public static const GUAJI_PLAY_START:int = 2060;
      
      public static const TOWER_INFO:int = 2190;
      
      public static const TOWER_RANK:int = 2191;
      
      public static const TOWER_JUMP:int = 2192;
      
      public static const TOWER_SCORE_REWARD:int = 2193;
      
      public static const TOWER_RANK_REWARD:int = 2194;
      
      public static const TOWER_BUY:int = 2195;
      
      public static const QQ_ADDGOODS:int = 2100;
      
      public static const QQ_NEW_GIFT:int = 2101;
      
      public static const QQ_DAY_NORMAL_GIFT:int = 2102;
      
      public static const QQ_DAY_HIGH_GIFT:int = 2103;
      
      public static const QQ_LEVEL_GIFT:int = 2104;
      
      public static const QQ_GIFT_INFO:int = 2105;
      
      public static const QQ_GET_TOKEN:int = 2106;
      
      public static const QQ_Gift_GET:int = 2107;
      
      public static const QQ_DAY_INVITE_REWARD_INFO:int = 2108;
      
      public static const QQ_GET_DAY_INVITE_REWARD:int = 2109;
      
      public static const FUNCTION_OPEN_TIME_NOTIFY:int = 4101;
      
      public static const FUNCTION_TIMES_NOTIFY:int = 4102;
      
      public static const NORMAL_BAG:int = 4010;
      
      public static const EQUIP_BAG:int = 4020;
      
      public static const BAG_ITEM_SELL:int = 4021;
      
      public static const BAG_ITEM_USE:int = 4022;
      
      public static const SHOW_ITEM:int = 4023;
      
      public static const ARENA_INFO:int = 4030;
      
      public static const ARENA_CHALLENGE:int = 4031;
      
      public static const ARENA_CLEAR_CD:int = 4032;
      
      public static const ARENA_CLEAR_CD_DIAMOND:int = 4033;
      
      public static const ARENA_BUY_TIMES:int = 4034;
      
      public static const ARENA_SET_MANIFESTO:int = 4035;
      
      public static const ARENA_CHANGE_ENEMY:int = 4036;
      
      public static const ARENA_GET_RANK_REWARD:int = 4037;
      
      public static const ARENA_GET_RANK_LIST:int = 4038;
      
      public static const ARENA_REPORT_INFO:int = 4039;
      
      public static const ARENA_MULTI_CHALLENGE:int = 4040;
      
      public static const ARENA_LEAVE:int = 4041;
      
      public static const ARENA_REPORT_NOTIFY:int = 4042;
      
      public static const COMPETE_INFO:int = 4050;
      
      public static const COMPETE_PLAYER_DISPLAY:int = 4051;
      
      public static const COMPETE_STAGE_INFO:int = 4052;
      
      public static const COMPETE_GROUP_STAGE_INFO:int = 4053;
      
      public static const COMPETE_STATUS_TIME_NOTIFY:int = 4054;
      
      public static const COMPETE_GAMBLE_INFO:int = 4055;
      
      public static const COMPETE_GAMBLE:int = 4056;
      
      public static const COMPETE_GAMBLE_REWARD:int = 4057;
      
      public static const COMPETE_GAMBLE_REWARD_NOTIFY:int = 4058;
      
      public static const COMPETE_PLAYER_RANK_INFO:int = 4059;
      
      public static const COMPETE_GET_RANK_REWARD:int = 4060;
      
      public static const COMPETE_OPEN_TIME:int = 4061;
      
      public static const SEVEN_DAY_INFO:int = 4070;
      
      public static const SEVEN_DAY_GET_REWARD:int = 4071;
      
      public static const SEVEN_DAY_NOTIFY:int = 4072;
      
      public static const SEVEN_DAY_TIME_STAMP:int = 4073;
      
      public static const SEVEN_DAY_SHOP_SELL_OUT_NOTIFY:int = 4074;
      
      public static const SEVEN_DAY_AVAI_NUM:int = 4075;
      
      public static const PLAYER_FIRST_BATTLE:int = 4080;
      
      public static const BG_INFO:int = 4200;
      
      public static const BG_TEAM_INFO:int = 4201;
      
      public static const BG_TEAM_NEW_MEM_NOTIFY:int = 4202;
      
      public static const BG_TEAM_MEM_INFO_NOTIFY:int = 4203;
      
      public static const BG_REG:int = 4204;
      
      public static const BG_REG_NOTIFY:int = 4205;
      
      public static const BG_LEAVE:int = 4206;
      
      public static const BG_LEAVE_NOTIFY:int = 4207;
      
      public static const BG_BTL_LEAVE_NOTIFY:int = 4208;
      
      public static const BG_START_NOTIFY:int = 4209;
      
      public static const BG_ENTER:int = 4210;
      
      public static const BG_CHECK:int = 4211;
      
      public static const BG_TEAM_DISMISS_NOTIFY:int = 4212;
      
      public static const BG_TIMEOUT_LEAVE_NOTIFY:int = 4213;
      
      public static const BG_FRIENDS_LIST:int = 4214;
      
      public static const BG_FAMILY_MEMBER_LIST:int = 4215;
      
      public static const BG_FIGHT:int = 4216;
      
      public static const BG_FIGHT_NOTIFY:int = 4217;
      
      public static const BG_GATHER:int = 4218;
      
      public static const BG_GATHER_NOTIFY:int = 4219;
      
      public static const BG_STAGE_ENTER_NOTIFY:int = 4220;
      
      public static const BG_STAGE_NEW_ENTER_NOTIFY:int = 4221;
      
      public static const BG_DEAD_NOTIFY:int = 4222;
      
      public static const BG_REBORN_NOTIFY:int = 4223;
      
      public static const BG_PLAYER_STATUS_NOTIFY:int = 4224;
      
      public static const BG_SCENE_MOVE:int = 4225;
      
      public static const BG_SCENE_MOVE_NOTIFY:int = 4226;
      
      public static const BG_RES_STATUS_NOTIFY:int = 4227;
      
      public static const BG_STAGE_GET_REPORT:int = 4228;
      
      public static const BG_CRY_STAGE_INFO_NOTIFY:int = 4229;
      
      public static const BG_STAGE_END_NOTIFY:int = 4230;
      
      public static const BG_STAGE_LEAVE:int = 4231;
      
      public static const BG_STAGE_LEAVE_NOTIFY:int = 4232;
      
      public static const BG_GATHER_STATUS_NOTIFY:int = 4233;
      
      public static const BG_GET_TITLE_REWARD:int = 4234;
      
      public static const BG_GET_TITLE_REWARD_INFO:int = 4235;
      
      public static const BG_GET_RANK_INFO:int = 4236;
      
      public static const BG_FIRE_STAGE_INFO_NOTIFY:int = 4237;
      
      public static const BG_PLACE_FLAG_NOTIFY:int = 4238;
      
      public static const BG_FIGHT_NPC:int = 4239;
      
      public static const BG_FIGHT_NPC_NOTIFY:int = 4240;
      
      public static const BK_INFO:int = 4250;
      
      public static const BK_REG:int = 4251;
      
      public static const BK_REG_NOTIFY:int = 4252;
      
      public static const BK_LEAVE:int = 4253;
      
      public static const BK_LEAVE_NOTIFY:int = 4254;
      
      public static const BK_BTL_LEAVE_NOTIFY:int = 4255;
      
      public static const BK_START_NOTIFY:int = 4256;
      
      public static const BK_ENTER:int = 4257;
      
      public static const BK_CHECK:int = 4258;
      
      public static const BK_TIMEOUT_LEAVE_NOTIFY:int = 4259;
      
      public static const BK_FIGHT:int = 4260;
      
      public static const BK_FIGHT_NOTIFY:int = 4261;
      
      public static const BK_STAGE_ENTER_NOTIFY:int = 4262;
      
      public static const BK_STAGE_NEW_ENTER_NOTIFY:int = 4263;
      
      public static const BK_DEAD_NOTIFY:int = 4264;
      
      public static const BK_REBORN_NOTIFY:int = 4265;
      
      public static const BK_PLAYER_STATUS_NOTIFY:int = 4266;
      
      public static const BK_SCENE_MOVE:int = 4267;
      
      public static const BK_SCENE_MOVE_NOTIFY:int = 4268;
      
      public static const BK_RES_STATUS_NOTIFY:int = 4269;
      
      public static const BK_STAGE_GET_REPORT:int = 4270;
      
      public static const BK_STAGE_END_NOTIFY:int = 4271;
      
      public static const BK_STAGE_LEAVE:int = 4272;
      
      public static const BK_STAGE_LEAVE_NOTIFY:int = 4273;
      
      public static const BK_GAME_STAGE_INFO_NOTIFY:int = 4274;
      
      public static const BK_GAME_STEP_NOTIFY:int = 4275;
      
      public static const BK_SPECIAL_COMMAND:int = 4276;
      
      public static const BK_SPECIAL_COMMAND_NOTIFY:int = 4277;
      
      public static const CROSS_SCENE_MOVE:int = 4300;
      
      public static const CROSS_SCENE_MOVE_NOTIFY:int = 4301;
      
      public static const CARD_INFO_NOTIFY:int = 4302;
      
      public static const CROSS_ARENA_INFO:int = 4310;
      
      public static const CROSS_ARENA_FIGHT:int = 4311;
      
      public static const CROSS_ARENA_CHANGE_ENEMY:int = 4313;
      
      public static const CROSS_ARENA_BOX_STATUS_NOTIFY:int = 4314;
      
      public static const CROSS_ARENA_RANK_INFO:int = 4315;
      
      public static const CROSS_ARENA_SOME_DATA_NOTIFY:int = 4316;
      
      public static const CROSS_ARENA_GET_LAYER_BOX:int = 4317;
      
      public static const CROSS_ARENA_CHEER_INFO:int = 4318;
      
      public static const CROSS_ARENA_CHEER:int = 4319;
      
      public static const CROSS_ARENA_FINAL_FIGHT:int = 4320;
      
      public static const CROSS_ARENA_GET_REPORT:int = 4321;
      
      public static const CROSS_ARENA_DIST_CHEER:int = 4322;
      
      public static const CROSS_ARENA_HONOR_HALL:int = 4323;
      
      public static const CROSS_ARENA_UPDATE_FINAL_ENEMY:int = 4324;
      
      public static const FAMILY_EXPE_INFO:int = 4350;
      
      public static const FAMILY_EXPE_START:int = 4351;
      
      public static const FAMILY_EXPE_START_NOTIFY:int = 4352;
      
      public static const FAMILY_EXPE_CHALLENGE_INFO:int = 4353;
      
      public static const FAMILY_EXPE_FIGHT_START:int = 4354;
      
      public static const FAMILY_EXPE_FIGHT_END:int = 4355;
      
      public static const FAMILY_EXPE_SURRENDER:int = 4356;
      
      public static const FAMILY_EXPE_FIGHT:int = 4358;
      
      public static const FAMILY_EXPE_GET_CON_RANK:int = 4359;
      
      public static const FAMILY_EXPE_END_NOTIFY:int = 4360;
      
      public static const FAMILY_EXPE_RECEIVE_TASK:int = 4361;
      
      public static const FAMILY_EXPE_TASK_NOTIFY:int = 4362;
      
      public static const FAMILY_EXPE_CROSS_RANK:int = 4363;
      
      public static const FAMILY_EXPE_FAMILY_PLAYER_RANK:int = 4365;
      
      public static const FAMILY_EXPE_SINGLE_RANK:int = 4366;
      
      public static const FAMILY_EXPE_BATTLE_INFO:int = 4364;
      
      public static const FAMILY_EXPE_LAST_CHAMPION:int = 4367;
      
      public static const FAMILY_EXPE_CHAMPION_THRONE:int = 4368;
      
      public static const FAMILY_EXPE_BATTLE_REPORT:int = 4369;
      
      public static const FAMILY_EXPE_DATA_NOTIFY:int = 4370;
      
      public static const CUSTOM_TEST:int = 4444;
      
      public static const LUCK_TREE_INFO:int = 7457;
      
      public static const LUCK_TREE_CHEER:int = 7458;
      
      public static const LUCK_TREE_BUY:int = 7459;
      
      public static const LUCK_TREE_GET_REWARD:int = 7460;
      
      public static const LUCK_TREE_WORLD_EXP_NOTIFY:int = 7461;
      
      public static const LUCK_TREE_DAJIANG_NOTIFY:int = 7462;
      
      public static const ZHUAN_PAN_INFO:int = 7450;
      
      public static const ZHUAN_PAN_COMMON:int = 7451;
      
      public static const ZHUAN_PAN_SUPER:int = 7452;
      
      public static const ZHUAN_PAN_BUY:int = 7453;
      
      public static const ZHUAN_PAN_GET_STATIC:int = 7454;
      
      public static const ZHUAN_PAN_RANK_DATA:int = 7455;
      
      public static const ZHUAN_PAN_DAJIANG:int = 7456;
      
      public static const LOTTERY_INFO:int = 4000;
      
      public static const LOTTERY_GET_REWARD:int = 7200;
      
      public static const LOTTERY:int = 4001;
      
      public static const LOTTERY_SUPERRAND:int = 3000;
      
      public static const LOTTERY_TEST:int = 3001;
      
      public static const LOTTERY_ADDITEM_TEST:int = 3002;
      
      public static const PLAYER_MOVE:int = 7000;
      
      public static const PLAYER_MOVE_NOTIFY:int = 7001;
      
      public static const PLAYER_BOSS_ZHAO_HUAN:int = 7090;
      
      public static const PLAYER_BOSS_ZHAO_HUAN_FREE_TIME:int = 7091;
      
      public static const PLAYER_RES_STAGE_FIGHT_END:int = 7005;
      
      public static const PLAYER_MILITARYRANK_UPGRADE:int = 7012;
      
      public static const PLAYER_MILITARYRANK_INFO:int = 7017;
      
      public static const PLAYER_FRIEND_SEARCH:int = 7013;
      
      public static const PLAYER_FRIEND_RECOMMEND:int = 7014;
      
      public static const PLAYER_FRIEND_QIE_CHUO:int = 7015;
      
      public static const PLAYER_FRIEND_NEXT:int = 7016;
      
      public static const PLAYER_FRIEND_APPLY:int = 7024;
      
      public static const PLAYER_FRIEND_APPLY_NOTIFY:int = 7020;
      
      public static const PLAYER_DELETE_FRIEND:int = 7036;
      
      public static const PLAYER_DELETE_FRIEND_NOTIFY:int = 7037;
      
      public static const PLAYER_ADD_TO_HEI_MING_DAN:int = 7038;
      
      public static const PLAYER_REMOVE_HEI_MING_DAN:int = 7039;
      
      public static const PLAYER_FRIENDS_INFO:int = 7048;
      
      public static const PLAYER_ALL_INFO:int = 7050;
      
      public static const PLAYER_SEE_FRIEND_INFO:int = 7055;
      
      public static const PLAYER_CLEAR_ALL_INFO:int = 7054;
      
      public static const PLAYER_ONLINE_NOTIFY:int = 7051;
      
      public static const PLAYER_OFFLINE_NOTIFY:int = 7052;
      
      public static const PLAYER_APPLY_AGREE_PI_LIANG:int = 7056;
      
      public static const PLAYER_APPLY_REFUSE_PI_LIANG:int = 7058;
      
      public static const PLAYER_APPLY_AGREE:int = 7063;
      
      public static const PLAYER_APPLY_AGREE_NOTIFY:int = 7062;
      
      public static const PLAYER_APPLY_REFUSE:int = 7064;
      
      public static const PLAYER_APPLY_REFUSE_NOTIFY:int = 7065;
      
      public static const PLAYER_FRIEND_CHAT:int = 7066;
      
      public static const PLAYER_FRIEND_CHAT_NOTIFY:int = 7067;
      
      public static const PLAYER_APPLY_PI_LIANG:int = 7068;
      
      public static const FRIEND_CONGRATULATE:int = 7069;
      
      public static const FRIEND_CONGRATULATE_ALL:int = 7309;
      
      public static const FRIEND_CONGRATULATE_NOTIFY:int = 7300;
      
      public static const FRIEND_TRENDS:int = 7301;
      
      public static const FRIEND_DONATE_STAMINA:int = 7302;
      
      public static const FRIEND_DONATE_STAMINA_NOTIFY:int = 7303;
      
      public static const FRIEND_SIGNATURE:int = 7304;
      
      public static const FRIEND_SIGNATURE_NOTIFY:int = 7305;
      
      public static const FRIEND_STAMINA_GET:int = 7306;
      
      public static const FRIEND_STAMINA_GET_ALL:int = 7307;
      
      public static const FRIEND_DONATE_STAMINA_ALL:int = 7308;
      
      public static const FRIEND_TREND_NOTIFY:int = 7310;
      
      public static const FRIEND_DAILY_INFO_CLEAR_NOTIFY:int = 7311;
      
      public static const FRIEND_STAMINA_INFO:int = 7312;
      
      public static const PLAYER_ACTIVATE_SADDLE_HORSE:int = 7070;
      
      public static const PLAYER_USE_SADDLE_HORSE:int = 7071;
      
      public static const PLAYER_UNUSE_SADDLE_HORSE:int = 7072;
      
      public static const PLAYER_CHANGE_SADDLE_HORSE:int = 7073;
      
      public static const PLAYER_CHANGE_GLORY:int = 7075;
      
      public static const PLAYER_GET_SADDLE_HORSES:int = 7077;
      
      public static const PLAYER_GET_GLORIES:int = 7079;
      
      public static const PLAYER_GET_CURRENT_GLORY:int = 7081;
      
      public static const PLAYER_GET_CURRENT_SADDLE_HORSE:int = 7083;
      
      public static const PLAYER_SADDLE_HORSE_YAN_JIU:int = 7085;
      
      public static const PLAYER_SADDLE_HORSE_YAN_JIU_ONE_KEY:int = 7087;
      
      public static const PLAYER_SADDLE_HORSE_UPGRADE:int = 7088;
      
      public static const SADDLE_HORSE_NOTIFY:int = 7089;
      
      public static const FAMILY_BOSS_INFO:int = 7170;
      
      public static const FAMILY_BOSS_SET_NEXT_START_TIME:int = 7171;
      
      public static const FAMILY_BOSS_BUY_GULI:int = 7172;
      
      public static const FAMILY_BOSS_HURT_INFO:int = 7173;
      
      public static const FAMILY_BOSS_MODEL_SET:int = 7174;
      
      public static const FAMILY_BOSS_RELIVE:int = 7175;
      
      public static const FAMILY_BOSS_JOIN_FIGHT_START:int = 7176;
      
      public static const FAMILY_BOSS_JOIN_FIGHT_END:int = 7177;
      
      public static const FAMILY_BOSS_MEMBER_RELIVE_NOTIFY:int = 7178;
      
      public static const FAMILY_BOSS_MEMBER_DEAD_NOTIFY:int = 7179;
      
      public static const FAMILY_BOSS_NEXT_START_TIME_NOTIFY:int = 7180;
      
      public static const FAMILY_BOSS_START_EVENT_NOTIFY:int = 7181;
      
      public static const FAMILY_BOSS_TOP_RANK_NOTIFY:int = 7182;
      
      public static const FAMILY_BOSS_NEXT_WAVE_NOTIFY:int = 7183;
      
      public static const FAMILY_BOSS_INFO_NOTIFY:int = 7184;
      
      public static const FAMILY_BOSS_BOSS_RELIVE_NOTIFY:int = 7185;
      
      public static const FAMILY_BOSS_BOSS_BUFF_NOTIFY:int = 7186;
      
      public static const FAMILY_BOSS_HURT_REWARD:int = 7187;
      
      public static const FAMILY_BOSS_QUICK_FIGHT_START:int = 7188;
      
      public static const FAMILY_BOSS_SUPPER_RANK:int = 7189;
      
      public static const WORLD_BOSS_INFO:int = 7500;
      
      public static const WORLD_BOSS_HURT_INFO:int = 7503;
      
      public static const WORLD_BOSS_MEMBER_RELIVE_NOTIFY:int = 7508;
      
      public static const WORLD_BOSS_MEMBER_DEAD_NOTIFY:int = 7509;
      
      public static const WORLD_BOSS_START_EVENT_NOTIFY:int = 7511;
      
      public static const WORLD_BOSS_TOP_RANK_NOTIFY:int = 7512;
      
      public static const WORLD_BOSS_NEXT_WAVE_NOTIFY:int = 7513;
      
      public static const WORLD_BOSS_HURT_REWARD:int = 7517;
      
      public static const WORLD_BOSS_QUICK_FIGHT_START:int = 7518;
      
      public static const WORLD_BOSS_INFO_NOTIFY:int = 7514;
      
      public static const WORLD_BOSS_JOIN_FIGHT_START:int = 7515;
      
      public static const WORLD_BOSS_MODEL_SET:int = 7516;
      
      public static const FAMILY_STAGE_CHAPTER_SELECT:int = 7144;
      
      public static const FAMILY_STAGE_GET_REWARD:int = 7145;
      
      public static const FAMILY_STAGE_CHAPTER_SELECT_NOTIFY:int = 7146;
      
      public static const FAMILY_STAGE_GET_REWARD_NOTIFY:int = 7147;
      
      public static const FAMILY_STAGE_REWARD_INFO:int = 7148;
      
      public static const FAMILY_STAGE_RECORD:int = 7149;
      
      public static const FAMILY_STAGE_ENTER_CHAPTER:int = 7150;
      
      public static const FAMILY_STAGE_FIGHT_START:int = 7151;
      
      public static const FAMILY_STAGE_FIGHT_END:int = 7152;
      
      public static const FAMILY_STAGE_YU_KOU_START:int = 7153;
      
      public static const FAMILY_STAGE_YU_KOU_END:int = 7154;
      
      public static const FAMILY_STAGE_HURT_RANK:int = 7155;
      
      public static const FAMILY_STAGE_HPS_NOTIFY:int = 7156;
      
      public static const FAMILY_STAGE_RESET_NOTIFY:int = 7157;
      
      public static const FAMILY_STAGE_FIGHT_START_NOTIFY:int = 7158;
      
      public static const FAMILY_STAGE_FIGHT_END_NOTIFY:int = 7159;
      
      public static const FAMILY_STAGE_NODE_RANK:int = 7160;
      
      public static const FAMILY_STAGE_BUY_TIMES:int = 7161;
      
      public static const FAMILY_STAGE_TIMES_NOTIFY:int = 7162;
      
      public static const FAMILY_STAGE_YU_KOU_SAO_DANG:int = 7163;
      
      public static const HERO_PRACTICE_INFO:int = 7201;
      
      public static const HERO_PRACTICE_ENTER_NODE:int = 7202;
      
      public static const HERO_PRACTICE_FIGHT_START:int = 7203;
      
      public static const HERO_PRACTICE_FIGHT_END:int = 7204;
      
      public static const HERO_PRACTICE_TIMES_NOTIFY:int = 7205;
      
      public static const HERO_PRACTICE_RESET_NOTIFY:int = 7206;
      
      public static const HERO_PRACTICE_SAO_DANG:int = 7207;
      
      public static const MOBILE_CHECK_GET_CODE:int = 7320;
      
      public static const MOBILE_CHECK:int = 7321;
      
      public static const MOBILE_CHECK_GET_REWARD:int = 7322;
      
      public static const WEIXIN_GET_REWARD_NOTIFY:int = 7323;
      
      public static const WEIXIN_GET_REWARD:int = 7324;
      
      public static const FAMILY_TECH_INFO:int = 7401;
      
      public static const FAMILY_TECH_RESEARCH:int = 7402;
      
      public static const FAMILY_TECH_STUDY:int = 7403;
      
      public static const FAMILY_TECH_RESEARCH_NOTIFY:int = 7404;
      
      public static const ACTIVATE_CODE:int = 7405;
      
      public static const SUPER_SALE_INFO:int = 7410;
      
      public static const SUPER_SALE_GET_REWARD:int = 7411;
      
      public static const SUPER_SALE_BUY_ITEM:int = 7412;
      
      public static const SUPER_SALE_ALL_COUNT_NOTIFY:int = 7413;
      
      public static const SUPER_SALE_RECHARGE_EXTRA_REWARD_NOTIFY:int = 7414;
      
      public static const SUPER_SALE_RESET_NOTIFY:int = 7421;
      
      public static const OPEN_FUND_INFO:int = 7415;
      
      public static const OPEN_FUND_BUY_FUND:int = 7416;
      
      public static const OPEN_FUND_GET_FUND_REWARD:int = 7417;
      
      public static const OPEN_FUND_GET_WELFARE:int = 7418;
      
      public static const OPEN_FUND_WELFARE_NOTIFY:int = 7419;
      
      public static const PRIVILEGE_WEI_SHI_CHECK:int = 7420;
      
      public static const SOUGOU_GET_REWARD:int = 7423;
      
      public static const SOUGOU_INPUT_GET_REWARD:int = 7422;
      
      public static const DUOWAN_NEWER_CARD:int = 7424;
      
      public static const SHUN_WANG_GET_REWARD:int = 7434;
      
      public static const FUNCTION_ACTION_NOTIFY:int = 7425;
      
      public static const SHEN_GRID_INFO:int = 7426;
      
      public static const SHEN_GRID_CLICK:int = 7427;
      
      public static const SHEN_GRID_CHOOSE:int = 7428;
      
      public static const JUE_ROAD_INFO:int = 7429;
      
      public static const JUE_ROAD_FIGHT_START:int = 7430;
      
      public static const JUE_ROAD_FIGHT_END:int = 7431;
      
      public static const JUE_ROAD_SAO_DANG:int = 7432;
      
      public static const JUE_ROAD_GET_REWARD:int = 7433;
      
      public static const JUE_ROAD_RECORD:int = 7438;
      
      public static const OPEN_CHALLENGE_INFO:int = 7436;
      
      public static const OPEN_CHALLENGE_GET_REWARD:int = 7435;
      
      public static const OPEN_CHALLENGE_NOTIFY:int = 7437;
      
      public static const XUNLEI_JINZUAN_GET_REWARD:int = 7439;
      
      public static const XUNLEI_JINZUAN_INFO_NOTIFY:int = 7440;
      
      public static const CHANGE_CITY_SCENE_LINE:int = 6050;
      
      public static const SHOW_LINE_STATE:int = 6051;
      
      public static const SHOW_LINE_NUMBER:int = 6052;
      
      public static const PUBLIC_TALK:int = 6001;
      
      public static const PRIVATE_TALK:int = 6002;
      
      public static const EVENT_NOTIFY:int = 6003;
      
      public static const PUBLIC_TALK_MULTI:int = 6004;
      
      public static const GET_SHEN_YUAN_INFO:int = 6073;
      
      public static const SHEN_YUAN_GET_MYSTERI_BOX:int = 6075;
      
      public static const SHEN_YUAN_TONG_GUAN:int = 6076;
      
      public static const SHEN_YUAN_REQUEST_FRIEND:int = 6077;
      
      public static const FIGHT_SHEN_YUAN_START:int = 6078;
      
      public static const FIGHT_SHEN_YUAN_END:int = 6079;
      
      public static const GOU_MAI_SHEN_YUAN_BUFF:int = 6080;
      
      public static const SHEN_YUAN_PAI_MING:int = 6081;
      
      public static const SHEN_YUAN_BUY_BUFF:int = 6083;
      
      public static const SHEN_YUAN_CONTINUE_CHANLLENGE:int = 6084;
      
      public static const SHEN_YUAN_RANK_REWARD:int = 6085;
      
      public static const SHEN_YUAN_RECEIVE_BOX:int = 6086;
      
      public static const SHEN_YUAN_STOP_FIGHT:int = 6087;
      
      public static const SHEN_YUAN_GET_LUCKY_BOX:int = 6088;
      
      public static const STAGE_BTL_GUIDE:int = 6068;
      
      public static const GET_YUN_BIAO_STATE:int = 6136;
      
      public static const GET_YUN_BIAO_TEAM_INFO:int = 6137;
      
      public static const GET_YUN_BIAO_FLY_INFO:int = 6138;
      
      public static const SHOW_YUN_BIAO_DA_JIE_INFO:int = 6146;
      
      public static const YUN_BIAO_DA_JIE:int = 6147;
      
      public static const REFRESH_YUN_BIAO_SHIP_QUALITY:int = 6148;
      
      public static const ABILITY_RANK:int = 6210;
      
      public static const AREA_RANK:int = 6211;
      
      public static const FAMILY_RANK:int = 6212;
      
      public static const LEVEL_RANK:int = 6213;
      
      public static const STAGE_STAR_RANK:int = 6214;
      
      public static const RANK_SEARCH_NAME:int = 6215;
      
      public static const GET_SIGN_IN_INFO:int = 6300;
      
      public static const SIGN_IN:int = 6301;
      
      public static const CAN_SIGN_IN:int = 6302;
      
      public static const SIGN_IN_EXTRA:int = 6303;
      
      public static const CAN_GET_SIGN_IN_EXTRA:int = 6304;
      
      public static const DRAGON_BOAT_ALL_INFO:int = 6350;
      
      public static const DRAGON_BOAT_MAKE_PANEL:int = 6351;
      
      public static const DRAGON_BOAT_SHOP_INFO:int = 6352;
      
      public static const DRAGON_BOAT_BUY:int = 6353;
      
      public static const DRAGON_BOAT_MAKE_ITEM:int = 6354;
      
      public static const DRAGON_BOAT_ONE_KEY_MAKE:int = 6355;
      
      public static const DRAGON_BOAT_RANK_TABLE:int = 6356;
      
      public static const DRAGON_BOAT_SINGLE_REWARD:int = 6357;
      
      public static const DRAGON_BOAT_GET_MATERIALS:int = 6358;
      
      public static const DRAGON_BOAT_DONATE_PANEL:int = 6359;
      
      public static const DRAGON_BOAT_DONATE:int = 6360;
      
      public static const DRAGON_BOAT_REQ_DONATE:int = 6361;
      
      public static const GET_VIP_INFO:int = 6401;
      
      public static const GET_CHARGE_INFO:int = 6402;
      
      public static const GET_VIP_REWARD_INFO:int = 6403;
      
      public static const VIP_RECEIVE_CHARGE_REWARD:int = 6404;
      
      public static const VIP_GET_FIRST_CHARGE:int = 6405;
      
      public static const VIP_GET_FIRST_CHARGE_REWARD:int = 6406;
      
      public static const WEB_SAVE:int = 6501;
      
      public static const CLIENT_DOWNLOAD:int = 6502;
      
      public static const VIP_MONTH_CARD:int = 6505;
      
      public static const OPEN_MODULE:int = 6601;
      
      public static const EQUIP_ADD_STAR:int = 6602;
      
      public static const WEI_DUAN_GET_REWARD:int = 6603;
      
      public static const ACTIVE_TITLE:int = 6701;
      
      public static const TITLE_PANEL:int = 6702;
      
      public static const TITLE_CHANGE_NOTIFY:int = 6703;
      
      public static const WEAR_TITLE:int = 6704;
      
      public static const WEAR_OUT_TITLE:int = 6705;
      
      public static const FOURTEEN_DAY_NOTIFY:int = 6230;
      
      public static const FOURTEEN_INFO:int = 6231;
      
      public static const FOURTEEN_DAY_GET_REWARD:int = 6232;
      
      public static const FOURTEEN_DAY_SHOP_BUY_TIMES:int = 6234;
      
      public static const VALENTINE_SEND_FLOWER:int = 6240;
      
      public static const VALENTINE_SHOP:int = 6241;
      
      public static const VALENTINE_SHOP_INFO:int = 6252;
      
      public static const LANTERN_SHOP:int = 6257;
      
      public static const LANTERN_SHOP_INFO:int = 6258;
      
      public static const SPRING_LOGIN_INFO:int = 6242;
      
      public static const SPRING_WELCOME_GOD_INFO:int = 6243;
      
      public static const SPRING_GET_GOD_REWARD:int = 6244;
      
      public static const SPRING_WELFARE_INFO:int = 6245;
      
      public static const SPRING_FIRE_CRACKER:int = 6247;
      
      public static const SPRING_GET_WELFARE_REWARD:int = 6248;
      
      public static const SPRING_LOGIN:int = 6249;
      
      public static const SPRING_FIGHT_BOSS_START:int = 6250;
      
      public static const SPRING_FIGHT_BOSS_END:int = 6251;
      
      public static const SPRING_BEAT_BOSS_NUM:int = 6253;
      
      public static const SPRING_GET_BEAT_BOSS_RANK_REWARD:int = 6254;
      
      public static const SPRING_BEAT_BOSS_LAST_RANK:int = 6255;
      
      public static const SPRING_BEAT_BOSS_RANK_LIST:int = 6246;
      
      public static const SPRING_BOSS_STOP_FIGHT:int = 6256;
      
      public static const GODDESS_VOTE_PANEL:int = 6259;
      
      public static const GODDESS_VOTE:int = 6260;
      
      public static const GODDESS_SHOW_PANEL:int = 6261;
      
      public static const GODDESS_SCORE_PANEL:int = 6262;
      
      public static const GODDESS_GET_SCORE_REWARD:int = 6263;
      
      public static const WHITE_VALENTINE_SEND_CHOCOLATE:int = 6267;
      
      public static const WHITE_VALENTINE_STUNNER:int = 6268;
      
      public static const WHITE_VALENTINE_RECEIVE_MESSAGE:int = 6269;
      
      public static const WHITE_VALENTINE_SHOP:int = 6270;
      
      public static const WHITE_VALENTINE_SHOP_INFO:int = 6271;
      
      public static const MIRROR_SYSTEM:int = 6272;
      
      public static const MINE_SWEEP_PANEL:int = 6273;
      
      public static const MINE_SWEEP_RESET:int = 6275;
      
      public static const MINE_SWEEP_ONE_KEY:int = 6276;
      
      public static const MINE_SWEEP_DIG:int = 6277;
      
      public static const MINE_SWEEP_RANK_TABLE:int = 6278;
      
      public static const MINE_SWEEP_SINGLE_REWARD:int = 6279;
      
      public static const MINE_SWEEP_BUY:int = 6280;
      
      public static const MINE_SWEEP_ALL_INFO:int = 6281;
      
      public static const MINE_SWEEP_SHOP_INFO:int = 6282;
      
      public static const MOTHER_DAY_SEND:int = 6283;
      
      public static const FASHION_MAKE:int = 6284;
      
      public static const FASHION_XI_LIAN:int = 6285;
      
      public static const FASHION_SKILL:int = 6286;
      
      public static const FASHION_WEAR:int = 6287;
      
      public static const FASHION_LIST:int = 6288;
      
      public static const ZHUANPAN_CROSS_INFO:int = 6290;
      
      public static const ZHUANPAN_CROSS_RANK:int = 6291;
      
      public static const ZHUANPAN_CROSS_ROTATE:int = 6292;
      
      public static const ZHUANPAN_CROSS_SUPER:int = 6293;
      
      public static const ZHUANPAN_CROSS_BUY:int = 6294;
      
      public static const ZHUANPAN_CROSS_SCORE_RWD:int = 6295;
      
      public static const ENTER_SCENE:int = 8000;
      
      public static const ENTER_SCENE_OTHER_PLAYER_NOTIFY:int = 8001;
      
      public static const LEAVE_SCENE_NOTIFY:int = 8002;
      
      public static const ENTER_SCENE_PLAYER_NOTIFY:int = 8003;
      
      public static const PLAYER_DATA_NOTIFY:int = 8004;
      
      public static const TEST_DROP_GROUP:int = 8005;
      
      public static const STAMINA_RECOVER_NOTIFY:int = 8006;
      
      public static const GET_SWAP_ACTIONS:int = 8007;
      
      public static const SWAP_ACTION:int = 8008;
      
      public static const SWAP_ACTIONS_IN_BATCH:int = 8009;
      
      public static const STAGE_FIGHT_START:int = 8053;
      
      public static const STAGE_FIGHT_END:int = 8054;
      
      public static const GET_STAGE_INFOS:int = 8055;
      
      public static const GET_CHAPTER_INFOS:int = 8056;
      
      public static const GET_CHAPTER_REWARD:int = 8057;
      
      public static const STAGE_SAO_DANG:int = 8058;
      
      public static const STAGE_PHASE_CHECK:int = 8059;
      
      public static const STAGE_RESET:int = 8060;
      
      public static const STAGE_OPEN_BOX:int = 8061;
      
      public static const ELITE_INVADE_FIGHT_START:int = 8062;
      
      public static const ELITE_INVADE_FIGHT_END:int = 8063;
      
      public static const ELITE_INVADE_NOTIFY:int = 8064;
      
      public static const EQUIP_STRENGTH:int = 8100;
      
      public static const EQUIP_JINGLIAN:int = 8101;
      
      public static const ITEM_HECHENG:int = 8102;
      
      public static const EQUIP_CHANGE:int = 8103;
      
      public static const EQUIP_PANEL_VIEW:int = 8104;
      
      public static const GET_MAIL_LIST:int = 8150;
      
      public static const READ_MAIL:int = 8151;
      
      public static const SEND_MAIL:int = 8152;
      
      public static const DEL_MAIL:int = 8153;
      
      public static const MAIL_NOTIFY:int = 8154;
      
      public static const DEL_MAIL_NOTIFY:int = 8155;
      
      public static const GET_MAIL_REWARD:int = 8156;
      
      public static const NEW_GROUP_MAIL_NOTIFY:int = 8157;
      
      public static const GET_NEW_GROUP_MAIL:int = 8158;
      
      public static const BTL_SKILL_NOTIFY:int = 8200;
      
      public static const BTL_ADD_BUFF_NOTIFY:int = 8201;
      
      public static const BTL_DEL_BUFF_NOTIFY:int = 8202;
      
      public static const BTL_PLAYER_DEAD_NOTIFY:int = 8203;
      
      public static const BTL_PLAYER_REVIVE_NOTIFY:int = 8204;
      
      public static const BTL_NPC_HP_NOTIFY:int = 8205;
      
      public static const TASK_GET_CUR_INFO:int = 8300;
      
      public static const TASK_FINISH:int = 8301;
      
      public static const TASK_INFO_NOTIFY:int = 8302;
      
      public static const ACTIVITY_GET_INFOS:int = 8350;
      
      public static const ACTIVITY_REWARD_FINISH:int = 8351;
      
      public static const ACTIVITY_INFO_NOTIFY:int = 8352;
      
      public static const ACTIVITY_REWARD_NOTIFY:int = 8353;
      
      public static const STATIC_ACTIVITYS:int = 8354;
      
      public static const ACTIVITY_HOT_UPDATE_NOTIFY:int = 8360;
      
      public static const CW_REGISTER:int = 8400;
      
      public static const CW_CANDIDATE_LIST:int = 8401;
      
      public static const CW_JOIN_CANDIDATE:int = 8402;
      
      public static const CW_VOTE_GENERAL:int = 8403;
      
      public static const CW_SHOW_GENERAL:int = 8405;
      
      public static const CW_RAND_CAMP:int = 8406;
      
      public static const CW_CAMP_LIST:int = 8407;
      
      public static const CW_CAMP_DETAIL_INFO:int = 8408;
      
      public static const CW_VOTE_MARSHAL:int = 8409;
      
      public static const CW_SHOW_MARSHAL:int = 8410;
      
      public static const CW_PLAYER_INFO:int = 8411;
      
      public static const GET_AUCTION_LIST:int = 8500;
      
      public static const AUCTION_SELL_ITEM:int = 8501;
      
      public static const AUCTION_UNSELL_ITEM:int = 8502;
      
      public static const AUCTION_BUY_ITEM:int = 8503;
      
      public static const AUCTION_MY_ORDER:int = 8504;
      
      public static const AUCTION_MY_SELLS:int = 8505;
      
      public static const AUCTION_SET_AUTO_BID:int = 8506;
      
      public static const AUCTION_MY_LIST_STAT_NOTIFY:int = 8507;
      
      public static const ACTIVITY_DROP_STATIC_NOTIFY:int = 8520;
      
      public static const PLAYER_PVP:int = 8521;
      
      public static const GET_OP_ACTIVITY_STATIC:int = 8530;
      
      public static const OP_ACTIVITY_STATIC_NOTIFY:int = 8531;
      
      public static const TUAN_GOU_INFO:int = 8532;
      
      public static const TUAN_GOU_INFO_NOTIFY:int = 8533;
      
      public static const TUAN_GOU_PANEL_CLOSE:int = 8534;
      
      public static const BUY_TUAN_GOU:int = 8535;
      
      public static const GET_TUAN_GOU_SCORE_REWARD:int = 8536;
      
      public static const TUAN_GOU_SCORE_INFO:int = 8537;
      
      public static const MJTX_INFO:int = 8600;
      
      public static const MJTX_RANK:int = 8601;
      
      public static const MJTX_OPEN_BOX:int = 8602;
      
      public static const MJTX_FIGHT_START:int = 8603;
      
      public static const MJTX_FIGHT_END:int = 8604;
      
      public static const MJTX_AUTO_FIGHT:int = 8605;
      
      public static const MJTX_NEXT_LEVEL:int = 8606;
      
      public static const MJTX_SOME_COUNT_NOTIFY:int = 8607;
      
      public static const FUND_INFO:int = 8620;
      
      public static const BUY_FUND:int = 8621;
      
      public static const GET_FUND_REWARD:int = 8622;
      
      public static const HERO_ADD_EXP:int = 5001;
      
      public static const HERO_TUPO:int = 5002;
      
      public static const HERO_INFO:int = 5005;
      
      public static const HERO_PEIYANG:int = 5007;
      
      public static const HERO_PEIYANG_TIHUAN:int = 5008;
      
      public static const HERO_SHENGJIE:int = 5009;
      
      public static const PANEL_VIEW:int = 5010;
      
      public static const HERO_INFO_NOTIFY:int = 5011;
      
      public static const EXP_HEROES:int = 5012;
      
      public static const HERO_COMBINE:int = 5013;
      
      public static const HERO_SHENGJIE_RECORD:int = 5014;
      
      public static const HERO_TUPO_ITEM_EQUIP:int = 5015;
      
      public static const HERO_TUPO_ITEM_EQUIP_ALL:int = 5016;
      
      public static const HERO_TALENT:int = 5017;
      
      public static const HERO_ALL_INFO_NOTIFY:int = 5018;
      
      public static const HERO_SKIN_ACTIVIE:int = 5019;
      
      public static const HERO_SKIN_EQUIP:int = 5021;
      
      public static const HERO_SKIN_INFO:int = 5022;
      
      public static const GUAJI_INFO:int = 3020;
      
      public static const GUAJI_CHANGE_NANDU:int = 3021;
      
      public static const GUAJI_BOSS_FIGHT_START:int = 3022;
      
      public static const GUAJI_BOSS_FIGHT_END:int = 3023;
      
      public static const GUAJI_GET_BAG_INFO:int = 3024;
      
      public static const GUAJI_GET_BAG_REWARD:int = 3025;
      
      public static const GUAJI_EXTRA_REWARD_NOTIFY:int = 3026;
      
      public static const GUAJI_LOG:int = 3027;
      
      public static const GUAJI_SWITCH:int = 3028;
      
      public static const GUAJI_INFO_NOTIFY:int = 3029;
      
      public static const TEAM_INVITE:int = 3030;
      
      public static const GUAJI_FIGHT_ST_NOTIFY:int = 3031;
      
      public static const GUAJI_REWARD_DISP_NOTIFY:int = 3032;
      
      public static const CROSS_SCENE_WATCH:int = 3033;
      
      public static const CROSS_SCENE_ENTER:int = 3034;
      
      public static const CROSS_SCENE_LEAVE:int = 3035;
      
      public static const CROSS_SCENE_ENTER_NOTIFY:int = 3036;
      
      public static const CROSS_SCENE_LEAVE_NOTIFY:int = 3037;
      
      public static const CROSS_SCENE_WATCH_CLOSE:int = 3038;
      
      public static const GUAJI_CHANGE_PVPER:int = 3140;
      
      public static const GUAJI_PVP_FIGHT_START:int = 3143;
      
      public static const GUAJI_PVP_FIGHT_END:int = 3144;
      
      public static const GUAJI_PVP_TODAY_RANK:int = 3145;
      
      public static const GUAJI_PVP_YESTODAY_RANK:int = 3146;
      
      public static const GUAJI_GET_RANK_REWARD:int = 3147;
      
      public static const GUAJI_SOME_DATA_NOTIFY:int = 3148;
      
      public static const GUAJI_PVP_GM:int = 3149;
      
      public static const GUAJI_PVP_BE_STEAL_NOTIFY:int = 3150;
      
      public static const GUAJI_PVP_AUTO_FIGHT:int = 3151;
      
      public static const GUAJI_SWITCH_NOTIFY:int = 3152;
      
      public static const GUAJI_SAO_DANG:int = 3153;
      
      public static const SHOP_LIST:int = 3040;
      
      public static const SHOP_BUY:int = 3041;
      
      public static const SHOP_REFRESH:int = 3042;
      
      public static const MALL_LIST:int = 3043;
      
      public static const MALL_BUY:int = 3044;
      
      public static const MALL_NOTIFY:int = 3045;
      
      public static const BU_ZHEN_CHANGE:int = 5020;
      
      public static const BU_ZHEN_VIEW:int = 5030;
      
      public static const BU_ZHEN_SUPPORT:int = 5031;
      
      public static const BU_ZHEN_LIST:int = 5032;
      
      public static const BAO_WU_BAG:int = 5100;
      
      public static const BAO_WU_EQUIP:int = 5101;
      
      public static const BAO_WU_STRENGTH:int = 5102;
      
      public static const BAO_WU_KEYIN:int = 5103;
      
      public static const BAO_WU_FUMO:int = 5104;
      
      public static const BAO_WU_FUMO_OPEN:int = 5105;
      
      public static const BAO_WU_MO_SHI_COMBINE:int = 5106;
      
      public static const BAO_WU_MO_SHI_TRANSFER:int = 5107;
      
      public static const BAO_WU_FUMO_ALL:int = 5108;
      
      public static const BAO_WU_MOSHI_ALL:int = 5109;
      
      public static const MO_SHI_COMBINE_RECORD:int = 5110;
      
      public static const BAO_WU_STAT_NOTIFY:int = 5111;
      
      public static const BAO_WU_GOLD_COMBINE:int = 5112;
      
      public static const BAO_WU_REMOULD:int = 5113;
      
      public static const BAO_WU_PURIFY:int = 5114;
      
      public static const BAO_WU_FUWEN_KEYIN:int = 5115;
      
      public static const FAMILY_CREATE:int = 5201;
      
      public static const FAMILY_APPLY:int = 5202;
      
      public static const FAMILY_APPLY_OP:int = 5203;
      
      public static const FAMILY_OPEN_INVITE:int = 5204;
      
      public static const FAMILY_INVITE_FRIEND:int = 5205;
      
      public static const FAMILY_APPOINT:int = 5206;
      
      public static const FAMILY_CHANGE_LEADER:int = 5207;
      
      public static const FAMILY_POST_UP:int = 5208;
      
      public static const FAMILY_QUIT:int = 5209;
      
      public static const FAMILY_KICK:int = 5210;
      
      public static const FAMILY_INFO:int = 5211;
      
      public static const FAMILY_MEMBER_LIST:int = 5212;
      
      public static const FAMILY_LIST:int = 5213;
      
      public static const FAMILY_DONATE:int = 5214;
      
      public static const FAMILY_CHANGE_NOTICE:int = 5215;
      
      public static const FAMILY_CHANGE_FLAG:int = 5216;
      
      public static const FAMILY_LOG:int = 5217;
      
      public static const FAMILY_APPLY_LIST:int = 5218;
      
      public static const FAMILY_QIAN_DAO:int = 5219;
      
      public static const FAMILY_APPLY_NOTIFY:int = 5220;
      
      public static const FAMILY_DISMISS:int = 5221;
      
      public static const FAMILY_CLEAR_CD:int = 5222;
      
      public static const FAMILY_MEMBER_INFO:int = 5223;
      
      public static const FAMILY_OTHER:int = 5224;
      
      public static const FAMILY_DONATE_REWARD:int = 5225;
      
      public static const FAMILY_POST_AUTHORITY:int = 5226;
      
      public static const FAMILY_GET_AUTHORITY:int = 5227;
      
      public static const FAMILY_AUTHORITY_NOTIFY:int = 5228;
      
      public static const FAMILY_DONATE_SCORE:int = 5229;
      
      public static const FAMILY_DONATE_NOTIFY:int = 5230;
      
      public static const CLOTHES_BAG:int = 5301;
      
      public static const CLOTHES_WEAR:int = 5302;
      
      public static const CLOTHES_SKILL:int = 5303;
      
      public static const CLOTHES_SKILL_BAG:int = 5304;
      
      public static const CLOTHES_ACTIVE:int = 5305;
      
      public static const VIEW_OTHER_PLAYER:int = 5310;
      
      public static const RECYCLE_HERO_DECOMPOSE:int = 5330;
      
      public static const RECYCLE_EQUIP_DECOMPOSE:int = 5331;
      
      public static const RECYCLE_BAOWU_DECOMPOSE:int = 5332;
      
      public static const RECYCLE_PET_DECOMPOSE:int = 5334;
      
      public static const TIMES_BUY:int = 5335;
      
      public static const GET_TIMES_BUY:int = 5336;
      
      public static const SUPPORT_INFO_NOTIFY:int = 5340;
      
      public static const PET_LEVEL_UP:int = 5360;
      
      public static const PET_INFO_NOTIFY:int = 5361;
      
      public static const PET_GRADE_UP:int = 5362;
      
      public static const PET_STAR_UP:int = 5363;
      
      public static const PET_ON_BATTLE:int = 5364;
      
      public static const PET_PROTECT:int = 5365;
      
      public static const PET_EQUIP:int = 5366;
      
      public static const PET_INFO:int = 5367;
      
      public static const PET_STATUS_ACTIVE:int = 5368;
      
      public static const PET_STATUS_USE:int = 5369;
      
      public static const PET_ON_SCENE:int = 5372;
      
      public static const RETRIVAL_INFO:int = 5370;
      
      public static const RETRIVAL_REWARD:int = 5371;
      
      public static const CTEAM_ARENA_SELECT_ENEMY:int = 5401;
      
      public static const CTEAM_ARENA_FIGHT:int = 5402;
      
      public static const CTEAM_ARENA_ENCOURAGE:int = 5403;
      
      public static const CTEAM_ARENA_RANK:int = 5404;
      
      public static const CTEAM_ARENA_INFO:int = 5405;
      
      public static const CTEAM_ARENA_ENEMY_CHANGE_NOTIFY:int = 5406;
      
      public static const CTEAM_ARENA_CHANGE_SORT:int = 5407;
      
      public static const CTEAM_ARENA_STATE:int = 5408;
      
      public static const CTEAM_ARENA_PRE_REPORT:int = 5409;
      
      public static const CTEAM_ARENA_FINAL_REPORT:int = 5410;
      
      public static const CTEAM_PLAYER_INFO:int = 5411;
      
      public static const CTEAM_PLAYER_REWARD:int = 5412;
      
      public static const CTEAM_ARENA_FINAL_TEAM:int = 5413;
      
      public static const CTEAM_ARENA_FINAL_BET_INFO:int = 5414;
      
      public static const CTEAM_ARENA_FINAL_BET_REWARD:int = 5415;
      
      public static const CTEAM_ARENA_FINAL_BET:int = 5416;
      
      public static const CTEAM_ARENA_HONOR:int = 5417;
      
      public static const MINE_AREA_INFO:int = 5441;
      
      public static const MINE_HILL_INFO:int = 5442;
      
      public static const MINE_FIGHT:int = 5444;
      
      public static const MINE_ABANDON:int = 5445;
      
      public static const MINE_REWARD:int = 5446;
      
      public static const GET_MINE_INFO:int = 5447;
      
      public static const MINE_LEAVE:int = 5448;
      
      public static const MINE_INFO_NOTIFY:int = 5449;
      
      public static const MINE_INVITE_APPLY:int = 5450;
      
      public static const MINE_INVITE_AGREE:int = 5451;
      
      public static const MINE_INVITE_INFO:int = 5453;
      
      public static const GET_ENEMY_INFO:int = 5452;
      
      public static const MINE_EVENT_NOTIFY:int = 5454;
      
      public static const MINE_SPECIAL:int = 5455;
      
      public static const MINE_TIMES:int = 5456;
      
      public static const MINE_LOG:int = 5457;
      
      public static const GET_SERIAL_NUMBER:int = 10000;
      
      public static const FACEBOOK_INVITE:int = 10001;
      
      public static const GAME_LIKE_REWARD:int = 10002;
      
      public static const CHANGE_LANGUAGE:int = 10003;
      
      public static const CHARM_RANK_SEND_CHOCOLATE:int = 10010;
      
      public static const CHARM_RANK_STUNNER:int = 10011;
      
      public static const CHARM_RANK_RECEIVE_MESSAGE:int = 10012;
      
      public static const CHARM_RANK_SHOP:int = 10013;
      
      public static const CHARM_RANK_SHOP_INFO:int = 10014;
      
      public static const CHARM_RANK_SHOP_DETAIL:int = 10015;
      
      public static const CHARM_RANK_RANK_DETAIL:int = 10016;
      
      public static const FAMILY_HERO_DONATION_PANEL:int = 10020;
      
      public static const FAMILY_HERO_DONATION_LAUNCH:int = 10021;
      
      public static const FAMILY_HERO_DONATION_DONATE:int = 10022;
      
      public static const FAMILY_HERO_DONATION_RECEIVE:int = 10023;
      
      public static const FAMILY_HERO_DONATION_NOTIFY:int = 10024;
      
      public static const BUY_DOUBLE_PANEL:int = 10030;
      
      public static const BUY_DOUBLE_BUY:int = 10031;
      
      public static const HERO_SHOP_SHARD_LOCK:int = 10032;
      
      public static const CROSS_ARENA_SELECT_COUNTRY:int = 10033;
      
      public static const GET_COMMENT_INFO:int = 10034;
      
      public static const QUESTION_IS_FINISH:int = 10040;
      
      public static const QUESTION_PANEL:int = 10041;
      
      public static const QUESTION_SUBMIT:int = 10042;
       
      
      public function CMD()
      {
         super();
      }
   }
}
