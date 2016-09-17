package nslm2.modules.roleInfos.phaseUps.talents
{
   import game.ui.roleInfos.phaseUps.talents.PhaseUpTalentPanelUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcHeroTalentInfoVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.LabelUtils;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import morn.core.utils.StringUtils;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.mgrs.skins.Effect2DUtils;
   import morn.core.components.Label;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import com.netease.protobuf.UInt64;
   import proto.HeroTalentReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.cultivates.roleTeam.ctrl.CheckRoleTeamRedPointCtrl;
   import nslm2.modules.foundations.AlertUtil;
   import flash.geom.Point;
   
   public class PhaseUpTalentPanel extends PhaseUpTalentPanelUI
   {
       
      
      private var showParam:nslm2.modules.roleInfos.phaseUps.talents.PhaseUpTalentVo;
      
      public function PhaseUpTalentPanel()
      {
         super();
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices();
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         this.panelBg.titleImgId = this.moduleId;
         this.txt_hadNow.text = LocaleMgr.ins.getStr(30600203);
         this.btn_submit.label = LocaleMgr.ins.getStr(30100005);
         DisplayUtils.addChildFromGlobal(this.btn_submit,this.costRender);
         showParam = param1 as nslm2.modules.roleInfos.phaseUps.talents.PhaseUpTalentVo;
         this.refreshUI();
      }
      
      private function refreshUI() : void
      {
         var _loc2_:StcHeroTalentInfoVo = StcMgr.ins.getHeroTalentInfoVo(showParam.stcTablentId);
         var _loc1_:StcHeroTalentInfoVo = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent_info",["node","lv"],[_loc2_.node,_loc2_.lv + 1]) as StcHeroTalentInfoVo;
         var _loc3_:WealthVo = WealthVo.parseCostStr(_loc2_.cost);
         _loc3_.useIconKind = 2;
         costRender.wealthVo = _loc3_;
         costRender.txt_num.color = LabelUtils.getCountColor(PlayerModel.ins.getCountByWealthVo(costRender.wealthVo),costRender.wealthVo.count);
         _loc3_ = WealthUtil.toStcCountVo(WealthVo.parseCostStr(_loc2_.cost));
         _loc3_.useIconKind = 2;
         this.hasRenderer.wealthVo = _loc3_;
         this.render1a.vo = this.showParam;
         this.render1b.vo = nslm2.modules.roleInfos.phaseUps.talents.PhaseUpTalentVo.initByStcId(_loc1_.id);
         this.render1a.toolTip = null;
         this.render1b.toolTip = null;
         this.txt_tip1a.text = LocaleMgr.ins.getStr(_loc2_.name) + " " + LocaleConsts.lvStr(_loc2_.lv);
         this.txt_tip1b.text = LocaleMgr.ins.getStr(_loc1_.name) + " " + LocaleConsts.lvStr(_loc1_.lv);
         if(StringUtils.isNull(_loc2_.attr) == false)
         {
            addAttrText(_loc2_.attr,this.txt_tip3a);
            this.txt_tip3a.visible = true;
         }
         else
         {
            this.txt_tip3a.visible = false;
         }
         addAttrText(_loc1_.attr,this.txt_tip3b);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         if(render1a.vo.heroPhaseLv >= _loc2_.cond)
         {
            if(PlayerModel.ins.getCountByWealthVo(costRender.wealthVo) >= costRender.wealthVo.count)
            {
               Effect2DUtils.showBtnEff_btnBig(this.btn_submit);
            }
            else
            {
               Effect2DUtils.hideBtnEff_btnBig(this.btn_submit);
            }
            this.btn_submit.disabled = false;
            this.txt_tip6.visible = false;
         }
         else
         {
            this.btn_submit.disabled = true;
            Effect2DUtils.hideBtnEff_btnBig(this.btn_submit);
            this.txt_tip6.text = LocaleMgr.ins.getStr(30113004,[_loc2_.cond]);
            this.txt_tip6.visible = true;
         }
      }
      
      private function addAttrText(param1:String, param2:Label) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Array = NpcPropVo.parseArrStr(param1);
         param2.text = "";
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc4_ = _loc3_[_loc5_] as NpcPropVo;
            if(_loc5_ != 0)
            {
               param2.text = param2.text + "\n";
            }
            param2.text = param2.text + (NPCPropConsts.ins.getLocaleName(_loc4_.propId) + " + " + _loc4_.value);
            _loc5_++;
         }
         param2.y = 182 - param2.textField.textHeight / 2;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_submit === _loc3_)
         {
            if(param2.ctrlKey)
            {
               this.floatPropArr();
            }
            else if(PlayerModel.ins.getCountByWealthVo(costRender.wealthVo) >= costRender.wealthVo.count)
            {
               server_heroTalent(this.showParam.heroId,this.showParam.index);
            }
            else
            {
               ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealth(20,costRender.wealthVo.sid),30100);
            }
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
      
      public function server_heroTalent(param1:UInt64, param2:uint) : void
      {
         var _loc3_:HeroTalentReq = new HeroTalentReq();
         _loc3_.id = param1;
         _loc3_.tid = param2;
         ServerEngine.ins.send(5017,_loc3_,server_heroTalent_cpl);
      }
      
      private function server_heroTalent_cpl(param1:*, param2:ServerEvent) : void
      {
         var _loc3_:StcHeroTalentInfoVo = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent_info",["node","lv"],[showParam.talentNodeId,showParam.lv + 1]) as StcHeroTalentInfoVo;
         var _loc4_:StcHeroTalentInfoVo = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent_info",["node","lv"],[showParam.talentNodeId,showParam.lv + 2]) as StcHeroTalentInfoVo;
         CheckRoleTeamRedPointCtrl.ins.checkAndSwitchHeroShowRedPoi();
         if(_loc4_)
         {
            showParam.stcTablentId = _loc3_.id;
            showParam.lv = _loc3_.lv;
            showParam.talentNodeId = _loc3_.node;
            this.refreshUI();
         }
         else
         {
            ModuleMgr.ins.closeModule(this.moduleId);
         }
         this.floatPropArr();
      }
      
      private function floatPropArr() : void
      {
         var _loc1_:StcHeroTalentInfoVo = StcMgr.ins.getHeroTalentInfoVo(showParam.stcTablentId);
         var _loc2_:Array = NpcPropVo.filterZeroProp(NpcPropVo.parseArrStr(_loc1_.attr));
         AlertUtil.float(LocaleMgr.ins.getStr(30400003),DisplayUtils.globarCenter(this).add(new Point(0,-30 * _loc2_.length)));
         AlertUtil.showPropArrChangeTip(_loc2_,null,null,DisplayUtils.globarCenter(this).add(new Point(0,25)));
      }
   }
}
