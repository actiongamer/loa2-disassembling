package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.render.TreasureListRenderUI;
   import nslm2.modules.cultivates.treasure.vo.TreasureVo;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.compsEffects.FlickerEffCtrl;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import com.greensock.TweenLite;
   import morn.core.components.Button;
   
   public final class TreasureListRender extends TreasureListRenderUI
   {
       
      
      private var _data:TreasureVo;
      
      private var flickerTxtExpPre:FlickerEffCtrl;
      
      private var floatEff:FloatUpDownEffCtrl;
      
      public function TreasureListRender()
      {
         super();
         btn_remove.clickHandler = removeSelf;
         img_plus.addEventListener("click",imgPlusClickHandler);
         img_icon.addEventListener("click",imgPlusClickHandler);
      }
      
      protected function imgPlusClickHandler(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("treasure_show_select_panel");
      }
      
      override public function get wealthVo() : WealthVo
      {
         if(_data)
         {
            return _data.wealthVo;
         }
         return null;
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
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as TreasureVo;
         if(_data)
         {
            box_content.visible = true;
            img_plus.visible = false;
            btn_remove.visible = true;
            if(flickerTxtExpPre)
            {
               flickerTxtExpPre.pause();
            }
            TweenLite.killTweensOf(TweenLite);
            TweenLite.from(box_content,0.1,{"y":box_content.y - 20});
         }
         else
         {
            if(!flickerTxtExpPre)
            {
               flickerTxtExpPre = new FlickerEffCtrl(img_plus,1);
            }
            flickerTxtExpPre.resume();
            box_content.visible = false;
            img_plus.visible = true;
            btn_remove.visible = false;
         }
         .super.dataSource = param1;
      }
      
      private function removeSelf(param1:Button) : void
      {
         _data.selected = false;
         ObserverMgr.ins.sendNotice("treasure_update_selected_list");
      }
   }
}
