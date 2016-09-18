package nslm2.modules.cultivates.pet.view.panel
{
   import game.ui.petModule.levelUp.PetLevelUpPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import morn.customs.components.WealthRender;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.ui.components.comps2d.BmcS1;
   import nslm2.common.compsEffects.ProgressBarAddEffect;
   import nslm2.modules.cultivates.equipGrows.jinglians.ProgressBarPreFlickerEffCtrl;
   import nslm2.common.compsEffects.FlickerEffCtrl;
   import nslm2.mgrs.stcMgrs.vos.StcLevelVo;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.cultivates.pet.util.PetUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.compsEffects.EffectQueue;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.components.View;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.utils.ListUtil;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.handlers.Handler;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.utils.getTimer;
   import nslm2.common.compsEffects.ImgMoveEffect;
   import flash.geom.Point;
   import nslm2.mgrs.SoundMgr;
   import com.greensock.TweenLite;
   import proto.PetLevelUpReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ProtocolStatusRes;
   import nslm2.modules.roleInfos.levelUps.RoleLevelUpEffectVo;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.ctrls.ProgressBarCtrl;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import com.mz.core.mediators.RollMediator;
   
   public class PetLevelUpPanel extends PetLevelUpPanelUI implements IViewStackPage, IObserver
   {
       
      
      private var _levelUpItems:Array;
      
      private var _selectLevelUpItem:int;
      
      private var TXT_VALUE:String = "txt_value";
      
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
      
      private var _selectedHeroId:int;
      
      private var _hasLevelUped:Boolean;
      
      private var _isSend:Boolean;
      
      private var addExpBookNumber:int = 1;
      
      private var _tenLevel:Boolean;
      
      public function PetLevelUpPanel()
      {
         _levelUpItems = StcMgr.ins.getVoArrByColumnValue("static_item","kind",39).sortOn("quality",16);
         _lastClickTime = getTimer();
         super();
         MornExpandUtil.addHandlerForBtnAll(subBar,btn_handler);
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
         this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(32000037);
         this.subBar.btn_levelUp.label = LocaleMgr.ins.getStr(32000028);
      }
      
      public function get selectionCostItemRender() : WealthRender
      {
         return subBar.renderHad;
      }
      
      private function get model() : PetModel
      {
         return PetModel.ins;
      }
      
      public function viewStackIn() : void
      {
         _curExp = Uint64Util.toNumber(model.crtPetInfo.exp);
         _curLevel = model.crtPetInfo.level;
         _curLevelVo = PetUtil.getLevelVo(model.crtPetId,_curLevel);
         ObserverMgr.ins.regObserver(this);
         this.visible = true;
         this.show();
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         EffectQueue.clear(32000);
         this.visible = false;
      }
      
      override public function fadeView_fadeInCpl() : void
      {
         super.fadeView_fadeInCpl();
         NGUtil.checkModuleShow(32000,ModuleMgr.ins.popLayer.getModule(32000));
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
         var _loc4_:int = 0;
         var _loc6_:* = null;
         if(param1)
         {
            return;
         }
         if(_selectedHeroId != model.crtPetId)
         {
            _curExp = Uint64Util.toNumber(model.crtPetInfo.exp);
            _curLevel = model.crtPetInfo.level;
            EffectQueue.clear(32000);
         }
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(model.crtPetId);
         _curLevelVo = PetUtil.getLevelVo(model.crtPetId,_curLevel);
         this.subBar.txt_levelNow.text = LocaleConsts.lvStr(_curLevelVo.level);
         this.txt_levelNow.text = LocaleConsts.lvStr(_curLevelVo.level);
         var _loc2_:Array = NpcPropVo.calNpcBaseProp(model.crtPetId,_curLevel);
         this.list_propBase.dataSource = _loc2_.concat().sortOn("propId",16);
         var _loc3_:int = getAddLevel();
         _loc6_ = PetUtil.getLevelVo(model.crtPetId,_curLevel + _loc3_);
         if(_loc6_ == false || _curLevelVo.level == DefindConsts.HERO_LV_LIMIT)
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
         subBar.renderHad.dataSource = getWealthVo();
         _selectLevelUpItem = getWealthVo().itemId;
         if(_selectLevelUpItem == 0)
         {
            flickerTxtExpPre.pause();
         }
         else
         {
            flickerTxtExpPre.resume();
         }
         this.subBar.bar_levelExp.value = _curExp / _curLevelVo.exp;
         this.subBar.txt_exp.text = getExpString();
         _selectedHeroId = model.crtPetId;
         countPreExp();
         this.list_propNext.commitMeasure();
         this.list_up.x = this.box_nextLevel.x + ListUtil.getLongestTextLength(this.list_propNext,TXT_VALUE) + 55;
      }
      
      private function getExpString() : String
      {
         if(_selectLevelUpItem == 0)
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
         _loc2_ = PetUtil.getLevelVo(model.crtPetId,_curLevel);
         if(PetUtil.isMaxExp(model.crtPetInfo))
         {
            AlertUtil.float(LocaleMgr.ins.getStr(32000046));
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
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealth(20,_selectLevelUpItem),32000);
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
      
      private function onLevelUpBtnDown(param1:MouseEvent) : void
      {
         var _loc2_:* = param1.target;
         if(this.subBar.btn_levelUp === _loc2_)
         {
            if(NGUtil.isCurFuncId(32000) == false)
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
         ObserverMgr.ins.sendNotice("set_pet_list_enable",false);
         this.subBar.mouseEvent = false;
         var _loc1_:PetLevelUpReq = new PetLevelUpReq();
         _loc1_.item = BagModel.ins.stcItemIdToItemArr(_selectLevelUpItem)[0].id;
         _loc1_.num = addExpBookNumber;
         _loc1_.id = model.crtPetId;
         ServerEngine.ins.send(5360,_loc1_,server_heroAddExp,server_err);
      }
      
      private function server_heroAddExp(param1:ProtocolStatusRes) : void
      {
         EffectQueue.push(32000,new RoleLevelUpEffectVo(Uint64Util.toNumber(model.crtPetInfo.exp),model.crtPetInfo.level));
         AlertUtil.float(TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100315,[StcMgr.ins.getItemVo(_selectLevelUpItem).id,addExpBookNumber,addExpBookNumber * int(StcMgr.ins.getItemVo(_selectLevelUpItem).extend_1)]),new TextFormat(null,20)),new Point(DisplayUtils.globarCenter(this.subBar.bar_levelExp).x,DisplayUtils.globarCenter(this.subBar.bar_levelExp).y - 70));
         if(_isShowingEffect == false)
         {
            if(_isAutoAddExp == false)
            {
               _isShowingEffect = true;
            }
            if(NGUtil.isCurFuncId(32000))
            {
               this.mouseEvent = false;
            }
            showEffect();
         }
         _isSend = false;
      }
      
      private function server_err(param1:ProtocolStatusRes) : void
      {
         ObserverMgr.ins.sendNotice("set_pet_list_enable",true);
         this.subBar.mouseEvent = true;
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      private function expOverflow(param1:int = 1) : int
      {
         return int(StcMgr.ins.getItemVo(_selectLevelUpItem).extend_1) * param1 - getCanAwardExp(param1,true);
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
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(32000037);
            }
            else if(_loc1_ == 9)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(32000036);
            }
            else if(_loc1_ == 8)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(32000035);
            }
            else if(_loc1_ == 7)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(32000034);
            }
            else if(_loc1_ == 6)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(32000033);
            }
            else if(_loc1_ == 5)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(32000032);
            }
            else if(_loc1_ == 4)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(32000031);
            }
            else if(_loc1_ == 3)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(32000030);
            }
            else if(_loc1_ == 2)
            {
               this.subBar.btn_levelUp10.label = LocaleMgr.ins.getStr(32000029);
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
            if(PetUtil.getLevelVo(model.crtPetId,_curLevel + _loc3_ + 1) && _curLevel + _loc3_ + 1 <= PlayerModel.ins.level)
            {
               _loc2_ = _loc2_ + PetUtil.getLevelVo(model.crtPetId,_curLevel + _loc3_ + 1).exp;
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
         if(_selectLevelUpItem && PetUtil.isMaxExp(model.crtPetInfo) == false)
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
         var _loc1_:Array = NpcPropVo.calNpcBaseProp(model.crtPetId,_curLevel);
         var _loc2_:int = Math.max(getAddLevel(),1);
         _loc4_ = PetUtil.getLevelVo(model.crtPetId,_curLevel + _loc2_);
         if(_loc4_)
         {
            subBar.txt_levelPre.text = "+" + _loc2_;
            this.txt_levelNext.text = LocaleConsts.lvStr(_loc4_.level);
            _loc3_ = NpcPropVo.calNpcBaseProp(model.crtPetId,_curLevel + _loc2_);
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
            _loc4_ = PetUtil.getLevelVo(model.crtPetId,_curLevel);
            _loc3_ = _curExp;
            _loc6_ = StcMgr.ins.getItemVo(_selectLevelUpItem);
            _loc5_ = int(_loc6_.extend_1) * param1;
            _loc5_ = _loc5_ - (_loc4_.exp - _loc3_);
            while(_loc5_ >= 0)
            {
               _loc2_++;
               _loc4_ = PetUtil.getLevelVo(model.crtPetId,_curLevel + _loc2_);
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
            _loc5_ = PetUtil.getLevelVo(model.crtPetId,model.crtPetInfo.level);
            _loc4_ = Uint64Util.toNumber(model.crtPetInfo.exp);
            _loc7_ = StcMgr.ins.getItemVo(_selectLevelUpItem);
            _loc8_ = _loc7_.extend_1;
            _loc6_ = _loc6_ + (_loc5_.exp - _loc4_);
            while(_loc6_ < _loc8_ * param1)
            {
               _loc3_++;
               _loc5_ = PetUtil.getLevelVo(model.crtPetId,model.crtPetInfo.level + _loc3_);
               if(model.crtPetInfo.level + _loc3_ > PlayerModel.ins.level || _loc5_ == null)
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
         var _loc1_:RoleLevelUpEffectVo = EffectQueue.shift(32000);
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
         if(EffectQueue.hasEffect(32000) == false)
         {
            _isShowingEffect = false;
            if(NGUtil.isCurFuncId(32000))
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
         ObserverMgr.ins.sendNotice("set_pet_list_enable",true);
         this.subBar.mouseEvent = true;
      }
      
      private function getEndValue(param1:int, param2:int, param3:int) : Number
      {
         var _loc4_:StcLevelVo = PetUtil.getLevelVo(model.crtPetId,param2);
         return param1 / _loc4_.exp + param2 - param3;
      }
      
      private function levelUp() : void
      {
         showNumTween();
      }
      
      private function lastLevelUp() : void
      {
         ObserverMgr.ins.sendNotice("levelUp",model.crtPetInfo);
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
         if(EffectQueue.hasEffect(32000) == false)
         {
            _isShowingEffect = false;
            if(NGUtil.isCurFuncId(32000))
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
         var _loc1_:Array = NpcPropVo.calNpcBaseProp(model.crtPetId,_curLevel + 1);
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
      
      private function getWealthVo() : WealthVo
      {
         return WealthUtil.countVo(20,_levelUpItems[0].id);
      }
      
      public function getFocusNotices() : Array
      {
         return ["change_selected_pet"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("change_selected_pet" === _loc3_)
         {
            show(false);
         }
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
         super.dispose();
      }
   }
}
