package nslm2.modules.footstones.tooltipsModules
{
   import morn.customs.components.TopModuleView;
   import flash.utils.Dictionary;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipString;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipStcItem;
   import proto.Item;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipItem;
   import nslm2.modules.bag.itemModuels.ItemMsg;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipItemMsg;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipStcNpc;
   import proto.PanelBaseInfo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipPanelBaseInfo;
   import nslm2.modules.footstones.tooltipsModules.servers.PanelBaseInfoServer;
   import proto.HeroInfo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipHeroInfo;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipWealth;
   import nslm2.mgrs.stcMgrs.vos.StcMengyueVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipStcMengYue;
   import nslm2.modules.battles.resourceDungeons.GainExtraTipVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipGainExtra;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipStcSkill;
   import nslm2.common.vo.SkillRenderVo;
   import nslm2.modules.footstones.tooltipsModules.uis.ToolTipEquipLianSuo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipTianfu;
   import nslm2.modules.footstones.tooltipsModules.uis.ToolTipNpcSkill;
   import proto.StageBtlReport;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipStageBtlReportData;
   import nslm2.modules.footstones.tooltipsModules.uis.ToolTipNpcCarrer;
   import nslm2.modules.footstones.tooltipsModules.uis.ToolTipNpcGroup;
   import nslm2.modules.roleInfos.equipPanels.RoleMengYuePanel;
   import proto.BaoWu;
   import nslm2.modules.footstones.tooltipsModules.uis.ToolTipTreasure;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipNpcFunc;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipHorse;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipPlayerSkill;
   import nslm2.mgrs.stcMgrs.vos.StcMilitaryrankVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipMilitary;
   import nslm2.modules.foundations.playerHeaders.PlayerMilitaryVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipPlayerMilitary;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipBuff;
   import nslm2.mgrs.stcMgrs.vos.StcGuajiVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipGuajiNandu;
   import nslm2.modules.cultivates.position.TooltipPositionVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipPosition;
   import nslm2.modules.foundations.vip.vo.VipVo;
   import nslm2.modules.footstones.tooltipsModules.uis.ToolTipVip;
   import proto.BgPlayerInfo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipBgPlayerInfo;
   import nslm2.modules.footstones.tooltipsModules.vos.WideToolTipStringVo;
   import nslm2.modules.footstones.tooltipsModules.uis.ToolTipStringWide;
   import proto.CrossArenaFinalEnemyInfo;
   import nslm2.modules.footstones.tooltipsModules.uis.ToolTipHeroInfoDetail;
   import nslm2.common.vo.PlayerDiamondVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipPlayerDiamond;
   import nslm2.modules.roleInfos.phaseUps.talents.PhaseUpTalentVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipStcPhaseTalent;
   import nslm2.modules.funnies.newYears.day38s.Day38GiftVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipDay38Gift;
   import nslm2.modules.funnies.secretExplore.SEBoxTipsVo;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipPet;
   import proto.MjtxEnemyInfo;
   import morn.core.handlers.Handler;
   import com.mz.core.utils2.reflects.ReflectUtil;
   import com.mz.core.logging.Log;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.Event;
   import com.mz.core.utils.DisplayUtils;
   
   public class TooltipModule extends TopModuleView
   {
      
      public static var mouse_offsetX:int = 10;
      
      public static var mouse_offsetY:int = 15;
      
      public static const BORDER:int = 4;
       
      
      private var configVoLib:Dictionary;
      
      private var isIgnoreClick:Boolean = false;
      
      private var curTask:nslm2.modules.footstones.tooltipsModules.TooltipShowTask;
      
      public function TooltipModule()
      {
         configVoLib = new Dictionary();
         super();
         regTooltip();
         UIMgr.stage.addEventListener("click",onStageHideTipClick);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         this.mouseEvent = false;
      }
      
      public function regTooltip() : void
      {
         configVoLib[String] = new TooltipConfigVo(TooltipString,null);
         configVoLib[StcItemVo] = new TooltipConfigVo(TooltipStcItem,null);
         configVoLib[Item] = new TooltipConfigVo(TooltipItem,null);
         configVoLib[ItemMsg] = new TooltipConfigVo(TooltipItemMsg,null);
         configVoLib[StcNpcVo] = new TooltipConfigVo(TooltipStcNpc,null);
         configVoLib[PanelBaseInfo] = new TooltipConfigVo(TooltipPanelBaseInfo,PanelBaseInfoServer);
         configVoLib[HeroInfo] = new TooltipConfigVo(TooltipHeroInfo,null);
         configVoLib[WealthVo] = new TooltipConfigVo(TooltipWealth,null);
         configVoLib[TooltipCompareVo] = new TooltipConfigVo(TooltipWealth,null);
         configVoLib[StcMengyueVo] = new TooltipConfigVo(TooltipStcMengYue,null);
         configVoLib[GainExtraTipVo] = new TooltipConfigVo(TooltipGainExtra,null);
         configVoLib[StcSkillVo] = new TooltipConfigVo(TooltipStcSkill,null);
         configVoLib[SkillRenderVo] = new TooltipConfigVo(TooltipStcSkill,null);
         configVoLib[ToolTipLianSuoVo] = new TooltipConfigVo(ToolTipEquipLianSuo,null);
         configVoLib[TooltipTianfuVo] = new TooltipConfigVo(TooltipTianfu,null);
         configVoLib[TooltipNpcSkillVo] = new TooltipConfigVo(ToolTipNpcSkill,null);
         configVoLib[StageBtlReport] = new TooltipConfigVo(TooltipStageBtlReportData,null);
         configVoLib[ToolTipNpcCarrerVo] = new TooltipConfigVo(ToolTipNpcCarrer,null);
         configVoLib[ToolTipNpcGroupVo] = new TooltipConfigVo(ToolTipNpcGroup,null);
         configVoLib[ToolTipYuanFenVo] = new TooltipConfigVo(RoleMengYuePanel,null);
         configVoLib[BaoWu] = new TooltipConfigVo(ToolTipTreasure,null);
         configVoLib[StcFunctionVo] = new TooltipConfigVo(TooltipNpcFunc,null);
         configVoLib[StcSaddlehorseVo] = new TooltipConfigVo(TooltipHorse,null);
         configVoLib[TooltipPlayerSkillVo] = new TooltipConfigVo(TooltipPlayerSkill,null);
         configVoLib[StcMilitaryrankVo] = new TooltipConfigVo(TooltipMilitary,null);
         configVoLib[PlayerMilitaryVo] = new TooltipConfigVo(TooltipPlayerMilitary,null);
         configVoLib[StcBuffVo] = new TooltipConfigVo(TooltipBuff,null);
         configVoLib[StcGuajiVo] = new TooltipConfigVo(TooltipGuajiNandu,null);
         configVoLib[TooltipPositionVo] = new TooltipConfigVo(TooltipPosition,PanelBaseInfoServer);
         configVoLib[VipVo] = new TooltipConfigVo(ToolTipVip,null);
         configVoLib[BgPlayerInfo] = new TooltipConfigVo(TooltipBgPlayerInfo,null);
         configVoLib[WideToolTipStringVo] = new TooltipConfigVo(ToolTipStringWide,null);
         configVoLib[CrossArenaFinalEnemyInfo] = new TooltipConfigVo(ToolTipPKCrossCheer,null);
         configVoLib[ToolTipGridActiveVo] = new TooltipConfigVo(ToolTipGridAngle,null);
         configVoLib[ToolTipHeroInfoDetailVo] = new TooltipConfigVo(ToolTipHeroInfoDetail,null);
         configVoLib[PlayerDiamondVo] = new TooltipConfigVo(TooltipPlayerDiamond,null);
         configVoLib[PhaseUpTalentVo] = new TooltipConfigVo(TooltipStcPhaseTalent,null);
         configVoLib[Day38GiftVo] = new TooltipConfigVo(TooltipDay38Gift,null);
         configVoLib[SEBoxTipsVo] = new TooltipConfigVo(ToolTipSEBox,null);
         configVoLib[PetInfoVo] = new TooltipConfigVo(TooltipPet,null);
         configVoLib[MjtxEnemyInfo] = new TooltipConfigVo(ToolTipSecretExplore,null);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat("msg_tooltip_click","msg_tooltip_show","msg_tooltip_hide");
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("msg_tooltip_click" !== _loc3_)
         {
            if("msg_tooltip_show" !== _loc3_)
            {
               if("msg_tooltip_hide" === _loc3_)
               {
                  hideTip();
               }
            }
            else
            {
               isIgnoreClick = false;
               showTooltip(param2);
            }
         }
         else
         {
            isIgnoreClick = true;
            showTooltip(param2);
         }
      }
      
      public function showTooltip(param1:*) : void
      {
         if(param1 is Function)
         {
            param1 = param1();
         }
         if(isIgnoreClick)
         {
            _showTooltip(param1);
         }
         else
         {
            App.timer.doOnce(Config.tipDelay,new Handler(_showTooltip,[param1]));
         }
      }
      
      private function _showTooltip(param1:*) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc3_:Class = ReflectUtil.getClassByOb(param1);
         var _loc2_:TooltipConfigVo = configVoLib[_loc3_];
         if(_loc2_)
         {
            curTask = new nslm2.modules.footstones.tooltipsModules.TooltipShowTask(this,_loc2_,param1);
            curTask.addCompleteHandler(task_cpl).exec();
         }
         else
         {
            Log.error(this,"未注册的tooltip 数据class",ReflectUtil.getClassName(param1));
         }
      }
      
      private function task_cpl(param1:nslm2.modules.footstones.tooltipsModules.TooltipShowTask) : void
      {
         this.width = param1.ui.showWidth;
         this.height = param1.ui.showHeight;
         this.validatePos();
         UIMgr.stage.addEventListener("mouseMove",onStageMouseMove);
         UIMgr.stage.addEventListener("mouseDown",hideTip);
      }
      
      private function onStageHideTipClick(param1:Event = null) : void
      {
         if(!this.isIgnoreClick)
         {
            hideTip();
         }
      }
      
      private function hideTip(param1:Event = null) : void
      {
         App.timer.clearTimer(_showTooltip);
         UIMgr.stage.removeEventListener("mouseMove",onStageMouseMove);
         UIMgr.stage.removeEventListener("mouseDown",hideTip);
         if(curTask)
         {
            this.curTask.dispose();
            this.curTask = null;
         }
         DisplayUtils.disposeChildren(this);
      }
      
      private function onStageMouseMove(... rest) : void
      {
         if(this.isIgnoreClick)
         {
            return;
         }
         this.validatePos();
      }
      
      private function validatePos() : void
      {
         var _loc1_:int = UIMgr.root.mouseX + mouse_offsetX;
         var _loc2_:int = UIMgr.root.mouseY + mouse_offsetY;
         if(_loc1_ > UIMgr.gameWidth - width - 4)
         {
            _loc1_ = UIMgr.root.mouseX - mouse_offsetX - width - 4;
         }
         if(_loc1_ < 4)
         {
            _loc1_ = 4;
         }
         if(_loc2_ > UIMgr.gameHeight - height - 4)
         {
            _loc2_ = UIMgr.gameHeight - height - 4;
         }
         if(_loc2_ < 4)
         {
            _loc2_ = 4;
         }
         this.x = _loc1_;
         this.y = _loc2_;
      }
   }
}
