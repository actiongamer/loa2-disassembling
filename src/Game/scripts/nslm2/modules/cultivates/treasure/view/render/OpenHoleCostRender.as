package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.render.OpenHoleCostRenderUI;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class OpenHoleCostRender extends OpenHoleCostRenderUI
   {
       
      
      public function OpenHoleCostRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         var _loc2_:int = BagModel.ins.getStcCount(wealthVo.sid);
         if(wealthVo.kind == 3)
         {
            _loc2_ = PlayerModel.ins.diamond;
         }
         if(_loc2_ >= wealthVo.count)
         {
            txt_num.color = 458496;
         }
         else
         {
            txt_num.color = 16723968;
         }
         txt_num.text = wealthVo.count + "";
         txt_have.text = "(" + LocaleMgr.ins.getStr(999000552) + _loc2_ + ")";
      }
      
      override public function changeSelectState(param1:int) : void
      {
         if(param1 == 2)
         {
            return;
         }
         radiaoBtn.selected = param1 == 3;
      }
   }
}
