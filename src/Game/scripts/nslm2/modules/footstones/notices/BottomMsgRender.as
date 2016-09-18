package nslm2.modules.footstones.notices
{
   import game.ui.notices.BottomMsgRenderUI;
   import nslm2.common.ui.components.comps2d.others.RedPointNum;
   import com.mz.core.mediators.RollMediator;
   import nslm2.common.ctrls.TSM;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import morn.customs.FilterLib;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import flash.events.MouseEvent;
   import com.mz.core.event.MzEvent;
   
   public class BottomMsgRender extends BottomMsgRenderUI
   {
      
      public static const TRIGGERED:String = "triggered";
       
      
      private var rollMed:RollMediator;
      
      private var tsm:TSM;
      
      private var filterBreath:GlowFilterBreathCtrl;
      
      public function BottomMsgRender()
      {
         super();
         tsm = new TSM(this,0.3).addState(44,{
            "alpha":0,
            "y":60
         });
         tsm.toState(44,0);
         rollMed = new RollMediator(this,rollHandler);
         this.addEventListener("click",clickHandler);
         this.buttonMode = true;
      }
      
      public function get redPointRef() : RedPointNum
      {
         return this.redPoint as RedPointNum;
      }
      
      private function filterBreath_cb(param1:Array) : void
      {
         this.filters = param1;
      }
      
      public function get vo() : BottomMsgVo
      {
         return this.dataSource as BottomMsgVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         .super.dataSource = param1;
         if(vo)
         {
            if(filterBreath == null)
            {
               filterBreath = new GlowFilterBreathCtrl(FilterLib.TEXT_GROW_SELECTED_FILTER).set_duration(1.2).addHandler(filterBreath_cb);
            }
            this.tsm.toState();
            _loc3_ = BottomMsgConsts.ins.getConfigVo(vo.kind);
            this.img_icon.url = UrlLib.bottomMsgIcon(_loc3_.icon);
            _loc2_ = vo.dataArr.length;
            if(vo.forceShowCount > -1)
            {
               _loc2_ = vo.forceShowCount;
            }
            if(_loc2_ <= 1)
            {
               this.redPointRef.visible = false;
            }
            else
            {
               this.redPointRef.visible = true;
               this.redPointRef.count = _loc2_;
            }
            this.toolTip = vo.configVo.name;
         }
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         this.tsm.toState(44);
         this.dispatchEvent(new MzEvent("triggered",this.vo,true));
      }
      
      private function rollHandler(param1:Boolean) : void
      {
         this.img_icon.filters = !!param1?[FilterLib.BUTTON_OVER_STATE]:null;
      }
      
      override public function dispose() : void
      {
         rollMed.dispose();
         if(filterBreath != null)
         {
            filterBreath.dispose();
            filterBreath = null;
         }
         rollMed = null;
         super.dispose();
      }
   }
}
