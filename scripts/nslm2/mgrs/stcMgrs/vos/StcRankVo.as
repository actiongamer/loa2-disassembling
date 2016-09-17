package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcRankVo extends StcVoBase
   {
      
      public static const RANK_MIN:String = "rankMin";
      
      public static const KIND_AREAN:int = 3;
      
      public static const KIND_SHENYUAN:int = 1;
      
      public static const KIND_CHAMPION:int = 4;
      
      public static const KIND_TEAM_GUAJI:int = 5;
      
      public static const KIND_PKCROSS_CHEER:int = 8;
      
      public static const KIND_BATTLEFIELD_LOCAL_SERVER:int = 6;
      
      public static const KIND_BATTLEFIELD_CROSS_SERVER:int = 7;
      
      public static const KIND_ABILITY_RANK:int = 9;
      
      public static const KIND_PKCROSS_RANK:int = 10;
      
      public static const KIND_NEW_YEAR_2016:int = 11;
      
      public static const KIND_CHARM_STAR:int = 12;
      
      public static const KIND_WORLD_BOSS_RANK:int = 13;
      
      public static const KIND_SECRET_EXPLORE:int = 15;
      
      public static const KIND_TPKC:int = 16;
      
      public static const KIND_CWTOTAL:int = 50;
      
      public static const KIND_CWTODAY:int = 51;
      
      public static const KIND:String = "kind";
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_rank";
       
      
      private var _rankMin:int;
      
      private var _rankMax:int;
      
      public var id:int;
      
      public var kind:int;
      
      public var rank:String;
      
      public var jibenjiangli:String;
      
      public var chaojijiangli:String;
      
      public var title_id:int;
      
      public var title_name:int;
      
      public function StcRankVo()
      {
         super();
      }
      
      public function get rankMin() : int
      {
         if(_rankMin == 0)
         {
            _rankMin = this.rank.split(":")[0];
         }
         return _rankMin;
      }
      
      public function get rankMax() : int
      {
         if(_rankMax == 0)
         {
            _rankMax = this.rank.split(":")[1];
         }
         return _rankMax;
      }
      
      public function checkRank(param1:int) : Boolean
      {
         return param1 >= rankMin && param1 <= rankMax;
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         rank = param1[2];
         jibenjiangli = param1[3];
         chaojijiangli = param1[4];
         title_id = param1[5];
         title_name = param1[6];
      }
   }
}
