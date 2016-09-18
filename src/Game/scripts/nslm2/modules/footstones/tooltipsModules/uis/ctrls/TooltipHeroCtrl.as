package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import proto.HeroInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import com.mz.core.configs.ClientConfig;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_hero;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipHeroLevel;
   import nslm2.common.consts.NPCPropConsts;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS5;
   
   public class TooltipHeroCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipHeroCtrl(param1:TooltipUICommon, param2:HeroInfo)
      {
         var _loc8_:int = 0;
         var _loc4_:int = 0;
         super(param1);
         var _loc7_:StcNpcVo = StcMgr.ins.getNpcVo(param2.baseInfo.baseId);
         var _loc3_:String = HeroInfoUtil.getName(param2.baseInfo.id,_loc7_.id,true);
         if(_loc3_ != "")
         {
            _loc3_ = _loc3_ + "\n";
         }
         _loc3_ = _loc3_ + HeroInfoUtil.getName(param2.baseInfo.id,_loc7_.id,false);
         if(ClientConfig.isChineseLang())
         {
            _loc3_ = HeroInfoUtil.getName(param2.baseInfo.id,_loc7_.id,false);
         }
         ui.img_bg.skin = SkinLib.changeSkinNum_underline(ui.img_bg.skin,_loc7_.quality);
         ui.box.addChild(new TooltipIconAndName_hero(HeroInfoUtil.getHeadIconUrl(param2.baseInfo.id,_loc7_.id),_loc7_.quality,_loc3_,LocaleMgr.ins.getStr(5000 + _loc7_.career_id),Uint64Util.toNumber(param2.baseInfo.fightValue),UrlLib.npcGroupImg(_loc7_.group),!!HeroModel.ins.isCurPlayerHeroByStcNpcId(_loc7_.id)?"":LocaleMgr.ins.getStr(5100 + _loc7_.group)));
         ui.box.addChild(new TooltipHeroLevel(param2));
         this.ui.addVGap(10);
         this.ui.addLine();
         this.ui.addVGap(10);
         var _loc6_:Array = [];
         var _loc5_:int = NPCPropConsts.ins.baseProp5List.length;
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            _loc4_ = NPCPropConsts.ins.baseProp5List[_loc8_];
            _loc6_.push(new NpcPropVo(_loc4_,int(param2.prop[NPCPropConsts.ins.getProtobufPropertyName(_loc4_)])));
            _loc8_++;
         }
         ui.box.addChild(new TooltipTitleListPanelS5(LocaleMgr.ins.getStr(999000175),_loc6_));
         ui.parts.push(new TooltipNpcSkillCtrl(ui,_loc7_,param2.baseInfo.sjLevel));
         ui.parts.push(new TooltipNpcDescCtrl(ui,_loc7_));
      }
   }
}
