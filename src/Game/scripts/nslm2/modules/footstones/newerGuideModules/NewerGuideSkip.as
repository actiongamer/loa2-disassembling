package nslm2.modules.footstones.newerGuideModules
{
   import game.ui.newerGuideModules.NewerGuideSkipUI;
   import com.greensock.TweenLite;
   
   public class NewerGuideSkip extends NewerGuideSkipUI
   {
       
      
      public function NewerGuideSkip()
      {
         super();
         this.txt_content.mouseEvent = false;
      }
      
      public function show() : void
      {
      }
      
      private function show2() : void
      {
         this.alpha = 0;
         this.visible = true;
         TweenLite.to(this,0.5,{"alpha":1});
      }
      
      public function hide() : void
      {
         TweenLite.killDelayedCallsTo(this.show2);
         TweenLite.killTweensOf(this);
         this.visible = false;
      }
   }
}
