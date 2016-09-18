package nslm2.modules.cultivates.equipGrows.jinglians
{
   import game.ui.equipGrows.jinglians.EquipJinglianPanelUI;
   import nslm2.modules.cultivates.equipGrows.commons.IEquipGrowSubPanel;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.common.compsEffects.FlickerEffCtrl;
   import nslm2.modules.cultivates.equipGrows.EquipGrowModel;
   import flash.geom.Point;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.vo.WealthVo;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.scenes.commons.UIWeapon3D;
   import nslm2.modules.footstones.tooltipsModules.ToolTipLianSuoVo;
   import com.greensock.TweenLite;
   import flash.utils.Timer;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.compsEffects.ImgMoveEffect;
   import com.mz.core.utils2.ShakeUtil;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.mgrs.stcMgrs.vos.StcEquipAttrVo;
   import proto.EquipJinglianReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.EquipJinglianRes;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import proto.Item;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.skins.ColorLib;
   import morn.core.handlers.Handler;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   import proto.ProtocolStatusRes;
   import nslm2.mgrs.stcMgrs.vos.StcEquipJinglianVo;
   import morn.core.utils.NumberUtil;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import morn.customs.components.ClipList;
   import nslm2.utils.WealthUtil;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   
   public class EquipJinglianPanel extends EquipJinglianPanelUI implements IEquipGrowSubPanel, IObserver, IViewStackPage
   {
       
      
      private var pgBarPreEff:nslm2.modules.cultivates.equipGrows.jinglians.ProgressBarPreFlickerEffCtrl;
      
      private var flickerTxtExpPre:FlickerEffCtrl;
      
      private var weapon:Object;
      
      public var model:EquipGrowModel;
      
      private var tipPos:Point;
      
      private var lvlUpEff:BmcSpriteSheet;
      
      private var isUseMouseDown:Boolean;
      
      private var _wealthVo:WealthVo;
      
      private var isAuto:Boolean = false;
      
      private var clickCnt:int;
      
      private var clickCheckTime:int;
      
      private var checkClickInterVal:int = 300;
      
      private var checkClickTime:Timer;
      
      private var isChecking:Boolean;
      
      private var flyCount:int = 1;
      
      private var curCount:int = 0;
      
      private var _lastShowAlertTime:int;
      
      private var lastLevel:int;
      
      private var costCnt:int;
      
      private var isOneKey:Boolean;
      
      private var showSkill:Boolean;
      
      private var lastSkillVo:StcEquipAttrVo;
      
      private var curExp:int;
      
      private var maxExp:int;
      
      private var _res:EquipJinglianRes;
      
      private var times:int;
      
      private var attrArr:Array;
      
      private var next_value:Number;
      
      private var last_level:Object;
      
      private var showSkillVo:StcEquipAttrVo;
      
      public function EquipJinglianPanel()
      {
         super();
         model = EquipGrowModel.ins;
         _wealthVo = WealthUtil.countVo(20,41000);
         liansuoArea.toolTip = getToolTip;
         btn_jinlian.addEventListener("mouseDown",jinLianBtnClickHandler);
         btn_jinlian.addEventListener("click",jinLianBtnClickHandler);
         btn_jinlian2.addEventListener("click",jinLian2BtnClickHandler);
         pgBarPreEff = new nslm2.modules.cultivates.equipGrows.jinglians.ProgressBarPreFlickerEffCtrl(this.progressBar);
         txt_levelPre.visible = false;
         flickerTxtExpPre = new FlickerEffCtrl(txt_levelPre);
         flickerTxtExpPre.pause();
         this.parts.push(new FloatUpDownEffCtrl().init(this.box_upArrow,NaN,2,1));
         BmcSpriteSheet.preload(new <int>[5002]);
         box_btn.addEventListener("rollOver",btnRollOver);
         box_btn.addEventListener("rollOut",btnRollOut);
         liansuoArea.addEventListener("click",liansuoClickHandler);
         DisplayUtils.addChildFromGlobal(btn_jinlian,img_btn);
         this.label_title.text = LocaleMgr.ins.getStr(10220012);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      protected function liansuoClickHandler(param1:MouseEvent) : void
      {
         if(model.heroInfo.items.length < 4)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30100050));
            return;
         }
         ModuleMgr.ins.showModule(30811,1,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      protected function btnRollOut(param1:MouseEvent) : void
      {
         (weapon as UIWeapon3D).restartRotate();
      }
      
      protected function btnRollOver(param1:MouseEvent) : void
      {
         (weapon as UIWeapon3D).reset();
      }
      
      private function getToolTip() : ToolTipLianSuoVo
      {
         var _loc1_:* = null;
         if(model.heroInfo)
         {
            _loc1_ = new ToolTipLianSuoVo();
            _loc1_.kind = 2;
            _loc1_.level = model.heroInfo.baseInfo.jinglianLSLv;
            _loc1_.lackEquip = model.heroInfo.items.length < 4;
         }
         return _loc1_;
      }
      
      private function startAuto() : void
      {
         isAuto = true;
         isUseMouseDown = true;
         this.iconFly();
      }
      
      private function stage_onMouseUp(param1:MouseEvent = null) : void
      {
         TweenLite.killDelayedCallsTo(startAuto);
         if(stage)
         {
            stage.removeEventListener("mouseUp",stage_onMouseUp);
         }
         isAuto = false;
      }
      
      private function itemListMouseHandler(param1:MouseEvent, param2:*) : void
      {
      }
      
      private function jinLian2BtnClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(BagModel.ins.getStcCount(_wealthVo.stcItemVo.id) <= 0)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealth(20,_wealthVo.sid),30500);
            return;
         }
         if(StcMgr.ins.getEquipJinglianVo(model.item.jinglianId).level >= Math.ceil(PlayerModel.ins.level / 2))
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000550));
            return;
         }
         btn_jinlian2.mouseEnabled = false;
         isOneKey = true;
         if(_wealthVo && _wealthVo.showCount <= 0 || !_wealthVo)
         {
            btn_jinlian2.mouseEnabled = true;
            return;
         }
         if(model.crtJingLianVO.unlock_level < PlayerModel.ins.level)
         {
            _loc2_ = Math.ceil((model.crtJingLianVO.need_exp - model.item.jinglianExp) / int(_wealthVo.stcItemVo.extend_1));
         }
         else
         {
            _loc2_ = Math.floor((model.crtJingLianVO.need_exp - model.item.jinglianExp) / int(_wealthVo.stcItemVo.extend_1));
         }
         if(_loc2_ > 0)
         {
            flyCount = _loc2_;
         }
         curCount = 0;
         if(_loc2_ <= _wealthVo.showCount)
         {
            server_sendJinglian(flyCount);
         }
         else
         {
            server_sendJinglian(_wealthVo.showCount);
         }
      }
      
      private function iconFly2() : void
      {
         var _loc1_:ImgMoveEffect = new ImgMoveEffect();
         curCount = Number(curCount) + 1;
         _loc1_.config(0.01,0);
         if(curCount < flyCount)
         {
            _loc1_.init(renderHad.img_icon,renderHad.img_icon.localToGlobal(new Point(0,0)),this.progressBar.localToGlobal(new Point(70,4)),flyCplNormal,false,true);
         }
         else if(curCount == flyCount)
         {
            _loc1_.init(renderHad.img_icon,renderHad.img_icon.localToGlobal(new Point(0,0)),this.progressBar.localToGlobal(new Point(70,4)),flyCplFinal,false,true);
         }
         _loc1_.startAnim(false);
      }
      
      private function flyCplFinal() : void
      {
         btn_jinlian2.mouseEnabled = true;
      }
      
      private function flyCplNormal() : void
      {
         showExp(model.item.jinglianExp + curCount * int(_wealthVo.stcItemVo.extend_1),model.crtJingLianVO.need_exp);
         iconFly2();
      }
      
      private function jinLianBtnClickHandler(param1:MouseEvent) : void
      {
         if(BagModel.ins.getStcCount(_wealthVo.stcItemVo.id) <= 0)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealth(20,_wealthVo.sid),30500);
            return;
         }
         isOneKey = false;
         if(StcMgr.ins.getEquipJinglianVo(model.item.jinglianId).level >= Math.ceil(PlayerModel.ins.level / 2))
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000550));
            return;
         }
         var _loc2_:* = param1.type;
         if("mouseDown" !== _loc2_)
         {
            if("click" === _loc2_)
            {
               if(_wealthVo && _wealthVo.showCount <= 0)
               {
                  return;
               }
               if(!isChecking)
               {
                  TweenLite.delayedCall(1,checkClickCnt);
                  isChecking = true;
               }
               clickCnt = Number(clickCnt) + 1;
               if(!isUseMouseDown)
               {
                  this.iconFly();
               }
               isUseMouseDown = false;
            }
         }
         else
         {
            if(_wealthVo && _wealthVo.showCount <= 0)
            {
               return;
            }
            stage.addEventListener("mouseUp",stage_onMouseUp);
            TweenLite.killDelayedCallsTo(startAuto);
            TweenLite.delayedCall(Config.clickDelay / 1000 + 0.2,startAuto);
         }
      }
      
      private function playUpEff() : void
      {
         lvlUpEff = new BmcSpriteSheet();
         lvlUpEff.init(5002);
         lvlUpEff.x = 40;
         lvlUpEff.y = -36;
         addChild(lvlUpEff);
         doShakeEffect();
      }
      
      private function doShakeEffect() : void
      {
         if(weapon)
         {
            ShakeUtil.shake(false,weapon,0,6,15,40);
         }
      }
      
      private function checkClickCnt() : void
      {
         if(clickCnt >= 3 || TimerManager.ins.currTimer - _lastShowAlertTime > 5000)
         {
            _lastShowAlertTime = TimerManager.ins.currTimer;
            AlertUtil.float(LocaleMgr.ins.getStr(30100009),DisplayUtils.globarCenter(this.btn_jinlian).add(new Point(0,-40)),-1,null,null,15);
         }
         clickCnt = 0;
         isChecking = false;
      }
      
      private function iconFly() : void
      {
         var _loc1_:ImgMoveEffect = new ImgMoveEffect();
         _loc1_.config(0.5,0.3);
         _loc1_.init(renderHad.img_icon,renderHad.img_icon.localToGlobal(new Point(0,0)),this.progressBar.localToGlobal(new Point(70,4)),!!this.isAuto?null:server_sendJinglian,false,true);
         _loc1_.startAnim();
         if(this.isAuto)
         {
            TweenLite.killDelayedCallsTo(server_sendJinglian);
            TweenLite.delayedCall(0.2,server_sendJinglian);
         }
      }
      
      private function server_sendJinglian(param1:int = 1) : void
      {
         var _loc2_:* = null;
         if(this.isDisposed)
         {
            return;
         }
         _loc2_ = new EquipJinglianReq();
         _loc2_.heroId = model.heroInfo.baseInfo.id;
         _loc2_.equipId = model.item.id;
         _loc2_.count = param1;
         _loc2_.itemId = _wealthVo.sid;
         costCnt = param1;
         lastLevel = StcMgr.ins.getEquipJinglianVo(model.item.jinglianId).level;
         ServerEngine.ins.send(8101,_loc2_,server_jinglian,server_jinglianErr);
         btn_jinlian2.mouseEnabled = true;
      }
      
      private function server_jinglian(param1:EquipJinglianRes = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         _res = param1;
         if(Uint64Util.equal(this.model.heroInfo.baseInfo.id,param1.heroId))
         {
            _loc2_ = (int(_wealthVo.stcItemVo.extend_1) * flyCount).toString();
         }
         if(_loc2_)
         {
            _loc3_ = "";
            if(isOneKey)
            {
               _loc3_ = LocaleMgr.ins.getStr(999000830) + "[" + _wealthVo.qualityName + "] " + TextFieldUtil.htmlText2("x " + costCnt,16773888) + "，";
            }
            _loc3_ = TextFieldUtil.htmlText(_loc3_ + LocaleMgr.ins.getStr(30500019) + " +" + _loc2_,new TextFormat(null,20,458496));
            if(!tipPos)
            {
               tipPos = this.localToGlobal(new Point(262,268));
            }
            AlertUtil.float(_loc3_,tipPos,-40);
            complete();
         }
         flyCount = 1;
         refreshSkillBox(true);
      }
      
      private function showSkillAlert() : void
      {
         AlertUtil.float(TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(showSkillVo.attr_name),458496) + TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(30200013),16773888),DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,null,null,1);
         AlertUtil.float(TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(showSkillVo.attr_disc),458496,19),DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,null,null,1);
         showSkill = false;
         next_value = 0;
      }
      
      private function complete() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         if(Uint64Util.equal(this.model.heroInfo.baseInfo.id,_res.heroId))
         {
            if(Uint64Util.equal(this.model.item.id,_res.equipId))
            {
               if(this.model.item.jinglianId != _res.id)
               {
                  this.model.item.jinglianId = _res.id;
                  playUpEff();
               }
               this.model.item.jinglianExp = _res.exp;
               _loc2_ = StcMgr.ins.getEquipJinglianVo(model.item.jinglianId).level;
               if(_loc2_ > this.lastLevel)
               {
                  times = _loc2_ - this.lastLevel;
                  process(false);
               }
               else
               {
                  preShowExp(false);
               }
               if(this.isAuto)
               {
                  if(BagModel.ins.getStcCount(_wealthVo.sid) <= 0)
                  {
                     this.isAuto = false;
                  }
                  else
                  {
                     this.iconFly();
                  }
               }
            }
            else
            {
               _loc1_ = Uint64Util.findItemByAttr(this.model.heroInfo.items,Item.ID.name,_res.equipId);
               if(_loc1_)
               {
                  if(_loc1_.jinglianId != _res.id)
                  {
                     playUpEff();
                  }
                  _loc1_.jinglianId = _res.id;
                  _loc1_.jinglianExp = _res.exp;
               }
            }
         }
      }
      
      private function process(param1:Boolean = true) : void
      {
         if(times > 0)
         {
            times = Number(times) - 1;
            if(param1)
            {
               this.progressBar.value = 0;
               TweenLite.to(this.progressBar,0.2,{
                  "value":1,
                  "onComplete":process
               });
            }
            else
            {
               TweenLite.to(this.progressBar,(1 - this.progressBar.value) * 0.2,{
                  "value":1,
                  "onComplete":process
               });
            }
         }
         else
         {
            preShowExp();
         }
      }
      
      private function preShowExp(param1:Boolean = true) : void
      {
         if(param1)
         {
            this.progressBar.value = 0;
         }
         showExp(model.item.jinglianExp,model.crtJingLianVO.need_exp,true,lvlUpComplete);
      }
      
      private function lvlUpComplete() : void
      {
         var _loc5_:int = StcMgr.ins.getEquipJinglianVo(model.item.jinglianId).level;
         countPreExp();
         var _loc3_:StcItemVo = StcMgr.ins.getItemVo(model.item.itemId);
         var _loc4_:uint = ColorLib.qualityColor(_loc3_.quality);
         var _loc2_:String = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(_loc3_.name),new TextFormat(null,null,_loc4_));
         if(_loc5_ > lastLevel)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30500016,[_loc2_,_loc5_]),DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,new Handler(floatCpl,[_loc5_ + "/" + Math.ceil(PlayerModel.ins.level / 2) + LocaleMgr.ins.getStr(999000495)]),DisplayUtils.globarCenter(this.txt_level),1);
            playUpEff();
         }
         var _loc1_:Array = NpcPropVo.parseArrStr(model.crtJingLianVO.add_growth,"+",DisplayUtils.globarCenter(this).add(new Point(0,-50)));
         this.list_prop.dataSource = _loc1_;
         this.list_prop.commitMeasure();
         if(showSkill && showSkillVo)
         {
            TweenLite.delayedCall(0.1,showSkillAlert);
         }
      }
      
      private function floatCpl(param1:*) : void
      {
         txt_level.text = param1;
         var _loc2_:Array = NpcPropVo.parseArrStr(model.nextJingLianVO.add_growth,"+");
         list_propNext.dataSource = _loc2_;
      }
      
      private function server_jinglianErr(param1:ProtocolStatusRes = null) : void
      {
         this.isAuto = false;
         ServerEngine.ins.doDefaultErr(param1);
         checkSelectItem();
      }
      
      private function checkSelectItem() : void
      {
      }
      
      private function getPreMaxExp() : int
      {
         return StcMgr.ins.getEquipJinglianVo(model.item.jinglianId).need_exp;
      }
      
      private function getAddedExp(param1:EquipJinglianRes, param2:Item) : int
      {
         var _loc3_:int = 0;
         if(param1.exp <= param2.jinglianExp)
         {
            _loc3_ = getPreMaxExp() - param2.jinglianExp + param1.exp;
         }
         else
         {
            _loc3_ = param1.exp - param2.jinglianExp;
         }
         return _loc3_;
      }
      
      public function show() : void
      {
         if(model.item)
         {
            renderHad.wealthVo = _wealthVo;
            showExp(model.item.jinglianExp,model.crtJingLianVO.need_exp);
            showPropAll();
            attrArr = StcMgr.ins.getVoArrByMultiColumnValue("static_equip_attr",["itemid","attr_kind"],[model.item.itemId,2]);
            refreshSkillBox();
         }
      }
      
      public function refreshSkillBox(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(attrArr.length > 0)
         {
            _loc2_ = StcMgr.ins.getEquipStrengthVo(model.item.jinglianId).level;
            if(param1 && _loc2_ >= next_value && last_level < next_value)
            {
               showSkill = true;
               showSkillVo = lastSkillVo;
            }
            var _loc5_:int = 0;
            var _loc4_:* = attrArr.sortOn("active_condi_value");
            for each(var _loc3_ in attrArr.sortOn("active_condi_value"))
            {
               if(_loc3_.active_condi_value > _loc2_ || attrArr.indexOf(_loc3_) == attrArr.length - 1)
               {
                  next_value = _loc3_.active_condi_value;
                  lastSkillVo = _loc3_;
                  this.label_require.text = LocaleMgr.ins.getStr(_loc3_.active_disc) + "：";
                  this.label_attr.text = "【" + LocaleMgr.ins.getStr(_loc3_.attr_name) + "】" + LocaleMgr.ins.getStr(_loc3_.attr_disc);
                  box_attr.visible = true;
                  break;
               }
            }
            last_level = _loc2_;
         }
         else
         {
            box_attr.visible = false;
         }
      }
      
      private function showPropAll() : void
      {
         showPropPanel(model.crtJingLianVO,model.nextJingLianVO);
         if(model.item.jinglianId)
         {
            if(App.language == "en")
            {
               txt_level.text = LocaleMgr.ins.getStr(999000495) + " " + StcMgr.ins.getEquipJinglianVo(model.item.jinglianId).level + "/" + Math.ceil(PlayerModel.ins.level / 2);
            }
            else
            {
               txt_level.text = StcMgr.ins.getEquipJinglianVo(model.item.jinglianId).level + "/" + Math.ceil(PlayerModel.ins.level / 2) + LocaleMgr.ins.getStr(999000495);
            }
         }
         showExp(model.item.jinglianExp,model.crtJingLianVO.need_exp);
      }
      
      private function showPropPanel(param1:StcEquipJinglianVo, param2:StcEquipJinglianVo) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = NaN;
         var _loc4_:Array = NpcPropVo.parseArrStr(param1.add_growth,"+");
         var _loc3_:Array = NpcPropVo.parseArrStr(param2.add_growth,"+");
         list_propNext.dataSource = _loc3_;
         if(_loc4_.length == 0)
         {
            var _loc9_:int = 0;
            var _loc8_:* = _loc3_;
            for each(var _loc7_ in _loc3_)
            {
               if(NumberUtil.isFloatNumber(_loc7_.value))
               {
                  _loc6_ = 0.001;
               }
               else
               {
                  _loc6_ = 0;
               }
               _loc5_ = new NpcPropVo(_loc7_.propId,_loc6_,_loc7_.preFix);
               _loc4_.push(_loc5_);
            }
         }
         list_prop.dataSource = _loc4_;
      }
      
      private function showExp(param1:Number, param2:int, param3:Boolean = false, param4:* = null) : void
      {
         curExp = param1;
         maxExp = param2;
         if(param3)
         {
            TweenLite.to(this.progressBar,param1 / param2 * 0.2,{
               "value":param1 / param2,
               "onComplete":param4
            });
         }
         else
         {
            progressBar.value = param1 / param2;
         }
         txt_progress.text = getExpString(param1,param2);
      }
      
      private function getExpString(param1:Number, param2:*) : String
      {
         if(!_wealthVo)
         {
            return param1.toString() + "/" + param2.toString();
         }
         return param1.toString() + TextFieldUtil.htmlText(" +" + getCanAwardExp(),new TextFormat(null,null,458496)) + "/" + param2.toString();
      }
      
      private function getCanAwardExp() : String
      {
         return _wealthVo.stcItemVo.extend_1;
      }
      
      private function countPreExp() : void
      {
         var _loc1_:int = 0;
         if(_wealthVo != null && maxExp > 0)
         {
            _loc1_ = _wealthVo.stcItemVo.extend_1;
            if(curExp + _loc1_ < maxExp)
            {
               this.pgBarPreEff.preValue = (curExp + _loc1_) / maxExp;
               txt_levelPre.visible = false;
               flickerTxtExpPre.pause();
            }
            else
            {
               this.pgBarPreEff.preValue = 1;
               txt_levelPre.visible = true;
               txt_levelPre.text = "+" + model.canLevelUpNum(_loc1_,model.crtJingLianVO.id,true);
               flickerTxtExpPre.resume();
            }
         }
         else
         {
            this.pgBarPreEff.preValue = 0;
            flickerTxtExpPre.pause();
            txt_levelPre.visible = false;
         }
      }
      
      public function set modelRef(param1:EquipGrowModel) : void
      {
         this.model = param1;
      }
      
      public function getFocusNotices() : Array
      {
         return null;
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
      }
      
      public function updateLiansuoLvl() : void
      {
         if(model.heroInfo && model.heroInfo.baseInfo)
         {
            lianSuoLvl.tweenValue = model.heroInfo.baseInfo.jinglianLSLv;
         }
      }
      
      public function set weaoponRef(param1:Object) : void
      {
         weapon = param1;
      }
      
      override public function fadeView_fadeInCpl() : void
      {
         super.fadeView_fadeInCpl();
         NGUtil.checkModuleShow(30501,ModuleMgr.ins.popLayer.getModule(30500));
      }
      
      override public function dispose() : void
      {
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
         TweenLite.killTweensOf(TweenLite);
         TweenLite.killDelayedCallsTo(server_sendJinglian);
         stage_onMouseUp();
         super.dispose();
      }
      
      public function get liansuoTxt() : ClipList
      {
         return this.lianSuoLvl;
      }
   }
}
