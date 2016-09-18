package nslm2.modules.funnies.championShip.view.comp
{
   import game.ui.championship.comp.ProgressLine5UI;
   import nslm2.modules.funnies.championShip.view.IProgressLine;
   import nslm2.modules.funnies.championShip.ctr.ProgressLineCtr;
   
   public class ProgressLine5 extends ProgressLine5UI implements IProgressLine
   {
       
      
      private var ctr:ProgressLineCtr;
      
      public function ProgressLine5()
      {
         super();
         ctr = new ProgressLineCtr(this);
         this.parts.push(ctr);
      }
      
      public function set highlight(param1:Boolean) : void
      {
         ctr.highlight = param1;
      }
      
      public function set lineColor(param1:uint) : void
      {
         ctr.lineColor = param1;
      }
   }
}
