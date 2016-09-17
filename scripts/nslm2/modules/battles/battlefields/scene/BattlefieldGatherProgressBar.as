package nslm2.modules.battles.battlefields.scene
{
   import game.ui.battlefield.BattlefieldScene.render.BattlefieldGatherProgressBarUI;
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class BattlefieldGatherProgressBar extends BattlefieldGatherProgressBarUI
   {
       
      
      private var _progressValue:Number = 0;
      
      public function BattlefieldGatherProgressBar()
      {
         super();
         this.progressBar.alpha = 0;
         this.txt_progressValue.alpha = 0;
      }
      
      public function show(param1:Number) : void
      {
         TweenLite.killTweensOf(this);
         TweenLite.killTweensOf(this.progressValue);
         TweenLite.killTweensOf(this.txt_progressValue);
         this.progressValue = 0;
         this.progressBar.alpha = 0;
         this.txt_progressValue.alpha = 0;
         TweenLite.to(this,param1,{
            "progressValue":1,
            "onComplete":stop,
            "ease":Linear.ease
         });
         TweenLite.to(this.progressBar,0.2,{"alpha":1});
         TweenLite.to(this.txt_progressValue,0.2,{"alpha":1});
      }
      
      public function get progressValue() : Number
      {
         return _progressValue;
      }
      
      public function set progressValue(param1:Number) : void
      {
         _progressValue = param1;
         this.progressBar.value = param1;
         this.txt_progressValue.text = LocaleConsts.percentStr(param1);
      }
      
      public function stop() : void
      {
         TweenLite.killTweensOf(this);
         TweenLite.killTweensOf(this.progressValue);
         TweenLite.killTweensOf(this.txt_progressValue);
         TweenLite.to(this.progressBar,0.2,{"alpha":0});
         TweenLite.to(this.txt_progressValue,0.2,{"alpha":0});
      }
   }
}
