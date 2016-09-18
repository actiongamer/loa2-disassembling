package nslm2.modules.roleInfos.levelUps
{
   import game.ui.roleInfos.levelUps.RoleLevelUpPanelUI;
   import nslm2.modules.roleInfos.commons.IRoleSubPanel;
   import com.mz.core.interFace.IViewStackPage;
   import morn.customs.components.WealthRender;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.ui.components.comps2d.BmcS1;
   import nslm2.common.compsEffects.ProgressBarAddEffect;
   import nslm2.modules.cultivates.equipGrows.jinglians.ProgressBarPreFlickerEffCtrl;
   import nslm2.common.compsEffects.FlickerEffCtrl;
   import nslm2.mgrs.stcMgrs.vos.StcLevelVo;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.compsEffects.EffectQueue;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import morn.core.components.View;
   import proto.HeroBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.utils.ListUtil;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.common.model.HeroModel;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.handlers.Handler;
   import flash.utils.getTimer;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.compsEffects.ImgMoveEffect;
   import flash.geom.Point;
   import nslm2.mgrs.SoundMgr;
   import com.greensock.TweenLite;
   import proto.HeroAddExpReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ProtocolStatusRes;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import proto.HeroAddExpRes;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.cultivates.roleTeam.ctrl.CheckRoleTeamRedPointCtrl;
   import nslm2.modules.footstones.newerAlertModules.NewerAlertModel;
   import com.mz.core.event.MzEvent;
   import nslm2.utils.WealthUtil;
   import morn.customs.expands.MornExpandUtil;
   import morn.customs.components.PlayerTitleRender;
   import nslm2.common.ctrls.ProgressBarCtrl;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import com.mz.core.mediators.RollMediator;
   
   public class RoleLevelUpPanel extends RoleLevelUpPanelUI implements IRoleSubPanel, IViewStackPage
   {
      
      public static const LEVEL_UP:String = "levelUp";
       
      
      private var _levelUpItems:Array;
      
      private var _selectLevelUpItem:int;
      
      private var _selectionCostItemRender:WealthRender;
      
      private var _selectEffect:BmcSpriteSheet;
      
      private var _expEffect:BmcS1;
      
      private var _lastClickTime:int;
      
      private var _isAutoAddExp:Boolean;
      
      private var _barEffect:ProgressBarAddEffect;
      
      private var _isShowingEffect:Boolean;
      
      private var _newExp:int;
      
      private var _newLevel:int;
      
      private var _curExp:int;
      
      private var _curLevel:int;
      
      private var pgBarPreEff:ProgressBarPreFlickerEffCtrl;
      
      private var flickerTxtExpPre:FlickerEffCtrl;
      
      private var _lastShowAlertTime:int;
      
      private var _curLevelVo:StcLevelVo;
      
      private var _selectedHeroId:UInt64;
      
      public var model:RoleInfoModel;
      
      private var _hasLevelUped:Boolean;
      
      private var _isSend:Boolean;
      
      private var addExpBookNumber:int = 1;
      
      private var _tenLevel:Boolean;
      
      public function RoleLevelUpPanel()
      {
         _levelUpItems = StcMgr.ins.getVoArrByColumnValue("static_item","kind",32).sortOn("quality",16);
         _lastClickTime = getTimer();
         super();
         MornExpandUtil.addHandlerForBtnAll(subBar,btn_handler);
         subBar.list_item.selectHandler = showSelect;
         (this.playerTitleRender as PlayerTitleRender).isShowTitleName = true;
         BmcS1.preload(1030);
         subBar.btn_levelUp.addEventListener("mouseDown",onLevelUpBtnDown);
         pgBarPreEff = new ProgressBarPreFlickerEffCtrl(this.subBar.bar_levelExp);
         flickerTxtExpPre = new FlickerEffCtrl(subBar.txt_levelPre);
         flickerTxtExpPre.pause();
         this.subBar.txt_canAwardExp.visible = false;
         this.parts.push(new ProgressBarCtrl(this.subBar.bar_levelExp));
         this.parts.push(new FloatUpDownEffCtrl().config(0.4).init(this.list_up,this.list_up.y,2,2));
         this.parts.push(new RollMediator(this.subBar.btn_levelUp,onRoll));
         this.parts.push(new RollMediator(this.subBar.btn_levelUp10,onRoll));
         this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(999000497);
         this.subBar.btn_levelUp.label = LocaleMgr.ins.getStr(999000498);
      }
      
      public function get selectionCostItemRender() : WealthRender
      {
         return _selectionCostItemRender;
      }
      
      public function set selectionCostItemRender(param1:WealthRender) : void
      {
         if(_selectionCostItemRender != param1)
         {
            _selectionCostItemRender = param1;
            if(_selectionCostItemRender != null)
            {
               this.countPreExp();
            }
            this.showNextLevel();
         }
      }
      
      public function viewStackIn() : void
      {
         _curExp = Uint64Util.toNumber(model.heroInfo.baseInfo.exp);
         _curLevel = model.heroInfo.baseInfo.level;
         _curLevelVo = HeroInfoUtil.getLevelVo(model.heroInfo.baseInfo,_curLevel);
         this.visible = true;
         this.show();
         NGUtil.checkModuleShow(30100,ModuleMgr.ins.popLayer.getModule(30100));
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         EffectQueue.clear(30100);
         setSelectItemToNull();
         this.visible = false;
      }
      
      override public function fadeView_fadeInCpl() : void
      {
         super.fadeView_fadeInCpl();
         NGUtil.checkModuleShow(30100,ModuleMgr.ins.popLayer.getModule(30100));
      }
      
      public function set layer3dRef(param1:UIPanel3D) : void
      {
      }
      
      public function set modelRef(param1:RoleInfoModel) : void
      {
         model = param1;
      }
      
      public function get subBarRef() : View
      {
         return subBar;
      }
      
      private function onRoll(param1:Boolean) : void
      {
         if(!param1)
         {
            stopAutoAdd();
         }
      }
      
      public function show(param1:Boolean = false) : void
      {
         var _loc5_:int = 0;
         var _loc7_:* = null;
         if(param1)
         {
            return;
         }
         if(Uint64Util.equal(_selectedHeroId,model.heroInfo.baseInfo.id) == false)
         {
            _curExp = Uint64Util.toNumber(model.heroInfo.baseInfo.exp);
            _curLevel = model.heroInfo.baseInfo.level;
            EffectQueue.clear(30100);
         }
         var _loc4_:HeroBaseInfo = model.heroInfo.baseInfo;
         var _loc6_:StcNpcVo = StcMgr.ins.getNpcVo(_loc4_.baseId);
         _curLevelVo = HeroInfoUtil.getLevelVo(model.heroInfo.baseInfo,_curLevel);
         showMinExpBook();
         this.subBar.txt_levelNow.text = LocaleConsts.lvStr(_curLevelVo.level);
         this.txt_levelNow.text = LocaleConsts.lvStr(_curLevelVo.level);
         this.playerTitleRender.dataSource = model.heroInfo;
         var _loc2_:Array = NpcPropVo.calNpcBaseProp(model.heroInfo.baseInfo.baseId,_curLevel);
         _loc2_ = _loc2_.concat().sortOn("propId",16);
         NpcPropVo.unshowAllPropColor(_loc2_);
         this.list_propBase.dataSource = _loc2_;
         var _loc3_:int = getAddLevel();
         _loc7_ = HeroInfoUtil.getLevelVo(model.heroInfo.baseInfo,_curLevel + _loc3_);
         if(_loc7_ == false || _curLevelVo.level == DefindConsts.HERO_LV_LIMIT)
         {
            this.subBar.txt_exp.text = LocaleConsts.max();
            this.box_nextLevel.visible = false;
            this.list_up.visible = false;
         }
         else
         {
            this.box_nextLevel.visible = true;
            this.showNextLevel();
            this.list_up.visible = true;
         }
         subBar.list_item.dataSource = getItemVoArr();
         if(_selectLevelUpItem == 0 || HeroInfoUtil.isPlayerHero(model.heroInfo.baseInfo.id))
         {
            flickerTxtExpPre.pause();
         }
         else
         {
            flickerTxtExpPre.resume();
         }
         this.subBar.bar_levelExp.value = _curExp / _curLevelVo.exp;
         this.subBar.txt_exp.text = getExpString();
         _selectedHeroId = model.heroInfo.baseInfo.id;
         countPreExp();
         this.list_propNext.commitMeasure();
         this.list_up.x = this.box_nextLevel.x + ListUtil.getLongestTextLength(this.list_propNext,"txt_value") + 55;
      }
      
      private function showMinExpBook() : void
      {
         var _loc2_:int = 0;
         if(BagModel.ins.getStcCount(_selectLevelUpItem) > 0)
         {
            return;
         }
         var _loc1_:int = -1;
         _loc2_ = 0;
         while(_loc2_ < _levelUpItems.length)
         {
            if(BagModel.ins.getStcCount((_levelUpItems[_loc2_] as StcItemVo).id) > 0)
            {
               subBar.list_item.selectedIndex = _loc2_;
               return;
            }
            _loc2_++;
         }
         subBar.list_item.selectedIndex = _loc1_;
      }
      
      private function getExpString() : String
      {
         if(_selectLevelUpItem == 0 || HeroModel.ins.isCurPlayerHero(model.heroInfo.baseInfo.id))
         {
            return _curExp.toString() + "/" + _curLevelVo.exp.toString();
         }
         return _curExp.toString() + TextFieldUtil.htmlText(" +" + getCanAwardExp(),new TextFormat(null,null,458496)) + "/" + _curLevelVo.exp.toString();
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         addExpBookNumber = 1;
         var _loc3_:* = param1;
         if(subBar.btn_levelUp !== _loc3_)
         {
            if(subBar.btn_levelUp10 === _loc3_)
            {
               addExp(true);
            }
         }
         else
         {
            if(_isAutoAddExp == false)
            {
               addExp();
            }
            _isAutoAddExp = false;
            stopAutoAdd();
         }
      }
      
      private function addExp(param1:Boolean = false) : void
      {
         var _loc2_:* = null;
         _tenLevel = param1;
         _loc2_ = HeroInfoUtil.getLevelVo(model.heroInfo.baseInfo,_curLevel);
         if(HeroInfoUtil.isMaxExp(model.heroInfo.baseInfo))
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30100997));
            return;
         }
         if(_selectLevelUpItem == 0)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(30100007)));
            TimerManager.ins.clearTimer(doAddExp);
            return;
         }
         if(param1)
         {
            needNumForTenLvls();
         }
         else
         {
            needNum();
         }
         if(addExpBookNumber == 1 && getAddLevel() > 10)
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(30100314,[getAddLevel()]),new Handler(handlerYes,[param1]),handlerNo);
         }
         else
         {
            handlerYes(param1);
         }
      }
      
      private function handlerNo() : void
      {
         this.subBar.mouseEvent = true;
      }
      
      private function handlerYes(param1:Boolean = false) : void
      {
         if(BagModel.ins.getStcCount(_selectLevelUpItem) <= 0)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(4000061)));
            stopAutoAdd();
         }
         else if(expOverflow(addExpBookNumber) > 0 && addExpBookNumber == 1)
         {
            if(NGUtil.isShowLock == false)
            {
               ObserverMgr.ins.sendNotice("simpleConfirm",new AlertMsgVo(LocaleMgr.ins.getStr(30100008,[TextFieldUtil.htmlText(!!param1?getNextXLevelExp(9):int(getCanAwardExp(addExpBookNumber,true)),new TextFormat(null,null,16723968)),TextFieldUtil.htmlText(int(StcMgr.ins.getItemVo(_selectLevelUpItem).extend_1) * addExpBookNumber,new TextFormat(null,null,16723968))]),doAddExp));
            }
            TimerManager.ins.clearTimer(doAddExp);
         }
         else
         {
            if(expOverflow(addExpBookNumber) > 0)
            {
               addExpBookNumber = Number(addExpBookNumber) - 1;
            }
            if(_isSend == true || _isShowingEffect == true)
            {
               return;
            }
            _isSend = true;
            if(getTimer() - _lastClickTime <= Config.clickNeedWaitDelay + 500 && _isAutoAddExp == false && getTimer() - _lastShowAlertTime >= 5000)
            {
               _lastShowAlertTime = getTimer();
            }
            _lastClickTime = getTimer();
            doAddExp();
         }
      }
      
      private function needNumForTenLvls() : int
      {
         addExpBookNumber = Math.max(addExpBookNumber,Math.min(Math.ceil(getNextXLevelExp(9) / int(StcMgr.ins.getItemVo(_selectLevelUpItem).extend_1)),BagModel.ins.getStcCount(_selectLevelUpItem)));
         return Math.max(addExpBookNumber,Math.min(Math.ceil(getNextXLevelExp(9) / int(StcMgr.ins.getItemVo(_selectLevelUpItem).extend_1)),BagModel.ins.getStcCount(_selectLevelUpItem)));
      }
      
      private function needNum() : int
      {
         addExpBookNumber = Math.max(addExpBookNumber,Math.min(Math.ceil((_curLevelVo.exp - _curExp) / int(StcMgr.ins.getItemVo(_selectLevelUpItem).extend_1)),BagModel.ins.getStcCount(_selectLevelUpItem)));
         return Math.max(addExpBookNumber,Math.min(Math.ceil((_curLevelVo.exp - _curExp) / int(StcMgr.ins.getItemVo(_selectLevelUpItem).extend_1)),BagModel.ins.getStcCount(_selectLevelUpItem)));
      }
      
      private function setSelectItemToNull() : void
      {
         if(_selectLevelUpItem != 0)
         {
            if(_selectEffect)
            {
               _selectEffect.dispose();
               _selectEffect = null;
            }
            _selectLevelUpItem = 0;
            this.subBar.list_item.selectedIndex = -1;
            selectionCostItemRender = null;
         }
      }
      
      private function initSelectItem() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Array = getItemVoArr();
         while(_loc2_ < _loc1_.length)
         {
            if(PlayerModel.ins.getCountByWealthVo(_loc1_[_loc2_]) > 0)
            {
               this.subBar.list_item.selectedIndex = _loc2_;
               return;
            }
            _loc2_++;
         }
      }
      
      private function onLevelUpBtnDown(param1:MouseEvent) : void
      {
         var _loc2_:* = param1.target;
         if(this.subBar.btn_levelUp === _loc2_)
         {
            if(NGUtil.isCurFuncId(30100) == false)
            {
               TimerManager.ins.doOnce(Config.clickDelay + 200,autoAddExpStart);
            }
         }
      }
      
      private function autoAddExpStart() : void
      {
         _isAutoAddExp = true;
         TimerManager.ins.doOnce(200,autoAddExp);
      }
      
      private function autoAddExp() : void
      {
         if(_isAutoAddExp == true)
         {
            addExp();
         }
      }
      
      private function stopAutoAdd() : void
      {
         TimerManager.ins.doOnce(200,function():void
         {
            _isAutoAddExp = false;
         });
         TimerManager.ins.clearTimer(autoAddExpStart);
         TimerManager.ins.clearTimer(autoAddExp);
      }
      
      private function doAddExp() : void
      {
         var _loc1_:ImgMoveEffect = new ImgMoveEffect();
         _loc1_.config(0.2,0.3);
         _loc1_.init(this.selectionCostItemRender.ref_img_icon,this.selectionCostItemRender.ref_img_icon.localToGlobal(new Point(0,0)),subBar.bar_levelExp.localToGlobal(new Point(70,4)),!!this._isAutoAddExp?null:doAddExp2,false,true);
         _loc1_.startAnim();
         SoundMgr.ins.playTexiaoSound("role_levelFly");
         if(this._isAutoAddExp)
         {
            TweenLite.killDelayedCallsTo(doAddExp2);
            TweenLite.delayedCall(0.1,doAddExp2);
         }
      }
      
      private function doAddExp2() : void
      {
         if(isDisposed)
         {
            return;
         }
         ObserverMgr.ins.sendNotice("msg_role_info_show_change_page_turning",false);
         this.subBar.mouseEvent = false;
         var _loc1_:HeroAddExpReq = new HeroAddExpReq();
         _loc1_.item = BagModel.ins.stcItemIdToItemArr(_selectLevelUpItem)[0].id;
         _loc1_.num = addExpBookNumber;
         _loc1_.hero = model.heroInfo.baseInfo.id;
         ServerEngine.ins.send(5001,_loc1_,server_heroAddExp,server_err);
      }
      
      private function server_err(param1:ProtocolStatusRes) : void
      {
         ObserverMgr.ins.sendNotice("msg_role_info_show_change_page_turning",true);
         this.subBar.mouseEvent = true;
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      private function expOverflow(param1:int = 1) : int
      {
         return int(StcMgr.ins.getItemVo(_selectLevelUpItem).extend_1) * param1 - getCanAwardExp(param1,true);
      }
      
      private function showSelect(param1:int) : void
      {
         if(param1 == -1)
         {
            return;
         }
         var _loc2_:int = (_levelUpItems[param1] as StcItemVo).id;
         if(_selectLevelUpItem == _loc2_)
         {
            return;
         }
         if(BagModel.ins.getStcCount((_levelUpItems[param1] as StcItemVo).id) <= 0)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealth(20,(subBar.list_item.getCell(param1) as WealthRender).wealthVo.sid),30100);
            subBar.list_item.selectedIndex = _levelUpItems.indexOf(_selectLevelUpItem);
            return;
         }
         _selectLevelUpItem = _loc2_;
         selectionCostItemRender = subBar.list_item.selection as WealthRender;
         if(_selectEffect == null)
         {
            _selectEffect = new BmcSpriteSheet();
            _selectEffect.init(1152,1,"all",true);
         }
         _selectEffect.x = subBar.list_item.getCell(param1).x + 118;
         _selectEffect.y = subBar.list_item.getCell(param1).y + 28;
         subBar.addChild(_selectEffect);
         this.subBar.txt_exp.text = getExpString();
      }
      
      private function refreshLevel10Button() : void
      {
         var _loc1_:int = 0;
         if(_selectLevelUpItem == 0)
         {
            this.subBar.btn_levelUp10.visible = false;
            return;
         }
         if(getNextXLevelExp(1) <= int(StcMgr.ins.getItemVo(_selectLevelUpItem).extend_1) * BagModel.ins.getStcCount(_selectLevelUpItem))
         {
            this.subBar.btn_levelUp10.visible = true;
            _loc1_ = getAddLevel(BagModel.ins.getStcCount(_selectLevelUpItem));
            if(_loc1_ >= 10)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(999000499);
            }
            else if(_loc1_ == 9)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(999000500);
            }
            else if(_loc1_ == 8)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(999000501);
            }
            else if(_loc1_ == 7)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(999000502);
            }
            else if(_loc1_ == 6)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(999000503);
            }
            else if(_loc1_ == 5)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(999000504);
            }
            else if(_loc1_ == 4)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(999000505);
            }
            else if(_loc1_ == 3)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(999000506);
            }
            else if(_loc1_ == 2)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(999000507);
            }
            else
            {
               this.subBar.btn_levelUp10.visible = false;
            }
         }
         else
         {
            this.subBar.btn_levelUp10.visible = false;
         }
      }
      
      private function getNextXLevelExp(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:int = _curLevelVo.exp - _curExp;
         _loc3_ = 0;
         while(_loc3_ < param1)
         {
            if(HeroInfoUtil.getLevelVo(model.heroInfo.baseInfo,_curLevel + _loc3_ + 1) && _curLevel + _loc3_ + 1 <= PlayerModel.ins.level)
            {
               _loc2_ = _loc2_ + HeroInfoUtil.getLevelVo(model.heroInfo.baseInfo,_curLevel + _loc3_ + 1).exp;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function countPreExp() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         var _loc3_:int = this._curLevelVo.exp;
         if(_selectLevelUpItem && HeroInfoUtil.isMaxExp(model.heroInfo.baseInfo) == false && HeroInfoUtil.isPlayerHero(model.heroInfo.baseInfo.id) == false)
         {
            _loc2_ = StcMgr.ins.getItemVo(_selectLevelUpItem);
            _loc1_ = _loc2_.extend_1;
            if(_curExp + _loc1_ < _loc3_)
            {
               this.pgBarPreEff.preValue = (_curExp + _loc1_) / _loc3_;
               subBar.txt_levelPre.visible = false;
               flickerTxtExpPre.pause();
            }
            else
            {
               this.pgBarPreEff.preValue = 1;
               if(getAddLevel() > 0)
               {
                  subBar.txt_levelPre.visible = true;
                  flickerTxtExpPre.resume();
               }
               else
               {
                  subBar.txt_levelPre.visible = false;
                  flickerTxtExpPre.resume();
               }
            }
         }
         else
         {
            this.pgBarPreEff.preValue = 0;
            flickerTxtExpPre.pause();
            subBar.txt_levelPre.visible = false;
            this.list_up.visible = false;
         }
      }
      
      private function showNextLevel() : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc1_:Array = NpcPropVo.calNpcBaseProp(model.heroInfo.baseInfo.baseId,_curLevel);
         var _loc2_:int = Math.max(getAddLevel(),1);
         _loc4_ = HeroInfoUtil.getLevelVo(model.heroInfo.baseInfo,_curLevel + _loc2_);
         if(_loc4_)
         {
            subBar.txt_levelPre.text = "+" + _loc2_;
            this.txt_levelNext.text = LocaleConsts.lvStr(_loc4_.level);
            _loc3_ = NpcPropVo.calNpcBaseProp(model.heroInfo.baseInfo.baseId,_curLevel + _loc2_);
            this.list_propNext.dataSource = _loc3_;
         }
         else
         {
            subBar.txt_levelPre.text = "";
            this.box_nextLevel.visible = false;
            this.list_up.visible = false;
         }
      }
      
      private function getAddLevel(param1:int = 1) : int
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         if(_selectLevelUpItem)
         {
            _loc4_ = HeroInfoUtil.getLevelVo(model.heroInfo.baseInfo,_curLevel);
            _loc3_ = _curExp;
            _loc6_ = StcMgr.ins.getItemVo(_selectLevelUpItem);
            _loc5_ = int(_loc6_.extend_1) * param1;
            _loc5_ = _loc5_ - (_loc4_.exp - _loc3_);
            while(_loc5_ >= 0)
            {
               _loc2_++;
               _loc4_ = HeroInfoUtil.getLevelVo(model.heroInfo.baseInfo,_curLevel + _loc2_);
               if(_loc4_)
               {
                  _loc5_ = _loc5_ - _loc4_.exp;
                  continue;
               }
               break;
            }
            return Math.min(PlayerModel.ins.level - _curLevel,_loc2_);
         }
         return 1;
      }
      
      private function getCanAwardExp(param1:int = 1, param2:Boolean = false) : int
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         if(_selectLevelUpItem)
         {
            _loc5_ = HeroInfoUtil.getLevelVo(model.heroInfo.baseInfo,model.heroInfo.baseInfo.level);
            _loc4_ = Uint64Util.toNumber(model.heroInfo.baseInfo.exp);
            _loc7_ = StcMgr.ins.getItemVo(_selectLevelUpItem);
            _loc8_ = _loc7_.extend_1;
            _loc6_ = _loc6_ + (_loc5_.exp - _loc4_);
            while(_loc6_ < _loc8_ * param1)
            {
               _loc3_++;
               _loc5_ = HeroInfoUtil.getLevelVo(model.heroInfo.baseInfo,model.heroInfo.baseInfo.level + _loc3_);
               if(model.heroInfo.baseInfo.level + _loc3_ > PlayerModel.ins.level)
               {
                  return _loc6_ - 1;
               }
               _loc6_ = _loc6_ + _loc5_.exp;
            }
            if(!param2)
            {
               return Math.min(_loc8_,_loc6_);
            }
            return _loc6_;
         }
         return 0;
      }
      
      private function server_heroAddExp(param1:HeroAddExpRes) : void
      {
         if(model.heroInfo && Uint64Util.equal(model.heroInfo.baseInfo.id,param1.hero))
         {
            EffectQueue.push(30100,new RoleLevelUpEffectVo(Uint64Util.toNumber(param1.exp),param1.level));
            model.heroInfo.baseInfo.level = param1.level;
            model.heroInfo.baseInfo.exp = param1.exp;
            AlertUtil.float(TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100315,[StcMgr.ins.getItemVo(_selectLevelUpItem).id,addExpBookNumber,addExpBookNumber * int(StcMgr.ins.getItemVo(_selectLevelUpItem).extend_1)]),new TextFormat(null,20)),new Point(DisplayUtils.globarCenter(this.subBar.bar_levelExp).x,DisplayUtils.globarCenter(this.subBar.bar_levelExp).y - 70));
            if(_isShowingEffect == false)
            {
               if(_isAutoAddExp == false)
               {
                  _isShowingEffect = true;
               }
               if(NGUtil.isCurFuncId(30100))
               {
                  this.mouseEvent = false;
               }
               showEffect();
            }
         }
         _isSend = false;
         if(BagModel.ins.getStcCount(_selectLevelUpItem) <= 0)
         {
            setSelectItemToNull();
         }
         CheckRoleTeamRedPointCtrl.ins.checkAndSwitchHeroShowRedPoi();
         NewerAlertModel.ins.checkCanTupo();
      }
      
      private function showNumTween() : void
      {
         if(_newLevel - _curLevel > 0)
         {
            TweenLite.to(this,0.2,{
               "nowExp":_curLevelVo.exp,
               "onComplete":initToZero
            });
         }
         else
         {
            TweenLite.to(this,0.2,{"nowExp":_newExp});
         }
      }
      
      private function initToZero() : void
      {
         _curLevel = Number(_curLevel) + 1;
         _curExp = 0;
         nowExp = 0;
      }
      
      public function set nowExp(param1:Number) : void
      {
         if(isDisposed)
         {
            return;
         }
         this.subBar.txt_exp.text = Math.round(param1) + " +" + getCanAwardExp() + "/" + _curLevelVo.exp.toString();
      }
      
      public function get nowExp() : Number
      {
         return _curExp;
      }
      
      private function showEffect() : void
      {
         var _loc1_:RoleLevelUpEffectVo = EffectQueue.shift(30100);
         _newLevel = _loc1_.newLevel;
         _newExp = _loc1_.newExp;
         showNumTween();
         if(_newLevel - _curLevel > 0)
         {
            _hasLevelUped = true;
         }
         else
         {
            _hasLevelUped = false;
         }
         _barEffect = new ProgressBarAddEffect(this.subBar.bar_levelExp,getEndValue(_newExp,_newLevel,_curLevel),new Handler(levelUp),new Handler(lastLevelUp),new Handler(perEffectOver));
         _barEffect.startAnim();
      }
      
      private function perEffectOver() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         this.pgBarPreEff.preValue = 0;
         if(_hasLevelUped == false)
         {
            _curExp = _newExp;
            _curLevel = _newLevel;
            this.show();
            if(_isAutoAddExp)
            {
               autoAddExp();
            }
            reEnable();
         }
         if(EffectQueue.hasEffect(30100) == false)
         {
            _isShowingEffect = false;
            if(NGUtil.isCurFuncId(30100))
            {
               this.mouseEvent = true;
            }
         }
         else if(_hasLevelUped == false)
         {
            showEffect();
         }
      }
      
      private function reEnable() : void
      {
         ObserverMgr.ins.sendNotice("msg_role_info_show_change_page_turning",true);
         this.subBar.mouseEvent = true;
      }
      
      private function getEndValue(param1:int, param2:int, param3:int) : Number
      {
         var _loc4_:StcLevelVo = HeroInfoUtil.getLevelVo(model.heroInfo.baseInfo,param2);
         return param1 / _loc4_.exp + param2 - param3;
      }
      
      private function levelUp() : void
      {
         showNumTween();
      }
      
      private function lastLevelUp() : void
      {
         this.dispatchEvent(new MzEvent("levelUp",model.heroInfo.baseInfo,true));
         showNumTween();
         showExpEffect();
      }
      
      private function floatEffCpl() : void
      {
         if(isDisposed)
         {
            return;
         }
         _curLevel = _newLevel;
         _curExp = _newExp;
         this.show();
         TweenLite.to(this.subBar.txt_levelNow,0.2,{"scale":1.2});
         TweenLite.to(this.subBar.txt_levelNow,0.2,{
            "scale":1,
            "delay":0.2
         });
         if(EffectQueue.hasEffect(30100) == false)
         {
            _isShowingEffect = false;
            if(NGUtil.isCurFuncId(30100))
            {
               this.mouseEvent = true;
            }
            if(_isAutoAddExp)
            {
               autoAddExp();
            }
         }
         else
         {
            showEffect();
         }
         reEnable();
      }
      
      private function showExpEffect() : void
      {
         var _loc3_:* = undefined;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         _curLevel = _newLevel;
         _curExp = _newExp;
         if(_isAutoAddExp == false)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30100101,[_curLevel]),DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,floatEffCpl,DisplayUtils.globarCenter(this.subBar.txt_levelNow),1);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30100101,[_curLevel]),DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,null,DisplayUtils.globarCenter(this.subBar.txt_levelNow),1);
            floatEffCpl();
         }
         var _loc1_:Array = NpcPropVo.calNpcBaseProp(model.heroInfo.baseInfo.baseId,_curLevel + 1);
         _loc1_ = _loc1_.concat().sortOn("propId",16);
         var _loc4_:int = _loc1_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc1_[_loc5_];
            _loc2_.floatPos = DisplayUtils.globarCenter(this).add(new Point(0,-50));
            _loc5_++;
         }
         this.list_propBase.dataSource = _loc1_;
         SoundMgr.ins.playTexiaoSound("click_star");
      }
      
      private function getItemVoArr() : Array
      {
         var _loc2_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = _levelUpItems;
         for each(var _loc1_ in _levelUpItems)
         {
            _loc2_.push(WealthUtil.countVo(20,_loc1_.id));
         }
         return _loc2_;
      }
      
      override public function dispose() : void
      {
         TweenLite.killTweensOf(this);
         TweenLite.killTweensOf(this.subBar.txt_levelNow);
         if(flickerTxtExpPre)
         {
            flickerTxtExpPre.dispose();
            flickerTxtExpPre = null;
         }
         if(this.pgBarPreEff)
         {
            pgBarPreEff.dispose();
            pgBarPreEff = null;
         }
         if(_barEffect)
         {
            _barEffect.dispose();
            _barEffect = null;
         }
         if(_selectEffect)
         {
            _selectEffect.dispose();
            _selectEffect = null;
         }
         ObserverMgr.ins.sendNotice("hero_level_changed");
         super.dispose();
      }
   }
}
