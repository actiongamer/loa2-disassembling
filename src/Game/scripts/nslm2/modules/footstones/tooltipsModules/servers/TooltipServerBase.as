package nslm2.modules.footstones.tooltipsModules.servers
{
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.modules.footstones.tooltipsModules.TooltipConfigVo;
   
   public class TooltipServerBase extends TaskBase
   {
       
      
      public var configVo:TooltipConfigVo;
      
      public var tooltipData;
      
      public function TooltipServerBase(param1:TooltipConfigVo, param2:*)
      {
         super();
         this.configVo = param1;
         this.tooltipData = param2;
      }
   }
}
