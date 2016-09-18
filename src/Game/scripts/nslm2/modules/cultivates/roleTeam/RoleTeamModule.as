package nslm2.modules.cultivates.roleTeam
{
   import game.ui.roleTeam.RoleTeamModuleUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import morn.core.components.ViewStack;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import proto.HeroInfoNotify;
   import nslm2.common.model.HeroModel;
   import proto.HeroInfo;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import nslm2.common.ui.components.comps2d.others.FightValueBox;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.roleInfos.equipPanels.MengYueEffectVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.roleInfos.commons.IRoleSubPanel;
   import proto.Item;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.common.ui.components.debug3d.DebugHeroInfoBox;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.cultivates.roleTeam.ctrl.CheckRoleTeamRedPointCtrl;
   import nslm2.modules.cultivates.roleTeam.view.render.TeamHeroListRender;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamVo;
   import nslm2.modules.footstones.tooltipsModules.TooltipHeroInfoCompare;
   import nslm2.modules.footstones.tooltipsModules.ToolTipHeroInfoDetailVo;
   import nslm2.mgrs.stcMgrs.vos.StcMengyueVo;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import nslm2.modules.cultivates.skin.SkinModel;
   import com.mz.core.utils.LocalData;
   import com.netease.protobuf.UInt64;
   import com.mz.core.configs.EnvConfig;
   import nslm2.common.ui.components.debug3d.DebugBloomFilterBox;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.cultivates.skin.service.SkinService;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import flash.events.Event;
   import away3d.events.MouseEvent3D;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.cultivates.roleTeam.view.panel.RoleTeamEquipPanel;
   import nslm2.modules.cultivates.roleTeam.view.panel.YuanJunPanel;
   import morn.customs.expands.MornExpandUtil;
   
   public class RoleTeamModule extends RoleTeamModuleUI implements INewerGuideGetComp, INewerGuideCheckHandler
   {
      
      private static const NG_COMP_ID:String = "btn_close_2";
       
      
      public var subViewStack:ViewStack;
      
      private var panel3D:UIPanel3D;
      
      private var avatar:UIUnit3D;
      
      private var bgSkinArr:Array;
      
      private var _playerLevel:int;
      
      public var debugHeroInfoBox:DebugHeroInfoBox;
      
      private var _param:Object;
      
      private var heroInfoDetail:TooltipHeroInfoCompare;
      
      public function RoleTeamModule()
      {
         subViewStack = new ViewStack();
         bgSkinArr = ["img_bg.jpg","img_yjBg.png"];
         super();
         subViewStack.subViewClasses = [RoleTeamEquipPanel,YuanJunPanel];
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         panelBg.bgCustom.addChild(img_funBg);
         list_team.useMouseDown = false;
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc4_:* = param1;
         if(btn_buzhen !== _loc4_)
         {
            if(btn_yuanjun === _loc4_)
            {
               if(!FuncOpenAutoCtrl.checkOpen(30814))
               {
                  _loc3_ = new ResGetPointModuleParam().initByLessId(int(DefindConsts.MAINHERO_LV_LESS_ID));
                  _loc3_.errMsg = FuncOpenAutoCtrl.getOpenLevelTipString(30814);
                  ModuleMgr.ins.showModule(12101,_loc3_,ModuleMgr.ins.popLayer.curModuleId);
                  return;
               }
               RoleTeamModel.ins.crtHeroNodeId = 0;
               list_team.selectedIndex = -1;
               avatar.visible = false;
               subViewStack.selectedIndex = 1;
               box_fightValue.visible = false;
               _loc2_ = box_opBtn.y + btn_yuanjun.y + -4 + 2;
               TweenLite.to(img_arrow,0.3,{
                  "y":_loc2_,
                  "ease":Back.easeOut
               });
               changeBg(1);
               updateHeroInfoTip();
            }
         }
         else
         {
            ModuleMgr.ins.showModule(40100,null,30810);
         }
      }
      
      private function changeBg(param1:int) : void
      {
         new GetResTask(1,UrlLib.moduleImgAsset(this.moduleId,bgSkinArr[param1])).addCompleteHandler(onLoadCpl).exec();
      }
      
      private function heroInfoNotifyHander(param1:HeroInfoNotify) : void
      {
         if(HeroModel.ins.isCurPlayerHero(param1.info.baseInfo.id) == true && _playerLevel != param1.info.baseInfo.level)
         {
            _playerLevel = param1.info.baseInfo.level;
         }
         else
         {
            heroInfoNotifyHander2(param1.info);
         }
      }
      
      private function heroInfoNotifyHander2(param1:HeroInfo) : void
      {
         var _loc2_:int = 0;
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc4_:* = null;
         RoleTeamModel.ins.crtHeroId = param1.baseInfo.id;
         RoleTeamModel.ins.crtHeroNodeId = HeroModel.getHeroNodeId(param1.baseInfo.baseId);
         if(RoleInfoModel.ins.heroInfo && !Uint64Util.equal(RoleInfoModel.ins.heroInfo.baseInfo.id,param1.baseInfo.id))
         {
            this.createAvatar3D(param1);
         }
         if(!RoleInfoModel.ins.heroInfo)
         {
            RoleInfoModel.ins.heroInfo = param1;
            this.createAvatar3D(param1);
         }
         var _loc5_:HeroInfo = RoleInfoModel.ins.heroInfo;
         var _loc3_:Boolean = false;
         if(Uint64Util.equal(_loc5_.baseInfo.id,param1.baseInfo.id) && !Uint64Util.equal(_loc5_.baseInfo.fightValue,param1.baseInfo.fightValue) && !RoleTeamModel.ins.blockFloatMsg)
         {
            _loc3_ = true;
            _loc2_ = Uint64Util.toNumber(param1.baseInfo.fightValue) - Uint64Util.toNumber(_loc5_.baseInfo.fightValue);
            AlertUtil.showFightPowerChangeTip(_loc2_,fightValueChangeHandler,DisplayUtils.globarCenter(this.fightValueBox),DisplayUtils.globarCenter(this.subViewStack).add(new Point(0,-50)));
         }
         else
         {
            (this.fightValueBox as FightValueBox).tweenValue = Uint64Util.toNumber(param1.baseInfo.fightValue);
         }
         if(HeroModel.ins.playerHero && Uint64Util.equal(HeroModel.ins.playerHero.baseInfo.id,param1.baseInfo.id))
         {
            _loc7_ = HeroModel.ins.playerHero;
         }
         else
         {
            _loc7_ = HeroModel.ins.heroInfoDic.getValue(Uint64Util.toString(param1.baseInfo.id));
         }
         if(_loc7_ && param1.hasBaseInfo)
         {
            _loc6_ = ArrayUtil.differenceBetweenArrs(param1.baseInfo.mengyue,_loc7_.baseInfo.mengyue);
            if(_loc6_.length > 0)
            {
               _loc4_ = new MengYueEffectVo();
               _loc4_.heroBaseInfo = param1.baseInfo;
               _loc4_.mengYueId = _loc6_[0];
               RoleInfoModel.ins.updateYuanFenDataAfterEffect = true;
               RoleInfoModel.ins.heroInfo = param1;
               ObserverMgr.ins.sendNotice("msg_role_info_change_mengyue",_loc4_);
            }
         }
         compareSuitCount(param1);
         RoleInfoModel.ins.heroInfo = param1;
         HeroModel.ins.onChangeOne(param1);
         if(this.subViewStack.selectedIndex == 0)
         {
            if(this.subViewStack.selection)
            {
               (this.subViewStack.selection as IRoleSubPanel).show(_loc3_);
            }
         }
      }
      
      private function compareSuitCount(param1:HeroInfo) : void
      {
         var _loc7_:* = null;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc6_:String = Uint64Util.toString(param1.baseInfo.id);
         var _loc9_:int = 0;
         var _loc8_:* = param1.items;
         for each(var _loc4_ in param1.items)
         {
            _loc2_ = StcMgr.ins.getItemVo(_loc4_.itemId).extend_1;
            _loc7_ = _loc6_ + "|" + _loc2_;
            _loc5_ = HeroModel.ins.suitDataDic.getValue(_loc7_);
            if(_loc5_ > 0 && _loc4_.suit.length > 1 && _loc4_.suit.length > _loc5_)
            {
               _loc3_ = LocaleMgr.ins.getStr(StcMgr.ins.getEquipSuitVo(_loc2_).name);
               AlertUtil.float(TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100089,[_loc3_,_loc4_.suit.length]),new TextFormat(null,18,458496)),this.localToGlobal(new Point(this.width / 2,this.height / 2)),-1,null,null,1);
               break;
            }
         }
      }
      
      public function fightValueChangeHandler() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         (this.fightValueBox as FightValueBox).tweenValue = Uint64Util.toNumber(RoleInfoModel.ins.heroInfo.baseInfo.fightValue);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         _param = param1;
         _playerLevel = PlayerModel.ins.level;
         new GetResTask(1,UrlLib.moduleImgAsset(this.moduleId,bgSkinArr[0])).addCompleteHandler(bgLoaded).exec();
         FuncOpenAutoCtrl.checkFuncBtnNew(30815,btn_yuanjun);
      }
      
      public function bgLoaded(param1:GetResTask) : void
      {
         this.img_funBg.url = param1.url;
         this.addChildAt(subViewStack,4);
         this.panelBg.titleImgId = this.moduleId;
         heroInfoNotifyHander2(HeroModel.ins.playerHero);
         panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(panel3D,this.img_funBg);
         panel3D.initByImage(img_funBg,this.panelBg);
         panel3D.visible = false;
         avatar = new UIUnit3D();
         panel3D.addChild3D(avatar);
         this.createAvatar3D(RoleInfoModel.ins.heroInfo);
         subViewStack.x = 86;
         subViewStack.y = 81;
         this.img_arrow.y = list_team.y + list_team.getCell(0).y + -4;
         this.visible = false;
         this.switchListeners(true);
         list_team.dataSource = HeroModel.ins.teamHeroArr;
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",true);
         box_fightValue.visible = true;
         if(_param && _param is HeroInfo && NGUtil.isCurFuncId(this.moduleId) == false)
         {
            changeHero(_param as HeroInfo);
         }
         updateHeroInfoTip();
         this.preShowCpl();
      }
      
      override protected function moduleFadeInTypeCpl() : void
      {
         if(this.canRun == false)
         {
            return;
         }
         ObserverMgr.ins.regObserver(this);
         CheckRoleTeamRedPointCtrl.ins.checkAll();
         subViewStack.selectedIndex = 0;
         super.moduleFadeInTypeCpl();
      }
      
      private function onListSelectHero(param1:int, param2:int) : void
      {
         if(list_team.selectedIndex == -1)
         {
            return;
         }
         var _loc5_:TeamHeroListRender = list_team.selection as TeamHeroListRender;
         if(_loc5_.img_lock.visible)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.MAINHERO_LV_LESS_ID)),ModuleMgr.ins.popLayer.curModuleId);
            return;
         }
         var _loc4_:RoleTeamVo = list_team.selectedItem as RoleTeamVo;
         if(param1 == param2 || param1 == 0 && param2 == -1 && this.avatar && this.avatar.visible == true)
         {
            showHeroInfoDetail(_loc4_,"click");
         }
         if(param1 == param2)
         {
            if(!_loc4_.heroData)
            {
               RoleTeamModel.ins.crtHeroId = null;
               RoleTeamModel.ins.crtHeroNodeId = 0;
               ObserverMgr.ins.sendNotice("role_team_show_select_team_member_panel");
            }
            return;
         }
         subViewStack.selectedIndex = 0;
         changeBg(0);
         box_fightValue.visible = true;
         avatar.visible = true;
         var _loc3_:int = list_team.y + list_team.selection.y + -4;
         TweenLite.to(img_arrow,0.3,{
            "y":_loc3_,
            "ease":Back.easeOut
         });
         ObserverMgr.ins.sendNotice("SIMPLE_STR_MSG_FLOAT_MSG_STOP");
         subViewStack.selectedIndex = 0;
         RoleTeamModel.ins.selectedPos = list_team.selectedIndex + 1;
         if(_loc4_.heroData)
         {
            RoleTeamModel.ins.crtHeroId = _loc4_.heroData.id;
            RoleTeamModel.ins.crtHeroNodeId = HeroModel.getHeroNodeId(_loc4_.heroData.baseId);
            HeroModel.ins.getHeroInfo(_loc4_.heroData.id,heroInfoNotifyHander2);
            this.fightValueBox.visible = true;
         }
         else
         {
            RoleInfoModel.ins.heroInfo = null;
            RoleTeamModel.ins.crtHeroNodeId = 0;
            ObserverMgr.ins.sendNotice("role_team_show_select_team_member_panel");
            if(this.subViewStack.selectedIndex == 0)
            {
               (this.subViewStack.selection as IRoleSubPanel).show(false);
            }
            if(this.avatar)
            {
               avatar.visible = false;
            }
            this.fightValueBox.visible = false;
         }
         updateHeroInfoTip(param2);
      }
      
      private function showHeroInfoDetail(param1:RoleTeamVo, param2:String) : void
      {
         if(heroInfoDetail && heroInfoDetail.isDisposed == false)
         {
            return;
         }
         if(param1.heroData == null)
         {
            return;
         }
         heroInfoDetail = new TooltipHeroInfoCompare(param2);
         var _loc3_:ToolTipHeroInfoDetailVo = new ToolTipHeroInfoDetailVo(param1);
         heroInfoDetail.x = 135;
         heroInfoDetail.y = this.y - 15;
         this.addChild(heroInfoDetail);
         heroInfoDetail.show(_loc3_);
      }
      
      private function updateHeroInfoTip(param1:int = 0) : void
      {
         var _loc4_:int = 0;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         _loc4_ = 0;
         while(_loc4_ < list_team.cells.length)
         {
            _loc2_ = avatar && avatar.visible && (_loc4_ == list_team.selectedIndex || _loc4_ == 0 && list_team.selectedIndex == -1);
            if(_loc2_)
            {
               list_team.cells[_loc4_].toolTip = LocaleMgr.ins.getStr(999001110);
               _loc3_ = param1 == -1 && _loc4_ == 0;
               if(list_team.selectedIndex != -1 && _loc3_ == false)
               {
                  ObserverMgr.ins.sendNotice("msg_tooltip_click",list_team.cells[_loc4_].toolTip);
               }
            }
            else
            {
               list_team.cells[_loc4_].toolTip = null;
            }
            _loc4_++;
         }
      }
      
      private function showMengYueActivateTip(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = param1.length;
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            _loc3_ = param1[_loc8_];
            _loc4_ = TextFieldUtil.htmlText(_loc3_.getHeroName(),new TextFormat(null,null,_loc3_.getHeroColor()));
            AlertUtil.float(TextFieldUtil.htmlText(_loc4_ + LocaleMgr.ins.getStr(999000087) + LocaleMgr.ins.getStr(30100011,[TextFieldUtil.htmlText(_loc3_.getMengYueName(),new TextFormat(null,null,16046112))]),new TextFormat(null,18,458496)),this.localToGlobal(new Point(this.width / 2,this.height / 2)),-1,null,null,1);
            _loc5_ = StcMgr.ins.getMengyueVo(_loc3_.mengYueId);
            _loc2_ = NpcPropVo.parseArrStr(_loc5_.attr,"+");
            var _loc10_:int = 0;
            var _loc9_:* = _loc2_;
            for each(var _loc7_ in _loc2_)
            {
               AlertUtil.float(TextFieldUtil.htmlText(_loc4_ + LocaleMgr.ins.getStr(999000087) + NPCPropConsts.ins.getLocaleNameNormal(_loc7_.propId) + "+" + NPCPropConsts.ins.showValue(_loc7_.value),new TextFormat(null,18,458496)),this.localToGlobal(new Point(this.width / 2,this.height / 2)),-1,null,null,1);
            }
            _loc8_++;
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_GM_CMD","role_team_notice_show_mengyue_tip","role_team_notice_change_member","role_team_show_role_team_red_point","role_team_switch_supporter_red_point","msg_role_select_changed"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc9_:* = param1;
         if("MSG_GM_CMD" !== _loc9_)
         {
            if("role_team_notice_show_mengyue_tip" !== _loc9_)
            {
               if("role_team_notice_change_member" !== _loc9_)
               {
                  if("role_team_show_role_team_red_point" !== _loc9_)
                  {
                     if("role_team_switch_supporter_red_point" !== _loc9_)
                     {
                        if("msg_role_select_changed" === _loc9_)
                        {
                           if(param2)
                           {
                              changeHero(param2 as HeroInfo);
                           }
                        }
                     }
                     else
                     {
                        img_YjRedPoint.visible = param2;
                     }
                  }
                  else
                  {
                     _loc5_ = param2 as Array;
                     _loc9_ = 0;
                     var _loc8_:* = list_team.cells;
                     for each(var _loc4_ in list_team.cells)
                     {
                        _loc6_ = _loc4_.dataSource as RoleTeamVo;
                        if(_loc6_ && _loc6_.heroData)
                        {
                           if(SkinModel.ins.getSkinAvailArrByNpcId(StcMgr.ins.getNpcVo(_loc6_.heroData.baseId).node).length > 0 && !LocalData.insCurPlayer.load("evtSkinSelect",false) || SkinModel.ins.canActiveByNpcId(StcMgr.ins.getNpcVo(_loc6_.heroData.baseId).node))
                           {
                              _loc4_.img_redPoint.visible = true;
                           }
                           else
                           {
                              _loc4_.img_redPoint.visible = false;
                           }
                        }
                     }
                     var _loc11_:int = 0;
                     var _loc10_:* = _loc5_;
                     for each(var _loc3_ in _loc5_)
                     {
                        _loc7_ = list_team.getCell(_loc3_) as TeamHeroListRender;
                        if(_loc7_)
                        {
                           _loc7_.img_redPoint.visible = true;
                        }
                     }
                  }
               }
               else
               {
                  onChangeTeamMember(param2);
               }
            }
            else
            {
               showMengYueActivateTip(param2);
            }
         }
         else if(param2 == "debug3d")
         {
            if(debugHeroInfoBox == null)
            {
               debugHeroInfoBox = new DebugHeroInfoBox(this.panel3D);
               debugHeroInfoBox.bindTarget(this.avatar);
               if(this.panel3D.lightCtrl)
               {
                  ModuleMgr.ins.debugBox.addChild(this.panel3D.lightCtrl.debugBox);
               }
            }
         }
      }
      
      private function changeHero(param1:HeroInfo) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = getHeorIndex(param1.baseInfo.id);
         if(_loc3_ >= 0)
         {
            list_team.selectedIndex = _loc3_;
            RoleTeamModel.ins.selectedPos = list_team.selectedIndex + 1;
            heroInfoNotifyHander2(param1);
            this.createAvatar3D(param1);
            _loc2_ = list_team.y + list_team.selection.y + -4;
            TweenLite.to(img_arrow,0.3,{
               "y":_loc2_,
               "ease":Back.easeOut
            });
         }
      }
      
      private function getHeorIndex(param1:UInt64) : int
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:Array = list_team.dataSource as Array;
         var _loc3_:int = _loc4_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = _loc4_[_loc5_];
            if(Uint64Util.equal(_loc2_.heroData.id,param1))
            {
               return _loc5_;
            }
            _loc5_++;
         }
         return -1;
      }
      
      private function onChangeTeamMember(param1:HeroInfo) : void
      {
         var _loc2_:int = 0;
         this.fightValueBox.visible = true;
         this.createAvatar3D(param1);
         var _loc3_:HeroInfo = RoleInfoModel.ins.heroInfo;
         if(_loc3_)
         {
            _loc2_ = Uint64Util.toNumber(param1.baseInfo.fightValue) - Uint64Util.toNumber(_loc3_.baseInfo.fightValue);
         }
         else
         {
            _loc2_ = Uint64Util.toNumber(param1.baseInfo.fightValue);
         }
         if(_loc2_)
         {
            AlertUtil.showFightPowerChangeTip(_loc2_,fightValueChangeHandler,DisplayUtils.globarCenter(this.fightValueBox),DisplayUtils.globarCenter(this.subViewStack).add(new Point(0,-50)));
         }
         RoleInfoModel.ins.heroInfo = param1;
         RoleTeamModel.ins.crtHeroId = param1.baseInfo.id;
         RoleTeamModel.ins.crtHeroNodeId = HeroModel.getHeroNodeId(param1.baseInfo.baseId);
         if(this.subViewStack.selectedIndex == 0)
         {
            (this.subViewStack.selection as IRoleSubPanel).show(true);
         }
         list_team.dataSource = HeroModel.ins.teamHeroArr;
         CheckRoleTeamRedPointCtrl.ins.checkAndSwitchHeroShowRedPoi();
      }
      
      override public function preClose(param1:Object = null) : void
      {
         ObserverMgr.ins.unregObserver(this);
         this.panel3D.dispose();
         this.panel3D = null;
         PlayerModel.ins.autoUpdateHeroInfo = true;
         super.preClose(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         var _loc2_:* = null;
         panel3D.visible = true;
         if(EnvConfig.ins.showDebugModule)
         {
            if(panel3D.useBloom)
            {
               _loc2_ = new DebugBloomFilterBox();
               _loc2_.bind(panel3D.bloomFilter);
               ModuleMgr.ins.debugBox.addChild(_loc2_);
            }
         }
         box_fightValue.visible = true;
         PlayerModel.ins.autoUpdateHeroInfo = false;
         super.show(param1);
         NGUtil.checkModuleShow(this.moduleId,this);
      }
      
      public function switchListeners(param1:Boolean) : void
      {
         if(param1)
         {
            list_team.changeHandler = onListSelectHero;
            ServerEngine.ins.addAlwayHandler(5011,heroInfoNotifyHander);
            SkinService.ins.getInitSkinInfo();
         }
         else
         {
            ServerEngine.ins.removeAlwayHandler(5011,heroInfoNotifyHander);
            list_team.changeHandler = null;
         }
      }
      
      private function onLoadCpl(param1:GetResTask) : void
      {
         panel3D.changeBgImg(ResMgr.ins.getRes(param1.url));
      }
      
      private function createAvatar3D(param1:HeroInfo) : void
      {
         if(this.avatar)
         {
            if(subViewStack.selectedIndex != 1)
            {
               this.avatar.visible = true;
            }
            this.avatar.initByStcNpcId(param1.baseInfo.baseId,false,param1.baseInfo.skin);
            if(debugHeroInfoBox)
            {
               debugHeroInfoBox.bindTarget(this.avatar);
            }
            this.avatar.pos2d = new Point(-40,-130);
            this.avatar.rotation = -90;
            avatar.avatar.addEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
         }
      }
      
      protected function avatarAsset_onCpl(param1:Event) : void
      {
         avatar.avatar.removeEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
         this.avatar.dispatchEvent(new MouseEvent3D("unitMouseClick"));
      }
      
      override public function dispose() : void
      {
         ModuleMgr.ins.debugBox.removeAllChild();
         ObserverMgr.ins.sendNotice("SIMPLE_STR_MSG_FLOAT_MSG_STOP");
         switchListeners(false);
         RoleTeamModel.ins.dispose();
         if(ModuleMgr.ins.popLayer.curModuleId != 30815)
         {
            ObserverMgr.ins.sendNotice("lock_total_fight_value_change",false);
         }
         RoleInfoModel.ins.updateYuanFenDataAfterEffect = false;
         RoleTeamModel.ins.blockFloatMsg = false;
         super.dispose();
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         if(param2.checkId == 10060)
         {
            ObserverMgr.ins.sendNotice("ROLE_TEAM_CLOSE_SELECT_TEAM_MEMBER_PANEL");
            return NGUtil.getCompById(this,param1,param2);
         }
         if(param1 == "btn_close_2")
         {
            return this.panelBg.btn_close;
         }
         return NGUtil.getCompById(this,param1,param2);
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         var _loc4_:int = 0;
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc7_:* = param1;
         if(10060 !== _loc7_)
         {
            if(20021 !== _loc7_)
            {
               if(20110 === _loc7_)
               {
                  if(HeroModel.ins.getEquipedItemByKind(1))
                  {
                     NGUtil.gm_gotoId(99372);
                     return 4;
                  }
                  if(BagModel.ins.getEquipByPosAtBag(1).length == 0)
                  {
                     return 0;
                  }
               }
            }
            else
            {
               if(int(param3.compParams[0]) == 0)
               {
                  _loc5_ = 8;
               }
               else
               {
                  _loc5_ = 9;
               }
               if(HeroModel.ins.getEquipedTreasureByKind2(_loc5_))
               {
                  NGUtil.gm_gotoId(param2[1]);
                  return 4;
               }
               if(TreasureModel.ins.hasTreasureInBg(_loc5_) == false)
               {
                  NGUtil.gm_gotoId(param2[0]);
                  return 4;
               }
               return 1;
            }
         }
         else
         {
            if(!HeroModel.ins.hasCanJoinTeamHero())
            {
               return 0;
            }
            if(param3.comp_id)
            {
               _loc4_ = param3.comp_id.split(":")[1];
            }
            _loc6_ = HeroModel.ins.teamHeroArr[_loc4_];
            if(_loc6_.heroData)
            {
               return 0;
            }
         }
         return 1;
      }
   }
}
