package nslm2.modules.footstones.tooltipsModules
{
   import flash.display.InteractiveObject;
   import flash.events.MouseEvent;
   
   public class TooltipUtils
   {
       
      
      public function TooltipUtils()
      {
         super();
      }
      
      public static function preventHideByMouseDown(param1:InteractiveObject) : void
      {
         param1.addEventListener("mouseDown",preventHideByMouseDown_handler);
         param1.addEventListener("click",preventHideByMouseDown_handler);
      }
      
      private static function preventHideByMouseDown_handler(param1:MouseEvent) : void
      {
         param1.stopPropagation();
      }
   }
}
