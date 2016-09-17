package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.footstones.tooltipsModules.TooltipCompareVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTxt;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipItem;
   import nslm2.modules.footstones.tooltipsModules.uis.ToolTipTreasure;
   
   public class TooltipCompareCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipCompareCtrl(param1:TooltipUICommon, param2:TooltipCompareVo)
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         super(param1);
         if(param2.curVo)
         {
            var _loc5_:* = param2.curVo.kind;
            if(20 !== _loc5_)
            {
               if(30 !== _loc5_)
               {
                  if(2121 !== _loc5_)
                  {
                     _loc4_ = ui.addTxt(LocaleMgr.ins.getStr(3000 + param2.curVo.kind),14210735,17);
                     ui.width = _loc4_.x * 2 + _loc4_.width;
                     ui.img_bg.width = ui.width;
                  }
                  else
                  {
                     ui.parts.push(new ToolTipTreasureCtrl(ui,param2.curVo.treasure));
                  }
               }
               else
               {
                  ui.parts.push(new TooltipStcNpcCtrl(ui,param2.curVo.stcNpcVo));
               }
            }
            else if(param2.curVo.item)
            {
               ui.parts.push(new TooltipItemCtrl(ui,param2.curVo.item));
            }
            else
            {
               ui.parts.push(new TooltipStcItemCtrl(ui,param2.curVo.stcItemVo));
            }
         }
         if(param2.compareVo)
         {
            if(param2.curVo.kind == 20)
            {
               _loc3_ = new TooltipItem();
               _loc3_.show(param2.compareVo.item);
            }
            else if(param2.curVo.kind == 2121)
            {
               _loc3_ = new ToolTipTreasure();
               _loc3_.show(param2.compareVo.treasure);
            }
            _loc3_.x = ui.width;
            ui.width = ui.width + _loc3_.width;
            ui.addChild(_loc3_);
         }
      }
   }
}
