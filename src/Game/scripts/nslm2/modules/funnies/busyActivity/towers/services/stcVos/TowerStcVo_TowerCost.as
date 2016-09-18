package nslm2.modules.funnies.busyActivity.towers.services.stcVos
{
   public class TowerStcVo_TowerCost
   {
      
      public static const COUNT:String = "count";
       
      
      public var cost:String;
      
      public var cost2:String;
      
      public var score:int;
      
      public var kind:int;
      
      public var count:int;
      
      public function TowerStcVo_TowerCost(param1:Object)
      {
         super();
         this.cost = param1.cost;
         this.cost2 = param1.cost2;
         this.kind = int(param1.kind);
         this.count = int(param1.count);
      }
   }
}
