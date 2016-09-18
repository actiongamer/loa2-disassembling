package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.footstones.tooltipsModules.TooltipCompareVo;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipCompareCtrl;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipItemCtrl;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipStcItemCtrl;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.ToolTipTreasureCtrl;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipStcNpcCtrl;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipWealthCommonCtrl;
   
   public class TooltipWealth extends TooltipUICommon
   {
       
      
      public function TooltipWealth()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         if(param1 is TooltipCompareVo && (param1 as TooltipCompareVo).compareVo != null)
         {
            this.parts.push(new TooltipCompareCtrl(this,param1));
         }
         else
         {
            _loc3_ = param1 is TooltipCompareVo?(param1 as TooltipCompareVo).curVo:param1 as WealthVo;
            var _loc7_:* = _loc3_.kind;
            if(20 !== _loc7_)
            {
               if(2121 !== _loc7_)
               {
                  if(30 !== _loc7_)
                  {
                     this.parts.push(new TooltipWealthCommonCtrl(this,_loc3_));
                  }
                  else
                  {
                     this.parts.push(new TooltipStcNpcCtrl(this,_loc3_.stcNpcVo));
                  }
               }
               else
               {
                  this.parts.push(new ToolTipTreasureCtrl(this,_loc3_.treasure));
               }
            }
            else if(_loc3_.item)
            {
               this.parts.push(new TooltipItemCtrl(this,_loc3_.item));
            }
            else
            {
               this.parts.push(new TooltipStcItemCtrl(this,_loc3_.stcItemVo));
            }
         }
         this.validateSize();
      }
   }
}
