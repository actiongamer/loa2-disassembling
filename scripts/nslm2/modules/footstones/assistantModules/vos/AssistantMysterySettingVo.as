package nslm2.modules.footstones.assistantModules.vos
{
   import nslm2.utils.RTools;
   import nslm2.utils.ServerTimer;
   
   public class AssistantMysterySettingVo
   {
       
      
      public var needUseItemRefresh:Boolean;
      
      public var useItemRefreshTimes:uint;
      
      private var _todayUseItemRefreshTimes:uint;
      
      public var buyLockHero:Boolean;
      
      public var lastItemRefreshStamp:uint;
      
      public var needBuyItemArr:Array;
      
      public function AssistantMysterySettingVo()
      {
         needBuyItemArr = [];
         super();
      }
      
      public function set todayUseItemRefreshTimes(param1:int) : void
      {
         _todayUseItemRefreshTimes = param1;
      }
      
      public function get todayUseItemRefreshTimes() : int
      {
         var _loc1_:Number = NaN;
         if(lastItemRefreshStamp == 0)
         {
            return _todayUseItemRefreshTimes;
         }
         _loc1_ = RTools.getTimestamp(ServerTimer.ins.date.fullYear,ServerTimer.ins.date.month + 1,ServerTimer.ins.date.date,0,0,0,0);
         if(lastItemRefreshStamp * 1000 <= _loc1_ && ServerTimer.ins.second * 1000 >= _loc1_)
         {
            _todayUseItemRefreshTimes = 0;
         }
         return _todayUseItemRefreshTimes;
      }
   }
}
