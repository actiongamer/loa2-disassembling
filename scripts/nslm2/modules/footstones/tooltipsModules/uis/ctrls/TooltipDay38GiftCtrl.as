package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.funnies.newYears.day38s.Day38GiftVo;
   import morn.core.components.Label;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.stcMgrs.consts.QualityConsts;
   
   public class TooltipDay38GiftCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipDay38GiftCtrl(param1:TooltipUICommon, param2:Day38GiftVo)
      {
         var _loc7_:int = 0;
         var _loc5_:* = null;
         super(param1);
         var _loc4_:Label = new Label();
         _loc4_.multiline = true;
         _loc4_.wordWrap = true;
         _loc4_.width = param1.width - 40;
         _loc4_.text = LocaleMgr.ins.getStr(999900274);
         _loc4_.x = 20;
         ui.box.addChild(_loc4_);
         ui.addVGap(10);
         ui.addLine();
         ui.addVGap(10);
         var _loc3_:Label = new Label();
         _loc3_.multiline = true;
         _loc3_.wordWrap = true;
         _loc3_.width = param1.width - 40;
         var _loc6_:String = "";
         _loc7_ = 0;
         while(_loc7_ < param2.ary.length)
         {
            _loc5_ = param2.ary[_loc7_] as WealthVo;
            if(_loc7_ != param2.ary.length - 1)
            {
               _loc6_ = _loc6_ + (TextFieldUtil.htmlText2(_loc5_.showName + "*" + _loc5_.showCount,QualityConsts.getQuColor(_loc5_.quality)) + "; ");
            }
            else
            {
               _loc6_ = _loc6_ + TextFieldUtil.htmlText2(_loc5_.showName + "*" + _loc5_.showCount,QualityConsts.getQuColor(_loc5_.quality));
            }
            _loc7_++;
         }
         _loc3_.text = _loc6_;
         _loc3_.x = 20;
         ui.box.addChild(_loc3_);
      }
   }
}
