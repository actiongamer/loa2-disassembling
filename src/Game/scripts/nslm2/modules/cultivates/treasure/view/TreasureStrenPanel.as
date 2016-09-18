package nslm2.modules.cultivates.treasure.view
{
   import game.ui.treasures.strens.TreasureStrenPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.cultivates.equipGrows.jinglians.ProgressBarPreFlickerEffCtrl;
   import nslm2.common.compsEffects.FlickerEffCtrl;
   import nslm2.modules.scenes.commons.UIWeapon3D;
   import nslm2.common.compsEffects.ProgressBarAddEffect;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.tooltipsModules.ToolTipLianSuoVo;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   import nslm2.common.consts.NPCPropConsts;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuStrengthVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.recycle.view.render.RecycleAlertRender;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.handlers.Handler;
   import flash.events.Event;
   import com.mz.core.utils.LocalData;
   import nslm2.utils.ServerTimer;
   import morn.core.components.Button;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.cultivates.treasure.service.TreasureService;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import proto.MapKey64Value32;
   import nslm2.modules.cultivates.treasure.vo.TreasureVo;
   import nslm2.modules.cultivates.treasure.view.render.TreasureListRender;
   import nslm2.common.compsEffects.ImgMoveEffect;
   import com.greensock.TweenLite;
   import nslm2.mgrs.SoundMgr;
   import proto.BaoWu;
   import nslm2.utils.ProtoUtils;
   import nslm2.modules.cultivates.equipGrows.jinglians.ComponentFlickerEff;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   import morn.customs.components.ClipList;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import flash.text.TextFormat;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.MathUtil;
   import morn.core.components.Image;
   import org.manager.DateUtils;
   import nslm2.common.ctrls.ProgressBarCtrl;
   
   public class TreasureStrenPanel extends TreasureStrenPanelUI implements IViewStackPage, IObserver, ITreasurePanel
   {
      
      private static const EMPTY_ARR:Array = [null,null,null,null,null,null];
       
      
      private var model:TreasureModel;
      
      private var pgBarPreEff:ProgressBarPreFlickerEffCtrl;
      
      private var flickerTxtExpPre:FlickerEffCtrl;
      
      private var weapon:UIWeapon3D;
      
      private var _barEffect:ProgressBarAddEffect;
      
      private var upEffect:BmcSpriteSheet;
      
      public function TreasureStrenPanel()
      {
         model = TreasureModel.ins;
         super();
         pgBarPreEff = new ProgressBarPreFlickerEffCtrl(this.progressBar);
         flickerTxtExpPre = new FlickerEffCtrl(txt_levelPre);
         flickerTxtExpPre.pause();
         comb_quality.labels = getLbls();
         comb_quality.selectedIndex = 0;
         liansuoArea.toolTip = getToolTip;
         var _loc1_:Number = LocalData.insCurPlayer.load("lastTreasureStrenTime",ServerTimer.ins.date.time);
         var _loc2_:DateUtils = new DateUtils(_loc1_ * 1000);
         if(_loc2_.date != ServerTimer.ins.date.date)
         {
            checkBoxBtn.selected = false;
         }
         else
         {
            checkBoxBtn.selected = LocalData.insCurPlayer.load("checkBoxState",false);
         }
         checkBoxBtn.selected = LocalData.insCurPlayer.load("checkBoxState",false);
         checkBoxBtnSelect(null);
         btn_autoStren.setClickDelay(3000);
         this.parts.push(new ProgressBarCtrl(this.progressBar));
      }
      
      public function initLabels() : void
      {
         comb_quality.labels = getLbls();
         comb_quality.selectedIndex = 0;
      }
      
      protected function liansuoClickHandler(param1:MouseEvent) : void
      {
         if(model.selectedHeroInfo.baowu.length < 2)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30100051),DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50)));
            return;
         }
         ModuleMgr.ins.showModule(30811,2,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function getToolTip() : ToolTipLianSuoVo
      {
         var _loc1_:* = null;
         if(model.selectedHeroInfo)
         {
            _loc1_ = new ToolTipLianSuoVo();
            _loc1_.kind = 3;
            _loc1_.level = model.selectedHeroInfo.baseInfo.baowuStrLs;
            _loc1_.lackEquip = model.selectedHeroInfo.baowu.length < 2;
         }
         return _loc1_;
      }
      
      private function showTip() : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_click",getTopLvlToolTip());
      }
      
      private function getLbls() : String
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc1_:String = "";
         var _loc2_:Array = [];
         _loc4_ = 2;
         while(_loc4_ < 5)
         {
            _loc5_ = TreasureModel.ins.getCanAutoAddCnt(_loc4_);
            _loc3_ = _loc5_ + "";
            if(_loc5_ == 0)
            {
               _loc3_ = TextFieldUtil.htmlText2(_loc5_,16723968);
            }
            if(App.language == "en")
            {
               _loc2_.push(LocaleMgr.ins.getStr(30600000 + _loc4_) + "(" + _loc3_ + ")");
            }
            else
            {
               _loc2_.push(LocaleMgr.ins.getStr(30600000 + _loc4_) + "（" + _loc3_ + "）");
            }
            _loc4_++;
         }
         return _loc2_.join(",");
      }
      
      private function getTopLvlToolTip() : String
      {
         var _loc4_:StcItemVo = model.selectedTreasureItemVo;
         var _loc3_:int = _loc4_.extend_3;
         var _loc2_:Array = list_prop.dataSource as Array;
         var _loc6_:NpcPropVo = _loc2_[0];
         var _loc5_:int = _loc3_ - model.selectedTreasure.level;
         var _loc1_:NpcPropVo = getPorpListByStrenLvl(0)[0];
         _loc1_.value = _loc1_.value + TreasureUtil.caculateStrenAddProp(_loc1_.value,_loc3_);
         var _loc7_:String = "Lv." + _loc3_ + "\n" + NPCPropConsts.ins.getLocaleNameNormal(_loc1_.propId) + ":" + TextFieldUtil.htmlText2(NPCPropConsts.ins.showValue(_loc1_.value,"+"),458496);
         return _loc7_;
      }
      
      private function expOverflow() : int
      {
         return model.selecteTrueasureAllExp - getCanAwardExp();
      }
      
      private function checkIsPlayerLvlLimit() : Boolean
      {
         var _loc1_:StcBaowuStrengthVo = TreasureUtil.getStrenVo(model.selectedTreasure.level,model.selectedTreasure.baseId);
         if(_loc1_.playerLevel > PlayerModel.ins.level)
         {
            return true;
         }
         return false;
      }
      
      public function viewStackIn() : void
      {
         list_treasures.dataSource = EMPTY_ARR;
         addEvent();
         this.visible = true;
         this.fadeIn();
         model.floatOffSet = -14;
         updateBtnStatus();
         this.render_recycle.dataSource = 30600;
         (this.render_recycle as RecycleAlertRender).autoHide();
      }
      
      private function updateBtnStatus() : void
      {
         if(model.selectedNum)
         {
            box_selecte.visible = false;
            box_stren.visible = true;
         }
         else
         {
            box_selecte.visible = true;
            box_stren.visible = false;
         }
      }
      
      private function addEvent() : void
      {
         ObserverMgr.ins.regObserver(this);
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         liansuoArea.addEventListener("click",liansuoClickHandler);
         btn_stren.addEventListener("rollOver",onBtnOver);
         btn_stren.addEventListener("rollOut",onBtnOut);
         checkBoxBtn.addEventListener("select",checkBoxBtnSelect);
         comb_quality.selectHandler = new Handler(combQualityHandler);
      }
      
      private function removeEvent() : void
      {
         ObserverMgr.ins.unregObserver(this);
         btn_stren.removeEventListener("rollOver",onBtnOver);
         btn_stren.removeEventListener("rollOut",onBtnOut);
         liansuoArea.removeEventListener("click",liansuoClickHandler);
         checkBoxBtn.removeEventListener("select",checkBoxBtnSelect);
         comb_quality.selectHandler = null;
      }
      
      protected function checkBoxBtnSelect(param1:Event) : void
      {
         if(checkBoxBtn.selected)
         {
            tunShiTxt.style = "普通绿色";
            btn_autoStren.toolTip = LocaleMgr.ins.getStr(30600022);
         }
         else
         {
            tunShiTxt.style = "普通说明";
            btn_autoStren.toolTip = LocaleMgr.ins.getStr(30600015);
         }
         LocalData.insCurPlayer.save("checkBoxState",checkBoxBtn.selected);
         LocalData.insCurPlayer.load("lastTreasureStrenTime",ServerTimer.ins.date.time);
      }
      
      private function combQualityHandler(param1:int) : void
      {
         tunShiTxt.toolTip = LocaleMgr.ins.getStr(30600021,[comb_quality.labels.split(",")[param1]]);
      }
      
      protected function onBtnOver(param1:MouseEvent) : void
      {
         if(weapon)
         {
            weapon.reset();
         }
      }
      
      protected function onBtnOut(param1:MouseEvent) : void
      {
         if(weapon)
         {
            (weapon as UIWeapon3D).restartRotate();
         }
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:int = comb_quality.selectedIndex + 2;
         var _loc5_:* = param1;
         if(btn_stren !== _loc5_)
         {
            if(btn_autoSelect !== _loc5_)
            {
               if(btn_autoStren === _loc5_)
               {
                  list_treasures.dataSource = EMPTY_ARR;
                  model.unSelectAll();
                  updateBtnStatus();
                  updateSelectedTreasure();
                  if(checkIsPlayerLvlLimit())
                  {
                     _loc3_ = new ResGetPointModuleParam().initByLessId(int(DefindConsts.MAINHERO_LV_LESS_ID));
                     _loc3_.errMsgLanCode = 30600009;
                     ModuleMgr.ins.showModule(12101,_loc3_,ModuleMgr.ins.popLayer.curModuleId);
                     return;
                  }
                  if(model.checkHasMoreExpTreasure(_loc4_))
                  {
                     _loc2_ = model.getOnekeyStrenTreausreList(_loc4_);
                  }
                  else if(checkBoxBtn.selected)
                  {
                     if(model.checkHasMoreExpTreasure(_loc4_,true))
                     {
                        _loc2_ = model.getOnekeyStrenTreausreList(_loc4_,true);
                     }
                     else
                     {
                        AlertUtil.float(LocaleMgr.ins.getStr(30600019,[LocaleMgr.ins.getStr(6000 + _loc4_)]),DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50)));
                        return;
                     }
                  }
                  else
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(30600016,[LocaleMgr.ins.getStr(6000 + _loc4_)]),DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50)));
                     return;
                  }
                  if(model.hasHighQualityItem)
                  {
                     AlertUtil.comfirm(LocaleMgr.ins.getStr(30600006),new Handler(doAutoStrenthen,[_loc2_]),null,"TreasureStrength");
                     return;
                  }
                  doAutoStrenthen(_loc2_);
               }
            }
            else
            {
               if(model.selectedTreasureIDArr.length >= 6)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(30600301),DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50)));
                  return;
               }
               if(checkAddEquip())
               {
                  if(!model.checkHasMoreTreasure(_loc4_))
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(30600001,[LocaleMgr.ins.getStr(6000 + _loc4_)]),DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50)));
                     return;
                  }
                  model.autoSelect(_loc4_);
               }
               updateSelectedTreasure();
            }
         }
         else
         {
            if(model.selectedTreasureIDArr.length == 0)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(30600300),DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50)));
               return;
            }
            if(checkIsPlayerLvlLimit())
            {
               _loc3_ = new ResGetPointModuleParam().initByLessId(int(DefindConsts.MAINHERO_LV_LESS_ID));
               _loc3_.errMsgLanCode = 30600009;
               ModuleMgr.ins.showModule(12101,_loc3_,ModuleMgr.ins.popLayer.curModuleId);
               return;
            }
            if(model.hasHighQualityItem)
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(30600006),new Handler(doStrenth),null,"TreasureStrength");
               return;
            }
            doStrenth();
         }
      }
      
      private function doAutoStrenthen(param1:Array) : void
      {
         setBtnEnable(false);
         ObserverMgr.ins.sendNotice("treasure_freeze_selector",false);
         playAutoStrenEffect(param1);
         list_treasures.visible = false;
      }
      
      private function requestOneKeyStrenthen(param1:Array) : void
      {
         var _loc2_:Array = compactCost(param1);
         model.preBwData = model.selectedTreasure;
         TreasureService.ins.strengthen(model.selectedHeroInfo.baseInfo.id,model.selectedTreasure.id,_loc2_,1);
      }
      
      private function compactCost(param1:Array) : Array
      {
         var _loc6_:* = null;
         var _loc2_:* = null;
         var _loc7_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Array = [];
         var _loc5_:int = param1.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc3_ = param1[_loc7_];
            if(_loc6_ && Uint64Util.equal(_loc6_.id,_loc3_))
            {
               _loc6_.value = Number(_loc6_.value) + 1;
            }
            else
            {
               _loc6_ = new MapKey64Value32();
               _loc6_.id = _loc3_;
               _loc6_.value = 1;
               _loc4_.push(_loc6_);
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      private function setBtnEnable(param1:Boolean) : void
      {
         var _loc2_:* = !param1;
         btn_stren.disabled = _loc2_;
         _loc2_ = _loc2_;
         btn_autoSelect.disabled = _loc2_;
         btn_autoStren.disabled = _loc2_;
         list_treasures.mouseEvent = param1;
      }
      
      private function doStrenth() : void
      {
         if(model.checkSelectedTreasursHasRune())
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(30600215),new Handler(checkOverExp));
            return;
         }
         checkOverExp();
      }
      
      private function checkAddEquip() : Boolean
      {
         if(model.idleTreasureList.length == 0)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.TREASURE_LESS_ID)),30600);
            return false;
         }
         return true;
      }
      
      private function checkOverExp() : void
      {
         var _loc1_:int = expOverflow();
         if(_loc1_ > 0)
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(30600010,[_loc1_]),confirmDoStren);
            return;
         }
         doEffect();
      }
      
      private function confirmDoStren() : void
      {
         doEffect();
      }
      
      private function doEffect() : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc6_:int = 0;
         ObserverMgr.ins.sendNotice("treasure_freeze_selector",false);
         setBtnEnable(false);
         var _loc5_:int = 6;
         var _loc2_:Point = this.localToGlobal(new Point(257,185));
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = list_treasures.getItem(_loc6_) as TreasureVo;
            if(_loc4_)
            {
               _loc3_ = list_treasures.getCell(_loc6_) as TreasureListRender;
               if(_loc3_)
               {
                  _loc3_.box_content.visible = false;
                  _loc1_ = new ImgMoveEffect();
                  _loc1_.config(0.5,0.8);
                  _loc1_.init(_loc3_.img_icon,_loc3_.img_icon.localToGlobal(new Point()),_loc2_,new Handler(moveIconEndHandler,[requestService]));
                  _loc1_.startAnim();
               }
            }
            _loc6_++;
         }
      }
      
      private function moveIconEndHandler(param1:Function, param2:Array = null) : void
      {
         if(!upEffect)
         {
            upEffect = new BmcSpriteSheet();
            upEffect.x = 133;
            upEffect.y = 43;
            upEffect.init(3060007,1,"all",false,1,0,new Handler(endHandler));
            addChild(upEffect);
            TweenLite.delayedCall(0.5,param1,param2);
         }
         SoundMgr.ins.playTexiaoSound("baoWuQiangHua");
      }
      
      private function requestService() : void
      {
         var _loc1_:* = null;
         if(model.selectedTreasure)
         {
            model.preBwData = model.selectedTreasure;
            _loc1_ = compactCost(model.selectedTreasureIDArr);
            TreasureService.ins.strengthen(model.selectedHeroInfo.baseInfo.id,model.selectedTreasure.id,_loc1_);
         }
      }
      
      private function endHandler() : void
      {
         upEffect = null;
      }
      
      private function showEffect(param1:BaoWu) : void
      {
         showAddExpTips(param1);
      }
      
      private function showAddExpTips(param1:BaoWu) : void
      {
         var _loc5_:int = 0;
         var _loc4_:int = param1.level - model.preBwData.level;
         var _loc3_:int = Uint64Util.toInt(param1.exp) - Uint64Util.toInt(model.preBwData.exp);
         if(_loc4_)
         {
            _loc5_ = TreasureUtil.getStrenVo(model.preBwData.level,model.preBwData.baseId).exp;
            _loc3_ = Uint64Util.toInt(param1.exp) + _loc5_ - Uint64Util.toInt(model.preBwData.exp);
         }
         else
         {
            _loc3_ = Uint64Util.toInt(param1.exp) - Uint64Util.toInt(model.preBwData.exp);
         }
         var _loc2_:String = TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(3011) + "+" + _loc3_,458496);
         AlertUtil.float(_loc2_,DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,50)),-1,new Handler(showExpTextTipCpl,[param1,model.selectedTreasure.level]),null,0);
         playProgressBarEff(param1,model.preBwData.level,param1.level > model.preBwData.level);
         ProtoUtils.copyParams(param1,model.selectedTreasure);
      }
      
      private function showExpTextTipCpl(param1:BaoWu, param2:int) : void
      {
         if(this.isDisposed)
         {
            return;
         }
      }
      
      private function playProgressBarEff(param1:BaoWu, param2:int, param3:Boolean) : void
      {
         _barEffect = new ProgressBarAddEffect(this.progressBar,getEndValue(Uint64Util.toInt(param1.exp),param1.level,param2),null,null,new Handler(perEffectOver,[param1,param3])).setTweenTime(0.4);
         _barEffect.startAnim();
      }
      
      private function perEffectOver(param1:BaoWu, param2:Boolean) : void
      {
         new ComponentFlickerEff(progressBar).showLight();
         showLvlUpTextTips(param2);
      }
      
      private function showLvlUpTextTips(param1:Boolean) : void
      {
         if(param1)
         {
            showLvlUpTip();
         }
         else
         {
            show();
         }
         if(model.needShowLiansuoEffect)
         {
            TweenLite.delayedCall(0.4,sendNotice);
         }
         ObserverMgr.ins.sendNotice("treasure_freeze_selector",true);
      }
      
      private function showLvlUpTip() : void
      {
         var _loc1_:* = null;
         var _loc4_:StcItemVo = model.selectedTreasureItemVo;
         if(!_loc4_)
         {
            return;
         }
         var _loc3_:String = TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(_loc4_.name),ColorLib.qualityColor(_loc4_.quality));
         var _loc2_:String = LocaleMgr.ins.getStr(30600216,[_loc3_,model.selectedTreasure.level]);
         AlertUtil.float(_loc2_,DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50)),-1,showTextTipCpl,DisplayUtils.globarCenter(txt_level),1);
         if(model.selectedTreasure)
         {
            _loc1_ = getPorpListByStrenLvl(model.selectedTreasure.level);
            _loc1_.forEach(setFloatPos);
            list_prop.dataSource = _loc1_;
         }
      }
      
      private function showTextTipCpl() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         this.show();
         return;
         §§push(new FloatZoomInEffCtrl(txt_level,1));
      }
      
      private function sendNotice() : void
      {
         ObserverMgr.ins.sendNotice("treasure_show_liansuo_lvlup_effect",[3,model.selectedHeroInfo]);
      }
      
      public function getCrtStrenPropList(param1:BaoWu) : Array
      {
         if(!model.selectedTreasure)
         {
            return [];
         }
         return NpcPropVo.parseFightProp(param1.base,"+");
      }
      
      private function setFloatPos(param1:NpcPropVo, param2:int, param3:Array) : void
      {
         param1.floatPos = DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50));
      }
      
      private function getEndValue(param1:int, param2:int, param3:int) : Number
      {
         var _loc4_:StcBaowuStrengthVo = TreasureUtil.getStrenVo(param2,model.selectedTreasure.baseId);
         return param1 / _loc4_.exp + param2 - param3;
      }
      
      public function viewStackOut() : void
      {
         removeEvent();
         this.visible = false;
      }
      
      public function getFocusNotices() : Array
      {
         return ["treasure_notice_stren_success","treasure_show_select_panel","treasure_update_selected_list","treasure_notice_stren_fail","treasure_notice_idle_updated"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc5_:* = param1;
         if("treasure_notice_stren_success" !== _loc5_)
         {
            if("treasure_show_select_panel" !== _loc5_)
            {
               if("treasure_update_selected_list" !== _loc5_)
               {
                  if("treasure_notice_stren_fail" !== _loc5_)
                  {
                     if("treasure_notice_idle_updated" === _loc5_)
                     {
                        _loc3_ = comb_quality.selectedIndex;
                        comb_quality.labels = getLbls();
                        comb_quality.selectedIndex = _loc3_;
                     }
                  }
                  else
                  {
                     model.unSelectAll();
                     list_treasures.dataSource = EMPTY_ARR;
                     ObserverMgr.ins.sendNotice("treasure_freeze_selector",true);
                     setBtnEnable(true);
                  }
               }
               else
               {
                  updateSelectedTreasure();
               }
            }
            else if(checkAddEquip())
            {
               ModuleMgr.ins.showModule(30601,null,30600);
            }
         }
         else
         {
            _loc4_ = param2 as BaoWu;
            list_treasures.dataSource = EMPTY_ARR;
            model.unSelectAll();
            this.pgBarPreEff.preValue = 0;
            showEffect(_loc4_);
         }
      }
      
      private function updateSelectedTreasure() : void
      {
         list_treasures.dataSource = TreasureModel.ins.selectedTreasureList;
         countPreExp();
         showNextLevel();
         updateProgressBar();
         updateNewProp();
         updateBtnStatus();
      }
      
      public function get liansuoTxt() : ClipList
      {
         return this.lianSuoLvl;
      }
      
      public function show() : void
      {
         txt_levelPre.visible = false;
         if(model.selectedTreasure)
         {
            updateTreasureName();
            txt_level.text = LocaleConsts.lvStr(model.selectedTreasure.level);
            updateProgressBar();
            updateBaseProp();
            updateNewProp();
            lianSuoLvl.tweenValue = model.selectedHeroInfo.baseInfo.baowuStrLs;
            model.unSelectAll();
            updateSelectedTreasure();
            setBtnEnable(true);
         }
         list_treasures.visible = true;
      }
      
      private function updateProgressBar() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc1_:int = 0;
         if(model.selectedTreasure)
         {
            _loc2_ = model.selectedTreasure.level;
            _loc3_ = TreasureUtil.getStrenVo(_loc2_,model.selectedTreasure.baseId);
            if(_loc3_)
            {
               _loc1_ = Uint64Util.toNumber(model.selectedTreasure.exp);
               txt_progress.text = getExpString(_loc1_,_loc3_.exp);
               progressBar.value = Uint64Util.toNumber(model.selectedTreasure.exp) / _loc3_.exp;
            }
         }
      }
      
      private function getExpString(param1:int, param2:*) : String
      {
         if(!model.selectedNum)
         {
            return param1.toString() + "/" + param2.toString();
         }
         return param1.toString() + TextFieldUtil.htmlText(" +" + getCanAwardExp(),new TextFormat(null,null,458496)) + "/" + param2.toString();
      }
      
      private function countPreExp() : void
      {
         var _loc1_:int = 0;
         var _loc4_:StcBaowuStrengthVo = TreasureUtil.getStrenVo(model.selectedTreasure.level,model.selectedTreasure.baseId);
         if(!_loc4_)
         {
            return;
         }
         var _loc3_:int = _loc4_.exp;
         var _loc2_:int = Uint64Util.toInt(model.selectedTreasure.exp);
         if(model.selectedNum)
         {
            _loc1_ = model.selecteTrueasureAllExp;
            if(_loc2_ + _loc1_ < _loc3_)
            {
               this.pgBarPreEff.preValue = (_loc2_ + _loc1_) / _loc3_;
               txt_levelPre.visible = false;
               flickerTxtExpPre.pause();
            }
            else
            {
               this.pgBarPreEff.preValue = 1;
               if(getAddLevel() > 0)
               {
                  txt_levelPre.visible = true;
                  flickerTxtExpPre.resume();
               }
               else
               {
                  txt_levelPre.visible = false;
                  flickerTxtExpPre.pause();
               }
            }
         }
         else
         {
            this.pgBarPreEff.preValue = 0;
            flickerTxtExpPre.pause();
            txt_levelPre.visible = false;
         }
      }
      
      private function getAddLevel() : int
      {
         var _loc8_:* = null;
         var _loc7_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         if(model.selectedNum)
         {
            _loc8_ = TreasureUtil.getStrenVo(model.selectedTreasure.level,model.selectedTreasure.baseId);
            _loc7_ = Uint64Util.toInt(model.selectedTreasure.exp);
            _loc5_ = model.selecteTrueasureAllExp;
            _loc3_ = model.selectedTreasureItemVo;
            _loc2_ = _loc3_.extend_3;
            _loc1_ = model.selectedTreasure.level;
            if(PlayerModel.ins.level < _loc8_.playerLevel || _loc1_ >= _loc2_)
            {
               return 0;
            }
            _loc5_ = _loc5_ - (_loc8_.exp - _loc7_);
            while(_loc5_ >= 0)
            {
               _loc4_++;
               _loc6_ = _loc1_ + _loc4_;
               _loc8_ = TreasureUtil.getStrenVo(_loc6_,model.selectedTreasure.baseId);
               if(!(PlayerModel.ins.level < _loc8_.playerLevel || _loc6_ >= _loc2_))
               {
                  _loc5_ = _loc5_ - _loc8_.exp;
                  continue;
               }
               break;
            }
            return _loc4_;
         }
         return 0;
      }
      
      private function showNextLevel() : void
      {
         var _loc1_:int = 0;
         if(model.selectedNum)
         {
            _loc1_ = getAddLevel();
            txt_levelPre.text = "+" + _loc1_;
         }
      }
      
      private function getCanAwardExp() : int
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = 0;
         if(model.selectedTreasure)
         {
            _loc5_ = TreasureUtil.getStrenVo(model.selectedTreasure.level,model.selectedTreasure.baseId);
            _loc4_ = Uint64Util.toNumber(model.selectedTreasure.exp);
            _loc6_ = _loc6_ + (_loc5_.exp - _loc4_);
            _loc7_ = model.selecteTrueasureAllExp;
            _loc3_ = model.selectedTreasureItemVo;
            _loc2_ = _loc3_.extend_3;
            while(_loc6_ < _loc7_)
            {
               _loc1_++;
               _loc5_ = TreasureUtil.getStrenVo(model.selectedTreasure.level + _loc1_,model.selectedTreasure.baseId);
               if(PlayerModel.ins.level < _loc5_.playerLevel || model.selectedTreasure.level + _loc1_ > _loc2_)
               {
                  return _loc6_ - 1;
               }
               _loc6_ = _loc6_ + _loc5_.exp;
            }
            return Math.min(_loc7_,_loc6_);
         }
         return 0;
      }
      
      private function updateBaseProp() : void
      {
         if(model.selectedTreasure)
         {
            nowLvl.txt_name.text = LocaleMgr.ins.getStr(30600303);
            nowLvl.txt_value.text = LocaleMgr.ins.getStr(999000100,[model.selectedTreasure.level + "/" + (String((StcMgr.ins.getVoByColumnValue("static_baowu_strength","playerLevel",PlayerModel.ins.level) as StcBaowuStrengthVo).level + 1))]);
            list_prop.dataSource = getPorpListByStrenLvl(model.selectedTreasure.level);
         }
      }
      
      private function getPorpListByStrenLvl(param1:int) : Array
      {
         var _loc2_:int = 0;
         var _loc4_:Array = NpcPropVo.parseFightProp(model.selectedTreasure.base,"+");
         var _loc6_:int = 0;
         var _loc5_:* = _loc4_;
         for each(var _loc3_ in _loc4_)
         {
            _loc2_ = TreasureUtil.caculateStrenAddProp(_loc3_.value,param1);
            _loc3_.value = _loc3_.value + _loc2_;
         }
         return _loc4_;
      }
      
      private function updateNewProp() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         if(model.selectedTreasure)
         {
            _loc2_ = getAddLevel();
            _loc1_ = model.selectedTreasure.level;
            _loc2_ = _loc2_ < 1?1:_loc2_;
            nextLvl.txt_name.text = LocaleMgr.ins.getStr(30600304);
            nextLvl.txt_value.text = LocaleMgr.ins.getStr(999000100,[_loc1_ + _loc2_]);
            list_propNext.dataSource = getPorpListByStrenLvl(_loc1_ + _loc2_);
         }
      }
      
      private function caculateNextlvlProp(param1:int, param2:int) : int
      {
         return param1 * param2 / 2;
      }
      
      private function updateTreasureName() : void
      {
         var _loc1_:StcItemVo = model.selectedTreasureItemVo;
         txt_treasureName.color = ColorLib.qualityColor(_loc1_.quality);
         txt_treasureName.text = LocaleMgr.ins.getStr(_loc1_.name);
         txt_treasureName.text = LocaleMgr.ins.getStr(_loc1_.name) + " +" + model.selectedTreasure.level;
      }
      
      private function playAutoStrenEffect(param1:Array) : void
      {
         var _loc10_:* = null;
         var _loc3_:* = null;
         var _loc9_:int = 0;
         var _loc5_:int = comb_quality.selectedIndex + 2;
         var _loc8_:Array = TreasureModel.ins.selectedExpTreausreIconArr;
         var _loc2_:int = _loc8_.length;
         var _loc4_:int = 100;
         var _loc14_:Number = MathUtil.random(3,1);
         var _loc12_:int = 270;
         var _loc11_:int = 182;
         var _loc6_:Point = this.localToGlobal(new Point(257,185));
         var _loc7_:int = param1.length;
         _loc7_ = _loc7_ > 40?40:int(_loc7_);
         var _loc13_:int = _loc7_ / 3;
         _loc9_ = 0;
         while(_loc9_ < _loc7_)
         {
            _loc3_ = new Image();
            _loc3_.smoothing = true;
            _loc3_.url = _loc8_[_loc9_];
            _loc3_.width = 30;
            _loc3_.height = 30;
            _loc3_.x = _loc12_ + _loc4_ * Math.cos(_loc14_);
            _loc3_.y = _loc11_ + _loc4_ * Math.sin(_loc14_);
            addChild(_loc3_);
            _loc14_ = _loc14_ + MathUtil.random(1.2,0.6);
            if(!(_loc9_ % _loc13_))
            {
               _loc4_ = _loc4_ + 40;
            }
            TweenLite.to(_loc3_,0.6,{
               "x":_loc12_,
               "y":_loc11_,
               "scale":0.8,
               "onComplete":iconFlyComplte,
               "onCompleteParams":[_loc3_]
            });
            _loc9_++;
         }
         TweenLite.delayedCall(0.6,playAutoStreEffectEnd,[param1]);
      }
      
      private function iconFlyComplte(param1:Image) : void
      {
         param1.dispose();
         param1 = null;
      }
      
      private function playAutoStreEffectEnd(param1:Array) : void
      {
         moveIconEndHandler(requestOneKeyStrenthen,[param1]);
      }
      
      public function updateLiansuoLvl() : void
      {
         lianSuoLvl.tweenValue = model.selectedHeroInfo.baseInfo.baowuStrLs;
      }
      
      public function set weaoponRef(param1:Object) : void
      {
         weapon = param1 as UIWeapon3D;
      }
      
      override public function dispose() : void
      {
         if(_barEffect)
         {
            _barEffect.dispose();
         }
         super.dispose();
      }
   }
}
