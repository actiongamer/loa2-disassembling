package nslm2.modules.cultivates.equipGrows.strens
{
   import game.ui.equipGrows.strens.EquipStrenPanelUI;
   import nslm2.modules.cultivates.equipGrows.commons.IEquipGrowSubPanel;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.common.ui.components.comps2d.others.TaskAlertRenderS2;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.foundations.FloatBubbleUtil;
   import nslm2.modules.scenes.commons.UIWeapon3D;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.cultivates.equipGrows.EquipGrowModel;
   import flash.geom.Point;
   import morn.core.components.Label;
   import nslm2.mgrs.stcMgrs.vos.StcEquipAttrVo;
   import nslm2.common.uiEffects.ImgScaleEff;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.tooltipsModules.ToolTipLianSuoVo;
   import nslm2.utils.WealthUtil;
   import flash.display.DisplayObject;
   import com.greensock.TweenLite;
   import morn.core.components.Button;
   import proto.EquipStrengthReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ProtocolStatusRes;
   import proto.EquipStrengthRes;
   import nslm2.utils.Uint64Util;
   import proto.Item;
   import nslm2.mgrs.SoundMgr;
   import com.mz.core.utils2.ShakeUtil;
   import com.mz.core.utils.DisplayUtils;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.TextFieldUtil;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import morn.customs.components.ClipList;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   
   public class EquipStrenPanel extends EquipStrenPanelUI implements IEquipGrowSubPanel, IObserver, IViewStackPage
   {
       
      
      private var _taskAlertRender:TaskAlertRenderS2;
      
      private var weapon:UIWeapon3D;
      
      private var weapon2D:BmcSpriteSheet;
      
      public var model:EquipGrowModel;
      
      private var successEff:BmcSpriteSheet;
      
      private var critEff:BmcSpriteSheet;
      
      private var hammerEff:BmcSpriteSheet;
      
      private var tipPos:Point;
      
      private var selectedStrengthCnt:int = 1;
      
      private var txt_EquipName:Label;
      
      private var attrArr:Array;
      
      private var next_value:Number;
      
      private var showSkill:Boolean;
      
      private var last_level:int;
      
      private var lastSkillVo:StcEquipAttrVo;
      
      private var showSkillVo:StcEquipAttrVo;
      
      private var critScaleEff:ImgScaleEff;
      
      public function EquipStrenPanel()
      {
         model = EquipGrowModel.ins;
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         addListener();
         liansuoArea.toolTip = getToolTip;
         liansuoArea.addEventListener("click",liansuoClickHandler);
         BmcSpriteSheet.preload(new <int>[5001]);
         nowLvlRender.txt_name.text = LocaleMgr.ins.getStr(10220002);
         newLvlRender.txt_name.text = LocaleMgr.ins.getStr(30500009);
         nowLvlRender.toolTip = LocaleMgr.ins.getStr(30500018);
         this.parts.push(new FloatUpDownEffCtrl().init(this.box_upArrow,NaN,2,1));
         DisplayUtils.addChildFromGlobal(btn_strenOnce,img_btn2);
         DisplayUtils.addChildFromGlobal(btn_strenFive,img_btn1);
         critScaleEff = new ImgScaleEff(lCritImg);
         this.label_title.text = LocaleMgr.ins.getStr(10220012);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.fadeIn();
         if(NGUtil.checkModuleShow(30500,this) == false)
         {
            if(NGUtil.isCurFuncId(30500) == false && FloatBubbleUtil.needShow(1140))
            {
               if(_taskAlertRender == null)
               {
                  _taskAlertRender = new TaskAlertRenderS2();
                  _taskAlertRender.show(1140);
                  _taskAlertRender.x = 356;
                  _taskAlertRender.y = 4;
               }
               FloatBubbleUtil.addOneTime(1140.toString());
               this.label_perc.addChild(_taskAlertRender);
            }
            else if(_taskAlertRender)
            {
               _taskAlertRender.dispose();
               _taskAlertRender = null;
            }
         }
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         if(_taskAlertRender)
         {
            _taskAlertRender.dispose();
            _taskAlertRender = null;
         }
      }
      
      protected function liansuoClickHandler(param1:MouseEvent) : void
      {
         if(model.heroInfo.items.length < 4)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30100050));
            return;
         }
         ModuleMgr.ins.showModule(30811,0,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function getToolTip() : ToolTipLianSuoVo
      {
         var _loc1_:* = null;
         if(model.heroInfo)
         {
            _loc1_ = new ToolTipLianSuoVo();
            _loc1_.kind = 1;
            _loc1_.level = model.heroInfo.baseInfo.strengthLSlv;
            _loc1_.lackEquip = model.heroInfo.items.length < 4;
         }
         return _loc1_;
      }
      
      protected function onBtnOut(param1:MouseEvent) : void
      {
         costRenderer.dataSource = WealthUtil.needVo(1,0,model.caculateStrengthCost());
         if(param1.target == btn_strenFive)
         {
            selectedStrengthCnt = 1;
            refreshNextPropAndCost();
            tweenTheCostRender();
         }
         if(weapon)
         {
            (weapon as UIWeapon3D).restartRotate();
         }
         if(weapon2D)
         {
            weapon2D.gotoAndPlay(1);
         }
      }
      
      protected function onBtnOver(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         var _loc3_:* = _loc2_;
         if(box_btn_1 !== _loc3_)
         {
            if(box_btn_2 === _loc3_)
            {
               selectedStrengthCnt = 1;
               tweenTheCostRender();
               resetWeapon();
               refreshNextPropAndCost();
            }
         }
         else
         {
            selectedStrengthCnt = 1;
            resetWeapon();
         }
      }
      
      private function resetWeapon() : void
      {
         if(weapon)
         {
            weapon.reset();
         }
         if(weapon2D)
         {
            weapon2D.gotoAndStop(1);
         }
      }
      
      private function refreshNextPropAndCost() : void
      {
         newLvlRender.txt_value.text = model.getNewStrenLvl(selectedStrengthCnt) + "/" + model.maxStrenLvl;
         list_AddProp.dataSource = model.getAddedPropList(selectedStrengthCnt);
         this.refreshNextCost();
      }
      
      private function refreshNextCost() : void
      {
         costRenderer.dataSource = WealthUtil.needVo(1,0,model.caculateStrengthCost(selectedStrengthCnt));
      }
      
      private function tweenTheCostRender() : void
      {
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if(btn_strenFive !== _loc4_)
         {
            if(btn_strenOnce === _loc4_)
            {
               this.btnEnableAll(false);
               _loc3_ = new EquipStrengthReq();
               _loc3_.heroId = model.heroInfo.baseInfo.id;
               _loc3_.equipId = model.item.id;
               _loc3_.count = 1;
               ServerEngine.ins.send(8100,_loc3_,server_stren,server_strenErr);
            }
         }
         else
         {
            this.btnEnableAll(false);
            _loc3_ = new EquipStrengthReq();
            _loc3_.heroId = model.heroInfo.baseInfo.id;
            _loc3_.equipId = model.item.id;
            _loc3_.count = 5;
            ServerEngine.ins.send(8100,_loc3_,server_stren,server_strenErr);
         }
      }
      
      private function setBtnEnableAll() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         btnEnableAll(true);
      }
      
      private function btnEnableAll(param1:Boolean) : void
      {
         this.btn_strenFive.disabled = !param1;
         this.btn_strenOnce.disabled = !param1;
      }
      
      private function server_strenErr(param1:ProtocolStatusRes = null) : void
      {
         btnEnableAll(true);
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      private function server_stren(param1:EquipStrengthRes = null) : void
      {
         var _loc2_:* = null;
         if(Uint64Util.equal(this.model.heroInfo.baseInfo.id,param1.heroId))
         {
            if(Uint64Util.equal(this.model.item.id,param1.equipId))
            {
               this.model.item.strengthId = param1.strnId;
               if(model.item)
               {
                  this.refreshNextCost();
               }
               TweenLite.delayedCall(0.7,showTextTips,[param1]);
            }
            else
            {
               _loc2_ = Uint64Util.findItemByAttr(this.model.heroInfo.items,Item.ID.name,param1.equipId);
               if(_loc2_)
               {
                  _loc2_.strengthId = param1.strnId;
               }
            }
            hammerEff = new BmcSpriteSheet();
            hammerEff.x = 207;
            hammerEff.y = -170;
            hammerEff.init(5007);
            addChild(hammerEff);
            TweenLite.delayedCall(0.4,addSparkEffect);
            TweenLite.killDelayedCallsTo(setBtnEnableAll);
            TweenLite.delayedCall(0.8,setBtnEnableAll);
         }
         FloatBubbleUtil.checkEquipNotStrengthed();
         refreshSkillBox(true);
      }
      
      private function addSparkEffect() : void
      {
         SoundMgr.ins.playTexiaoSound("zhuangBeiQiangHua");
         successEff = new BmcSpriteSheet();
         successEff.x = 107;
         successEff.y = 16;
         successEff.init(5001);
         addChild(successEff);
         doShakeEffect();
      }
      
      private function doShakeEffect() : void
      {
         if(weapon)
         {
            ShakeUtil.shake(false,weapon,0,6,15,40);
         }
         if(weapon2D)
         {
            ShakeUtil.shake(false,weapon2D,0,6,15,40);
         }
      }
      
      private function showTextTips(param1:EquipStrengthRes) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(param1.strnCount == 1)
         {
            _loc3_ = LocaleMgr.ins.getStr(30500010,[param1.strnCount + param1.critCount]);
         }
         else if(param1.critCount)
         {
            _loc3_ = LocaleMgr.ins.getStr(30500012,[param1.strnCount,param1.critCount,param1.strnCount + param1.critCount]);
         }
         else
         {
            _loc3_ = LocaleMgr.ins.getStr(30500013,[param1.strnCount,param1.strnCount]);
         }
         if(param1.critCount)
         {
            critScaleEff.exec();
            SoundMgr.ins.playTexiaoSound("zhuangBeiQiangHuaBaoJi");
         }
         AlertUtil.float(_loc3_,DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,new Handler(showTextTipCpl,[model.itemCrtStrLvl]),DisplayUtils.globarCenter(nowLvlRender.ref_txt_value),1);
         if(model.item)
         {
            _loc2_ = model.crtEuipStrPropList;
            _loc2_.forEach(setFloatPos);
            list_prop.dataSource = _loc2_;
         }
         if(showSkill && showSkillVo)
         {
            TweenLite.delayedCall(0.1,showSkillAlert);
         }
      }
      
      private function showSkillAlert() : void
      {
         AlertUtil.float(TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(showSkillVo.attr_name),458496) + TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(30200013),16773888),DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,null,DisplayUtils.globarCenter(nowLvlRender.ref_txt_value),1);
         AlertUtil.float(TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(showSkillVo.attr_disc),458496,19),DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,null,DisplayUtils.globarCenter(nowLvlRender.ref_txt_value),1);
         showSkill = false;
      }
      
      private function setFloatPos(param1:NpcPropVo, param2:int, param3:Array) : void
      {
         param1.floatPos = DisplayUtils.globarCenter(this).add(new Point(0,-50));
      }
      
      private function showTextTipCpl(param1:int) : void
      {
         if(this.isDisposed)
         {
            return;
         }
         nowLvlRender.txt_value.text = param1 + "/" + model.maxStrenLvl;
         refreshNextPropAndCost();
         return;
         §§push(new FloatZoomInEffCtrl(nowLvlRender.ref_txt_value,1));
      }
      
      private function tipTweenComplete(param1:DisplayObject) : void
      {
         param1.parent.removeChild(param1);
         param1 = null;
      }
      
      public function show() : void
      {
         if(model.item)
         {
            list_prop.dataSource = model.crtEuipStrPropList;
            nowLvlRender.txt_value.text = model.itemCrtStrLvl + "/" + model.maxStrenLvl;
            refreshNextPropAndCost();
            this.label_perc.text = LocaleMgr.ins.getStr(30100348,[VipModel.ins.getVipValue(10060) * 100]);
            addChild(new VipHintBox(10060,252,label_perc.y - 2));
            attrArr = StcMgr.ins.getVoArrByMultiColumnValue("static_equip_attr",["itemid","attr_kind"],[model.item.itemId,1]);
            refreshSkillBox();
         }
      }
      
      public function refreshSkillBox(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(attrArr.length > 0)
         {
            _loc2_ = StcMgr.ins.getEquipStrengthVo(model.item.strengthId).level;
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
      
      private function addListener() : void
      {
         box_btn_1.addEventListener("rollOver",onBtnOver);
         box_btn_2.addEventListener("rollOver",onBtnOver);
         box_btn_1.addEventListener("rollOut",onBtnOut);
         box_btn_2.addEventListener("rollOut",onBtnOut);
      }
      
      private function removeListener() : void
      {
         box_btn_1.removeEventListener("rollOver",onBtnOver);
         box_btn_2.removeEventListener("rollOver",onBtnOver);
         box_btn_1.removeEventListener("rollOut",onBtnOut);
         box_btn_2.removeEventListener("rollOut",onBtnOut);
      }
      
      public function updateLiansuoLvl() : void
      {
         if(model.heroInfo && model.heroInfo.baseInfo)
         {
            lianSuoLvl.tweenValue = model.heroInfo.baseInfo.strengthLSlv;
         }
      }
      
      public function set weaoponRef(param1:Object) : void
      {
         weapon = param1 as UIWeapon3D;
      }
      
      private function refreshCost(param1:int) : void
      {
         costRenderer.dataSource = WealthUtil.needVo(1,0,model.caculateStrengthCost(param1));
      }
      
      public function getFocusNotices() : Array
      {
         return null;
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
      }
      
      override public function dispose() : void
      {
         removeListener();
         super.dispose();
      }
      
      public function set equipNameTxt(param1:Label) : void
      {
         txt_EquipName = param1;
      }
      
      public function get liansuoTxt() : ClipList
      {
         return this.lianSuoLvl;
      }
   }
}
