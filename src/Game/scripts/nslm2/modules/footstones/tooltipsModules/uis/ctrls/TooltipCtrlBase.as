package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   
   public class TooltipCtrlBase implements IDispose
   {
       
      
      public var ui:TooltipUICommon;
      
      public function TooltipCtrlBase(param1:TooltipUICommon)
      {
         super();
         this.ui = param1;
      }
      
      public function dispose() : void
      {
         ui = null;
      }
   }
}
