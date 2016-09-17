package nslm2.modules.funnies.newYears.day51s.renders
{
   import game.ui.newYears.day51s.renders.Day51CostRender2UI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class Day51CostRender2 extends Day51CostRender2UI
   {
       
      
      public function Day51CostRender2()
      {
         super();
      }
      
      override protected function validateTxtNum() : void
      {
         super.validateTxtName();
         this.ref_txt_num.text = LocaleMgr.ins.getStr(60300008) + wealthVo.showCount;
      }
   }
}
