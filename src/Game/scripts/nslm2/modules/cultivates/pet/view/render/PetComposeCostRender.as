package nslm2.modules.cultivates.pet.view.render
{
   import game.ui.petModule.comps.PetComposeCostRenderUI;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   
   public class PetComposeCostRender extends PetComposeCostRenderUI
   {
       
      
      public function PetComposeCostRender()
      {
         super();
         img_icon.mouseEnabled = true;
         img_icon.buttonMode = true;
         img_icon.addEventListener("click",clickedHandler);
      }
      
      protected function clickedHandler(param1:MouseEvent) : void
      {
         AlertUtil.lackItem(wealthVo);
      }
   }
}
