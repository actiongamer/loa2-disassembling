package nslm2.modules.funnies.arenas
{
   import nslm2.modules.funnies.arenas.mains.ArenaUnit3DConfigVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import flash.geom.Point;
   
   public class ArenaConsts
   {
      
      public static const SKIN_ARROW_UP:String = "png.uiActRank.绿箭头";
      
      public static const SKIN_ARROW_DOWN:String = "png.uiActRank.红箭头";
      
      public static const SKIN_RANK:String = "png.uiRankReward.rank";
      
      public static const SKIN_ARENA_RANK:String = "png.uiArenas.rank";
      
      public static const REWARD_STATUS_NOT_AVAILABLE:int = 1;
      
      public static const REWARD_STATUS_AVAILABLE:int = 2;
      
      public static const REWARD_STATUS_ALREADY_GET:int = 3;
      
      public static const CAN_USE_SIMPLE_FIGHT_LEVEL:int = 35;
      
      private static var _ins:nslm2.modules.funnies.arenas.ArenaConsts;
       
      
      public var player3DConfigVo:ArenaUnit3DConfigVo;
      
      public var unit3DConfigVoArr:Vector.<ArenaUnit3DConfigVo>;
      
      public var ARENA_CD_per:int;
      
      public var ARENA_CD_limite:int;
      
      public var SIGATUE_WORDS_LIMIT_MIN:int;
      
      public var SIGATUE_WORDS_LIMIT_MAX:int;
      
      public var ARENA_CHALLENGE_RESULT_VO:nslm2.modules.funnies.arenas.ArenaChallengeResultVo;
      
      public function ArenaConsts()
      {
         super();
         var _loc1_:Array = String(DefindConsts.ARENA_CD).split("|");
         ARENA_CD_per = int(_loc1_[0]) * 60;
         ARENA_CD_limite = int(_loc1_[1]) * 60;
         var _loc2_:Array = String(DefindConsts.ARENA_WORDS_LIMIT).split("|");
         SIGATUE_WORDS_LIMIT_MIN = _loc2_[0];
         SIGATUE_WORDS_LIMIT_MAX = _loc2_[1];
         player3DConfigVo = new ArenaUnit3DConfigVo(new Point(0,-300),0.9,180);
         unit3DConfigVoArr = new Vector.<ArenaUnit3DConfigVo>();
         unit3DConfigVoArr.push(new ArenaUnit3DConfigVo(new Point(-17,20),0.9,-45));
         unit3DConfigVoArr.push(new ArenaUnit3DConfigVo(new Point(-214,-63),0.9,-45));
         unit3DConfigVoArr.push(new ArenaUnit3DConfigVo(new Point(218,-66),0.9,45));
         unit3DConfigVoArr.push(new ArenaUnit3DConfigVo(new Point(-312,-157),0.85,-45));
         unit3DConfigVoArr.push(new ArenaUnit3DConfigVo(new Point(282,-179),0.85,45));
         unit3DConfigVoArr.push(new ArenaUnit3DConfigVo(new Point(-470,-213),0.85,-45));
         unit3DConfigVoArr.push(new ArenaUnit3DConfigVo(new Point(416,-210),0.85,45));
         unit3DConfigVoArr.push(new ArenaUnit3DConfigVo(new Point(-385,-359),0.85,-45));
         unit3DConfigVoArr.push(new ArenaUnit3DConfigVo(new Point(342,-325),0.85,45));
      }
      
      public static function get ins() : nslm2.modules.funnies.arenas.ArenaConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.arenas.ArenaConsts();
         }
         return _ins;
      }
   }
}
