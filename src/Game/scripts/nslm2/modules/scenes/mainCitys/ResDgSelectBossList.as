package nslm2.modules.scenes.mainCitys
{
   import game.ui.mainCitys.ResDgSelectBossListUI;
   import nslm2.common.compsEffects.ListSelectSlideEffect;
   import com.greensock.TweenLite;
   import com.mz.core.event.ChangeValueEvent;
   import flash.events.MouseEvent;
   import com.mz.core.event.MzEvent;
   import morn.core.components.Component;
   
   public class ResDgSelectBossList extends ResDgSelectBossListUI
   {
       
      
      private var listSelectSlideEffect:ListSelectSlideEffect;
      
      public function ResDgSelectBossList()
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         super();
         this.list1.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S1";
         var _loc2_:int = this.box_btn.numChildren;
         _loc3_ = _loc2_ - 1;
         while(_loc3_ >= 0)
         {
            _loc1_ = this.box_btn.getChildAt(_loc3_) as Component;
            if(_loc1_ != this.box_btn.btn_enter)
            {
               _loc1_.mouseEvent = false;
            }
            _loc3_--;
         }
         listSelectSlideEffect = new ListSelectSlideEffect(this.list1);
         this.txt_levelTimes.visible = false;
         this.btn_add.visible = false;
      }
      
      public function init(param1:Array) : void
      {
         this.right = -this.width - 10;
         this.list1.dataSource = param1;
         this.list1.selectedIndex = -1;
         this.list1.changeHandler = list_change;
      }
      
      override public function fadeIn(param1:Number = 0, param2:int = 0) : void
      {
         this.isFadeIn = true;
         this.visible = true;
         this.list1.refresh();
         this.list1.selectedIndex = -1;
         this.box_btn.visible = false;
         TweenLite.to(this,0.3,{
            "right":0,
            "onComplete":fadeView_fadeInCpl
         });
      }
      
      override public function fadeOut() : void
      {
         this.isFadeIn = false;
         TweenLite.to(this,0.3,{"right":-this.width - 10});
      }
      
      private function list_change(param1:int) : void
      {
         this.dispatchEvent(new ChangeValueEvent(this.list1.selectedItem));
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         this.dispatchEvent(new MzEvent("close"));
      }
      
      public function hideBtnEnter() : void
      {
         this.box_btn.visible = false;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(listSelectSlideEffect != null)
         {
            listSelectSlideEffect.dispose();
            listSelectSlideEffect = null;
         }
      }
   }
}
