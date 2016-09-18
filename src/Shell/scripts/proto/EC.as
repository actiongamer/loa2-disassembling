package proto
{
   public final class EC
   {
      
      public static const OK:int = 0;
      
      public static const ERROR:int = 1;
      
      public static const SYSTEM_BUSY:int = 300000000;
      
      public static const RELOGIN:int = 300000001;
      
      public static const FORBIDDEN:int = 300000002;
      
      public static const PARAM_ERROR:int = 300000003;
      
      public static const FUNCTION_NOT_OPEN:int = 300000004;
      
      public static const PLAYER_SPEED_UP:int = 300000005;
      
      public static const NO_PLAYER_ROLE:int = 300002001;
      
      public static const LOGIN_OTHER:int = 300002003;
      
      public static const INVALID_NAME:int = 300002004;
      
      public static const PLAYER_LEVEL_LIMIT:int = 300002005;
      
      public static const PLAYER_NOT_EXIST:int = 300002006;
      
      public static const AVOID_INDULGE:int = 300002007;
      
      public static const BAG_ID_WRONG:int = 300004000;
      
      public static const BAG_FULL:int = 300004001;
      
      public static const BAG_ALREADY_EXIST:int = 300004002;
      
      public static const BAG_TYPE_NOT_EXIST:int = 300004003;
      
      public static const BAG_EQUIP_EXIST:int = 300004004;
      
      public static const BAG_EQUIP_PLACE_NOT_EXIST:int = 300004005;
      
      public static const BAG_CLOTH_PLACE_NOT_EXIST:int = 300004006;
      
      public static const HEROPOS_ERROR:int = 300004007;
      
      public static const ITEM_FULL:int = 300004020;
      
      public static const ITEM_COUNT_CANNOT_ADD:int = 300004021;
      
      public static const ITEM_ID_NOT_EXIST:int = 300004022;
      
      public static const ITEM_ID_ALREADY_EXIST:int = 300004023;
      
      public static const ITEM_COUNT_NOT_ENOUGH:int = 300004024;
      
      public static const ITEM_NOT_EXIST:int = 300004025;
      
      public static const ITEM_KIND_WRONG:int = 300004026;
      
      public static const ITEM_CREATE_FAILED:int = 300004027;
      
      public static const ITEM_SLICE_LEN_MISMATCH:int = 300004028;
      
      public static const ITEM_IS_NOT_EQUIP:int = 300004029;
      
      public static const EQUIP_STRENGTH_CNT_ERR:int = 300004030;
      
      public static const EQUIP_STRENGTH_LV_LIMIT:int = 300004031;
      
      public static const EQUIP_JINGLIAN_LV_LIMIT:int = 300004032;
      
      public static const ITEM_CANNOT_SELL:int = 300004033;
      
      public static const ITEM_CANNOT_USE:int = 300004034;
      
      public static const ITEM_USE_CHOICE:int = 300004035;
      
      public static const ITEM_COUNT_IS_ZERO:int = 300004036;
      
      public static const ITEM_IS_EXIST:int = 300004037;
      
      public static const ITEM_CANNOT_ADDSTAR:int = 300006300;
      
      public static const EQUIP_ADD_STAR_LIMIT:int = 300006301;
      
      public static const ITEM_STREN_LEVEL_LIMIT:int = 300006302;
      
      public static const EQUIP_ADD_STAR_CNT_ERR:int = 300006303;
      
      public static const GOLD_NOT_ENOUGH:int = 300004040;
      
      public static const DIAMOND_NOT_ENOUGH:int = 300004041;
      
      public static const SOURCE_NOT_ENOUGH:int = 300004042;
      
      public static const LOTTERY_ITEM_NOT_ENOUGH:int = 300004050;
      
      public static const LOTTERY_ID_NOT_EXIST:int = 300004051;
      
      public static const LOTTERY_MOLIZHI_UPLIMIT:int = 300007200;
      
      public static const LOTTERY_CD:int = 300004052;
      
      public static const LOTTERY_TIMES_LIMIT:int = 300004053;
      
      public static const LOTTERY_MOLIZHI_NOT_ENOUGH:int = 300007201;
      
      public static const LOTTERY_HERO_NUM_UPLIMIT:int = 300007202;
      
      public static const DROP_COMMIT_CANNOT_ADDITEM:int = 300004060;
      
      public static const DROP_COMMIT_FAIL_TO_CREATE_HERO:int = 300004061;
      
      public static const DROP_ERROR:int = 300004062;
      
      public static const ARENA_LEVEL_NOT_ENOUGH:int = 300004070;
      
      public static const ARENA_RANK_NOT_ENOUGH:int = 300004071;
      
      public static const ARENA_CD_LIMIT:int = 300004072;
      
      public static const ARENA_TIMES_NOT_ENOUGH:int = 300004073;
      
      public static const ARENA_ENEMY_IN_CHALLENGE:int = 300004074;
      
      public static const ARENA_RANK_LIST_CHANGE:int = 300004075;
      
      public static const ARENA_RANK_REWARD_RANK_LIMIT:int = 300004076;
      
      public static const ARENA_BUY_TIMES_LIMIT:int = 300004077;
      
      public static const ARENA_RANK_REWARD_ALREADY_GET:int = 300004078;
      
      public static const ARENA_MANIFESTO_SENSITIVE:int = 300004079;
      
      public static const ARENA_CANNOT_CHALLENGE_SELF:int = 300004080;
      
      public static const ARENA_MANIFESTO_LENGTH_LIMIT:int = 300004081;
      
      public static const ARENA_MANIFESTO_LOCKED:int = 300004082;
      
      public static const ARENA_MULTI_CHALLENGE_RANK_NOT_ENOUGH:int = 300004083;
      
      public static const COMPETE_GAMBLE_NOT_OPEN:int = 300004100;
      
      public static const COMPETE_STATUS_GAMBLE_NOT_ALLOWED:int = 300004101;
      
      public static const COMPETE_GAMBLE_TIMES_LIMIT:int = 300004102;
      
      public static const COMPETE_GAMBLE_REWARD_STAGE_NOT_END:int = 300004103;
      
      public static const COMPETE_GAMBLE_REWARD_PLAYER_NOT_GAMBLE:int = 300004104;
      
      public static const COMPETE_RANK_REWARD_ALREADY_GET:int = 300004105;
      
      public static const COMPETE_NOT_OPEN:int = 300004106;
      
      public static const COMPETE_GAMBLE_REWARD_ALREADY_GET:int = 300004107;
      
      public static const SEVEN_DAY_DAY_LIMIT:int = 300004120;
      
      public static const SEVEN_DAY_REWARD_ALREADY_GET:int = 300004121;
      
      public static const SEVEN_DAY_SHOP_ALREADY_GET:int = 300004122;
      
      public static const SEVEN_DAY_SHOP_LACK_STOCK:int = 300004123;
      
      public static const SEVEN_DAY_TASK_REWARD_NOT_AVAI:int = 300004124;
      
      public static const SEVEN_DAY_TASK_REWARD_ALREADY_GET:int = 300004125;
      
      public static const SEVEN_DAY_CLOSE:int = 300004126;
      
      public static const SEVEN_DAY_SHOP_LIMIT:int = 300004127;
      
      public static const SEVEN_DAY_SHOP_BUY_COUNT_LIMIT:int = 300004128;
      
      public static const BG_PLAYER_ALREADY_IN_TEAM:int = 300004140;
      
      public static const BG_PLAYER_NOT_IN_TEAM:int = 300004141;
      
      public static const BG_TEAM_MEM_NOT_ENOUGH:int = 300004142;
      
      public static const BG_NOT_OPEN:int = 300004143;
      
      public static const BG_TEAM_NOT_EXIST:int = 300004144;
      
      public static const BG_TEAM_ENTER_NOT_ALLOWDED:int = 300004145;
      
      public static const BG_STAGE_NOT_EXIST:int = 300004146;
      
      public static const BG_TEAM_MEM_IN_BTL:int = 300004147;
      
      public static const BG_TEAM_MEM_IN_WAIT:int = 300004148;
      
      public static const BG_CANNOT_FIGHT_ALLY:int = 300004149;
      
      public static const BG_CANNOT_FIGHT_SELF:int = 300004150;
      
      public static const BG_RES_RUN_OUT:int = 300004151;
      
      public static const BG_RES_BEING_GATHERED:int = 300004152;
      
      public static const BG_PLAYER_IN_PENALTY_TIME:int = 300004153;
      
      public static const BG_PLAYER_NOT_IN_WAIT_STATUS:int = 300004154;
      
      public static const BG_PLAYER_ALREADY_IN_WAIT_QUEUE:int = 300004155;
      
      public static const BG_TEAM_ALREADY_IN_WAIT_QUEUE:int = 300004156;
      
      public static const BG_PLAYER_ALREADY_IN_BG_STAGE:int = 300004157;
      
      public static const BG_PLAYER_NOT_REG:int = 300004158;
      
      public static const BG_NOT_OPEN_ON_FIRST_DAY:int = 300004159;
      
      public static const BG_TITLE_REWARD_ALREADY_GET:int = 300004160;
      
      public static const BG_TITLE_REWARD_LIMIT:int = 300004161;
      
      public static const BG_ENEMY_IN_BTL:int = 300004162;
      
      public static const BG_IN_DEFENSIVE_TIME:int = 300004163;
      
      public static const BG_SPECIAL_ORE_GATHERER_LIMIT:int = 300004164;
      
      public static const BG_GATHERING:int = 300004165;
      
      public static const BG_GATHERING_BY_OTHERS:int = 300004166;
      
      public static const BG_MULTI_CARD_USED_ALREADY:int = 300004167;
      
      public static const BG_ALREADY_HAVE_FLAG:int = 300004168;
      
      public static const BG_BETTER_MULTI_CARD_ALREADY_USED:int = 300004169;
      
      public static const BG_NPC_ALREADY_DEAD:int = 300004170;
      
      public static const BG_PLAYER_IN_BTL:int = 300004171;
      
      public static const BG_NPC_IN_BTL:int = 300004172;
      
      public static const TOO_FAR:int = 300004200;
      
      public static const BK_NOT_OPEN:int = 300004201;
      
      public static const BK_STAGE_NOT_EXIST:int = 300004202;
      
      public static const BK_CANNOT_FIGHT_ALLY:int = 300004203;
      
      public static const BK_CANNOT_FIGHT_SELF:int = 300004204;
      
      public static const BK_PLAYER_IN_PENALTY_TIME:int = 300004205;
      
      public static const BK_PLAYER_NOT_IN_WAIT_STATUS:int = 300004206;
      
      public static const BK_PLAYER_ALREADY_IN_WAIT_QUEUE:int = 300004207;
      
      public static const BK_PLAYER_ALREADY_IN_BK_STAGE:int = 300004208;
      
      public static const BK_PLAYER_NOT_REG:int = 300004209;
      
      public static const BK_ENEMY_IN_BTL:int = 300004210;
      
      public static const BK_IN_DEFENSIVE_TIME:int = 300004211;
      
      public static const BK_PLAYER_IN_BTL:int = 300004212;
      
      public static const BK_PLAYER_IN_BATTLE_GROUND:int = 300004213;
      
      public static const CROSS_ARENA_RESIDUAL_TIMES_NOT_ENOUGH:int = 300004250;
      
      public static const CROSS_ARENA_LAYER_BOX_ALREADY_GET:int = 300004251;
      
      public static const CROSS_ARENA_ENEMY_DATA_ERROR:int = 300004252;
      
      public static const CROSS_ARENA_ENEMY_RANK_CHANGED:int = 300004253;
      
      public static const CROSS_ARENA_ENEMY_IN_BTL:int = 300004254;
      
      public static const CROSS_ARENA_PLAYER_IN_BTL:int = 300004255;
      
      public static const CROSS_ARENA_PLAYER_RANK_CHANGED:int = 300004256;
      
      public static const CROSS_ARENA_CANNOT_FIGHT_SELF:int = 300004257;
      
      public static const CROSS_ARENA_AUDIENCE_CANNOT_FIGHT:int = 300004258;
      
      public static const CROSS_ARENA_CHEER_RESIDUAL_TIMES_NOT_ENOUGH:int = 300004259;
      
      public static const CROSS_ARENA_FINAL_FIGHT_RANK_NOT_ENOUGH:int = 300004260;
      
      public static const CROSS_ARENA_NOT_MASS:int = 300004261;
      
      public static const CROSS_ARENA_NOT_FINAL:int = 300004262;
      
      public static const CROSS_ARENA_CANNOT_FIGHT_LOWER_RANK:int = 300004263;
      
      public static const CROSS_ARENA_ENEMY_ALREADY_DEAD:int = 300004264;
      
      public static const FAMILY_EXPE_ACTIVITY_NOT_OPEN:int = 300004300;
      
      public static const FAMILY_EXPE_WAIT_LEADER_OPEN:int = 300004301;
      
      public static const FAMILY_EXPE_TIMES_NOT_ENOUGH:int = 300004302;
      
      public static const FAMILY_EXPE_PLAYER_TIMES_NOT_ENOUGH:int = 300004303;
      
      public static const FAMILY_EXPE_PLAYER_ALREADY_IN_BTL:int = 300004305;
      
      public static const FAMILY_EXPE_ENEMY_ALREADY_IN_BTL:int = 300004306;
      
      public static const FAMILY_EXPE_AVAI_PLAYER_NOT_ENOUGH:int = 300004307;
      
      public static const FAMILY_EXPE_ALREADY_START:int = 300004308;
      
      public static const FAMILY_EXPE_NOT_IN_OPEN_INTVL:int = 300004309;
      
      public static const FAMILY_EXPE_CANNOT_FIGHT_SELF_FAMILY:int = 300004310;
      
      public static const FAMILY_EXPE_FAMILY_NOT_QUALITIFY:int = 300004311;
      
      public static const FAMILY_EXPE_FAMILY_NOT_IN_CHANLLENGE:int = 300004312;
      
      public static const FAMILY_EXPE_NOT_FIGHT_PLAYER:int = 300004313;
      
      public static const FAMILY_EXPE_TASK_IN_CD:int = 300004314;
      
      public static const FAMILY_EXPE_FIGHT_ALREADY_START:int = 300004315;
      
      public static const FAMILY_ALREADY_GET_TASK:int = 300004316;
      
      public static const FAMILY_EXPE_TARGET_FAMILY_NOT_EXISTS:int = 300004317;
      
      public static const FAMILY_EXPE_TARGET_PLAYER_NOT_EXISTS:int = 300004318;
      
      public static const FAMILY_EXPE_FIGHT_IN_CD:int = 300004319;
      
      public static const FAMILY_EXPE_CANNOT_RECEIVE_TASK:int = 300004320;
      
      public static const FAMILY_EXPE_ACTIVITY_ON:int = 300004321;
      
      public static const FAMILY_EXPE_ACTIVITY_ON_BREAK_OUT:int = 300004322;
      
      public static const FAMILY_EXPE_WAIT:int = 300004323;
      
      public static const FAMILY_EXPE_SELECT_NEW_ENERMY:int = 300004324;
      
      public static const CITY_LINE_OVERFLOW:int = 300006001;
      
      public static const CAN_NOT_TALK:int = 300006002;
      
      public static const NO_SUCH_CHANNEL:int = 300006003;
      
      public static const TALK_TOO_QUICK:int = 300006004;
      
      public static const FORBIDDEN_TALK:int = 300006005;
      
      public static const SCENE_OVER_FLOW:int = 300006006;
      
      public static const NOT_CITYSCENE:int = 300006007;
      
      public static const LINE_NOT_EXIST:int = 300006008;
      
      public static const LINE_NOT_ZERO:int = 300006009;
      
      public static const AT_SAME_LINE:int = 300006010;
      
      public static const SHENYUAN_TIME_LIMIT:int = 300006011;
      
      public static const SHENYUAN_LAYER_ERROR:int = 300006013;
      
      public static const SHENYUAN_BUFF_STAR_NOT_ENOUGH:int = 300006015;
      
      public static const NOT_YOUR_FRIEND:int = 300006016;
      
      public static const SHENYUAN_RANK_LIMIT:int = 300006017;
      
      public static const SHENYUAN_RECEIVE_BOX_FAILED:int = 300006018;
      
      public static const SHENYUAN_FRIEND_HELP_LIMIT:int = 300006020;
      
      public static const SHENYUAN_LAYER_NO_DATA:int = 300006021;
      
      public static const SHENYUAN_REACH_TOP_LAYER:int = 300006022;
      
      public static const SHENYUAN_NOW_UPDATE:int = 300006023;
      
      public static const SHEN_YUAN_BUY_MYSTERIBOX_TIME_LIMIT:int = 300006024;
      
      public static const YUNBIAO_SHIP_NOT_FLY:int = 300006200;
      
      public static const YUN_BIAO_PASSED_LOCKED_TIME:int = 300006201;
      
      public static const YUN_BIAO_DAJIE_CD:int = 300006202;
      
      public static const YUN_BIAO_BEI_DAJIE_CD:int = 300006203;
      
      public static const YUN_BIAO_DAJIE_TIME_LIMIT:int = 300006204;
      
      public static const YUN_BIAO_TIME_LIMIT:int = 300006205;
      
      public static const YUN_BIAO_DAJIE_CISHU_LIMIT:int = 300006208;
      
      public static const YUN_BIAO_BEI_DAJIE_TIME_LIMIT:int = 300006209;
      
      public static const YUN_BIAO_DAJIE_ERR:int = 300006210;
      
      public static const NO_SUCH_NAME_IN_RANK:int = 300006031;
      
      public static const GET_SIGN_IN_REWARD_FAILED:int = 300006041;
      
      public static const GET_SIGN_IN_EXTRA_REWARD_FAILED:int = 300006042;
      
      public static const VIP_CARD_INVALID:int = 300006051;
      
      public static const VIP_REWARD_GET_ERROR:int = 300006052;
      
      public static const FIRST_CHARGE_REWARD_GET_ERROR:int = 300006053;
      
      public static const WEB_SAVE_REWARD_GET_ERROR:int = 300006060;
      
      public static const CLIENT_DOWNLOAD_GET_ERROR:int = 300006061;
      
      public static const FOURTEEN_DAY_DAY_LIMIT:int = 300006062;
      
      public static const FOURTEEN_DAY_REWARD_ALREADY_GET:int = 300006063;
      
      public static const FOURTEEN_DAY_SHOP_TIME_LIMIT:int = 300006064;
      
      public static const FOURTEEN_DAY_TASK_REWARD_NOT_AVAI:int = 300006066;
      
      public static const FOURTEEN_DAY_TASK_REWARD_ALREADY_GET:int = 300006067;
      
      public static const FOURTEEN_DAY_CLOSE:int = 300006068;
      
      public static const FOURTEEN_DAY_SHOP_TOP_VIP:int = 300006069;
      
      public static const SPRING_BEAT_BOSS_NUM_LIMIT:int = 300006071;
      
      public static const SPRING_BOSS_GET_LAST_RANK_ERROR:int = 300006072;
      
      public static const VALENTINE_SEND_FLOWER_NOT_ENOUGH:int = 300006073;
      
      public static const WHITE_VALENTINE_NOT_IN_TIME:int = 300006078;
      
      public static const WHITE_VALENTINE_NOT_YOUR_FRIEND:int = 300006079;
      
      public static const WHITE_VALENTINE_SHOP_NOT_IN_TIME:int = 300006080;
      
      public static const WHITE_VALENTINE_CAN_NOT_BUY:int = 300006081;
      
      public static const WHITE_VALENTINE_NOT_ENOUGH:int = 300006082;
      
      public static const GODDESS_VOTE_NOT_IN_TIME:int = 300006076;
      
      public static const GODDESS_VOTE_TICKETS_NOT_ENOUGH:int = 300006077;
      
      public static const YELLOW_ITEM_ADD_STAR_BY_RED:int = 300006074;
      
      public static const YELLOW_PIECE_NOT_FOR_EQUIP_THREE_STAR:int = 300006075;
      
      public static const FASHION_XILIAN_MAX:int = 300006090;
      
      public static const DRAGON_BOAT_MAKE_NUM_LIMIT:int = 300006510;
      
      public static const DRAGON_BOAT_NOT_FAMILY:int = 300006511;
      
      public static const DRAGON_BOAT_ENTER_FAMILY_TIME_LIMIT:int = 300006512;
      
      public static const DRAGON_BOAT_CD:int = 300006513;
      
      public static const HORSE_ALREADY_ACTIVED:int = 300007000;
      
      public static const FRIEND_NO_PLAYER_RECOMMAND:int = 300007001;
      
      public static const PLAYER_NAME_SENSITIVE:int = 300007002;
      
      public static const PLAYER_NAME_MORETHANSIX:int = 300007003;
      
      public static const PLAYER_NAME_LESSTHANTWO:int = 300007004;
      
      public static const PLAYER_NAME_EXIST:int = 300007005;
      
      public static const PLAYER_NAME_VALID:int = 300007006;
      
      public static const FAMILY_BOSS_BUFF_CDLIMIT:int = 300007007;
      
      public static const FAMILY_BOSS_BUFF_LAYERLIMIT:int = 300007008;
      
      public static const FAMILY_LEVEL_LIMIT:int = 300007009;
      
      public static const FAMILY_GET_REWARD_ERR:int = 300007010;
      
      public static const FAMILY_BOSS_BOSS_ALREADY_DEAD:int = 300007011;
      
      public static const FAMILY_BOSS_GULI_TIMES_LIMIT:int = 300007012;
      
      public static const FAMILY_BOSS_GULI_NORAML_CDTIME_LIMIT:int = 300007015;
      
      public static const FAMILY_BOSS_FIGHT_NOT_START:int = 300007016;
      
      public static const FAMILY_BOSS_CAN_NOT_JION_FIGHT:int = 300007021;
      
      public static const FAMILY_BOSS_BOSS_HAS_ALREADY_DEAD:int = 300007017;
      
      public static const FAMILY_BOSS_TOTAL_HURT_NOT_ENOUGH:int = 300007018;
      
      public static const FAMILY_BOSS_HURT_REWARD_ALREADY_GET:int = 300007019;
      
      public static const FAMILY_BOSS_NO_REWARD_CAN_GET:int = 300007020;
      
      public static const FAMILY_BOSS_CAN_NOT_KICK_DURING_BOSS:int = 300007022;
      
      public static const FAMILY_BOSS_CAN_NOT_DISMISS_DURING_BOSS:int = 300007023;
      
      public static const FAMILY_BOSS_CAN_NOT_GUWU:int = 300007024;
      
      public static const FAMILY_BOSS_FIGHT_END:int = 300007025;
      
      public static const FAMILY_BOSS_PLAYER_RELIVE_CD:int = 300007026;
      
      public static const HORSE_ITEM_AND_LEVEL_BOTH_NOT_ENOUGH:int = 300007013;
      
      public static const HORSE_LEVEL_ALREADY_HIGHEST:int = 300007014;
      
      public static const FRIEND_CONGRATULATE_TIMES_LIMIT:int = 300007100;
      
      public static const FRIEND_CONGRATULATED_TIMES_LIMIT:int = 300007101;
      
      public static const FRIEND_DONATE_STAMINA_TIMES_LIMIT:int = 300007102;
      
      public static const FRIEND_DONATED_STAMINA_TIMES_LIMIT:int = 300007103;
      
      public static const FRIEND_SIGNATURE_INVALID_CONTENT:int = 300007104;
      
      public static const FRIEND_SIGNATURE_LENGTH_LIMIT:int = 300007105;
      
      public static const FRIEND_MAX_NUMBER_LIMIT:int = 300007106;
      
      public static const FRIEND_MAX_NUMBER_ALREADY:int = 300007124;
      
      public static const FRIEND_OTHER_MAX_NUMBER_LIMIT:int = 300007123;
      
      public static const FRIEND_DAILY_DELETE_NUMBER_LIMIT:int = 300007107;
      
      public static const FRIEND_PRIVATE_TALK_INTERVAL_LIMIT:int = 300007108;
      
      public static const FRIEND_ONLY_FRIEND_CAN_DONATE:int = 300007110;
      
      public static const FRIEND_HAS_ALREADY_DONATE:int = 300007111;
      
      public static const TARGETFRIEND_CONGRATULATE_TIMES_LIMIT:int = 300007112;
      
      public static const FRIEND_NO_PLAYER_TO_DONATE:int = 300007113;
      
      public static const FRIEND_APPLY_TOO_FREQUENCY:int = 300007114;
      
      public static const FRIEND_CANNOT_APPLY_YOURSELF:int = 300007115;
      
      public static const FRIEND_ALREADY_FRIEND:int = 300007203;
      
      public static const FRIEND_TREND_ALREADY_CONGED:int = 300007119;
      
      public static const FRIEND_APPLY_IN_HEIMINGDAN:int = 300007121;
      
      public static const FRIEND_APPLY_IN_OTHER_HEIMINGDAN:int = 300007122;
      
      public static const FRIEND_APPLY_ALREADY_IN_APPLYLIST:int = 300007126;
      
      public static const FRIEND_APPLY_ALREADY_IN_SELF_APPLYLIST:int = 300007125;
      
      public static const FRIEND_HEIMING_LENGTHEN_LIMIT:int = 300007129;
      
      public static const FRIEND_CANNOT_APPLY:int = 300007130;
      
      public static const FRIEND_APPLY_LEVEL_LIMIT:int = 300007132;
      
      public static const SADDLE_HORSE_NEED_PREVHORSE:int = 300007109;
      
      public static const FAMILY_STAGE_FREE_TIMES_LIMIT:int = 300007116;
      
      public static const FAMILY_STAGE_INVALIDATE_STATE:int = 300007117;
      
      public static const FAMILY_STAGE_NOT_FINISH:int = 300007118;
      
      public static const FAMILY_STAGE_FIGHTING:int = 300007120;
      
      public static const FAMILY_STAGE_ALREADY_GOT_TODAY:int = 300007127;
      
      public static const FAMILY_STAGE_PLAYER_FIGHTING:int = 300007128;
      
      public static const FAMILY_STAGE_HAVE_PLAYER_FIGHTING:int = 300007131;
      
      public static const HERO_PRACTICE_DAILYTIMES_LIMIT:int = 300007500;
      
      public static const HERO_PRACTICE_OPEN_TIME_LIMIT:int = 300007501;
      
      public static const FAMILY_TECH_LEVEL_LIMIT:int = 300007502;
      
      public static const FAMILY_TECH_CDTIME_LIMIT:int = 300007503;
      
      public static const FAMILY_TECH_MEMBER_LIMIT:int = 300007504;
      
      public static const FAMILY_TECH_CON_NOT_ENOUGH:int = 300007505;
      
      public static const FAMILY_TECH_FUND_NOT_ENOUGH:int = 300007506;
      
      public static const ACTIVATE_CODE_ALREADY_USED:int = 300007507;
      
      public static const ACTIVATE_CODE_ALREADY_ACTIVATE:int = 300007508;
      
      public static const ACTIVATE_CODE_ALREADY_EXPIRE:int = 300007509;
      
      public static const ACTIVATE_CODE_NOT_EXIST:int = 300007510;
      
      public static const SUPER_SALE_OPEN_TIME_ERR:int = 300007511;
      
      public static const VIP_LEVEL_NOT_ENOUGH:int = 300007512;
      
      public static const OPEN_FUND_HAS_ALREADY_BUY:int = 300007513;
      
      public static const G360_CHECK_CODE_SYSTEM_BUSY:int = 300007514;
      
      public static const G360_CHECK_CODE_ONLINE_FIRST:int = 300007515;
      
      public static const G360_CHECK_CODE_ALREADY_GET:int = 300007516;
      
      public static const G360_CHECK_CODE_NOT_ONLINE:int = 300007517;
      
      public static const G360_CHECK_CODE_ALREADY_FINISH:int = 300007518;
      
      public static const G360_CHECK_CODE_NOT_CONIFG:int = 300007519;
      
      public static const G360_CHECK_CODE_WAIT:int = 300007520;
      
      public static const MOBILE_CHECK_GET_CODE_ERR:int = 300007521;
      
      public static const MOBILE_CHECK_GET_CODE_MORE_THAN_TEN:int = 300007522;
      
      public static const MOBILE_CHECK_ERR:int = 300007523;
      
      public static const MOBILE_CHECK_ALREADY_BIND:int = 300007524;
      
      public static const MOBILE_CHECK_NUM_ALREADY_BIND_OTHER:int = 300007525;
      
      public static const MOBILE_CHECK_CODE_INVALIDE:int = 300007526;
      
      public static const MOBILE_CHECK_GET_CODE_NUM_INVALIDE:int = 300007527;
      
      public static const JUE_ROAD_NOT_FINISH:int = 300007528;
      
      public static const JUE_ROAD_TIME_LIMIT:int = 300007529;
      
      public static const JUE_ROAD_BAOXIANG_ALREADY_GET:int = 300007533;
      
      public static const JUE_ROAD_STARS_NOT_ENOUGHT:int = 300007534;
      
      public static const JUE_ROAD_PRE_NODE_FIRST:int = 300007535;
      
      public static const JUE_ROAD_NODE_STATE_ERR:int = 300007536;
      
      public static const JUE_ROAD_FREE_TIME_LIMIT:int = 300007537;
      
      public static const OPEN_CHALLENGE_TIME_END:int = 300007530;
      
      public static const OPEN_CHALLENGE_HAS_ALREADY_GET:int = 300007531;
      
      public static const OPEN_CHALLENGE_CAN_NOT_GET_REWARD:int = 300007532;
      
      public static const XUNLEI_JINZUAN_VIP_INOF_SYSERR:int = 300007538;
      
      public static const WORLD_BOSS_FIGHT_END:int = 300007539;
      
      public static const WORLD_BOSS_FIGHT_NOT_START:int = 300007540;
      
      public static const WORLD_BOSS_PLAYER_RELIVE_CD:int = 300007541;
      
      public static const WORLD_BOSS_BOSS_HAS_ALREADY_DEAD:int = 300007542;
      
      public static const WORLD_BOSS_TOTAL_HURT_NOT_ENOUGH:int = 300007543;
      
      public static const WORLD_BOSS_HURT_REWARD_ALREADY_GET:int = 300007544;
      
      public static const WORLD_BOSS_NO_REWARD_CAN_GET:int = 300007545;
      
      public static const WORLD_BOSS_CALL_NEXT_WAVE:int = 300007546;
      
      public static const ZHUAN_PAN_NOT_IN_LOTTERY_TIME:int = 300007560;
      
      public static const ZHUNA_PAN_NOT_IN_ACTIVITY_TIME:int = 300007561;
      
      public static const LUCK_TREE_NOT_IN_LOTTERY_TIME:int = 300007562;
      
      public static const LUCK_TREE_NOT_IN_ACTIVITY_TIME:int = 300007563;
      
      public static const LUCK_TREE_REWARD_HAS_ALREADY_GET:int = 300007564;
      
      public static const LUCK_TREE_LEVEL_LIMIT_50:int = 300004565;
      
      public static const SCENE_NOT_EXIST:int = 300008001;
      
      public static const CANNOT_ENTER_SCENE:int = 300008002;
      
      public static const SCENE_LV_LIMIT:int = 300008003;
      
      public static const PLAYER_NOT_IN_SCENE:int = 300008004;
      
      public static const TARGET_NOT_IN_SCENE:int = 300008005;
      
      public static const STAGE_STATUS:int = 300008020;
      
      public static const STAGE_ONE_TIME:int = 300008021;
      
      public static const COMMON_STAGE_NOT_PASSED:int = 300008022;
      
      public static const PREV_STAGE_NOT_PASSED:int = 300008023;
      
      public static const CHECK_FIGHT_RESULT_FAILED:int = 300008024;
      
      public static const STAGE_STAR_ERR:int = 300008025;
      
      public static const STAMINA_NOT_ENOUGH:int = 300008026;
      
      public static const STAGE_FREE_TIME_NOT_ENOUGH:int = 300008027;
      
      public static const NOTIN_CORRECT_SCENE:int = 300008028;
      
      public static const ELITE_STAGE_COUNT_LIMIT:int = 300008029;
      
      public static const ALREADY_IN_BTL:int = 300008030;
      
      public static const NOT_IN_BTL:int = 300008031;
      
      public static const BTL_RESULT_CHECK_FAILED:int = 300008032;
      
      public static const STAGE_NOT_EXIST:int = 300008033;
      
      public static const CHAPTER_AWARDED:int = 300008034;
      
      public static const CHAPTER_STAR_NOT_ENOUGH:int = 300008035;
      
      public static const STAGE_SD_COUNT:int = 300008036;
      
      public static const STAGE_RESET_COUNT:int = 300008037;
      
      public static const NOT_IN_CORRECT_BTL:int = 300008038;
      
      public static const STAGE_CANNOT_OPEN_BOX:int = 300008039;
      
      public static const ELITE_INVADE_NOT_EXIST:int = 300008050;
      
      public static const ELITE_INVADE_FINISHED:int = 300008051;
      
      public static const NOT_IN_TIME:int = 300008052;
      
      public static const LEVEL_NOT_ENOUGH:int = 300008053;
      
      public static const ABILITY_NOT_ENOUGH:int = 300008054;
      
      public static const MAIL_NOT_EXIST:int = 300008100;
      
      public static const MAIL_TITLE_CONTENT_LEN:int = 300008101;
      
      public static const MAIL_SEND_NAME_ERROR:int = 300008102;
      
      public static const MAIL_MAX_SEND_NUM:int = 300008103;
      
      public static const TASK_NOT_EXIST:int = 300008150;
      
      public static const TASK_ALREADY_FINISH:int = 300008151;
      
      public static const TASK_NOT_FINISH:int = 300008152;
      
      public static const ACTIVITY_NOT_EXIST:int = 300008160;
      
      public static const ACTIVITY_NOT_FINISH:int = 300008161;
      
      public static const ACTIVITY_ST_ERR:int = 300008162;
      
      public static const ACTIVITY_REWARD_NOT_EXIST:int = 300008163;
      
      public static const ACTIVITY_NOT_INTIME:int = 300008164;
      
      public static const ACTIVITY_ALREADY_FINISH:int = 300008165;
      
      public static const SWAP_ACTION_NOT_EXIST:int = 300008200;
      
      public static const SWAP_ACTION_LEVEL_LIMIT:int = 300008201;
      
      public static const SWAP_ACTION_COUNT_LIMIT:int = 300008202;
      
      public static const SWAP_ACTION_LOGIC_ERR:int = 300008203;
      
      public static const GUAJI_BOSS_PASSED:int = 300008300;
      
      public static const GUAJI_IN_BTL:int = 300008301;
      
      public static const GUAJI_NANDU_NOT_OPEN:int = 300008302;
      
      public static const GUAJI_NOT_OPEN:int = 300008303;
      
      public static const GUAJI_BOSS_FIGHT_CD:int = 300008304;
      
      public static const GUAJI_NOT_IN_OPENTM:int = 300008305;
      
      public static const GUAJI_PVP_IMMU:int = 300008306;
      
      public static const GUAJI_NOT_IN_RANK:int = 300008307;
      
      public static const GUAJI_JINGLI_LIMIT:int = 300008308;
      
      public static const GUAJI_PVP_ALREADY_GET_REWARD:int = 300008309;
      
      public static const GJPVP_STEAL_NOT_ENOUGH:int = 300008310;
      
      public static const GUAJI_CHANGE_PVPER_CD:int = 300008311;
      
      public static const GUAJI_BAG_IS_FULL:int = 300008312;
      
      public static const GUAJI_BOSS_LV_LIMIT:int = 300008313;
      
      public static const GUAJI_PVP_RANK_NOT_REFRESH:int = 300008314;
      
      public static const TEAM_ENTER_APPLYER:int = 300008400;
      
      public static const TEAM_NOT_EXIST:int = 300008401;
      
      public static const TEAM_FULL:int = 300008402;
      
      public static const TEAMPLAY_NOT_FOUND:int = 300008403;
      
      public static const TEAM_CROSS_ERR:int = 300008404;
      
      public static const TEAMMEM_ALREADY_IN_TEAM:int = 300008405;
      
      public static const TEAM_NOT_START_YET:int = 300008406;
      
      public static const TEAM_STOP_NOT_ALLOWED:int = 300008407;
      
      public static const TEAM_DISMISS_NOT_ALLOWED:int = 300008408;
      
      public static const TEAM_KICK_NOT_ALLOWED:int = 300008409;
      
      public static const TEAM_CREATE_ERR:int = 300008410;
      
      public static const CW_NOT_IN_ABILITY_RANK:int = 300008420;
      
      public static const CW_NOT_IN_REGISTER:int = 300008422;
      
      public static const CW_NOT_GENERAL:int = 300008423;
      
      public static const CAMP_KIND_NOT_IN_RANGE:int = 300008424;
      
      public static const CW_VOTE_NOT_ENOUGH:int = 300008425;
      
      public static const AUCTION_NOT_OPEN:int = 300008500;
      
      public static const AUCTION_PRICE_ERR:int = 300008501;
      
      public static const AUCTION_BAOWU_CANNOT_BE_SELL:int = 300008502;
      
      public static const AUCTION_CANNOT_SELL:int = 300008503;
      
      public static const AUCTION_HAS_BUYER:int = 300008504;
      
      public static const AUCTION_AUTO_BID:int = 300008505;
      
      public static const AUCTION_NO_ITEM:int = 300008506;
      
      public static const AUCTION_REPEAT_BID:int = 300008507;
      
      public static const AUCTION_BUY_SELF:int = 300008508;
      
      public static const AUCTION_ITEM_CANNOT_SELL:int = 300008509;
      
      public static const AUCTION_SELLBWCNT_LIMIT:int = 300008511;
      
      public static const AUCTION_SELLITEMCNT_LIMIT:int = 300008512;
      
      public static const AUCTION_BUY_PRICE_ERR:int = 300008513;
      
      public static const MJTX_CANNOT_GET_REWARD:int = 300008550;
      
      public static const MJTX_POS_CANNOT_ATK:int = 300008551;
      
      public static const MJTX_CANNOT_ENTER_NEXT_LEVEL:int = 300008552;
      
      public static const FUND_CHARGE_CONDITION_NOT_ENOUGH:int = 300008600;
      
      public static const FUND_HAS_BUY:int = 300008601;
      
      public static const CANNOT_GET_FUND_REWARD:int = 300008602;
      
      public static const FUND_REWARD_ALREADY_GET:int = 300008603;
      
      public static const FUND_REWARD_TM_ERR:int = 300008604;
      
      public static const FUND_BUY_TM_ERR:int = 300008605;
      
      public static const HERO_NOT_EXIST:int = 350000001;
      
      public static const HERO_LEVEL_OVER_PLAYER:int = 350000002;
      
      public static const HERO_LEVEL_MAX:int = 350000003;
      
      public static const HERO_NUM_OVER_MAX:int = 350000005;
      
      public static const HERO_NOT_ENOUGH:int = 350000006;
      
      public static const HERO_IS_NULL:int = 350000007;
      
      public static const HERO_LEVEL_NOT_ENOUGH:int = 350000008;
      
      public static const HERO_SHENGJIE_MAX:int = 350000009;
      
      public static const STATIC_DATA_NOT_EXIST:int = 350000004;
      
      public static const BUZHEN_BTL_HERO_NOT_ENOUGH:int = 350000149;
      
      public static const BUZHEN_OVER_MAX_NUM:int = 350000150;
      
      public static const BUZHEN_PLAYER_DOWN:int = 350000151;
      
      public static const BUZHEN_NOT_SAME:int = 350000152;
      
      public static const BUZHEN_POS_NOT_OPEN:int = 350000153;
      
      public static const BAOWU_NOT_EXISTS:int = 350000154;
      
      public static const BAOWU_MOSHI_NOT_SAME:int = 350000155;
      
      public static const BAOWU_STRENGTH_OVER:int = 350000156;
      
      public static const BAOWU_MOSHI_OPEN_LIMIT:int = 350000157;
      
      public static const BAOWU_MOSHI_NOT_OPEN:int = 350000158;
      
      public static const BAOWU_KEYIN_MAX_LEVEL:int = 350000159;
      
      public static const BAOWU_QUALITY_LOW:int = 350000160;
      
      public static const BAOWU_OVER_MAX_NUM:int = 350000161;
      
      public static const BAOWU_IN_BINDING:int = 350000162;
      
      public static const BAOWU_IN_AUCTION:int = 350000163;
      
      public static const FAMILY_ABILITY_LIMIT:int = 350000200;
      
      public static const FAMILY_MEMBER_OVER:int = 350000201;
      
      public static const FAMILY_MEMBER_CD_TIME:int = 350000202;
      
      public static const FAMILY_AUTH_NOT_ENOUGH:int = 350000203;
      
      public static const FMAILY_BEEN_APPLYED:int = 350000204;
      
      public static const FAMILY_DONATE_SCORE_NOT:int = 350000205;
      
      public static const FAMILY_REWARD_RECEIVED:int = 350000206;
      
      public static const FAMILY_NOT_EXISTS:int = 350000207;
      
      public static const FAMILY_NAME_SAME:int = 350000208;
      
      public static const FAMILY_QUIT_LIMIT:int = 350000209;
      
      public static const SHOP_ITEM_CONDITION_ERR:int = 350000301;
      
      public static const SHOP_REFRESH_ERR:int = 350000302;
      
      public static const SHOP_REFRESH_TIME_OVER:int = 350000303;
      
      public static const MALL_OVER_NUM:int = 350000321;
      
      public static const BUY_TIME_OVER_LIMIT:int = 350000322;
      
      public static const STAMINA_OVER_MAX:int = 350000323;
      
      public static const SHOP_ITEM_NOT_EXISTS:int = 350000324;
      
      public static const SHOP_COIN_CONSUME_LIMIT:int = 300000325;
      
      public static const GJJINGLI_TIMES_BUY_OVER_MAX:int = 350000400;
      
      public static const CLOTHES_SEX_WRONG:int = 350000350;
      
      public static const CLOTHES_EXISTS:int = 350000351;
      
      public static const CLOTHES_NOT_ACTIVE:int = 350000352;
      
      public static const MINE_STATUS_LOCK:int = 300000328;
      
      public static const MINE_INVITE_HELPER:int = 300000329;
      
      public static const MINE_APPLY_OVER:int = 300000330;
      
      public static const MINE_LOSTED:int = 300000331;
      
      public static const MINE_INVITE_LIMIT:int = 300000332;
      
      public static const GET_SERIAL_SUCCESS:int = 350010000;
      
      public static const GET_SERIAL_VERIFY_ERR:int = 350010001;
      
      public static const GET_SERIAL_DEADLINE:int = 350010002;
      
      public static const GET_SERIAL_LACK_PARAM:int = 350010003;
      
      public static const GET_SERIAL_USEOUT:int = 350010004;
      
      public static const GET_SERIAL_UNKNOWN_ERR:int = 350010005;
      
      public static const GET_SERIAL_PARSE_ERR:int = 350010006;
      
      public static const GET_SERIAL_NO_QUALIFICATION:int = 350010007;
      
      public static const GET_SERIAL_FREQUENTLY:int = 350010008;
      
      public static const NET_ERROR:int = 350010009;
      
      public static const GAME_LIKE_REWARD_GET_ERROR:int = 350010010;
      
      public static const CHARM_RANK_NOT_YOUR_FRIEND:int = 350010020;
      
      public static const CHARM_RANK_NOT_ENOUGH:int = 350010021;
      
      public static const CHARM_RANK_NOT_IN_TIME:int = 350010022;
      
      public static const FAMILY_DONATE_DAILY_LIMIT:int = 350010030;
      
      public static const FAMILY_DONATE_FULL_BOX:int = 350010031;
      
      public static const FAMILY_DONATE_ITEM_ERROR:int = 350010032;
      
      public static const FAMILY_DONATE_NO_RECEIVE:int = 350010033;
      
      public static const FAMILY_DONATE_ALREADY_DONATE:int = 350010034;
      
      public static const FAMILY_DONATE_CASE_ERROR:int = 350010035;
      
      public static const FAMILY_DONATE_DONATELIMIT:int = 350010036;
      
      public static const FAMILY_DONATE_DONATE_NUM_ERROR:int = 350010037;
      
      public static const QUESTION_VERSION_ERROR:int = 350010042;
      
      public static const QUESTION_FINISH_ERROR:int = 350010043;
      
      public static const QUESTION_EXIST_ERROR:int = 350010044;
      
      public static const QUESTION_ANSWER_ERROR:int = 350010045;
      
      public static const HERO_CHANGE_GROUP_LEVEL_ERROR:int = 109001030;
      
      public static const HERO_CHANGE_QUALITY_ERROR:int = 109001031;
      
      public static const HERO_CHANGE_ONPLACE_ERROR:int = 109001032;
      
      public static const HERO_CHANGE_ONSUPPORT_ERROR:int = 109001033;
      
      public static const HERO_CHANGE_PEIYANG_ERROR:int = 109001034;
      
      public static const HERO_CHANGE_SAME_ERROR:int = 109001035;
      
      public static const ACTIVITY_TIME_ERR:int = 999900521;
      
      public static const REPEAT_SELECT:int = 999902690;
      
      public static const COUNTRY_NOT_EXIST:int = 999920691;
      
      public static const NOT_IN_MASS_STAGE:int = 999902696;
       
      
      public function EC()
      {
         super();
      }
   }
}
