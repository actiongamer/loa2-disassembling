package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.bag.itemModuels.ItemMsg;
   import proto.Item;
   import nslm2.modules.bag.itemModuels.BagModel;
   import proto.BaoWu;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.ToolTipTreasureCtrl;
   import com.mz.core.logging.Log;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipItemCtrl;
   
   public class TooltipItemMsg extends TooltipUICommon
   {
       
      
      public function TooltipItemMsg()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:ItemMsg = param1 as ItemMsg;
         if(_loc4_.item)
         {
            _loc3_ = _loc4_.item;
         }
         else
         {
            _loc3_ = BagModel.ins.getItemById(_loc4_.itemId);
         }
         _loc5_ = _loc4_.baowu;
         if(_loc5_)
         {
            this.parts.push(new ToolTipTreasureCtrl(this,_loc5_));
            this.validateSize();
            return;
         }
         if(_loc3_ == null)
         {
            Log.fatal(this,"没有找到物品 itemId:",_loc4_.itemId,"from",_loc4_.playerId);
         }
         else
         {
            this.parts.push(new TooltipItemCtrl(this,_loc3_));
            this.validateSize();
         }
      }
   }
}
