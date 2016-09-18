package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.mgrs.stcMgrs.vos.StcMengyueVo;
   
   public class TooltipStcMengYue extends TooltipUICommon
   {
       
      
      public function TooltipStcMengYue()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         var _loc3_:StcMengyueVo = param1 as StcMengyueVo;
         this.addTxt(_loc3_.name);
         this.addVGap(10);
         this.addLine();
         this.addVGap(10);
         this.addTxt(_loc3_.desc);
         this.validateSize();
      }
   }
}
