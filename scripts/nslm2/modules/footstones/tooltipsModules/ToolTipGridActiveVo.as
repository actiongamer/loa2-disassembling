package nslm2.modules.footstones.tooltipsModules
{
   import nslm2.mgrs.stcMgrs.vos.StcGridPageVo;
   
   public class ToolTipGridActiveVo
   {
       
      
      public var vo:StcGridPageVo;
      
      public var active:Boolean;
      
      public var isMid:Boolean;
      
      public function ToolTipGridActiveVo(param1:StcGridPageVo, param2:Boolean, param3:Boolean = false)
      {
         super();
         vo = param1;
         active = param2;
         isMid = param3;
      }
   }
}
