package nslm2.modules.foundations.mall.view
{
   import game.ui.mallModule.MallBuySuccessPanelUI;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.DisplayUtils;
   import com.greensock.TweenLite;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.Event;
   import nslm2.common.uiEffects.ListIconFlyEff;
   
   public class MallBuySuccessPanel extends MallBuySuccessPanelUI
   {
       
      
      private var eff:BmcSpriteSheet;
      
      public function MallBuySuccessPanel()
      {
         super();
      }
      
      public function show(param1:Object) : void
      {
         list_item.repeatX = param1.length;
         list_item.x = this.width - list_item.width >> 1;
         list_item.dataSource = param1;
         eff = new BmcSpriteSheet();
         eff.x = 112;
         eff.y = -8;
         eff.init(1015007,1,"all",true);
         DisplayUtils.addChildBelow(eff,list_item);
         fadeIn();
      }
      
      public function fadeIn() : void
      {
         TweenLite.from(this,0.3,{
            "alpha":0,
            "y":this.y + 50
         });
         TweenLite.delayedCall(3,fadeOut);
         UIMgr.stage.addEventListener("click",fadeOut);
      }
      
      private function fadeOut(param1:Event = null) : void
      {
         eff.dispose();
         TweenLite.killDelayedCallsTo(fadeOut);
         UIMgr.stage.removeEventListener("click",fadeOut);
         new ListIconFlyEff(this.list_item).exec();
         TweenLite.to(this,0.3,{
            "alpha":0,
            "y":this.y - 50,
            "onComplete":dispose
         });
      }
   }
}
