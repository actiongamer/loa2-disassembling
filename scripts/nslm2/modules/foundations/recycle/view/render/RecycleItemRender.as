package nslm2.modules.foundations.recycle.view.render
{
   import game.ui.recycleModules.render.RecycleItemRenderUI;
   import nslm2.modules.foundations.recycle.vo.RecycleVo;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.compsEffects.FlickerEffCtrl;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import morn.core.components.Button;
   
   public class RecycleItemRender extends RecycleItemRenderUI
   {
       
      
      private var _data:RecycleVo;
      
      private var flickerTxtExpPre:FlickerEffCtrl;
      
      private var floatEff:FloatUpDownEffCtrl;
      
      public function RecycleItemRender()
      {
         super();
         btn_remove.clickHandler = removeSelf;
         img_plus.addEventListener("click",imgPlusClickHandler);
         img_icon.addEventListener("click",imgPlusClickHandler);
      }
      
      protected function imgPlusClickHandler(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("recycle_notice_show_select_panel");
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
         _data = param1 as RecycleVo;
         if(_data)
         {
            box_content.visible = true;
            img_plus.visible = false;
            btn_remove.visible = true;
            if(flickerTxtExpPre)
            {
               flickerTxtExpPre.pause();
            }
            if(!floatEff)
            {
               floatEff = new FloatUpDownEffCtrl();
               floatEff.config(0.8);
               floatEff.init(this.box_content,NaN,4,4);
            }
            floatEff.reStart();
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
            if(floatEff)
            {
               floatEff.dispose();
            }
            floatEff = null;
         }
         .super.dataSource = param1;
      }
      
      private function removeSelf(param1:Button) : void
      {
         _data.isSelected = false;
         ObserverMgr.ins.sendNotice("recycle_notice_update_list");
      }
   }
}
