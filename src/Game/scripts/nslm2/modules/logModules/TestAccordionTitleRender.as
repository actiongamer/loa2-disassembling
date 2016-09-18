package nslm2.modules.logModules
{
   import game.ui.logModules.TestAccordionTitleRenderUI;
   
   public class TestAccordionTitleRender extends TestAccordionTitleRenderUI
   {
       
      
      public function TestAccordionTitleRender()
      {
         super();
      }
      
      override public function changeSelectState(param1:int) : void
      {
         super.changeSelectState(param1);
         switch(int(param1) - 1)
         {
            case 0:
               this.txt1.text = "up";
               break;
            case 1:
               this.txt1.text = "over";
               break;
            case 2:
               this.txt1.text = "select";
         }
      }
   }
}
