package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.skins.SkinLib;
   import proto.PetInfo;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipPetBaseInfo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.consts.NPCPropConsts;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS5;
   import nslm2.modules.cultivates.pet.util.PetUtil;
   
   public class ToolTipPetCtr extends TooltipCtrlBase
   {
       
      
      public function ToolTipPetCtr(param1:TooltipUICommon, param2:PetInfoVo)
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc5_:int = 0;
         super(param1);
         var _loc14_:StcNpcVo = param2.stcVo;
         ui.img_bg.skin = SkinLib.changeSkinNum_underline(ui.img_bg.skin,_loc14_.quality);
         var _loc10_:int = 1;
         var _loc13_:int = 1;
         var _loc3_:Array = [];
         var _loc12_:int = _loc14_.combat_power;
         var _loc15_:PetInfo = param2.petInfo;
         if(!_loc15_)
         {
            _loc15_ = PetModel.ins.getPetInfo(param2.id);
         }
         if(_loc15_)
         {
            _loc10_ = _loc15_.level;
            _loc13_ = _loc15_.grade;
            _loc3_ = PetModel.getStarLightArray(_loc15_.star,true);
            _loc12_ = Uint64Util.toInt(_loc15_.ability);
            _loc4_ = _loc15_.star;
         }
         ui.box.addChild(new TooltipPetBaseInfo(UrlLib.headIcon(_loc14_.head_id),_loc14_.quality,HeroInfoUtil.getName(null,_loc14_.id),"",_loc12_,LocaleMgr.ins.getStr(11300000) + _loc10_,LocaleMgr.ins.getStr(30100005) + ":" + LocaleMgr.ins.getStr(999000044,[_loc13_]),_loc3_));
         this.ui.addLine();
         this.ui.addVGap(10);
         var _loc7_:Array = [];
         var _loc9_:Array = [];
         if(_loc15_)
         {
            _loc6_ = NPCPropConsts.ins.baseProp5List.length;
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc5_ = NPCPropConsts.ins.baseProp5List[_loc8_];
               _loc7_.push(new NpcPropVo(_loc5_,int(_loc15_.prop[NPCPropConsts.ins.getProtobufPropertyName(_loc5_)])));
               _loc9_.push(new NpcPropVo(_loc5_,int(_loc15_.prop[NPCPropConsts.ins.getProtobufPropertyName(_loc5_)])));
               _loc8_++;
            }
         }
         else
         {
            _loc7_ = param2.basePropArr;
            _loc9_ = param2.basePropArr;
         }
         ui.box.addChild(new TooltipTitleListPanelS5(LocaleMgr.ins.getStr(10220000),_loc7_));
         this.ui.addVGap(10);
         this.ui.addLine();
         this.ui.addVGap(10);
         if(_loc15_)
         {
            _loc7_ = PetUtil.getPetAllAttrByInfo(_loc15_,false);
         }
         else
         {
            _loc7_ = PetUtil.getPetAllAttr(param2.id,0,0);
         }
         var _loc11_:TooltipTitleListPanelS5 = new TooltipTitleListPanelS5(LocaleMgr.ins.getStr(10220000),_loc7_);
         _loc11_.height = 18 + Math.ceil(_loc7_.length / 2) * 20;
         ui.box.addChild(_loc11_);
         this.ui.addVGap(10);
         ui.parts.push(new TooltipPetSkillCtrl(ui,_loc14_,_loc13_));
      }
   }
}
