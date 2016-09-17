package nslm2.modules.footstones.loadingModules
{
   import game.ui.loadingModules.LoadingPopUI;
   import com.greensock.TweenLite;
   
   public class LoadingPop extends LoadingPopUI
   {
       
      
      public function LoadingPop()
      {
         super();
         this.hide();
         this.img_logo.mask = this.logoMask;
      }
      
      public function set percent(param1:int) : void
      {
         this.logoMask.scaleX = param1 / 100;
      }
      
      public function tweenIn() : void
      {
         this.visible = true;
         TweenLite.to(this,0.1,{
            "delay":0.3,
            "alpha":1,
            "onComplete":tweenInCpl,
            "overwrite":1
         });
      }
      
      public function tweenInCpl() : void
      {
      }
      
      public function tweenOut() : void
      {
         if(this.visible)
         {
            TweenLite.to(this,0.1,{
               "alpha":0,
               "onComplete":tweenOutCpl,
               "overwrite":1
            });
         }
      }
      
      public function tweenOutCpl() : void
      {
         this.visible = false;
      }
      
      public function hide() : void
      {
         if(this.visible)
         {
            TweenLite.killTweensOf(this);
            this.visible = false;
            this.alpha = 0;
         }
      }
   }
}
