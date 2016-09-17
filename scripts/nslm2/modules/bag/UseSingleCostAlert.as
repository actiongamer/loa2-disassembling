package nslm2.modules.bag
{
   import game.ui.BagModules.UseSingleCostAlertUI;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class UseSingleCostAlert extends UseSingleCostAlertUI
   {
       
      
      public function UseSingleCostAlert(param1:String, param2:int = 1)
      {
         super();
         var _loc3_:WealthVo = WealthUtil.parseCostStr(param1);
         _loc3_.count = _loc3_.count * param2;
         this.renderCost.wealthVo = _loc3_;
         if(this.renderCost.wealthVo.kind == 20)
         {
            this.txt_content1.text = LocaleMgr.ins.getStr(11000902);
         }
         else
         {
            this.txt_content1.text = LocaleMgr.ins.getStr(11000903);
         }
      }
   }
}
