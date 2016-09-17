package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcClotheSuitVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.text.TextFormat;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS1;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTxt;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipSkillRenderS2_2;
   import com.mz.core.utils.FilterUtil;
   
   public class TooltipFashionSuitCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipFashionSuitCtrl(param1:TooltipUICommon, param2:StcItemVo)
      {
         super(param1);
         var _loc8_:int = FashionModel.ins.getSuitId(param2.id);
         var _loc7_:StcClotheSuitVo = StcMgr.ins.getClotheSuitVo(_loc8_);
         var _loc4_:Array = [];
         var _loc11_:int = 0;
         if(FashionModel.ins.hasActivatedClothBySuitId(_loc8_))
         {
            _loc11_++;
         }
         if(FashionModel.ins.hasActivatedWingBySuitId(_loc8_))
         {
            _loc11_++;
         }
         _loc4_.push(TextFieldUtil.htmlText(LocaleMgr.ins.getStr(_loc7_.name) + "(" + _loc11_ + "/2)",new TextFormat(null,null,_loc11_ > 0?16542720:7566195)));
         var _loc6_:uint = FashionModel.ins.getFashionCloth(_loc8_);
         var _loc3_:uint = FashionModel.ins.getFashionWing(_loc8_);
         var _loc5_:StcItemVo = StcMgr.ins.getItemVo(_loc6_);
         var _loc9_:StcItemVo = StcMgr.ins.getItemVo(_loc3_);
         _loc4_.push(TextFieldUtil.htmlText(LocaleMgr.ins.getStr(_loc5_.name),new TextFormat(null,null,!!FashionModel.ins.hasActivatedFashion(_loc6_)?16542720:7566195)) + "   " + TextFieldUtil.htmlText(LocaleMgr.ins.getStr(_loc9_.name),new TextFormat(null,null,!!FashionModel.ins.hasActivatedFashion(_loc3_)?16542720:7566195)));
         ui.addVGap(10);
         ui.box.addChild(new TooltipTitleListPanelS1(LocaleMgr.ins.getStr(30200015),16769187,_loc4_,TooltipTxt));
         ui.addVGap(10);
         var _loc13_:StcSkillVo = StcMgr.ins.getSkillVo(_loc7_.skill_1);
         var _loc12_:StcSkillVo = StcMgr.ins.getSkillVo(_loc7_.skill_2);
         var _loc10_:TooltipSkillRenderS2_2 = new TooltipSkillRenderS2_2();
         _loc10_.dataSource = _loc13_.id;
         _loc10_.x = 48;
         _loc10_.filters = _loc11_ >= 1?null:[FilterUtil.grayFilter()];
         var _loc14_:TooltipSkillRenderS2_2 = new TooltipSkillRenderS2_2();
         _loc14_.dataSource = _loc12_.id;
         _loc14_.x = 48;
         _loc14_.filters = _loc11_ >= 2?null:[FilterUtil.grayFilter()];
         ui.box.addChild(_loc10_);
         ui.addVGap(10);
         ui.box.addChild(_loc14_);
      }
   }
}
