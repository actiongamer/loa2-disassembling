package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.ToolTipHeroInfoDetail;
   import nslm2.modules.footstones.tooltipsModules.ToolTipHeroInfoDetailVo;
   import nslm2.common.model.HeroModel;
   import proto.HeroInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.core.components.Label;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipSkillRenderS2;
   import nslm2.modules.cultivates.skin.SkinModel;
   import nslm2.mgrs.stcMgrs.vos.StcHeroSkinSuitVo;
   import proto.FashionList;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionExtraSkillVo;
   import nslm2.common.consts.NPCPropConsts;
   import nslm2.mgrs.stcMgrs.vos.StcMengyueVo;
   import nslm2.mgrs.stcMgrs.vos.StcGrowthVo;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroShengjieVo;
   import proto.ShenGridNodeInfo;
   import proto.ShenGridDingNodeInfo;
   import nslm2.mgrs.stcMgrs.vos.StcGridPageVo;
   import nslm2.mgrs.stcMgrs.vos.StcGridNodeVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroTalentVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroTalentInfoVo;
   import proto.Item;
   import nslm2.mgrs.stcMgrs.vos.StcEquipStrengthVo;
   import nslm2.mgrs.stcMgrs.vos.StcEquipJinglianVo;
   import nslm2.mgrs.stcMgrs.vos.StcEquipAddStarVo;
   import nslm2.mgrs.stcMgrs.vos.StcEquipAttrVo;
   import nslm2.mgrs.stcMgrs.vos.StcEquipLiansuoVo;
   import proto.BaoWu;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuFuwenKeyinVo;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuKeyinVo;
   import nslm2.modules.cultivates.horse.HorseService;
   import nslm2.mgrs.stcMgrs.vos.StcHorsejingtongVo;
   import nslm2.mgrs.stcMgrs.vos.StcHorseupgradeVo;
   import nslm2.modules.funnies.guilds.guildTechs.GuildTechService;
   import proto.FamilyTechItem;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyTechCostVo;
   import proto.FMTechItem;
   import nslm2.modules.cultivates.roleTeam.vo.YuanJunVo;
   import nslm2.mgrs.stcMgrs.vos.StcSupportDevelopVo;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import proto.PetInfo;
   import nslm2.modules.cultivates.pet.util.PetUtil;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import game.ui.tooltipModules.comps.ToolTipHeroInfoDetailTitle2UI;
   import game.ui.tooltipModules.comps.ToolTipHeroInfoDetailPropUI;
   import game.ui.tooltipModules.comps.ToolTipHeroInfoDetailTitleUI;
   
   public class ToolTipHeroInfoDetailCtrl extends TooltipCtrlBase
   {
      
      public static const LEVEL:int = 1;
      
      public static const RANK:int = 2;
      
      public static const AUGMENT:int = 3;
      
      public static const RIDER_LEVEL:int = 4;
      
      public static const AWAKE:int = 5;
       
      
      private var mui:ToolTipHeroInfoDetail;
      
      private var vo:ToolTipHeroInfoDetailVo;
      
      private var playerLevel:int;
      
      private var quality:int;
      
      private var nullVGap:int = 5;
      
      private var isCompare:Boolean = false;
      
      private var _info:HeroInfo;
      
      private var hasAddBigTitle:Array;
      
      private var isTopBigTitle:Boolean = true;
      
      public function ToolTipHeroInfoDetailCtrl(param1:ToolTipHeroInfoDetail, param2:ToolTipHeroInfoDetailVo, param3:Boolean = false)
      {
         hasAddBigTitle = [];
         super(null);
         this.mui = param1;
         this.vo = param2;
         this.isCompare = param3;
         if(param2.isPlayer)
         {
            playerLevel = PlayerModel.ins.level;
            HeroModel.ins.getHeroInfo(param2.roleTeamVo.heroData.id,onGetHeroInfoCpl);
         }
         else
         {
            if(OtherRoleInfoModel.ins.heroInfo && OtherRoleInfoModel.ins.heroInfo.baseInfo)
            {
               playerLevel = OtherRoleInfoModel.ins.playerHero.baseInfo.level;
            }
            else
            {
               playerLevel = PlayerModel.ins.level;
            }
            onGetHeroInfoCpl(OtherRoleInfoModel.ins.getHeroInfo(param2.roleTeamVo.heroData.id));
         }
      }
      
      public function update(param1:ToolTipHeroInfoDetailVo) : void
      {
         this.vo = param1;
         HeroModel.ins.getHeroInfo(param1.roleTeamVo.heroData.id,onGetHeroInfoCpl2);
      }
      
      private function onGetHeroInfoCpl2(param1:HeroInfo) : void
      {
         _info = param1;
         this.mui.boxTitle.removeChildren();
         this.mui.box.removeChildren();
         hasAddBigTitle = [];
         isTopBigTitle = true;
         onGetHeroInfoCpl(param1);
      }
      
      private function onGetHeroInfoCpl(param1:HeroInfo) : void
      {
         var _loc89_:int = 0;
         var _loc84_:* = null;
         var _loc44_:* = null;
         var _loc27_:* = null;
         var _loc55_:* = null;
         var _loc11_:* = null;
         var _loc9_:* = null;
         var _loc50_:* = null;
         var _loc39_:int = 0;
         var _loc21_:* = null;
         var _loc12_:* = null;
         var _loc76_:* = null;
         var _loc57_:int = 0;
         var _loc58_:int = 0;
         var _loc75_:Number = NaN;
         var _loc70_:Number = NaN;
         var _loc5_:* = null;
         var _loc23_:* = null;
         var _loc54_:* = null;
         var _loc74_:* = null;
         var _loc72_:* = null;
         var _loc30_:int = 0;
         var _loc37_:* = null;
         var _loc81_:* = null;
         var _loc51_:* = null;
         var _loc24_:int = 0;
         var _loc91_:* = null;
         var _loc53_:* = null;
         var _loc60_:* = null;
         var _loc14_:* = 0;
         var _loc29_:* = null;
         var _loc95_:* = null;
         var _loc34_:int = 0;
         var _loc28_:* = null;
         var _loc13_:int = 0;
         var _loc64_:* = null;
         var _loc77_:* = null;
         var _loc93_:* = null;
         var _loc78_:* = null;
         var _loc46_:* = null;
         var _loc3_:* = null;
         var _loc69_:* = null;
         var _loc80_:int = 0;
         var _loc18_:int = 0;
         var _loc17_:* = null;
         var _loc82_:* = null;
         var _loc16_:* = null;
         var _loc94_:* = null;
         var _loc41_:* = null;
         var _loc42_:* = null;
         var _loc66_:* = null;
         var _loc45_:int = 0;
         var _loc86_:int = 0;
         var _loc79_:* = null;
         var _loc61_:* = null;
         var _loc19_:* = null;
         var _loc52_:int = 0;
         var _loc90_:* = null;
         var _loc68_:* = null;
         var _loc71_:* = null;
         var _loc36_:* = null;
         var _loc26_:* = null;
         var _loc32_:* = null;
         var _loc65_:* = null;
         var _loc43_:* = null;
         var _loc7_:* = null;
         var _loc10_:* = null;
         var _loc25_:* = null;
         var _loc4_:int = 0;
         var _loc6_:* = null;
         var _loc73_:int = 0;
         var _loc88_:* = null;
         var _loc35_:* = null;
         var _loc67_:* = null;
         vo.heroInfo = param1;
         var _loc92_:StcNpcVo = StcMgr.ins.getNpcVo(param1.baseInfo.baseId);
         var _loc33_:Array = [];
         if(vo.isPlayer)
         {
            _loc33_ = HeroModel.ins.teamHeroInfoArr.concat(HeroModel.ins.YuanJunArr);
         }
         else
         {
            _loc33_ = OtherRoleInfoModel.ins.teamHeroArr.concat(OtherRoleInfoModel.ins.yuanJunArr);
         }
         quality = _loc92_.quality;
         updateUI();
         var _loc56_:String = "";
         if(vo.isMainHero)
         {
            if(vo.isPlayer)
            {
               _loc56_ = PlayerModel.ins.playerInfo.name;
            }
            else
            {
               _loc56_ = OtherRoleInfoModel.ins.name;
            }
         }
         else
         {
            _loc56_ = LocaleMgr.ins.getStr(_loc92_.name);
         }
         this.mui.boxTitle.addChild(new TooltipIconAndName_heroDetail(HeroInfoUtil.getHeadIconUrl(param1.baseInfo.id,_loc92_.id),_loc92_.quality,_loc56_,LocaleMgr.ins.getStr(5000 + _loc92_.career_id),Uint64Util.toNumber(param1.baseInfo.fightValue),_loc92_.group == 0?"":UrlLib.npcGroupImg(_loc92_.group),!!HeroModel.ins.isCurPlayerHeroByStcNpcId(_loc92_.id)?"":LocaleMgr.ins.getStr(5100 + _loc92_.group)));
         this.mui.addVGap(10);
         this.mui.addLine();
         if(isCompare)
         {
            this.mui.addVGap(10);
            _loc84_ = new Label(LocaleMgr.ins.getStr(999001023));
            _loc84_.color = 458496;
            this.mui.box.addChild(_loc84_);
            _loc84_.x = 300 - _loc84_.width;
            this.mui.addVGap(10);
            this.mui.addLine();
            this.mui.addVGap(10);
         }
         else
         {
            this.mui.addVGap(10);
         }
         updateUI();
         var _loc62_:Array = [];
         var _loc59_:Array = [];
         var _loc38_:Array = [];
         if(vo.isMainHero)
         {
            if(vo.isPlayer)
            {
               _loc59_ = FashionModel.ins.activatedClothArr.concat(FashionModel.ins.activatedWingArr);
            }
            else
            {
               _loc59_ = OtherRoleInfoModel.ins.fashion;
            }
            addBigTitle(999001000);
            if(_loc59_.length > 0)
            {
               addSmallTitle(999001001);
               _loc62_ = [];
               if(_loc59_.length > 0)
               {
                  _loc89_ = 0;
                  while(_loc89_ < _loc59_.length)
                  {
                     _loc44_ = StcMgr.ins.getItemVo(_loc59_[_loc89_]);
                     addPropArrByItemVo(_loc44_,_loc62_);
                     _loc89_++;
                  }
                  addPropDisplay(_loc62_);
               }
               _loc27_ = StcMgr.ins.getSkillVo(param1.baseInfo.skill[0]);
               if(_loc27_.node_id != _loc92_.skill_id1)
               {
                  _loc38_.push(_loc27_);
               }
               _loc27_ = StcMgr.ins.getSkillVo(param1.baseInfo.skill[1]);
               if(_loc27_.node_id != _loc92_.skill_id2)
               {
                  _loc38_.push(_loc27_);
               }
            }
            else
            {
               addSmallTitle(999001001,false);
               mui.addVGap(nullVGap);
            }
            updateUI();
            if(_loc38_.length > 0)
            {
               addSmallTitle(999001002);
               _loc89_ = 0;
               while(_loc89_ < _loc38_.length)
               {
                  _loc55_ = new TooltipSkillRenderS2();
                  _loc55_.dataSource = (_loc38_[_loc89_] as StcSkillVo).id;
                  _loc55_.x = mui.img_bg.width / 2 - _loc55_.width / 2;
                  _loc55_.commitMeasure();
                  mui.box.addChild(_loc55_);
                  if(_loc89_ != _loc38_.length - 1)
                  {
                     mui.addVGap(20);
                  }
                  _loc89_++;
               }
            }
            else
            {
               addSmallTitle(999001002,false);
               mui.addVGap(nullVGap);
            }
         }
         if(getIsFunctionOpen(31100))
         {
            addBigTitle(999900091);
            if(SkinModel.ins.getSkinAvailArrByNpcId(param1.baseInfo.baseId).length > 0)
            {
               _loc62_ = [];
               if(vo.isPlayer)
               {
                  _loc11_ = SkinModel.ins.activeArr.concat(SkinModel.ins.usedArr);
               }
               else
               {
                  _loc11_ = OtherRoleInfoModel.ins.skinList;
               }
               _loc89_ = 0;
               while(_loc89_ < _loc11_.length)
               {
                  _loc23_ = StcMgr.ins.getItemVo(_loc11_[_loc89_]);
                  if(_loc92_.node == int(_loc23_.extend_4))
                  {
                     addPropArrByItem(_loc23_,_loc62_);
                  }
                  _loc89_++;
               }
               addTitleAndPropDisplay(_loc62_,51800109);
            }
            _loc62_ = [];
            _loc9_ = StcMgr.ins.getHeroSkinSuitTable().array;
            _loc89_ = 0;
            while(_loc89_ < _loc9_.length)
            {
               _loc50_ = _loc9_[_loc89_];
               if(vo.isPlayer)
               {
                  _loc39_ = SkinModel.ins.getActivedCountNodeId(_loc50_.node);
               }
               else
               {
                  _loc39_ = OtherRoleInfoModel.ins.skinSuitCount[_loc50_.node];
               }
               if(_loc50_.num <= _loc39_)
               {
                  addPropArrByStr(_loc50_.attr,_loc62_);
               }
               _loc89_++;
            }
            addTitleAndPropDisplay(_loc62_,999900502);
         }
         if(getIsFunctionOpen(31200))
         {
            _loc21_ = [];
            _loc12_ = [];
            if(vo.isPlayer)
            {
               _loc76_ = FashionModel.ins.fashionAccArr;
            }
            else
            {
               _loc76_ = OtherRoleInfoModel.ins.fashionAccList;
            }
            _loc57_ = 0;
            _loc58_ = 0;
            var _loc97_:int = 0;
            var _loc96_:* = _loc76_;
            for each(var _loc83_ in _loc76_)
            {
               _loc5_ = StcMgr.ins.getFashionSynVo(_loc83_.id);
               _loc23_ = StcMgr.ins.getItemVo(_loc5_.item);
               if(_loc83_.curUseId > 0 && vo.isPlayer == false || vo.isPlayer && (_loc5_.item == FashionModel.ins.usingLeftAccId || _loc5_.item == FashionModel.ins.usingRightAccId))
               {
                  _loc54_ = StcMgr.ins.getFashionExtraSkillVo(_loc5_.skill);
                  if(_loc23_.kind == 15)
                  {
                     _loc57_ = _loc54_.skillId;
                     _loc75_ = _loc83_.skillNum;
                  }
                  else
                  {
                     _loc58_ = _loc54_.skillId;
                     _loc70_ = _loc83_.skillNum;
                  }
               }
               if(vo.isMainHero)
               {
                  if(_loc23_.kind == 15)
                  {
                     addPropArrByStr(_loc5_.prop,_loc21_);
                  }
                  else
                  {
                     addPropArrByStr(_loc5_.prop,_loc12_);
                  }
               }
            }
            if(vo.isMainHero)
            {
               addBigTitle(999900213);
               addTitleAndPropDisplay(_loc21_,999900209);
               addSmallTitle(999900211,_loc57_ > 0);
               if(_loc57_ > 0)
               {
                  _loc55_ = new TooltipSkillRenderS2();
                  _loc55_.skillNum = _loc75_;
                  _loc55_.dataSource = _loc57_;
                  _loc55_.x = mui.img_bg.width / 2 - _loc55_.width / 2;
                  _loc55_.commitMeasure();
                  mui.box.addChild(_loc55_);
               }
               addTitleAndPropDisplay(_loc12_,999900210);
               addSmallTitle(999900212,_loc58_ > 0);
               if(_loc58_ > 0)
               {
                  _loc55_ = new TooltipSkillRenderS2();
                  _loc55_.skillNum = _loc70_;
                  _loc55_.dataSource = _loc58_;
                  _loc55_.x = mui.img_bg.width / 2 - _loc55_.width / 2;
                  _loc55_.commitMeasure();
                  mui.box.addChild(_loc55_);
               }
            }
         }
         var _loc20_:Array = NPCPropConsts.ins.baseProp5List;
         updateUI();
         addBigTitle(999001003);
         _loc62_ = [];
         if(param1.baseInfo.mengyue.length > 0)
         {
            _loc89_ = 0;
            while(_loc89_ < param1.baseInfo.mengyue.length)
            {
               _loc74_ = StcMgr.ins.getMengyueVo(param1.baseInfo.mengyue[_loc89_]);
               addPropArrByStr(_loc74_.attr,_loc62_);
               _loc89_++;
            }
         }
         addTitleAndPropDisplay(_loc62_,999001003);
         updateUI();
         addBigTitle(999001004);
         _loc62_ = [];
         if(param1.baseInfo.level > 1)
         {
            _loc72_ = StcMgr.ins.getGrowthVo(_loc92_.grow_id);
            _loc89_ = 0;
            while(_loc89_ < _loc20_.length)
            {
               _loc30_ = _loc20_[_loc89_];
               _loc37_ = NPCPropConsts.ins.getStcVoPropertyName(_loc30_);
               _loc81_ = new NpcPropVo(_loc30_,Math.floor(_loc72_[_loc37_] * (param1.baseInfo.level - 1)));
               _loc62_.push(_loc81_);
               _loc89_++;
            }
         }
         addTitleAndPropDisplay(_loc62_,999001005,param1.baseInfo.level,1);
         if(getIsFunctionOpen(30110))
         {
            updateUI();
            _loc62_ = [];
            if(_loc92_.tupo > 0)
            {
               _loc51_ = StcMgr.ins.getNpcVo(_loc92_.node);
               _loc89_ = 0;
               while(_loc89_ < _loc20_.length)
               {
                  _loc30_ = _loc20_[_loc89_];
                  _loc37_ = NPCPropConsts.ins.getStcVoPropertyName(_loc30_);
                  _loc81_ = new NpcPropVo(_loc30_,_loc92_[_loc37_] - _loc51_[_loc37_]);
                  _loc62_.push(_loc81_);
                  _loc89_++;
               }
               _loc24_ = 0;
               _loc91_ = StcMgr.ins.getVoByColumnValue("static_tupo","hero_node",_loc92_.node);
               while(true)
               {
                  addPropArrByStr(_loc91_.attr,_loc62_);
                  _loc53_ = StcMgr.ins.getTupoVo(_loc91_.id + 1);
                  if(_loc53_ && _loc53_.hero_node == _loc91_.hero_node)
                  {
                     _loc91_ = _loc53_;
                     if(_loc91_.tupo_level > _loc92_.tupo)
                     {
                        break;
                     }
                     continue;
                  }
                  break;
               }
            }
            addTitleAndPropDisplay(_loc62_,999001006,_loc92_.tupo,3);
         }
         if(getIsFunctionOpen(30109))
         {
            updateUI();
            _loc62_ = [];
            if(param1.baseInfo.sjLevel > 1)
            {
               _loc60_ = StcMgr.ins.getVoByMultiColumnValue("static_hero_shengjie",["kind","level"],[1,param1.baseInfo.sjLevel]) as StcHeroShengjieVo;
               addPropArrByStr(_loc60_.add_attr,_loc62_);
            }
            addTitleAndPropDisplay(_loc62_,999001007,param1.baseInfo.sjLevel,2);
         }
         if(getIsFunctionOpen(30121))
         {
            _loc62_ = [];
            var _loc99_:int = 0;
            var _loc98_:* = param1.shengridinfo.nodesinfo;
            for each(var _loc40_ in param1.shengridinfo.nodesinfo)
            {
               addPropArrByStr(StcMgr.ins.getGridNodeVo(_loc40_.id).node_attr,_loc62_);
            }
            var _loc101_:int = 0;
            var _loc100_:* = param1.shengridinfo.dingnodes;
            for each(var _loc87_ in param1.shengridinfo.dingnodes)
            {
               if(_loc87_.achieve)
               {
                  addPropArrByStr(StcMgr.ins.getGridPageVo(_loc87_.id).angle_attr,_loc62_);
               }
            }
            _loc14_ = uint(param1.shengridinfo.pagenum - 1);
            while(_loc14_ > 0)
            {
               _loc89_ = 0;
               _loc34_ = setShape(_loc14_);
               _loc89_ = 0;
               while(_loc89_ < _loc34_)
               {
                  _loc29_ = StcMgr.ins.getGridPageVo(100 * _loc14_ + _loc89_ + 1);
                  if(_loc89_ == 0)
                  {
                     addPropArrByStr(_loc29_.mid_attr,_loc62_);
                  }
                  addPropArrByStr(_loc29_.angle_attr,_loc62_);
                  _loc89_++;
               }
               _loc89_ = 0;
               while(_loc89_ < _loc34_ * 2)
               {
                  _loc95_ = StcMgr.ins.getGridNodeVo(1000 * _loc14_ + (_loc89_ + 1) * 10);
                  addPropArrByStr(_loc95_.node_attr,_loc62_);
                  _loc89_++;
               }
               _loc14_--;
            }
            _loc28_ = StcMgr.ins.getGridPageTable().array.sortOn("sort");
            _loc13_ = _loc28_[_loc28_.length - 1].sort;
            if(param1.shengridinfo.nodesinfo.length == 12 && param1.shengridinfo.pagenum == _loc13_)
            {
               _loc29_ = StcMgr.ins.getGridPageVo(100 * _loc13_ + 1);
               addPropArrByStr(_loc29_.mid_attr,_loc62_);
            }
            addTitleAndPropDisplay(_loc62_,9130120,param1.shengridinfo.pagenum,5);
         }
         if(getIsFunctionOpen(30113))
         {
            _loc62_ = [];
            _loc64_ = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent",["node"],[_loc92_.node]);
            if(_loc64_)
            {
               if(_loc64_.talent_1 > 0 && param1.baseInfo.talent.length >= 1)
               {
                  _loc77_ = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent_info",["node","lv"],[_loc64_.talent_1,param1.baseInfo.talent[0]]) as StcHeroTalentInfoVo;
                  addPropArrByStr(_loc77_.attr,_loc62_);
               }
               if(_loc64_.talent_2 > 0 && param1.baseInfo.talent.length >= 2)
               {
                  _loc77_ = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent_info",["node","lv"],[_loc64_.talent_2,param1.baseInfo.talent[1]]) as StcHeroTalentInfoVo;
                  addPropArrByStr(_loc77_.attr,_loc62_);
               }
               if(_loc64_.talent_3 > 0 && param1.baseInfo.talent.length >= 3)
               {
                  _loc77_ = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent_info",["node","lv"],[_loc64_.talent_3,param1.baseInfo.talent[2]]) as StcHeroTalentInfoVo;
                  addPropArrByStr(_loc77_.attr,_loc62_);
               }
            }
            updateUI();
            addTitleAndPropDisplay(_loc62_,999001027);
         }
         var _loc85_:Array = [];
         var _loc2_:Array = [];
         var _loc8_:Array = [];
         var _loc48_:Array = [];
         var _loc47_:Array = [];
         if(param1.items.length > 0)
         {
            _loc89_ = 0;
            while(_loc89_ < param1.items.length)
            {
               _loc93_ = param1.items[_loc89_] as Item;
               _loc44_ = StcMgr.ins.getItemVo(_loc93_.itemId);
               _loc78_ = StcMgr.ins.getEquipStrengthVo(_loc93_.strengthId);
               addPropArrByStr(_loc78_.add_growth,_loc85_);
               _loc46_ = StcMgr.ins.getEquipJinglianVo(_loc93_.jinglianId);
               addPropArrByStr(_loc46_.add_growth,_loc2_);
               _loc3_ = getStcEquipStarVo(_loc93_.itemId,1);
               if(_loc3_)
               {
                  _loc80_ = 0;
                  while(_loc80_ <= _loc93_.star && _loc80_ <= 6)
                  {
                     _loc69_ = StcMgr.ins.getEquipAddStarVo(_loc3_.id - 1 + _loc80_);
                     if(_loc69_ && _loc69_.equipId == _loc3_.equipId)
                     {
                        if(_loc69_.extra_property != "0")
                        {
                           addPropArrByStr(_loc69_.extra_property,_loc48_);
                        }
                        if(_loc69_.property != "0")
                        {
                           _loc30_ = _loc69_.property.split(":")[0];
                           _loc18_ = _loc69_.property.split(":")[1];
                           if(_loc80_ < _loc93_.star)
                           {
                              _loc81_ = getPropVoByPropId(_loc30_,_loc8_);
                              _loc81_.value = _loc81_.getRealPropValue() + _loc18_ * _loc69_.totalstep;
                           }
                           else if(_loc93_.starExp != 0)
                           {
                              _loc81_ = getPropVoByPropId(_loc30_,_loc8_);
                              _loc81_.value = _loc81_.getRealPropValue() + _loc18_ * _loc93_.starExp;
                           }
                        }
                        _loc80_++;
                        continue;
                     }
                     break;
                  }
               }
               if(_loc44_.quality == 6)
               {
                  _loc17_ = StcMgr.ins.getVoArrByColumnValue("static_equip_attr","itemid",_loc93_.itemId);
                  var _loc103_:int = 0;
                  var _loc102_:* = _loc17_;
                  for each(var _loc22_ in _loc17_)
                  {
                     if(_loc22_.active_condi_kind == 1)
                     {
                        if(_loc78_.level >= _loc22_.active_condi_value)
                        {
                           addPropArrByStr(_loc22_.attr_value,_loc47_);
                        }
                     }
                  }
               }
               _loc89_++;
            }
         }
         if(getIsFunctionOpen(30500))
         {
            updateUI();
            addBigTitle(999001008);
            addTitleAndPropDisplay(_loc85_,999001009);
            updateUI();
            _loc62_ = [];
            if(param1.baseInfo.strengthLSlv > 0)
            {
               _loc82_ = getStcEquipLiansuoVo(1,param1.baseInfo.strengthLSlv);
               if(_loc82_)
               {
                  param1.baseInfo.strengthLSlv;
                  addPropArrByStr(_loc82_.add_growth,_loc62_);
               }
            }
            addTitleAndPropDisplay(_loc62_,999001010,param1.baseInfo.strengthLSlv,2);
         }
         if(getIsFunctionOpen(96500))
         {
            updateUI();
            addBigTitle(999001008);
            addTitleAndPropDisplay(_loc47_,999001024);
         }
         if(getIsFunctionOpen(30501))
         {
            updateUI();
            addTitleAndPropDisplay(_loc2_,999001011);
            updateUI();
            _loc62_ = [];
            if(param1.baseInfo.jinglianLSLv > 0)
            {
               _loc16_ = getStcEquipLiansuoVo(2,param1.baseInfo.jinglianLSLv);
               if(_loc16_)
               {
                  addPropArrByStr(_loc16_.add_growth,_loc62_);
               }
            }
            addTitleAndPropDisplay(_loc62_,999001012,param1.baseInfo.jinglianLSLv,2);
         }
         if(getIsFunctionOpen(30502))
         {
            updateUI();
            addTitleAndPropDisplay(_loc8_,999001013);
            updateUI();
            addTitleAndPropDisplay(_loc48_,999001014);
         }
         if(getIsFunctionOpen(30600))
         {
            _loc62_ = [];
            _loc94_ = [];
            _loc41_ = [];
            _loc42_ = [];
            if(param1.baowu.length > 0)
            {
               _loc89_ = 0;
               while(_loc89_ < param1.baowu.length)
               {
                  _loc66_ = param1.baowu[_loc89_] as BaoWu;
                  if(_loc66_.level > 0)
                  {
                     _loc44_ = StcMgr.ins.getItemVo(_loc66_.baseId);
                     if(_loc44_.kind == 8)
                     {
                        _loc45_ = 2;
                        _loc81_ = getPropVoByPropId(_loc45_,_loc62_);
                        _loc81_.value = _loc81_.getRealPropValue() + TreasureUtil.caculateStrenAddProp(_loc66_.base.attack,_loc66_.level);
                     }
                     else
                     {
                        _loc45_ = 1;
                        _loc81_ = getPropVoByPropId(_loc45_,_loc62_);
                        _loc81_.value = _loc81_.getRealPropValue() + TreasureUtil.caculateStrenAddProp(_loc66_.base.hp,_loc66_.level);
                     }
                  }
                  _loc86_ = 0;
                  while(_loc86_ < _loc66_.fumo.length)
                  {
                     _loc79_ = StcMgr.ins.getItemVo(_loc66_.fumo[_loc86_].id);
                     if(_loc79_)
                     {
                        addPropArrByStr(_loc79_.extend_3,_loc94_);
                        if(_loc66_.fuwenkeyin > 0)
                        {
                           _loc61_ = StcMgr.ins.getVoByMultiColumnValue("static_baowu_fuwen_keyin",["quality","level"],[StcMgr.ins.getItemVo(_loc66_.baseId).quality,_loc66_.fuwenkeyin]);
                           if(_loc61_.fuwen_attr > 0)
                           {
                              _loc19_ = _loc79_.extend_3.split("|")[0];
                              _loc52_ = _loc19_.split(":")[1] * _loc61_.fuwen_attr;
                              var _loc31_:String = _loc19_.split(":")[0] + ":" + _loc52_.toString();
                              addPropArrByStr(_loc31_,_loc94_);
                           }
                        }
                     }
                     _loc86_++;
                  }
                  if(getIsFunctionOpen(30616))
                  {
                     if(_loc66_.fuwenkeyin > 0)
                     {
                        _loc90_ = StcMgr.ins.getVoByMultiColumnValue("static_baowu_fuwen_keyin",["quality","level"],[StcMgr.ins.getItemVo(_loc66_.baseId).quality,_loc66_.fuwenkeyin]);
                        _loc68_ = _loc90_.normal_attr.split("|");
                        var _loc105_:int = 0;
                        var _loc104_:* = _loc68_;
                        for each(var _loc15_ in _loc68_)
                        {
                           addPropArrByStr(_loc15_,_loc42_);
                        }
                     }
                  }
                  if(getIsFunctionOpen(30609))
                  {
                     _loc71_ = StcMgr.ins.getVoByMultiColumnValue("static_baowu_keyin",["level","itemid"],[_loc66_.keyin,_loc66_.baseId]);
                     if(_loc71_)
                     {
                        _loc36_ = _loc71_.add_attr.split("|");
                        var _loc107_:int = 0;
                        var _loc106_:* = _loc36_;
                        for each(_loc31_ in _loc36_)
                        {
                           addPropArrByStr(_loc31_,_loc41_);
                        }
                     }
                  }
                  _loc89_++;
               }
            }
            updateUI();
            addBigTitle(999001015);
            addTitleAndPropDisplay(_loc62_,999001016);
            updateUI();
            _loc62_ = [];
            if(param1.baseInfo.baowuStrLs > 0)
            {
               _loc26_ = getStcEquipLiansuoVo(3,param1.baseInfo.baowuStrLs);
               if(_loc26_)
               {
                  addPropArrByStr(_loc26_.add_growth,_loc62_);
               }
            }
            addTitleAndPropDisplay(_loc62_,999001017,param1.baseInfo.baowuStrLs,2);
         }
         if(getIsFunctionOpen(30607))
         {
            updateUI();
            addTitleAndPropDisplay(_loc94_,999001018);
         }
         if(getIsFunctionOpen(30609))
         {
            updateUI();
            addTitleAndPropDisplay(_loc41_,999900034);
         }
         if(getIsFunctionOpen(30616))
         {
            updateUI();
            addTitleAndPropDisplay(_loc42_,30616001);
         }
         var _loc63_:Array = [];
         if(vo.isPlayer && vo.isMainHero)
         {
            _loc63_ = horseAddAllProp(HorseService.ins.activatedHorseList);
         }
         else if(vo.isPlayer == false && vo.isMainHero)
         {
            _loc63_ = horseAddAllProp(OtherRoleInfoModel.ins.activatedHorseList);
         }
         var _loc49_:int = 0;
         if(vo.isPlayer)
         {
            _loc49_ = HorseService.ins.masterLevel;
         }
         else
         {
            _loc49_ = OtherRoleInfoModel.ins.horseMasterLevel;
         }
         if(getIsFunctionOpen(30300))
         {
            updateUI();
            addBigTitle(999001019);
            if(vo.isMainHero)
            {
               addTitleAndPropDisplay(_loc63_,999001019);
            }
         }
         if(getIsFunctionOpen(30320))
         {
            updateUI();
            _loc62_ = [];
            if(_loc49_ > 1)
            {
               _loc32_ = StcMgr.ins.getHorsejingtongVo(_loc49_);
               addPropArrByStr(_loc32_.prop,_loc62_);
               _loc89_ = 1;
               while(_loc89_ <= _loc32_.rank)
               {
                  _loc65_ = StcMgr.ins.getVoByColumnValue("static_horseupgrade","level",_loc89_);
                  addPropArrByStr(_loc65_.talent,_loc62_);
                  _loc89_++;
               }
            }
            addTitleAndPropDisplay(_loc62_,999001020,_loc49_,4);
         }
         if(getIsFunctionOpen(40700))
         {
            _loc62_ = [];
            if(vo.isPlayer && GuildTechService.ins.infoRes && GuildTechService.ins.infoRes.items)
            {
               _loc89_ = 0;
               while(_loc89_ < GuildTechService.ins.infoRes.items.length)
               {
                  _loc43_ = GuildTechService.ins.infoRes.items[_loc89_];
                  _loc7_ = GuildTechService.findStcVoByTechtypeAndRank(_loc43_.techtype,_loc43_.memberlevel);
                  addPropArrByStr(_loc7_.effect,_loc62_);
                  _loc89_++;
               }
            }
            else if(vo.isPlayer == false && OtherRoleInfoModel.ins.guildTechList)
            {
               _loc89_ = 0;
               while(_loc89_ < OtherRoleInfoModel.ins.guildTechList.length)
               {
                  _loc10_ = OtherRoleInfoModel.ins.guildTechList[_loc89_] as FMTechItem;
                  _loc7_ = GuildTechService.findStcVoByTechtypeAndRank(_loc10_.itemtype,_loc10_.itemlevel);
                  addPropArrByStr(_loc7_.effect,_loc62_);
                  _loc89_++;
               }
            }
            updateUI();
            addBigTitle(999001025);
            addTitleAndPropDisplay(_loc62_,999001026);
         }
         if(getIsFunctionOpen(30815))
         {
            if(vo.isPlayer)
            {
               _loc25_ = HeroModel.ins.YuanJunArr;
            }
            else
            {
               _loc25_ = OtherRoleInfoModel.ins.yuanJunArr;
            }
            _loc4_ = 999;
            if(_loc25_.length >= 6)
            {
               _loc89_ = 0;
               while(_loc89_ < _loc25_.length)
               {
                  _loc6_ = _loc25_[_loc89_] as YuanJunVo;
                  if(_loc6_.heroData == null)
                  {
                     _loc4_ = 0;
                     break;
                  }
                  _loc4_ = Math.min(_loc6_.heroData.level,_loc4_);
                  _loc89_++;
               }
            }
            _loc62_ = [];
            _loc73_ = 0;
            if(_loc4_ >= 10)
            {
               _loc88_ = StcMgr.ins.getSupportDevelopVo(1000 + int(_loc4_ / 10) * 10);
               if(_loc88_)
               {
                  addPropArrByStr(_loc88_.attr,_loc62_);
                  _loc73_ = _loc88_.level;
               }
            }
            addBigTitle(30815000);
            addTitleAndPropDisplay(_loc62_,30815000,_loc73_,2);
         }
         if(getIsFunctionOpen(32000))
         {
            addBigTitle(9032000);
            _loc62_ = [];
            if(vo.isPlayer)
            {
               _loc35_ = PetModel.ins.lastUpdatePet;
               if(_loc35_)
               {
                  _loc67_ = _loc35_.petInfo;
               }
            }
            else
            {
               _loc67_ = OtherRoleInfoModel.ins.pet;
            }
            if(_loc67_)
            {
               _loc62_ = PetUtil.getPetAllAttrByInfo(_loc67_,true);
            }
            addTitleAndPropDisplay(_loc62_,32000011);
         }
      }
      
      private function setShape(param1:uint) : int
      {
         var _loc2_:Array = StcMgr.ins.getVoArrByColumnValue("static_grid_page","sort",param1);
         return _loc2_.length;
      }
      
      private function getIsFunctionOpen(param1:int) : Boolean
      {
         var _loc2_:StcFunctionVo = StcMgr.ins.getFunctionVo(param1);
         if(_loc2_)
         {
            return _loc2_.canOpen && playerLevel >= _loc2_.level;
         }
         return true;
      }
      
      private function updateUI() : void
      {
      }
      
      private function getStcEquipStarVo(param1:int, param2:int) : StcEquipAddStarVo
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Array = StcMgr.ins.getEquipAddStarTable().array;
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc4_ = _loc3_[_loc5_] as StcEquipAddStarVo;
            if(_loc4_.equipId == param1 && _loc4_.star == param2)
            {
               return _loc4_;
            }
            _loc5_++;
         }
         return null;
      }
      
      private function getStcEquipLiansuoVo(param1:int, param2:int) : StcEquipLiansuoVo
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Array = StcMgr.ins.getEquipLiansuoTable().array;
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc4_ = _loc3_[_loc5_] as StcEquipLiansuoVo;
            if(_loc4_.kind == param1 && _loc4_.level == param2)
            {
               return _loc4_;
            }
            _loc5_++;
         }
         return null;
      }
      
      private function addPropArrByItemVo(param1:StcItemVo, param2:Array) : void
      {
         var _loc7_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc5_:Array = NPCPropConsts.ins.baseProp5List;
         _loc7_ = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc7_];
            _loc6_ = NPCPropConsts.ins.getStcVoPropertyName(_loc3_);
            if(param1[_loc6_])
            {
               _loc4_ = getPropVoByPropId(_loc3_,param2);
               _loc4_.value = _loc4_.value + param1[_loc6_];
            }
            _loc7_++;
         }
      }
      
      private function addPropArrByStr(param1:String, param2:Array) : void
      {
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:Number = NaN;
         var _loc6_:* = null;
         if(param1 == "0" || param1 == "")
         {
            return;
         }
         var _loc8_:Array = param1.split("|");
         _loc7_ = 0;
         while(_loc7_ < _loc8_.length)
         {
            _loc4_ = (_loc8_[_loc7_] as String).split(":");
            _loc5_ = _loc4_[0];
            _loc3_ = _loc4_[1];
            if(_loc3_ != 0)
            {
               _loc6_ = getPropVoByPropId(_loc5_,param2);
               _loc6_.value = _loc6_.getRealPropValue() + _loc3_;
            }
            _loc7_++;
         }
      }
      
      private function addPropArrByItem(param1:StcItemVo, param2:Array) : void
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Array = NpcPropVo.parseItemVo(param1);
         _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc6_];
            if(_loc3_.value > 0)
            {
               _loc4_ = getPropVoByPropId(_loc3_.propId,param2);
               _loc4_.value = _loc4_.getRealPropValue() + _loc3_.getRealPropValue();
            }
            _loc6_++;
         }
      }
      
      private function getPropVoByPropId(param1:int, param2:Array) : NpcPropVo
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         _loc4_ = 0;
         while(_loc4_ < param2.length)
         {
            _loc3_ = param2[_loc4_] as NpcPropVo;
            if(_loc3_.propId == param1)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         _loc3_ = new NpcPropVo(param1,0,"",null,1);
         param2.push(_loc3_);
         return _loc3_;
      }
      
      private function addTitleAndPropDisplay(param1:Array, param2:uint, param3:int = 0, param4:int = 0) : void
      {
         if(param1.length > 0)
         {
            addSmallTitle(param2,true,param3,param4);
            addPropDisplay(param1);
         }
         else
         {
            addSmallTitle(param2,false);
            mui.addVGap(nullVGap);
         }
      }
      
      private function addSmallTitle(param1:uint, param2:Boolean = true, param3:int = 0, param4:int = 0) : void
      {
         var _loc5_:String = LocaleMgr.ins.getStr(param1);
         var _loc6_:ToolTipHeroInfoDetailTitle2UI = new ToolTipHeroInfoDetailTitle2UI();
         if(param2)
         {
            if(param4 > 0)
            {
               _loc6_.txt_title.text = _loc5_ + "(" + getLevelText(param3,param4) + ")";
            }
            else
            {
               _loc6_.txt_title.text = _loc5_;
            }
         }
         else
         {
            _loc6_.txt_title.text = _loc5_ + "<font color=\'#" + 16723968.toString(16) + "\'>" + LocaleMgr.ins.getStr(999001109) + "</font>";
         }
         mui.box.addChild(_loc6_);
         isTopBigTitle = false;
      }
      
      private function getLevelText(param1:int, param2:int) : String
      {
         var _loc3_:* = null;
         switch(int(param2) - 1)
         {
            case 0:
               return LocaleMgr.ins.getStr(999001021,[param1]);
            case 1:
               return LocaleMgr.ins.getStr(999000044,[param1]);
            case 2:
               return "+" + param1;
            case 3:
               _loc3_ = StcMgr.ins.getHorsejingtongVo(param1);
               return LocaleMgr.ins.getStr(999000044,[_loc3_.rank]) + LocaleMgr.ins.getStr(999001021,[_loc3_.level]);
            case 4:
               return LocaleMgr.ins.getStr(999001022,[param1]);
         }
      }
      
      private function addPropDisplay(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         param1.sort(sortProp);
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = new ToolTipHeroInfoDetailPropUI();
            mui.box.addChild(_loc4_);
            _loc3_ = param1[_loc5_] as NpcPropVo;
            setPropText(_loc4_.txt_title,_loc4_.txt_value,_loc3_);
            if(_loc5_ + 1 >= param1.length)
            {
               _loc4_.txt_title2.text = "";
               _loc4_.txt_value2.text = "";
            }
            else
            {
               _loc2_ = param1[_loc5_ + 1] as NpcPropVo;
               if(_loc3_.isPrecent == false && _loc2_.isPrecent)
               {
                  _loc4_.txt_title2.text = "";
                  _loc4_.txt_value2.text = "";
                  _loc5_ = _loc5_ - 1;
               }
               else
               {
                  setPropText(_loc4_.txt_title2,_loc4_.txt_value2,_loc2_);
               }
            }
            _loc5_ = _loc5_ + 2;
         }
      }
      
      private function setPropText(param1:Label, param2:Label, param3:NpcPropVo) : void
      {
         NpcPropVo.setLabelColor(param2,param3);
         param1.text = NPCPropConsts.ins.getLocaleName(param3.propId) + ":";
         param2.text = NPCPropConsts.ins.showValue(param3.value,"+",param3.fixPos);
         param1.width;
         if(param1.textWidth + 5 + param1.x > param2.x)
         {
            param2.x = param1.textWidth + 5 + param1.x;
         }
      }
      
      private function addBigTitle(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc2_:String = LocaleMgr.ins.getStr(param1);
         if(hasAddBigTitle.indexOf(_loc2_) < 0)
         {
            if(isTopBigTitle == false)
            {
               mui.addVGap(10);
               mui.addLine();
               mui.addVGap(10);
            }
            hasAddBigTitle.push(_loc2_);
            _loc3_ = new ToolTipHeroInfoDetailTitleUI();
            _loc3_.x = mui.width / 2 - _loc3_.width / 2;
            _loc3_.lTitle.text = _loc2_;
            mui.box.addChild(_loc3_);
            isTopBigTitle = false;
         }
      }
      
      public function horseAddAllProp(param1:Array) : Array
      {
         var _loc3_:Array = [];
         if(param1.length == 0)
         {
            return NpcPropVo.createPropArrZero(NPCPropConsts.ins.baseProp5List);
         }
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc2_ in param1)
         {
            NpcPropVo.addProp(_loc3_,NpcPropVo.parseArrStr(StcMgr.ins.getSaddlehorseVo(_loc2_).prop));
         }
         return _loc3_;
      }
      
      public function masterAddAllProp(param1:int) : Array
      {
         if(param1 == 1)
         {
            return NpcPropVo.createPropArrZero(NPCPropConsts.ins.baseProp5List);
         }
         var _loc2_:StcHorsejingtongVo = StcMgr.ins.getHorsejingtongVo(param1);
         return NpcPropVo.parseArrStr(_loc2_.prop);
      }
      
      private function sortPropById(param1:Array) : void
      {
         param1.sort(sortProp);
      }
      
      private function sortProp(param1:NpcPropVo, param2:NpcPropVo) : int
      {
         var _loc3_:Boolean = param1.isPrecent;
         var _loc4_:Boolean = param2.isPrecent;
         if(_loc3_ != _loc4_)
         {
            return !!_loc3_?1:-1;
         }
         return param1.propId > param2.propId?1:-1;
      }
      
      override public function dispose() : void
      {
         this.ui = null;
         this.mui.box.removeAllChild();
         this.mui = null;
         hasAddBigTitle = [];
      }
   }
}
