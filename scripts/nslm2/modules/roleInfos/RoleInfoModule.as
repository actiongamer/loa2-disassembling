package nslm2.modules.roleInfos
{
   import game.ui.roleInfos.RoleInfoPanelUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import com.mz.core.interFace.ILogger;
   import com.mz.core.logging.Log;
   import morn.core.components.ViewStack;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import org.specter3d.display.particle.SpecterEffect;
   import proto.HeroInfo;
   import morn.core.components.Image;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import com.netease.protobuf.UInt64;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.common.ui.components.debug3d.DebugHeroInfoBox;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.model.HeroModel;
   import flash.geom.Point;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import morn.core.handlers.Handler;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.roleInfos.commons.IRoleSubPanel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.roleInfos.awake.RoleAwakePanel;
   import nslm2.modules.foundations.recycle.view.render.RecycleAlertRender;
   import proto.HeroInfoNotify;
   import nslm2.utils.Uint64Util;
   import com.mz.core.interFace.IViewStackPage;
   import com.greensock.TweenLite;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import nslm2.modules.roleInfos.tupos.RoleTupoUtil;
   import morn.core.components.Component;
   import nslm2.modules.roleInfos.awake.RoleAwakeUtil;
   import nslm2.modules.roleInfos.levelUps.RoleLevelUpUtil;
   import nslm2.modules.roleInfos.phaseUps.talents.PhaseUpTalentUtil;
   import flash.display.DisplayObject;
   import proto.PanelBaseInfo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import flash.display.BitmapData;
   import nslm2.nets.sockets.ServerEngine;
   import flash.events.MouseEvent;
   import nslm2.modules.cultivates.roleTeam.vo.YuanJunVo;
   import com.mz.core.event.MzEvent;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.core.events.UIEvent;
   import flash.geom.Rectangle;
   import morn.customs.FilterLib;
   import nslm2.modules.footstones.newerAlertModules.NewerAlertModel;
   import nslm2.modules.cultivates.reinforceTrain.ReinforceModel;
   import morn.core.utils.StringUtils;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.roleInfos.baseInfoPanel.RoleBaseInfoPanel;
   import nslm2.modules.roleInfos.levelUps.RoleLevelUpPanel;
   import nslm2.modules.roleInfos.tupos.RoleTupoPanel;
   import nslm2.modules.roleInfos.phaseUps.RolePhaseUpPanel;
   import nslm2.common.ctrls.BtnLongBarCtrl;
   
   public class RoleInfoModule extends RoleInfoPanelUI implements INewerGuideCheckHandler
   {
      
      private static var logger:ILogger = Log.getClassLogger(RoleInfoModule);
       
      
      private var model:nslm2.modules.roleInfos.RoleInfoModel;
      
      public var subViewStack:ViewStack;
      
      private var panel3D:UIPanel3D;
      
      private var avatar:UIUnit3D;
      
      private var rotationCtrlPosHash:Object;
      
      private var avatarPosHash:Object;
      
      private var avatarScaleHash:Object;
      
      private var indexSubIdHash:Array;
      
      private var effCenter:SpecterEffect;
      
      private var _nowShowIndex:int = -1;
      
      private var _curSubIdArr:Array;
      
      private var _isFake:Boolean;
      
      private var fakeheroInfoOld:HeroInfo;
      
      private var _isShowingAlert:Boolean;
      
      private var _lastTabId:uint;
      
      private var _roleBg:Image;
      
      private var _roleBgMask:Image3D;
      
      private var _tabel3D:Image3D;
      
      private var _prevFightValue:UInt64;
      
      private var render_recycleOriY:int;
      
      private var bgImgArr:Array;
      
      private var showParam:RoleInfoModuleParam;
      
      public var debugHeroInfoBox:DebugHeroInfoBox;
      
      private var _tempImg:Image;
      
      private var _playerLevel:int;
      
      private var _redPoint:RedPoint;
      
      private var _redPointLvlUp:RedPoint;
      
      private var _redPointPhaseUpTalent:RedPoint;
      
      private var _redPointAwake:RedPoint;
      
      private var _showPageChangeFade:Boolean;
      
      private var _fromIndexChanged:Boolean;
      
      private var _nowShowSupportIndex:int;
      
      public function RoleInfoModule()
      {
         subViewStack = new ViewStack();
         _roleBg = new Image();
         _prevFightValue = new UInt64();
         bgImgArr = ["png.uiRoleInfo.baseInfo.img_heroBaseBg","png.uiRoleInfo.baseInfo.img_heroBaseBg","png.uiRoleInfo.baseInfo.img_heroBaseBg","png.uiRoleInfo.baseInfo.img_heroBaseBg","png.uiRoleInfo.awake.img_starBG"];
         _redPoint = new RedPoint();
         _redPointLvlUp = new RedPoint();
         _redPointPhaseUpTalent = new RedPoint();
         _redPointAwake = new RedPoint();
         super();
         render_recycleOriY = this.render_recycle.y;
         model = nslm2.modules.roleInfos.RoleInfoModel.ins;
         subViewStack.createSubViewCallBack = initSubView;
         subViewStack.subViewClasses = [RoleBaseInfoPanel,RoleLevelUpPanel,RoleTupoPanel,RolePhaseUpPanel,RoleAwakePanel];
         tabBar.selectHandler = onTabBarChanged;
         this.parts.push(new BtnLongBarCtrl(this.btn_leftArrow,img_leftBg));
         this.parts.push(new BtnLongBarCtrl(this.btn_rightArrow,img_rightBg));
         this.panelBg.bgCustom.addChild(this.img_funBg);
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.init(115001,1,"all",true);
      }
      
      public function get curSubIdArr() : Array
      {
         return _curSubIdArr;
      }
      
      public function set curSubIdArr(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         if(_curSubIdArr == null || ArrayUtil.equal(_curSubIdArr,param1) == false)
         {
            _curSubIdArr = param1;
            _loc4_ = _curSubIdArr.length;
            _loc2_ = [];
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ = _curSubIdArr[_loc5_];
               _loc2_.push(RoleInfoConsts.ins.getVo(_loc3_).nameCN);
               _loc5_++;
            }
            this.tabBar.labels = _loc2_.join(",");
            FuncOpenAutoCtrl.checkFuncTabNew(param1,tabBar);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         _playerLevel = PlayerModel.ins.level;
         this.switchListeners(true);
         if(param1)
         {
            showParam = param1 as RoleInfoModuleParam;
            _isFake = showParam.isFake;
            this.curSubIdArr = RoleInfoConsts.previewSubIdArr;
         }
         else
         {
            showParam = new RoleInfoModuleParam();
            showParam.init(HeroModel.ins.playerHero,30100);
         }
         if(_isFake)
         {
            fakeheroInfoOld = nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo;
            nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo = showParam.heroInfo;
         }
         heroInfoNotifyHander2(showParam.heroInfo);
         avatarPosHash = {};
         RoleInfoConsts.AVATAR_Y = -this.img_funBg.height / 2 + 120;
         avatarPosHash[30100] = new Point(-144,RoleInfoConsts.AVATAR_Y - 60);
         avatarPosHash[20010] = new Point(0,RoleInfoConsts.AVATAR_Y);
         avatarPosHash[30109] = new Point(-1600,RoleInfoConsts.AVATAR_Y);
         avatarPosHash[30120] = new Point(-1600,RoleInfoConsts.AVATAR_Y);
         avatarPosHash[30110] = new Point(0,RoleInfoConsts.AVATAR_Y);
         avatarScaleHash = {};
         avatarScaleHash[30100] = 1;
         avatarScaleHash[20010] = 1;
         avatarScaleHash[30109] = 1;
         avatarScaleHash[30120] = 1;
         avatarScaleHash[30110] = 1;
         rotationCtrlPosHash = {};
         rotationCtrlPosHash[30100] = new Point(160,480);
         rotationCtrlPosHash[20010] = new Point(314,419);
         rotationCtrlPosHash[30109] = new Point(-800,480);
         rotationCtrlPosHash[30120] = new Point(-800,480);
         rotationCtrlPosHash[30110] = new Point(-800,354);
         DisplayUtils.addChildBelow(subViewStack,box_btn_right);
         this.setChildIndex(tabBar,this.numChildren - 1);
         this.panelBg.titleImgId = this.moduleId;
         panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(panel3D,this.img_funBg);
         panel3D.initByImage(img_funBg,this.panelBg);
         panel3D.visible = false;
         avatar = new UIUnit3D();
         panel3D.addChild3D(avatar);
         this.createAvatar3D(nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo);
         _tabel3D = new Image3D(UrlLib.get3DCommonImg("img_roleInfoTable"),250,150,3900);
         _tabel3D.x = -144;
         _tabel3D.y = RoleInfoConsts.AVATAR_Y - 73;
         this.panel3D.addChild3D(_tabel3D);
         subViewStack.x = 3;
         subViewStack.y = 67;
         indexSubIdHash = [30100,20010,30110,30109];
         this.visible = false;
         if(HeroModel.ins.getPositionList().length <= 1)
         {
            this.btn_leftArrow.visible = false;
            this.btn_rightArrow.visible = false;
         }
         RoleTeamModel.ins.blockFloatMsg = true;
         this.render_recycle.dataSource = 30100;
         this.render_recycle.visible = false;
         super.preShow(param1);
      }
      
      override public function getFocusNotices() : Array
      {
         return ["MSG_GM_CMD","role_info_change_tab","tupoModuleClose","role_info_change_tab","msg_show_tujian","msg_role_info_show_lvlup_panel","msg_role_info_show_change_page_turning","msg_role_select_changed","msg_role_awake_change_bg"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("MSG_GM_CMD" !== _loc3_)
         {
            if("role_info_change_tab" !== _loc3_)
            {
               if("tupoModuleClose" !== _loc3_)
               {
                  if("msg_role_info_show_lvlup_panel" !== _loc3_)
                  {
                     if("msg_role_info_show_change_page_turning" !== _loc3_)
                     {
                        if("msg_role_select_changed" !== _loc3_)
                        {
                           if("msg_role_awake_change_bg" === _loc3_)
                           {
                              this.panel3D.changeBgImg(App.asset.getBitmapData(param2 as String));
                           }
                        }
                        else if(param2)
                        {
                           this.createAvatar3D(param2 as HeroInfo);
                        }
                     }
                     else
                     {
                        this.btn_rightArrow.mouseEvent = param2 as Boolean;
                        this.btn_leftArrow.mouseEvent = param2 as Boolean;
                        this.tabBar.mouseEvent = param2 as Boolean;
                     }
                  }
                  else
                  {
                     this.subViewStack.selectedIndex = 1;
                     this.tabBar.selectedIndex = 1;
                  }
               }
               else
               {
                  this.createAvatar3D(nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo);
               }
            }
            else
            {
               tabBar.selectedIndex = this.curSubIdArr.indexOf(param2 as int);
            }
         }
         else if(param2 == "debug3d")
         {
            if(debugHeroInfoBox == null)
            {
               debugHeroInfoBox = new DebugHeroInfoBox(this.panel3D);
               debugHeroInfoBox.bindTarget(this.avatar);
            }
         }
      }
      
      private function onTabBarChanged(param1:int) : void
      {
         if(!_isShowingAlert)
         {
            _isShowingAlert = true;
            this.alertPhaseUp(new Handler(confirmTabBarChange,[param1]),true);
         }
      }
      
      private function confirmTabBarChange(param1:int) : void
      {
         this.tabBar.selectedIndex = param1;
         var _loc4_:int = this.curSubIdArr[param1];
         _lastTabId = _loc4_;
         var _loc2_:int = RoleInfoConsts.subViewStackIdArr.indexOf(_loc4_);
         ObserverMgr.ins.sendNotice("SIMPLE_STR_MSG_FLOAT_MSG_STOP");
         subViewStack.selectedIndex = _loc2_;
         var _loc3_:IRoleSubPanel = subViewStack.selection as IRoleSubPanel;
         if(_loc4_ == 30100 && this.panel3D.visible)
         {
            _roleBg.url = UrlLib.roleBg(StcMgr.ins.getNpcVo(nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo.baseInfo.baseId).node);
            onLoadCpl(null);
            _tabel3D.visible = true;
            this.render_recycle.visible = false;
         }
         else
         {
            this.panel3D.changeBgImg(App.asset.getBitmapData(bgImgArr[_loc2_]));
            _tabel3D.visible = false;
            if(subViewStack.selection is RoleAwakePanel)
            {
               this.render_recycle.visible = false;
            }
            else
            {
               this.render_recycle.visible = true;
            }
         }
         this.render_recycle.dataSource = _loc4_;
         (this.render_recycle as RecycleAlertRender).autoHide();
         if(this.render_recycle.visible)
         {
            if(_loc4_ == 30109)
            {
               this.render_recycle.commitMeasure();
               this.render_recycle.y = this.render_recycleOriY - this.render_recycle.img_bg.height - 22;
            }
            else
            {
               this.render_recycle.y = this.render_recycleOriY;
            }
         }
         var _loc5_:Point = avatarPosHash[_loc4_];
         var _loc6_:Number = avatarScaleHash[_loc4_];
         this.avatar.pos2d = _loc5_;
         this.avatar.scaleAll = _loc6_;
         if(_loc4_ == 30109)
         {
            panel3D.switchListeners(false);
            this.img_funBg.visible = true;
         }
         else
         {
            panel3D.switchListeners(true);
            this.img_funBg.visible = false;
         }
         _isShowingAlert = false;
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
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         if(nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo && !Uint64Util.equal(nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo.baseInfo.id,param1.baseInfo.id))
         {
            this.createAvatar3D(param1);
         }
         if(!nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo)
         {
            nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo = param1;
            this.createAvatar3D(param1);
         }
         if(this.curSubIdArr)
         {
            _loc4_ = this.curSubIdArr[tabBar.selectedIndex];
         }
         else
         {
            _loc4_ = -1;
         }
         var _loc5_:HeroInfo = nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo;
         var _loc3_:Boolean = false;
         if(Uint64Util.isZero(_prevFightValue))
         {
            _prevFightValue.high = _loc5_.baseInfo.fightValue.high;
            _prevFightValue.low = _loc5_.baseInfo.fightValue.low;
         }
         if(Uint64Util.equal(_loc5_.baseInfo.id,param1.baseInfo.id) && !Uint64Util.equal(_loc5_.baseInfo.fightValue,param1.baseInfo.fightValue))
         {
            _loc3_ = true;
            _loc2_ = Uint64Util.toNumber(param1.baseInfo.fightValue) - Uint64Util.toNumber(_loc5_.baseInfo.fightValue);
            if(this.curSubIdArr[subViewStack.selectedIndex] == 30110 || this.curSubIdArr[subViewStack.selectedIndex] == 30109)
            {
            }
         }
         nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo = param1;
         if(HeroModel.ins.isCurPlayerHero(param1.baseInfo.id))
         {
            this.curSubIdArr = RoleInfoConsts.playerHeroSubIdArr;
            if(_loc4_ == 20010)
            {
               tabBar.selectedIndex = this.curSubIdArr.indexOf(30100);
            }
            else if(_loc4_ != -1)
            {
               tabBar.selectedIndex = this.curSubIdArr.indexOf(_loc4_);
            }
         }
         else if(_isFake == false)
         {
            this.curSubIdArr = RoleInfoConsts.heroSubIdArr;
            if(_loc4_ != -1)
            {
               tabBar.selectedIndex = this.curSubIdArr.indexOf(_loc4_);
            }
         }
         if(_showPageChangeFade)
         {
            if(this.subViewStack.selection)
            {
               (this.subViewStack.selection as IViewStackPage).viewStackIn();
               _showPageChangeFade = false;
            }
         }
         else if(this.subViewStack.selection is RoleAwakePanel)
         {
            if(!Uint64Util.equal(_prevFightValue,param1.baseInfo.fightValue))
            {
               (this.subViewStack.selection as IRoleSubPanel).show(true);
            }
            else
            {
               (this.subViewStack.selection as IRoleSubPanel).show(false);
            }
         }
         else if(this.subViewStack.selection)
         {
            (this.subViewStack.selection as IRoleSubPanel).show(_loc3_);
         }
         _nowShowIndex = HeroModel.ins.getIndexInTeamHeroInfo(param1);
         if(showParam.isFromGrowUpPanel)
         {
            _nowShowSupportIndex = HeroModel.ins.getIndexInYuanJunHeroInfo(param1);
         }
         else
         {
            _nowShowSupportIndex = -1;
         }
         if(_nowShowIndex == -1 && _nowShowSupportIndex == -1)
         {
            this.box_btn_left.visible = false;
            this.box_btn_right.visible = false;
         }
         else
         {
            this.box_btn_left.visible = true;
            this.box_btn_right.visible = true;
         }
         showTupoRedPoint();
         TweenLite.delayedCall(0.3,showAwakeRedPoint);
         TweenLite.delayedCall(0.3,showLvlUpRedPoint);
         TweenLite.delayedCall(0.3,showPhaseUpTalentRedPoint);
      }
      
      private function showTupoRedPoint() : void
      {
         var _loc1_:int = 0;
         if(RoleTupoUtil.needShowRedPoint(nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo,false))
         {
            _redPoint.top = -2;
            _redPoint.right = -2;
            _loc1_ = this.curSubIdArr.indexOf(30110);
            if(_loc1_ != -1)
            {
               (this.tabBar.items[_loc1_] as Component).addChild(_redPoint);
            }
         }
         else
         {
            DisplayUtils.removeSelf(_redPoint);
         }
      }
      
      private function showAwakeRedPoint() : void
      {
         var _loc1_:int = 0;
         if(RoleAwakeUtil.checkCurHeroStatus())
         {
            _redPointAwake.top = -2;
            _redPointAwake.right = -2;
            _loc1_ = this.curSubIdArr.indexOf(30120);
            if(_loc1_ != -1)
            {
               (this.tabBar.items[_loc1_] as Component).addChild(_redPointAwake);
            }
         }
         else
         {
            DisplayUtils.removeSelf(_redPointAwake);
         }
      }
      
      private function showLvlUpRedPoint() : void
      {
         var _loc1_:int = 0;
         if(RoleLevelUpUtil.checkNeedPromptLevelUp(nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo.baseInfo))
         {
            _redPointLvlUp.top = -2;
            _redPointLvlUp.right = -2;
            _loc1_ = this.curSubIdArr.indexOf(20010);
            if(_loc1_ != -1)
            {
               (this.tabBar.items[_loc1_] as Component).addChild(_redPointLvlUp);
            }
         }
         else
         {
            DisplayUtils.removeSelf(_redPointLvlUp);
         }
      }
      
      private function showPhaseUpTalentRedPoint() : void
      {
         var _loc1_:int = 0;
         if(PhaseUpTalentUtil.canUp(nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo))
         {
            _redPointPhaseUpTalent.top = -2;
            _redPointPhaseUpTalent.right = -2;
            _loc1_ = this.curSubIdArr.indexOf(30109);
            if(_loc1_ != -1)
            {
               (this.tabBar.items[_loc1_] as Component).addChild(_redPointPhaseUpTalent);
            }
         }
         else
         {
            DisplayUtils.removeSelf(_redPointPhaseUpTalent);
         }
      }
      
      public function fightValueChangeHandler() : void
      {
         if(this.isDisposed)
         {
            return;
         }
      }
      
      private function getIndexBySubId(param1:int) : int
      {
         return indexSubIdHash.indexOf(param1);
      }
      
      private function initSubView(param1:DisplayObject) : void
      {
         var _loc2_:IRoleSubPanel = param1 as IRoleSubPanel;
         _loc2_.layer3dRef = this.panel3D;
         _loc2_.modelRef = this.model;
      }
      
      private function sortHeroFun(param1:PanelBaseInfo, param2:PanelBaseInfo) : int
      {
         if(HeroModel.ins.isCurPlayerHero(param1.id))
         {
            return -1;
         }
         if(HeroModel.ins.isCurPlayerHero(param2.id))
         {
            return 1;
         }
         if(param1.place > param2.place)
         {
            return -1;
         }
         if(param1.place < param2.place)
         {
            return 1;
         }
         if(!param1.ability)
         {
            return 1;
         }
         if(!param2.ability)
         {
            return -1;
         }
         var _loc4_:StcNpcVo = StcMgr.ins.getNpcVo(param1.baseId);
         var _loc3_:StcNpcVo = StcMgr.ins.getNpcVo(param2.baseId);
         if(_loc4_.quality > _loc3_.quality)
         {
            return -1;
         }
         if(_loc4_.quality < _loc3_.quality)
         {
            return 1;
         }
         if(Uint64Util.toNumber(param1.ability) >= Uint64Util.toNumber(param2.ability))
         {
            return -1;
         }
         return 1;
      }
      
      override protected function moduleFadeInTypeCpl() : void
      {
         if(this.canRun == false)
         {
            return;
         }
         subViewStack.selectedIndex = 0;
         if(showParam)
         {
            tabBar.selectedIndex = Math.max(0,this.curSubIdArr.indexOf(showParam.subPanelId));
         }
         else
         {
            tabBar.selectedIndex = 0;
         }
         avatar.scaleAll = avatarScaleHash[showParam.subPanelId];
         super.moduleFadeInTypeCpl();
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         panel3D.visible = true;
         _roleBg.url = UrlLib.roleBg(StcMgr.ins.getNpcVo(nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo.baseInfo.baseId).node);
         _roleBgMask = new Image3D(null);
         _roleBgMask.showByBmd(new BitmapData(this.img_funBg.width,this.img_funBg.height,true,16777215));
         _roleBgMask.alpha = 0.15;
         _roleBgMask.z = 3950;
         this.panel3D.addChild3D(_roleBgMask);
      }
      
      private function createAvatar3D(param1:HeroInfo) : void
      {
         var _loc2_:* = null;
         if(this.avatar)
         {
            this.avatar.initByStcNpcId(param1.baseInfo.baseId,false,param1.baseInfo.skin);
            if(debugHeroInfoBox)
            {
               debugHeroInfoBox.bindTarget(this.avatar);
            }
            _loc2_ = avatarPosHash[this.curSubIdArr[tabBar.selectedIndex]];
            this.avatar.pos2d = _loc2_;
            this.avatar.rotation = -90;
            if(this.tabBar.selectedIndex == this.curSubIdArr.indexOf(30100) && this.panel3D.visible)
            {
               _roleBg.url = UrlLib.roleBg(StcMgr.ins.getNpcVo(param1.baseInfo.baseId).node);
            }
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         switchListeners(false);
         this.panel3D.dispose();
         this.panel3D = null;
         this.avatar = null;
         RoleTeamModel.ins.blockFloatMsg = false;
         super.preClose(param1);
      }
      
      public function switchListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.addEventListener("levelUp",onLevelUp);
            this.addEventListener("tupo",onHeroInfoChange);
            this.btn_leftArrow.addEventListener("click",onIndexMinus);
            this.btn_rightArrow.addEventListener("click",onIndexAdd);
            ServerEngine.ins.addAlwayHandler(5011,heroInfoNotifyHander);
            _roleBg.addEventListener("imageLoaded",onLoadCpl);
         }
         else
         {
            this.removeEventListener("levelUp",onLevelUp);
            this.removeEventListener("tupo",onHeroInfoChange);
            this.btn_leftArrow.removeEventListener("click",onIndexMinus);
            this.btn_rightArrow.removeEventListener("click",onIndexAdd);
            ServerEngine.ins.removeAlwayHandler(5011,heroInfoNotifyHander);
            _roleBg.removeEventListener("imageLoaded",onLoadCpl);
         }
      }
      
      private function onIndexMinus(param1:MouseEvent) : void
      {
         _fromIndexChanged = true;
         this.alertPhaseUp(new Handler(doIndexMinus,[param1]),false);
      }
      
      private function doIndexMinus(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(_nowShowIndex == -1)
         {
            _nowShowSupportIndex = Number(_nowShowSupportIndex) - 1;
            _loc2_ = HeroModel.ins.YuanJunArr;
            if(_nowShowSupportIndex < 0)
            {
               _nowShowSupportIndex = _nowShowSupportIndex + _loc2_.length;
            }
         }
         else
         {
            _nowShowIndex = Number(_nowShowIndex) - 1;
            _loc2_ = HeroModel.ins.teamHeroInfoArr;
            if(_nowShowIndex < 0)
            {
               _nowShowIndex = _nowShowIndex + _loc2_.length;
            }
         }
         if(this.tabBar.selectedIndex == this.curSubIdArr.indexOf(20010) && HeroModel.ins.isCurPlayerHero((_loc2_[_nowShowIndex] as HeroInfo).baseInfo.id))
         {
            _nowShowIndex = Number(_nowShowIndex) - 1;
            if(_nowShowIndex < 0)
            {
               _nowShowIndex = _nowShowIndex + _loc2_.length;
            }
         }
         _showPageChangeFade = true;
         if(_nowShowSupportIndex == -1)
         {
            heroInfoNotifyHander2(_loc2_[_nowShowIndex]);
         }
         else
         {
            checkSupportAvail(_loc2_,true);
         }
         ObserverMgr.ins.sendNotice("msg_role_select_changed",_loc2_[_nowShowIndex]);
      }
      
      private function onIndexAdd(param1:MouseEvent) : void
      {
         _fromIndexChanged = true;
         this.alertPhaseUp(new Handler(doIndexAdd,[param1]),false);
      }
      
      private function doIndexAdd(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(_nowShowIndex == -1)
         {
            _nowShowSupportIndex = Number(_nowShowSupportIndex) + 1;
            _loc2_ = HeroModel.ins.YuanJunArr;
         }
         else
         {
            _nowShowIndex = Number(_nowShowIndex) + 1;
            _loc2_ = HeroModel.ins.teamHeroInfoArr;
         }
         if(_nowShowIndex >= _loc2_.length)
         {
            _nowShowIndex = _nowShowIndex - _loc2_.length;
         }
         if(_nowShowSupportIndex >= _loc2_.length)
         {
            _nowShowSupportIndex = _nowShowSupportIndex - _loc2_.length;
         }
         if(this.tabBar.selectedIndex == this.curSubIdArr.indexOf(20010) && _nowShowSupportIndex == -1 && HeroModel.ins.isCurPlayerHero((_loc2_[_nowShowIndex] as HeroInfo).baseInfo.id))
         {
            _nowShowIndex = Number(_nowShowIndex) + 1;
            if(_nowShowIndex >= _loc2_.length)
            {
               _nowShowIndex = _nowShowIndex - _loc2_.length;
            }
         }
         _showPageChangeFade = true;
         if(_nowShowSupportIndex == -1)
         {
            heroInfoNotifyHander2(_loc2_[_nowShowIndex]);
         }
         else
         {
            checkSupportAvail(_loc2_,false);
         }
         ObserverMgr.ins.sendNotice("msg_role_select_changed",_loc2_[_nowShowIndex]);
      }
      
      private function checkSupportAvail(param1:Array, param2:Boolean) : void
      {
         if((param1[_nowShowSupportIndex] as YuanJunVo).heroData)
         {
            heroInfoNotifyHander2(HeroModel.ins.getHeroInfoQuick((param1[_nowShowSupportIndex] as YuanJunVo).heroData.id));
         }
         else
         {
            if(param2)
            {
               _nowShowSupportIndex = Number(_nowShowSupportIndex) - 1;
               if(_nowShowSupportIndex < 0)
               {
                  _nowShowSupportIndex = _nowShowSupportIndex + param1.length;
               }
            }
            else
            {
               _nowShowSupportIndex = Number(_nowShowSupportIndex) + 1;
               if(_nowShowSupportIndex >= param1.length)
               {
                  _nowShowSupportIndex = _nowShowSupportIndex - param1.length;
               }
            }
            checkSupportAvail(param1,param2);
         }
      }
      
      private function onLevelUp(param1:MzEvent) : void
      {
         var _loc2_:* = null;
         if(avatar && avatar.isDispose == false)
         {
            avatar.avatarRandomActionCtrl.unitMouseTriggerHandler(null);
            _loc2_ = new BmcSpriteSheet();
            _loc2_.init(1113);
            _loc2_.x = 215;
            _loc2_.y = 210;
            this.addChild(_loc2_);
         }
      }
      
      private function onLoadCpl(param1:UIEvent) : void
      {
         showBg(true);
      }
      
      private function showBg(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(_roleBg.bitmapData && this.tabBar.selectedIndex == this.curSubIdArr.indexOf(30100))
         {
            _loc3_ = new Rectangle(0,0,_roleBg.bitmapData.width,_roleBg.bitmapData.height);
            _loc2_ = _roleBg.bitmapData.clone();
            if(param1)
            {
               _loc2_.applyFilter(_loc2_,_loc3_,new Point(),FilterLib.fakeGaussianFilter);
            }
            if(this.panel3D)
            {
               this.panel3D.changeBgImg(_loc2_);
            }
         }
      }
      
      private function onHeroInfoChange(param1:MzEvent) : void
      {
      }
      
      override public function dispose() : void
      {
         _roleBg.dispose();
         ObserverMgr.ins.sendNotice("SIMPLE_STR_MSG_FLOAT_MSG_STOP");
         switchListeners(false);
         super.dispose();
         if(_isFake)
         {
            nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo = fakeheroInfoOld;
         }
         RoleTeamModel.ins.blockFloatMsg = false;
         NewerAlertModel.ins.checkCanTupo();
         TweenLite.delayedCall(0.1,ReinforceModel.ins.supportInfoCpl);
      }
      
      private function server_heroInfo(param1:HeroInfo) : void
      {
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         this.alertPhaseUp(new Handler(super.btnCloseHandler,[param1]),false);
      }
      
      private function alertPhaseUp(param1:*, param2:Boolean) : void
      {
         if(Uint64Util.toNumber(nslm2.modules.roleInfos.RoleInfoModel.ins.heroInfo.baseInfo.sjExp) != 0 && _lastTabId == 30109 && !StringUtils.isNull(DefindConsts.SHENGJIE_REDUCE))
         {
            if(param2 && this.tabBar.selectedIndex == this.curSubIdArr.indexOf(30109))
            {
               Handler.execute(param1);
            }
            else
            {
               this.tabBar.selectedIndex = this.curSubIdArr.indexOf(30109);
               ObserverMgr.ins.sendNotice("msg_stop_auto_phase_up");
               AlertUtil.comfirm(LocaleMgr.ins.getStr(30100207,[LocaleConsts.percentStr(Number(DefindConsts.SHENGJIE_REDUCE))]) + "\r\n" + LocaleMgr.ins.getStr(30100208),$confirmHandler,param1,null,LocaleMgr.ins.getStr(30100210),LocaleMgr.ins.getStr(30100209));
            }
         }
         else if(param1)
         {
            Handler.execute(param1);
         }
      }
      
      private function $confirmHandler() : void
      {
         _isShowingAlert = false;
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         var _loc5_:int = 0;
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc4_:int = 0;
         var _loc8_:* = param1;
         if(10030 !== _loc8_)
         {
            if(10020 !== _loc8_)
            {
               if(10040 !== _loc8_)
               {
                  if(10041 !== _loc8_)
                  {
                     if(10042 !== _loc8_)
                     {
                        if(10045 === _loc8_)
                        {
                           return RoleTupoUtil.ngCheckAll(param1,param2,param3);
                        }
                     }
                  }
                  addr54:
                  return RoleTupoUtil.ngCheck(param1,param2,param3);
               }
               addr53:
               §§goto(addr54);
            }
            §§goto(addr53);
         }
         else
         {
            _loc5_ = param3.comp_id.split(":")[1];
            _loc7_ = StcMgr.ins.getVoArrByColumnValue("static_item","kind",32).sortOn("quality",16);
            _loc6_ = _loc7_[_loc5_];
            _loc4_ = BagModel.ins.getStcCount(_loc6_.id);
            if(_loc4_ == 0)
            {
               return 0;
            }
         }
         return 1;
      }
   }
}
