package nslm2.modules.battles.reportPlayer
{
   import nslm2.nets.sockets.DataNotifyCacheVo;
   
   public class BattleReportParamVo
   {
      
      public static const TYPE_REPORT:int = 0;
      
      public static const TYPE_ARENA:int = 1;
      
      public static const TYPE_TEAMGUAJI_PVP:int = 2;
      
      public static const TYPE_FAMILY_BOSS:int = 3;
      
      public static const TYPE_PK_CROSS:int = 4;
      
      public static const TYPE_WORLD_BOSS:int = 5;
      
      public static const TYPE_GPK:int = 6;
       
      
      public var reportIds:Array;
      
      public var isWin:Boolean;
      
      public var drops:Array;
      
      public var dataNotifyCacheVo:DataNotifyCacheVo;
      
      public var type:int;
      
      public var robSuccess:Boolean;
      
      public var familybossId:int;
      
      public var otherskillBoss:Boolean;
      
      public var familybossDmg:int;
      
      public function BattleReportParamVo()
      {
         super();
      }
      
      public static function createIds(param1:Array) : BattleReportParamVo
      {
         var _loc2_:BattleReportParamVo = new BattleReportParamVo();
         _loc2_.reportIds = param1.concat();
         return _loc2_;
      }
      
      public static function createId(param1:String) : BattleReportParamVo
      {
         return createIds([param1]);
      }
      
      public static function createReportVo(param1:String, param2:*, param3:Array, param4:DataNotifyCacheVo, param5:int = 1) : BattleReportParamVo
      {
         var _loc6_:BattleReportParamVo = BattleReportParamVo.createIds([param1]);
         _loc6_.isWin = param2;
         _loc6_.drops = param3;
         _loc6_.dataNotifyCacheVo = param4;
         _loc6_.type = param5;
         return _loc6_;
      }
   }
}
