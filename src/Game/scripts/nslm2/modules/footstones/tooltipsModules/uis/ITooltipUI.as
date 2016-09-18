package nslm2.modules.footstones.tooltipsModules.uis
{
   import com.mz.core.interFace.IFadeView;
   
   public interface ITooltipUI extends IFadeView
   {
       
      
      function show(param1:*, param2:* = null) : void;
      
      function get showWidth() : int;
      
      function get showHeight() : int;
   }
}
