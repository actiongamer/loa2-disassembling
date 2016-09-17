package nslm2.modules.cultivates.roleTeam.view.panel
{
   import game.ui.roleTeam.panel.YuanJunPanelUI;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.roleInfos.equipPanels.RoleMengYuePanel;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.cultivates.roleTeam.view.render.YuanJunHeroListRender;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.cultivates.roleTeam.vo.YuanJunVo;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import flash.events.Event;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamVo;
   import nslm2.modules.cultivates.roleTeam.view.HeroYuanfenInfoBox;
   import nslm2.modules.roleInfos.equipPanels.MengYueEffectVo;
   import nslm2.modules.cultivates.roleTeam.view.render.TeamRoleViewRender;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.modules.foundations.AlertUtil;
   import flash.geom.Point;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcMengyueVo;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   import nslm2.modules.cultivates.roleTeam.service.RoleTeamService;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   
   public class YuanJunPanel extends YuanJunPanelUI implements IObserver, IViewStackPage
   {
       
      
      private var YUAFENLIST_GAP:int = 6;
      
      private var selectPanel:nslm2.modules.cultivates.roleTeam.view.panel.SelectYuanJunPanel;
      
      private var mengYuePanel:RoleMengYuePanel;
      
      public function YuanJunPanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         list_yuanjun.useMouseDown = false;
         list_yuanjun.changeHandler = listYuanJunSelectHandler;
         pane_team.list_teamHero.changeHandler = selectHeroHandler;
         box_yuanjunTrain.visible = EnvConfig.ins.showDevModule || FuncOpenAutoCtrl.checkOpen(30815);
         if(box_yuanjunTrain.visible)
         {
            FuncOpenAutoCtrl.checkFuncBtnNew(30815,btn_yuanjunTrain);
         }
      }
      
      private function selectHeroHandler(param1:int, param2:int) : void
      {
         showYuanFenListPanel(param1);
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_yuafen !== _loc2_)
         {
            if(btn_back !== _loc2_)
            {
               if(btn_yuanjunTrain === _loc2_)
               {
                  ModuleMgr.ins.showModule(30815);
               }
            }
            else
            {
               showTeamInfoPanel();
            }
         }
         else
         {
            showYuanFenListPanel();
         }
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         list_yuanjun.dataSource = HeroModel.ins.YuanJunArr;
         txt_bottomtxt.text = LocaleMgr.ins.getStr(30100031,[HeroModel.ins.totalYuanFengCnt + "/" + (HeroModel.ins.getPositionList().length - 1) * 4]);
         ObserverMgr.ins.regObserver(this);
         showTeamInfoPanel();
         pane_team.list_teamHero.dataSource = HeroModel.ins.teamHeroArrWithoutPlayer;
         this.fadeIn();
      }
      
      private function showYuanFenListPanel(param1:int = 0) : void
      {
         txt_des.text = LocaleMgr.ins.getStr(30100030);
         this.pane_team.visible = false;
         box_yuafenDetail.visible = true;
         btn_back.visible = true;
         btn_yuafen.visible = false;
         updateYuanFenlistPanel(param1);
      }
      
      private function showTeamInfoPanel() : void
      {
         btn_back.visible = false;
         btn_yuafen.visible = true;
         txt_des.text = LocaleMgr.ins.getStr(999000086);
         this.pane_team.visible = true;
         box_yuafenDetail.visible = false;
      }
      
      private function listYuanJunSelectHandler(param1:Object) : void
      {
         var _loc3_:YuanJunHeroListRender = list_yuanjun.selection as YuanJunHeroListRender;
         if(_loc3_.img_lock.visible)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.MAINHERO_LV_LESS_ID)),ModuleMgr.ins.popLayer.curModuleId);
            return;
         }
         var _loc2_:YuanJunVo = list_yuanjun.selectedItem as YuanJunVo;
         RoleTeamModel.ins.selectedYuanJunPos = _loc2_.index;
         if(!_loc2_.heroData && _loc2_.isOpen)
         {
            showSelectYuanJunPanel();
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(114,_loc2_));
         }
      }
      
      private function showSelectYuanJunPanel() : void
      {
         if(!HeroModel.ins.getNotInYuanJunHeroList().length)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.HERO_LESS_ID)),30810);
            return;
         }
         RoleTeamModel.ins.selectedYuanJunPos = (list_yuanjun.selectedItem as YuanJunVo).index;
         if(this.selectPanel)
         {
            disposeSelectPanel();
         }
         else
         {
            disposeSelectPanel();
            selectPanel = new nslm2.modules.cultivates.roleTeam.view.panel.SelectYuanJunPanel();
            parent.parent.addChild(selectPanel);
            selectPanel.x = 238;
            selectPanel.y = 40;
            selectPanel.show();
            selectPanel.addEventListener("close",disposeSelectPanel);
            selectPanel.panelFadeIn();
         }
      }
      
      private function disposeSelectPanel(param1:Event = null) : void
      {
         if(selectPanel)
         {
            selectPanel.removeEventListener("close",disposeSelectPanel);
            selectPanel.panelFadeOutAndDispose();
            selectPanel = null;
         }
      }
      
      private function updateYuanFenlistPanel(param1:int) : void
      {
         var _loc7_:* = null;
         var _loc2_:* = 0;
         var _loc4_:int = 0;
         var _loc8_:int = 0;
         var _loc5_:* = null;
         var _loc3_:Array = HeroModel.ins.teamHeroArrWithoutPlayer;
         var _loc6_:int = _loc3_.length;
         panel_yuanfen.removeAllChild();
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            _loc5_ = _loc3_[_loc8_];
            if(_loc5_.heroData)
            {
               _loc7_ = new HeroYuanfenInfoBox();
               _loc7_.setHeroInfo(_loc5_.heroData);
               _loc7_.y = _loc4_;
               if(_loc8_ == param1)
               {
                  _loc2_ = _loc4_;
               }
               _loc4_ = _loc4_ + (_loc7_.height + YUAFENLIST_GAP);
               panel_yuanfen.addChild(_loc7_);
            }
            _loc8_++;
         }
         panel_yuanfen.scrollTo(0,_loc2_);
      }
      
      private function showMengYueActivateTip(param1:Array) : void
      {
         var _loc9_:* = null;
         var _loc3_:* = null;
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         showTeamInfoPanel();
         var _loc6_:int = param1.length;
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            _loc3_ = param1[_loc8_];
            _loc9_ = findRender(_loc3_.heroBaseInfo.id);
            if(_loc9_)
            {
               _loc4_ = TextFieldUtil.htmlText(_loc3_.getHeroName(),new TextFormat(null,null,_loc3_.getHeroColor()));
               AlertUtil.float(TextFieldUtil.htmlText(_loc4_ + LocaleMgr.ins.getStr(999000087) + LocaleMgr.ins.getStr(30100011,[TextFieldUtil.htmlText(_loc3_.getMengYueName(),new TextFormat(null,null,16046112))]),new TextFormat(null,18,458496)),this.localToGlobal(new Point(this.width / 2,80)),-1,new Handler(alertFloatCpl,[_loc9_]),DisplayUtils.globarCenter(_loc9_.txt_num),1);
               _loc5_ = StcMgr.ins.getMengyueVo(_loc3_.mengYueId);
               _loc2_ = NpcPropVo.parseArrStr(_loc5_.attr,"+");
               var _loc11_:int = 0;
               var _loc10_:* = _loc2_;
               for each(var _loc7_ in _loc2_)
               {
                  AlertUtil.float(TextFieldUtil.htmlText(_loc4_ + LocaleMgr.ins.getStr(999000087) + NPCPropConsts.ins.getLocaleNameNormal(_loc7_.propId) + "+" + NPCPropConsts.ins.showValue(_loc7_.value),new TextFormat(null,18,458496)),this.localToGlobal(new Point(this.width / 2,80)),-1,new Handler(alertFloatCpl,[_loc9_]),DisplayUtils.globarCenter(_loc9_.txt_num),1);
               }
            }
            _loc8_++;
         }
      }
      
      private function findRender(param1:UInt64) : TeamRoleViewRender
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc3_:Array = pane_team.list_teamHero.dataSource as Array;
         var _loc4_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc5_];
            if(Uint64Util.equal(_loc6_.heroData.id,param1))
            {
               _loc2_ = pane_team.list_teamHero.getCell(_loc5_) as TeamRoleViewRender;
               break;
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      private function alertFloatCpl(param1:TeamRoleViewRender) : void
      {
         if(this.isDisposed)
         {
            return;
         }
         if(param1)
         {
            new FloatZoomInEffCtrl(param1.txt_num);
         }
         pane_team.list_teamHero.dataSource = HeroModel.ins.teamHeroArrWithoutPlayer;
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
      
      public function getFocusNotices() : Array
      {
         return ["role_team_notice_select_new_yuanjun","role_team_notice_change_yuanjun","role_team_notice_show_mengyue_tip_yuanjun","role_team_show_select_yuanjun_panel"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("role_team_notice_select_new_yuanjun" !== _loc3_)
         {
            if("role_team_notice_change_yuanjun" !== _loc3_)
            {
               if("role_team_show_select_yuanjun_panel" !== _loc3_)
               {
                  if("role_team_notice_show_mengyue_tip_yuanjun" === _loc3_)
                  {
                     showMengYueActivateTip(param2);
                  }
               }
               else
               {
                  showSelectYuanJunPanel();
               }
            }
            else
            {
               showTeamInfoPanel();
               if(param2)
               {
                  pane_team.list_teamHero.dataSource = HeroModel.ins.teamHeroArrWithoutPlayer;
               }
               list_yuanjun.dataSource = HeroModel.ins.YuanJunArr;
               txt_bottomtxt.text = LocaleMgr.ins.getStr(30100031,[HeroModel.ins.totalYuanFengCnt + "/" + (HeroModel.ins.getPositionList().length - 1) * 4]);
            }
         }
         else
         {
            selectNewHeroHandler(param2);
         }
      }
      
      private function selectNewHeroHandler(param1:UInt64) : void
      {
         RoleTeamModel.ins.selectedHeroId = param1;
         RoleTeamService.ins.changeYuanJun(RoleTeamModel.ins.selectedYuanJunPos,param1);
         disposeSelectPanel();
      }
   }
}
