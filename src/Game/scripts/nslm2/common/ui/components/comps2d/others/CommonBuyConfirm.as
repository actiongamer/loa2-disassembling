package nslm2.common.ui.components.comps2d.others
{
   import game.ui.commons.comps.others.CommonBuyConfirmUI;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.common.vo.CommonBuyVo;
   import com.mz.core.event.MzEvent;
   import nslm2.common.vo.WealthVo;
   
   public class CommonBuyConfirm extends CommonBuyConfirmUI
   {
       
      
      private var _vo:CommonBuyVo;
      
      public function CommonBuyConfirm(param1:CommonBuyVo)
      {
         super();
         _vo = param1;
         this.render_cost.dataSource = param1.costVo;
         this.render_item.dataSource = param1.itemVo;
         this.txt_alert.text = "";
         this.numBar.init(1,getCanBuyMaxCount(),1);
         switchEventListeners(true);
      }
      
      public function getCanBuyMaxCount() : int
      {
         return Math.min(_vo.limitCanBuyCount,PlayerModel.ins.getCountByWealthVo(_vo.costVo) / _vo.costVo.count);
      }
      
      public function get numBar() : NumBarS1
      {
         return numBarUI as NumBarS1;
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
      
      public function setAlertTxt(param1:String) : void
      {
         this.txt_alert.text = param1;
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.numBar.addEventListener("evt_numbar_value_change",numBarRef_change);
         }
         else
         {
            this.numBar.removeEventListener("evt_numbar_value_change",numBarRef_change);
         }
      }
      
      private function numBarRef_change(param1:MzEvent) : void
      {
         var _loc2_:WealthVo = _vo.costVo.clone();
         _loc2_.count = _loc2_.count * numBar.nowNum;
         this.render_cost.dataSource = _loc2_;
      }
   }
}
