package nslm2.modules.bag
{
   import game.ui.BagModules.SellBatchItemRenderUI;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import flash.events.Event;
   import com.mz.core.event.ValueChangedEvent;
   import flash.events.MouseEvent;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import morn.customs.components.WealthRender;
   import nslm2.common.uiEffects.IconFlyEff;
   import nslm2.common.uiEffects.WealthFlyEffectTask;
   
   public class SellBatchItemRender extends SellBatchItemRenderUI
   {
       
      
      public function SellBatchItemRender()
      {
         super();
         this.showMultipleSign = true;
         this.btn_remove.addEventListener("click",btn_removeHandler);
         numBar.addEventListener("evt_numbar_value_change",numBar_change);
      }
      
      public function get numBar() : NumBarS1
      {
         return this.numBarUI as NumBarS1;
      }
      
      private function numBar_change(param1:Event) : void
      {
         var _loc2_:Number = this.wealthVo.extraData["sellCount"];
         this.wealthVo.extraData["sellCount"] = numBar.nowNum;
         countSellPrice();
         this.dispatchEvent(new ValueChangedEvent("evtSellBatchCountChanged",this.wealthVo.extraData["sellCount"],_loc2_,true));
      }
      
      public function btn_removeHandler(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event("evtSellBatchRemove",true));
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(wealthVo && wealthVo.kind != 0)
         {
            if(!this.wealthVo.extraData["sellCount"])
            {
               this.wealthVo.extraData["sellCount"] = 1;
            }
            this.numBar.init(1,this.wealthVo.item.count,this.wealthVo.extraData["sellCount"]);
            countSellPrice();
         }
      }
      
      private function countSellPrice() : void
      {
         var _loc1_:WealthVo = WealthUtil.parseCostStr(this.wealthVo.stcItemVo.sell_price);
         _loc1_.count = _loc1_.count * this.wealthVo.extraData["sellCount"];
         this.renderSellPrice.wealthVo = _loc1_;
      }
      
      override protected function validateTooltip() : void
      {
         if(wealthVo && wealthVo.kind != 0)
         {
            this.img_icon.toolTip = WealthUtil.tooltip(wealthVo);
         }
         else
         {
            this.img_icon.toolTip = null;
         }
      }
      
      public function flyFrom(param1:WealthRender) : void
      {
         this.setVisibleList("SELL_BATCH_RENDER",false);
         IconFlyEff.createFlyTo(param1.ref_img_icon,this.img_icon).addHandlers(flyCpl).exec();
      }
      
      protected function flyCpl() : void
      {
         this.setVisibleList("SELL_BATCH_RENDER",true);
      }
      
      public function wealthFly() : void
      {
         if(wealthVo && wealthVo.kind != 0)
         {
            new WealthFlyEffectTask(this.renderSellPrice.wealthVo.kind,this.renderSellPrice.wealthVo.count,this.renderSellPrice.img_icon).exec();
         }
      }
   }
}
