package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import morn.core.utils.StringUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TooltipNpcDescCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipNpcDescCtrl(param1:TooltipUICommon, param2:StcNpcVo)
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         super(param1);
         var _loc5_:Array = [param2.description1,param2.description2];
         var _loc3_:int = _loc5_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ = _loc5_[_loc6_];
            if(StringUtils.isNull(_loc4_) == false)
            {
               ui.addVGap(10);
               ui.addLine();
               ui.addVGap(10);
               ui.addTxt(LocaleMgr.ins.getStr(_loc4_));
            }
            _loc6_++;
         }
      }
   }
}
