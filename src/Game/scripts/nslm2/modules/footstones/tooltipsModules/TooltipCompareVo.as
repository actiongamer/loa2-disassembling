package nslm2.modules.footstones.tooltipsModules
{
   import nslm2.common.vo.WealthVo;
   
   public class TooltipCompareVo
   {
       
      
      public var curVo:WealthVo;
      
      public var compareVo:WealthVo;
      
      public function TooltipCompareVo(param1:WealthVo, param2:WealthVo = null)
      {
         super();
         curVo = param1;
         compareVo = param2;
      }
   }
}
