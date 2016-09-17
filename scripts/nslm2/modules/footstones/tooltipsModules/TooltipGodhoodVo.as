package nslm2.modules.footstones.tooltipsModules
{
   import proto.HeroInfo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   
   public class TooltipGodhoodVo
   {
       
      
      public var heroinfo:HeroInfo;
      
      public var stcItemVo:StcItemVo;
      
      public function TooltipGodhoodVo(param1:HeroInfo, param2:StcItemVo)
      {
         super();
         heroinfo = param1;
         stcItemVo = param2;
      }
   }
}
