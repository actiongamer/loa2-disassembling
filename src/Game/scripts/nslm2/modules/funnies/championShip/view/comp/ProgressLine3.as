package nslm2.modules.funnies.championShip.view.comp
{
   import game.ui.championship.comp.ProgressLine3UI;
   import nslm2.modules.funnies.championShip.view.IProgressLine;
   import nslm2.modules.funnies.championShip.ctr.ProgressLineCtr;
   
   public class ProgressLine3 extends ProgressLine3UI implements IProgressLine
   {
       
      
      private var ctr:ProgressLineCtr;
      
      public function ProgressLine3()
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
