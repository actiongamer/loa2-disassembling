package nslm2.modules.foundations.recycle.service
{
   import proto.RecycleHeroDecomposeReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.RecycleEquipDecomposeReq;
   import proto.RecycleBaowuDecomposeReq;
   import proto.RecyclePetDecomposeReq;
   
   public class RecycleService
   {
      
      private static var _ins:nslm2.modules.foundations.recycle.service.RecycleService;
       
      
      public function RecycleService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.recycle.service.RecycleService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.recycle.service.RecycleService();
         }
         return _ins;
      }
      
      public function recycleHeroDecompose(param1:Array, param2:Boolean, param3:uint, param4:Function, param5:Function) : void
      {
         var _loc6_:RecycleHeroDecomposeReq = new RecycleHeroDecomposeReq();
         _loc6_.id = param1;
         _loc6_.confirm = param2;
         _loc6_.kind = param3;
         ServerEngine.ins.send(5330,_loc6_,param4,param5);
      }
      
      public function recycleEquipDecompose(param1:Array, param2:Boolean, param3:Boolean, param4:Function, param5:Function) : void
      {
         var _loc6_:RecycleEquipDecomposeReq = new RecycleEquipDecomposeReq();
         _loc6_.id = param1;
         _loc6_.confirm = param2;
         _loc6_.crit = param3;
         ServerEngine.ins.send(5331,_loc6_,param4,param5);
      }
      
      public function recycleTreasureReborn(param1:Array, param2:Boolean, param3:Function, param4:Function, param5:int = 0) : void
      {
         var _loc6_:RecycleBaowuDecomposeReq = new RecycleBaowuDecomposeReq();
         _loc6_.id = param1;
         _loc6_.confirm = param2;
         _loc6_.kind = param5;
         ServerEngine.ins.send(5332,_loc6_,param3,param4);
      }
      
      public function recyclePetReborn(param1:Array, param2:Boolean, param3:Function, param4:Function, param5:int = 0) : void
      {
         var _loc6_:RecyclePetDecomposeReq = new RecyclePetDecomposeReq();
         _loc6_.id = param1;
         _loc6_.confirm = param2;
         _loc6_.kind = param5;
         ServerEngine.ins.send(5334,_loc6_,param3,param4);
      }
   }
}
