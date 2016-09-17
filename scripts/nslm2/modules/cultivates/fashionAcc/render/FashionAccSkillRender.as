package nslm2.modules.cultivates.fashionAcc.render
{
   import game.ui.fashionAcc.FashionAccSkillRenderUI;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.FashionList;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionExtraSkillVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.mgrs.skins.ColorLib;
   
   public class FashionAccSkillRender extends FashionAccSkillRenderUI
   {
       
      
      public function FashionAccSkillRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc11_:int = 0;
         var _loc10_:* = null;
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc8_:* = null;
         var _loc3_:Number = NaN;
         var _loc2_:* = null;
         var _loc7_:* = null;
         var _loc6_:int = param1 as int;
         if(_loc6_ == 1)
         {
            _loc11_ = FashionModel.ins.usingLeftAccId;
            txt_kind.text = LocaleMgr.ins.getStr(999900211);
            txt_no_skill.text = LocaleMgr.ins.getStr(999900214);
         }
         else
         {
            _loc11_ = FashionModel.ins.usingRightAccId;
            txt_kind.text = LocaleMgr.ins.getStr(999900212);
            txt_no_skill.text = LocaleMgr.ins.getStr(999900215);
         }
         var _loc4_:FashionList = getFashionListByItem(_loc11_);
         if(_loc4_ != null)
         {
            img_icon.visible = true;
            img_quality.visible = true;
            txt_desc.visible = true;
            txt_no_skill.visible = false;
            _loc10_ = StcMgr.ins.getItemVo(_loc11_);
            _loc5_ = StcMgr.ins.getFashionSynVo(_loc4_.id);
            _loc9_ = StcMgr.ins.getFashionExtraSkillVo(_loc5_.skill);
            _loc8_ = StcMgr.ins.getSkillVo(_loc9_.skillId);
            _loc3_ = _loc4_.skillNum;
            .super.dataSource = _loc8_.id;
            _loc2_ = "【" + LocaleMgr.ins.getStr(_loc8_.name) + " Lv." + _loc8_.level + "】";
            _loc7_ = TextFieldUtil.htmlText(_loc2_,new TextFormat(null,null,ColorLib.qualityColor(_loc8_.quality)));
            this.txt_desc.text = _loc7_ + LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(stcSkillId).skill_description1,[int(_loc3_) * (Math.abs(_loc9_.intRange) != 1?100:1) / Math.abs(_loc9_.intRange) + (Math.abs(_loc9_.intRange) != 1?"%":"")]);
         }
         else
         {
            img_icon.visible = false;
            img_quality.visible = false;
            txt_desc.visible = false;
            txt_no_skill.visible = true;
         }
      }
      
      override protected function validateTxtKind() : void
      {
      }
      
      private function getFashionListByItem(param1:int) : FashionList
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc4_:Array = FashionModel.ins.fashionAccArr;
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            _loc2_ = StcMgr.ins.getFashionSynVo(_loc4_[_loc3_].id);
            if(_loc2_.item == param1)
            {
               return _loc4_[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
   }
}
