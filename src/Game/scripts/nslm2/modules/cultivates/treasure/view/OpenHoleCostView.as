package nslm2.modules.cultivates.treasure.view
{
   import game.ui.treasures.inlay.OpenHoleCostViewUI;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   
   public class OpenHoleCostView extends OpenHoleCostViewUI
   {
       
      
      public function OpenHoleCostView()
      {
         super();
         list_cost.selectHandler = listSelectHandler;
      }
      
      public function show(param1:Array, param2:String) : void
      {
         txt_title.text = param2;
         list_cost.selectedIndex = 0;
         list_cost.dataSource = param1;
         setDefaultSelect(param1);
      }
      
      private function setDefaultSelect(param1:Array) : void
      {
         var _loc2_:* = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:int = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = param1[_loc6_];
            _loc4_ = PlayerModel.ins.getCountByWealthVo(_loc3_);
            _loc2_ = _loc6_;
            if(_loc3_.count > _loc4_)
            {
               _loc6_++;
               continue;
            }
            break;
         }
         list_cost.selectedIndex = _loc2_;
         TreasureModel.ins.openHoleCostType = _loc2_ + 1;
      }
      
      private function listSelectHandler(param1:int) : void
      {
         TreasureModel.ins.openHoleCostType = param1 + 1;
      }
   }
}
