package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.cultivates.skin.SkinModel;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.text.TextFormat;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS1;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTxt;
   
   public class TooltipSkinSuitCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipSkinSuitCtrl(param1:TooltipUICommon, param2:StcItemVo)
      {
         var _loc10_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         super(param1);
         var _loc9_:Array = StcMgr.ins.getVoArrByColumnValue("static_hero_skin_suit","node",int(param2.extend_1)).sortOn("num");
         var _loc3_:Array = StcMgr.ins.getVoArrByMultiColumnValue("static_item",["kind","extend_1"],[param2.kind,param2.extend_1]);
         var _loc4_:Array = [];
         _loc3_.sortOn("kind",16);
         var _loc8_:int = _loc3_.length;
         var _loc7_:int = 0;
         _loc10_ = 0;
         while(_loc10_ < _loc8_)
         {
            _loc5_ = _loc3_[_loc10_];
            _loc6_ = SkinModel.ins.isActive(_loc5_.id) || SkinModel.ins.isUsed(_loc5_.id);
            if(_loc6_)
            {
               _loc7_++;
            }
            _loc4_.push(TextFieldUtil.htmlText(LocaleMgr.ins.getStr(_loc5_.name),new TextFormat(null,null,!!_loc6_?16542720:7566195)));
            _loc10_++;
         }
         _loc10_ = 0;
         while(_loc10_ < _loc9_.length)
         {
            _loc4_.push(TextFieldUtil.htmlText(LocaleMgr.ins.getStr(10000003 + _loc9_[_loc10_].num) + ": " + LocaleMgr.ins.getStr(_loc9_[_loc10_].name) + LocaleMgr.ins.getStr(_loc9_[_loc10_].desc),new TextFormat(null,null,_loc7_ >= _loc9_[_loc10_].num?458496:7566195)));
            if(_loc10_ == _loc9_.length - 1)
            {
               ui.box.addChild(new TooltipTitleListPanelS1(LocaleMgr.ins.getStr(30200015),16046112,_loc4_,TooltipTxt,0));
            }
            _loc10_++;
         }
      }
   }
}
