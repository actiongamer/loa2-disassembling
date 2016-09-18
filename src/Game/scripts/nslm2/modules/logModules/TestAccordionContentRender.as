package nslm2.modules.logModules
{
   import game.ui.logModules.TestAccordionContentRenderUI;
   
   public class TestAccordionContentRender extends TestAccordionContentRenderUI
   {
       
      
      public function TestAccordionContentRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            if(param1 == "null")
            {
               this.txt2.text = "";
            }
            else
            {
               this.txt2.text = String(param1);
            }
         }
      }
   }
}
