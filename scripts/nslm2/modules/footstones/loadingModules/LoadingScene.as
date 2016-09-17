package nslm2.modules.footstones.loadingModules
{
   import game.ui.loadingModules.LoadingSceneUI;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import com.greensock.TweenLite;
   
   public class LoadingScene extends LoadingSceneUI
   {
       
      
      public function LoadingScene()
      {
         super();
         var _loc1_:int = 0;
         this._centerY = _loc1_;
         this.centerX = _loc1_;
         this.hide();
      }
      
      public function set percent(param1:int) : void
      {
         this.txt_process.text = "Loading " + LocaleConsts.percentStrInt(param1);
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
            TweenLite.to(this,0.2,{
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
         }
      }
   }
}
