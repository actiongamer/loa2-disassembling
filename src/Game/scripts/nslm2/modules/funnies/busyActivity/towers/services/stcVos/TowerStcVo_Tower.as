package nslm2.modules.funnies.busyActivity.towers.services.stcVos
{
   import nslm2.utils.WealthUtil;
   
   public class TowerStcVo_Tower
   {
      
      public static const LAYER:String = "layer";
       
      
      public var reward:String;
      
      public var score:int;
      
      public var kind:int;
      
      public var layer:int;
      
      private var _rewardArr:Array;
      
      public function TowerStcVo_Tower(param1:Object)
      {
         super();
         this.reward = param1.reward;
         this.score = int(param1.score);
         this.kind = int(param1.kind);
         this.layer = int(param1.count);
      }
      
      public function get rewardArr() : Array
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         if(_rewardArr == null)
         {
            _rewardArr = [];
            _loc1_ = this.reward.split(",");
            _loc2_ = _loc1_.length;
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = _loc1_[_loc4_].split("-");
               _rewardArr.push(WealthUtil.parseCostStr(_loc3_[0]));
               _loc4_++;
            }
         }
         return _rewardArr;
      }
   }
}
