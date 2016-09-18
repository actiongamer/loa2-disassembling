package nslm2.modules.funnies.pkCrossSer
{
   import nslm2.common.vo.PlayerVo;
   import proto.PlayerBaseInfo;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import flash.geom.Point;
   
   public class PKCrossConst
   {
      
      public static const local_data_pkcross_fast_fight:String = "local_data_pkcross_fast_fight";
      
      public static const STATE_NO_OPEN:int = 0;
      
      public static const STATE_PRELIMINARY:int = 1;
      
      public static const STATE_FINAL:int = 2;
      
      public static var SHOW_CD_SEC:uint = 172800;
      
      public static const OPT_START_CD_COMPLETE:String = "OPT_START_CD_COMPLETE";
      
      public static const OPT_START_CHALLENGE:String = "OPT_START_CHALLENGE";
      
      public static const OPT_CHANGE_ENEMY:String = "OPT_CHANGE_ENEMY";
      
      public static const OPT_FINAL_START_CHALLENGE:String = "OPT_FINAL_START_CHALLENGE";
      
      public static const OPT_FINAL_CHEER:String = "OPT_FINAL_CHEER";
      
      public static const OPT_FINAL_CHEER_CHG_TIMES:String = "OPT_FINAL_CHEER_CHG_TIMES";
      
      public static const OPT_FINAL_CHEER_SWAPACTION:String = "OPT_FINAL_CHEER_SWAPACTION";
      
      public static const OPT_SHOW_REWARD:String = "OPT_SHOW_REWARD";
      
      public static const MAX_ENEMIES_PER_LEVEL:int = 5;
      
      public static const MAX_LAYER:int = 5;
      
      public static const MAX_ENMIES_IN_FINAL:int = 8;
      
      public static var JUMP_PAGE:int = 5;
      
      public static var NUM_PER_PAGE:int = 5;
      
      public static const rank_pre:int = 1;
      
      public static const rank_final:int = 2;
      
      public static const rank_final_my_ser:int = 3;
      
      public static const report_myhx:int = 1;
      
      public static const report_myjs:int = 2;
      
      public static const report_js:int = 3;
      
      public static const box_status_rewarded:int = 2;
      
      public static const RANK_PKCROSSHX:int = 0;
      
      public static const RANK_PKCROSSJS:int = 1;
      
      public static const POS_ARR:Array = [new Point(-400,-180),new Point(-200,-130),new Point(0,-100),new Point(200,-130),new Point(400,-180)];
      
      public static const POS_RO:Array = [-45,-45,0,45,45];
       
      
      public function PKCrossConst()
      {
         super();
      }
      
      public static function RankInfoToPlayerVo(param1:PlayerBaseInfo) : PlayerVo
      {
         var _loc2_:PlayerVo = new PlayerVo();
         _loc2_.playerId = param1.id;
         _loc2_.baseId = param1.npcId;
         _loc2_.fightValue = Uint64Util.toNumber(param1.ability);
         _loc2_.level = param1.lv;
         _loc2_.name = param1.name;
         _loc2_.headerIconUrl = HeroInfoUtil.getHeadIconUrl(_loc2_.playerId,_loc2_.baseId);
         _loc2_.militaryRank = param1.militaryRank;
         _loc2_.disID = param1.dist;
         return _loc2_;
      }
   }
}
