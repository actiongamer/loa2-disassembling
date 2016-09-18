package nslm2.modules.roleInfos.vo
{
   import proto.PanelBaseInfo;
   import nslm2.common.vo.WealthVo;
   
   public class RoleTupoNeedVo
   {
       
      
      public var panelBaseInfo:PanelBaseInfo;
      
      public var wealthVo:WealthVo;
      
      public function RoleTupoNeedVo(param1:PanelBaseInfo, param2:WealthVo)
      {
         super();
         panelBaseInfo = param1;
         wealthVo = param2;
      }
      
      public static function voArrFromWealthVoArr(param1:Array, param2:PanelBaseInfo) : Array
      {
         var _loc3_:Array = [];
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc4_ in param1)
         {
            _loc3_.push(new RoleTupoNeedVo(param2,_loc4_));
         }
         return _loc3_;
      }
   }
}
