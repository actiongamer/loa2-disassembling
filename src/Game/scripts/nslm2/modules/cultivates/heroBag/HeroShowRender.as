package nslm2.modules.cultivates.heroBag
{
   import game.ui.heroShowModule.HeroShowRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import nslm2.common.model.HeroModel;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import proto.HeroInfo;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.newerGuideModules.NGConsts;
   import proto.PanelBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.utils.RTools;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.common.model.PlayerModel;
   import morn.customs.FilterLib;
   import nslm2.mgrs.skins.ColorLib;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.roleInfos.tupos.RoleTupoUtil;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.modules.roleInfos.vo.RoleTupoNeedVo;
   import nslm2.modules.roleInfos.levelUps.RoleLevelUpUtil;
   import nslm2.modules.roleInfos.awake.RoleAwakeUtil;
   import nslm2.modules.roleInfos.phaseUps.talents.PhaseUpTalentUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.mediators.RollMediator;
   
   public class HeroShowRender extends HeroShowRenderUI implements IObserver
   {
       
      
      private var filterMed:RoleGrowFilterMed;
      
      private var _isRoll:Boolean;
      
      public var redPoint:RedPoint;
      
      private var _showModuleSubId:int;
      
      private var canTuPo:Boolean;
      
      private var canLvlUp:Boolean;
      
      private var canAwake:Boolean;
      
      private var canPhaseUpTalent:Boolean;
      
      public function HeroShowRender()
      {
         super();
         switchEventListener(true);
         filterMed = new RoleGrowFilterMed(this,null);
         this.parts.push(new RoleGrowFilterMed(this,null));
         this.parts.push(new RollMediator(this,onRoll));
         this.img_icon.mask = this.img_mask;
         this.list_need.mouseChildren = false;
         ObserverMgr.ins.regObserver(this);
      }
      
      private function switchEventListener(param1:Boolean) : void
      {
         if(param1)
         {
            this.addEventListener("click",onMouseClick);
         }
         else
         {
            this.removeEventListener("click",onMouseClick);
         }
      }
      
      private function onRoll(param1:Boolean) : void
      {
         if(this.vo)
         {
            _isRoll = param1;
            this.img_new.visible = false;
            removeHero();
            this.filters = null;
         }
      }
      
      private function removeHero() : void
      {
         if(this.img_new.visible)
         {
            HeroModel.ins.removeNewHero(vo.id);
            this.img_new.visible = false;
            this.dispatchEvent(new Event("evtClickNewHero",true));
         }
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         if(!vo.id)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.HERO_LESS_ID)),30701);
         }
         else
         {
            removeHero();
            if(param1.target == list_need)
            {
               _showModuleSubId = 30110;
            }
            else if(HeroModel.ins.isCurPlayerHero(vo.id) || canTuPo)
            {
               _showModuleSubId = 30110;
            }
            else
            {
               _showModuleSubId = 20010;
            }
            HeroModel.ins.getHeroInfo(this.vo.id,openModuleHandler);
         }
      }
      
      private function openModuleHandler(param1:HeroInfo) : void
      {
         var _loc2_:RoleInfoModuleParam = new RoleInfoModuleParam();
         if(NGUtil.isCurGuideId(97175) || NGUtil.isCurGuideId(97168))
         {
            _loc2_.init(param1,30110);
            ModuleMgr.ins.showModule(30100,_loc2_);
         }
         else
         {
            _loc2_.init(param1,_showModuleSubId);
            if(NGUtil.hasCurGuideId(NGConsts.NG_NEED_OPEN_DIRECTLY))
            {
               ModuleMgr.ins.showModule(30100,_loc2_);
            }
            else
            {
               ModuleMgr.ins.showModule(30100,_loc2_,30701);
            }
         }
      }
      
      private function get vo() : PanelBaseInfo
      {
         return this.dataSource as PanelBaseInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         .super.dataSource = param1;
         this.filters = null;
         if(vo)
         {
            if(!vo.id)
            {
               this.box_info.visible = false;
               this.btn_goToReward.visible = true;
               this.box_info.toolTip = null;
               filterMed.glowFilter = null;
               return;
            }
            this.box_info.toolTip = vo;
            this.btn_goToReward.visible = false;
            this.box_info.visible = true;
            _loc3_ = StcMgr.ins.getNpcVo(vo.baseId);
            if(HeroModel.ins.isNewHero(vo.id))
            {
               this.img_new.visible = true;
            }
            else
            {
               this.img_new.visible = false;
            }
            this.txt_nick.visible = RTools.cl(true,false);
            this.txt_jieshu.text = LocaleMgr.ins.getStr(999000047) + vo.shengjie;
            this.txt_level.text = LocaleMgr.ins.getStr(999000048) + vo.level;
            this.txt_name.text = HeroInfoUtil.getHtmlNameHasTupoLevel(vo.baseId,false);
            this.txt_nick.text = HeroInfoUtil.getHtmlNameHasTupoLevel(vo.baseId,true,false);
            if(vo.place && !HeroModel.ins.isReinforcements(vo.place))
            {
               this.img_shangzhen.visible = true;
               this.list_need.visible = true;
               this.txt_jieshu.y = 138;
               this.txt_level.y = 138;
            }
            else
            {
               this.img_shangzhen.visible = false;
               this.list_need.visible = false;
               this.txt_jieshu.y = this.list_need.y + 2;
               this.txt_level.y = this.list_need.y + 2;
            }
            this.img_reinforcements.visible = HeroModel.ins.isReinforcements(vo.place);
            this.img_icon.url = UrlLib.npcDialogIcon(_loc3_.head_id);
            if(HeroModel.ins.isCurPlayerHero(vo.id))
            {
               _loc2_ = MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank);
            }
            else
            {
               _loc2_ = _loc3_.quality;
            }
            this.img_bg.url = UrlLib.showHeroRenderBgs(_loc2_);
            filterMed.glowFilter = FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(_loc2_));
            if(false && _loc3_.career_id)
            {
               this.img_career.url = UrlLib.npcTypeIcon(_loc3_.career_id);
               this.img_career.visible = true;
            }
            else
            {
               this.img_career.visible = false;
            }
            if(HeroModel.ins.isCurPlayerHero(vo.id))
            {
               this.img_reinforcements.visible = false;
               this.img_shangzhen.visible = false;
               this.img_crown.visible = true;
               this.list_need.visible = true;
            }
            else
            {
               this.img_crown.visible = false;
            }
            initGodHood();
         }
         else
         {
            TimerManager.ins.clearTimer(dispatchRemoveNewHeroEvent);
         }
      }
      
      private function initGodHood() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc6_:StcNpcVo = StcMgr.ins.getNpcVo(vo.baseId);
         var _loc2_:StcTupoVo = RoleTupoUtil.getStcTupoVo(_loc6_.node,_loc6_.tupo + 1);
         var _loc5_:Array = RoleTupoUtil.getTupoNeedItem(_loc2_);
         if(_loc2_)
         {
            this.list_need.dataSource = RoleTupoNeedVo.voArrFromWealthVoArr(_loc5_,vo);
            canTuPo = false;
            var _loc8_:int = 0;
            var _loc7_:* = this.list_need.array;
            for each(var _loc4_ in this.list_need.array)
            {
               if(RoleTupoUtil.getGodhoodEquipState(_loc4_.panelBaseInfo,_loc4_.wealthVo.sid) == 3 && (vo.place && !HeroModel.ins.isReinforcements(vo.place) || HeroModel.ins.isCurPlayerHero(vo.id)))
               {
                  canTuPo = true;
               }
            }
            if(canTuPo == false)
            {
               if(HeroModel.ins.isCurPlayerHero(vo.id) && RoleTupoUtil.canTupo(HeroModel.ins.playerHero,false))
               {
                  canTuPo = true;
               }
               else
               {
                  _loc1_ = HeroModel.ins.getHeroInfoQuick(vo.id);
                  if(_loc1_ && RoleTupoUtil.canTupo(_loc1_,false))
                  {
                     canTuPo = true;
                  }
               }
            }
            canLvlUp = false;
            if(vo.place && !HeroModel.ins.isReinforcements(vo.place) && RoleLevelUpUtil.checkNeedPromptLevelUp(vo))
            {
               canLvlUp = true;
            }
            canAwake = false;
            if(HeroModel.ins.isCurPlayerHero(vo.id) && RoleAwakeUtil.checkCurHeroStatus(HeroModel.ins.playerHero))
            {
               canAwake = true;
            }
            else if(vo.place && !HeroModel.ins.isReinforcements(vo.place))
            {
               _loc3_ = HeroModel.ins.getHeroInfoQuick(vo.id);
               if(_loc3_ && RoleAwakeUtil.checkCurHeroStatus(_loc3_))
               {
                  canAwake = true;
               }
            }
            canPhaseUpTalent = false;
            if(HeroModel.ins.isCurPlayerHero(vo.id) && PhaseUpTalentUtil.canUp(HeroModel.ins.playerHero))
            {
               canPhaseUpTalent = true;
            }
            else if(vo.place && !HeroModel.ins.isReinforcements(vo.place))
            {
               _loc3_ = HeroModel.ins.getHeroInfoQuick(vo.id);
               if(_loc3_ && PhaseUpTalentUtil.canUp(_loc3_))
               {
                  canPhaseUpTalent = true;
               }
            }
            if(canTuPo || canLvlUp || canAwake || canPhaseUpTalent)
            {
               if(redPoint)
               {
                  redPoint.visible = true;
               }
               else
               {
                  redPoint = new RedPoint();
                  redPoint.anchorX = 0.5;
                  redPoint.anchorY = 0.5;
                  redPoint.x = this.width - 9;
                  redPoint.y = -6;
                  addChild(redPoint);
               }
            }
            else if(redPoint)
            {
               redPoint.visible = false;
            }
            redPointHandler();
         }
         else
         {
            this.list_need.visible = false;
         }
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         if(_isRoll || !vo)
         {
            return;
         }
         var _loc3_:* = param1;
         if("heroEquippedChanged" !== _loc3_)
         {
            if("hero_level_changed" === _loc3_)
            {
               if(HeroModel.ins.getHeroInfoQuick(vo.id))
               {
                  this.dataSource = HeroInfoUtil.heroBaseInfoToPanelBaseInfo(HeroModel.ins.getHeroInfoQuick(vo.id).baseInfo);
               }
               if(HeroModel.ins.isCurPlayerHero(vo.id))
               {
                  this.dataSource = HeroInfoUtil.heroBaseInfoToPanelBaseInfo(HeroModel.ins.playerHero.baseInfo);
               }
            }
         }
         else
         {
            if(HeroModel.ins.getHeroInfoQuick(vo.id))
            {
               this.dataSource = HeroInfoUtil.heroBaseInfoToPanelBaseInfo(HeroModel.ins.getHeroInfoQuick(vo.id).baseInfo);
            }
            if(HeroModel.ins.isCurPlayerHero(vo.id))
            {
               this.dataSource = HeroInfoUtil.heroBaseInfoToPanelBaseInfo(HeroModel.ins.playerHero.baseInfo);
            }
         }
      }
      
      override public function dispose() : void
      {
         TimerManager.ins.clearTimer(dispatchRemoveNewHeroEvent);
         switchEventListener(false);
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
      
      private function redPointHandler() : void
      {
         if(this.img_new.visible)
         {
            TimerManager.ins.doOnce(200,dispatchRemoveNewHeroEvent);
         }
      }
      
      private function dispatchRemoveNewHeroEvent() : void
      {
         this.dispatchEvent(new Event("evtClickNewHero",true));
      }
      
      public function getFocusNotices() : Array
      {
         return ["heroEquippedChanged","hero_level_changed"];
      }
   }
}
