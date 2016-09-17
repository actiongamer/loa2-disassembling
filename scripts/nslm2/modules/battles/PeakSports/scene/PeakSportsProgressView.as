package nslm2.modules.battles.PeakSports.scene
{
   import game.ui.peakSports.peakSportsScene.panel.PeakSportsProgressViewUI;
   
   public class PeakSportsProgressView extends PeakSportsProgressViewUI
   {
       
      
      public function PeakSportsProgressView()
      {
         super();
         init();
      }
      
      private function init() : void
      {
         blueBar.mask = maskBar;
         maskBar.scaleX = 0.5;
         bar.x = blueBar.x + blueBar.width * maskBar.scaleX - (bar.width >> 1);
      }
      
      public function value(param1:Number, param2:uint) : void
      {
         maskBar.scaleX = param1;
         bar.x = blueBar.x + blueBar.width * param1 - (bar.width >> 1);
      }
   }
}
