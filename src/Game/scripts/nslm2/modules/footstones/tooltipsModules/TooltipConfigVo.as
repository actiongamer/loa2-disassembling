package nslm2.modules.footstones.tooltipsModules
{
   public class TooltipConfigVo
   {
       
      
      public var uiClass:Class;
      
      public var serverTaskClass:Class;
      
      public function TooltipConfigVo(param1:Class, param2:Class = null)
      {
         super();
         this.uiClass = param1;
         this.serverTaskClass = param2;
      }
   }
}
