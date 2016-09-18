package nslm2.modules.cultivates.treasure.view
{
   import game.ui.treasures.keyin.TreasureKeyinPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.cultivates.equipGrows.jinglians.ProgressBarPreFlickerEffCtrl;
   import nslm2.modules.scenes.commons.UIWeapon3D;
   import nslm2.common.compsEffects.ProgressBarAddEffect;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.foundations.recycle.view.render.RecycleAlertRender;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.components.ClipList;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuKeyinVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.bag.itemModuels.BagModel;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.skins.ColorLib;
   import proto.BaoWuBuff;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.cultivates.treasure.service.TreasureService;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import proto.BaoWuKeyinRes;
   import com.greensock.TweenLite;
   import proto.BaoWu;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import nslm2.utils.ProtoUtils;
   import morn.core.handlers.Handler;
   import nslm2.modules.cultivates.equipGrows.jinglians.ComponentFlickerEff;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.common.ctrls.ProgressBarCtrl;
   
   public class TreasureKeyinPanel extends TreasureKeyinPanelUI implements IViewStackPage, ITreasurePanel, IObserver
   {
       
      
      private var model:TreasureModel;
      
      private var pgBarPreEff:ProgressBarPreFlickerEffCtrl;
      
      private var weapon:UIWeapon3D;
      
      private var _barEffect:ProgressBarAddEffect;
      
      private var costVo:WealthVo;
      
      private var _weapon:UIWeapon3D;
      
      private var equipEff:BmcSpriteSheet;
      
      private var costNum:int;
      
      private var starUpEff:BmcSpriteSheet;
      
      public function TreasureKeyinPanel()
      {
         model = TreasureModel.ins;
         super();
         pgBarPreEff = new ProgressBarPreFlickerEffCtrl(this.progressBar);
         parts.push(pgBarPreEff);
         btn_autoKeyin.toolTip = LocaleMgr.ins.getStr(30609009);
         this.parts.push(new ProgressBarCtrl(this.progressBar));
         btn_autoKeyin.clickHandler = autoKeyin;
         btn_keyin.clickHandler = doKeyin;
      }
      
      public function viewStackIn() : void
      {
         visible = true;
         this.visible = true;
         this.fadeIn();
         this.render_recycle.dataSource = 30600;
         (this.render_recycle as RecycleAlertRender).autoHide();
         ObserverMgr.ins.regObserver(this);
      }
      
      public function viewStackOut() : void
      {
         visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
      
      public function get liansuoTxt() : ClipList
      {
         return null;
      }
      
      public function show() : void
      {
         if(model.selectedTreasure)
         {
            if(StcMgr.ins.getItemVo(model.selectedTreasure.baseId).quality >= 5)
            {
               updateTreasureName();
               updateProgressBar();
               updateRandomProp();
               updateAddedProp();
               updateStars();
               setBtnEnable(true);
               updateCost();
               box_notavail.visible = false;
               box_operation.visible = true;
               if(_weapon)
               {
                  _weapon.visible = true;
               }
               if(model.selectedTreasure.keyin == 10)
               {
                  setBtnEnable(false);
                  txt_maxStar.visible = true;
                  box_cost.visible = false;
                  progressBar.visible = false;
                  list_propNext.visible = false;
                  txtStaticNextProp.visible = false;
                  bgNextProp.visible = false;
               }
               else
               {
                  txt_maxStar.visible = false;
                  box_cost.visible = true;
                  progressBar.visible = true;
                  list_propNext.visible = true;
                  txtStaticNextProp.visible = true;
                  bgNextProp.visible = true;
               }
            }
            else
            {
               updateTreasureName();
               box_operation.visible = false;
               box_notavail.visible = true;
               if(_weapon)
               {
                  _weapon.visible = false;
               }
            }
         }
      }
      
      private function updateCost() : void
      {
         var _loc1_:StcBaowuKeyinVo = model.currentKeyinVo;
         costRender.showMultipleSign = true;
         costVo = WealthUtil.parseCostStr(_loc1_.cost).set_useMiniIcon(2);
         costRender.dataSource = WealthUtil.parseCostStr(_loc1_.cost).set_useMiniIcon(2);
         txt_has.text = LocaleMgr.ins.getStr(30609006,[BagModel.ins.getStcCount(costVo.sid)]);
      }
      
      private function updateAddedProp() : void
      {
         var _loc9_:* = null;
         var _loc1_:Number = NaN;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc3_:StcBaowuKeyinVo = StcMgr.ins.getVoByMultiColumnValue("static_baowu_keyin",["level","itemid"],[model.selectedTreasure.keyin,model.selectedTreasure.baseId]);
         var _loc2_:Array = [];
         var _loc7_:Array = list_prop.dataSource as Array;
         var _loc6_:int = _loc7_.length;
         if(_loc3_)
         {
            _loc8_ = _loc3_.add_attr.split("|");
            var _loc11_:int = 0;
            var _loc10_:* = _loc8_;
            for each(_loc4_ in _loc8_)
            {
               _loc9_ = new NpcPropVo(_loc4_.split(":")[0],_loc4_.split(":")[1],"+");
               _loc2_.push(_loc9_);
            }
         }
         _loc3_ = StcMgr.ins.getVoByMultiColumnValue("static_baowu_keyin",["level","itemid"],[model.selectedTreasure.keyin + 1,model.selectedTreasure.baseId]);
         var _loc5_:Array = [];
         if(_loc3_)
         {
            _loc8_ = _loc3_.add_attr.split("|");
            var _loc13_:int = 0;
            var _loc12_:* = _loc8_;
            for each(_loc4_ in _loc8_)
            {
               _loc9_ = new NpcPropVo(_loc4_.split(":")[0],_loc4_.split(":")[1],"+");
               _loc9_.showArrow = true;
               _loc5_.push(_loc9_);
            }
         }
         list_prop.dataSource = _loc2_;
         list_propNext.dataSource = _loc5_;
      }
      
      private function updateStars() : void
      {
         list_stars.dataSource = TreasureModel.getStarLightArray(model.selectedTreasure.keyin);
      }
      
      private function updateTreasureName() : void
      {
         var _loc1_:StcItemVo = model.selectedTreasureItemVo;
         txt_treasureName.color = ColorLib.qualityColor(_loc1_.quality);
         txt_treasureName.text = LocaleMgr.ins.getStr(_loc1_.name);
         txt_treasureName.text = LocaleMgr.ins.getStr(_loc1_.name) + " +" + model.selectedTreasure.level;
      }
      
      private function updateRandomProp() : void
      {
         var _loc1_:* = null;
         var _loc2_:Number = NaN;
         var _loc4_:* = null;
         if(model.selectedTreasure)
         {
            _loc1_ = NpcPropVo.parseFightProp(model.selectedTreasure.random,"+",1);
            if(model.selectedTreasure.buff)
            {
               var _loc6_:int = 0;
               var _loc5_:* = model.selectedTreasure.buff;
               for each(var _loc3_ in model.selectedTreasure.buff)
               {
                  _loc2_ = _loc3_.value;
                  _loc4_ = new NpcPropVo(0,0,"+",null,1);
                  _loc4_.propId = _loc3_.id;
                  _loc4_.value = _loc2_;
                  _loc1_.push(_loc4_);
               }
            }
            list_prop.repeatY = _loc1_.length;
            list_prop.dataSource = _loc1_;
         }
      }
      
      private function getPorpListByStar(param1:uint) : Array
      {
         var _loc2_:Array = [];
         return _loc2_;
      }
      
      private function setBtnEnable(param1:Boolean) : void
      {
         var _loc2_:* = !param1;
         btn_autoKeyin.disabled = _loc2_;
         btn_keyin.disabled = _loc2_;
      }
      
      private function updateProgressBar() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         if(model.selectedTreasure)
         {
            _loc2_ = model.currentKeyinVo;
            if(_loc2_)
            {
               _loc1_ = Uint64Util.toNumber(model.selectedTreasure.keyinExp);
               txt_progress.text = _loc1_ + "/" + _loc2_.exp;
               if(_loc2_.exp > 0)
               {
                  progressBar.value = Uint64Util.toNumber(model.selectedTreasure.keyinExp) / _loc2_.exp;
               }
               else
               {
                  progressBar.value = 1;
               }
            }
         }
      }
      
      private function doKeyin() : void
      {
         costNum = 0;
         if(costVo.count > BagModel.ins.getStcCount(costVo.sid))
         {
            AlertUtil.lackItem(costVo);
         }
         else
         {
            model.preBwData = model.selectedTreasure;
            TreasureService.ins.baoWuKeyin(model.selectedHeroInfo.baseInfo.id,model.selectedTreasure.id,keyinSuccessHandler);
         }
      }
      
      private function autoKeyin() : void
      {
         costNum = 0;
         if(costVo.count > BagModel.ins.getStcCount(costVo.sid))
         {
            AlertUtil.lackItem(costVo);
         }
         else
         {
            model.preBwData = model.selectedTreasure;
            TreasureService.ins.baoWuKeyin(model.selectedHeroInfo.baseInfo.id,model.selectedTreasure.id,keyinSuccessHandler,2);
         }
      }
      
      private function keyinSuccessHandler(param1:BaoWuKeyinRes) : void
      {
         costNum = param1.cost;
         setBtnEnable(false);
         if(!equipEff)
         {
            equipEff = new BmcSpriteSheet();
            equipEff.init(10170002);
            equipEff.x = 30;
            addChild(equipEff);
         }
         else
         {
            equipEff.init(10170002);
         }
         showEffect(param1.info);
      }
      
      private function playStarUpEff(param1:int) : void
      {
         if(!starUpEff)
         {
            starUpEff = new BmcSpriteSheet();
            starUpEff.init(10170001,1,"all",false,1,0,null,true);
            box_operation.addChild(starUpEff);
         }
         else
         {
            starUpEff.init(10170001,1,"all",false,1,0,null,true);
         }
         starUpEff.x = this.list_stars.x + 38 * (param1 - 1) + 13;
         starUpEff.y = this.list_stars.y + 72;
         TweenLite.delayedCall(0.5,show);
         TweenLite.delayedCall(0.5,showLvlUpTip);
      }
      
      private function showEffect(param1:BaoWu) : void
      {
         showAddExpTips(param1);
      }
      
      private function showAddExpTips(param1:BaoWu) : void
      {
         var _loc5_:int = 0;
         var _loc4_:int = param1.keyin - model.preBwData.keyin;
         var _loc3_:int = Uint64Util.toInt(param1.keyinExp) - Uint64Util.toInt(model.preBwData.keyinExp);
         if(_loc4_)
         {
            _loc5_ = StcMgr.ins.getVoByColumnValue("static_baowu_keyin","level",model.preBwData.keyin).exp;
            _loc3_ = Uint64Util.toInt(param1.keyinExp) + _loc5_ - Uint64Util.toInt(model.preBwData.keyinExp);
         }
         else
         {
            _loc3_ = Uint64Util.toInt(param1.keyinExp) - Uint64Util.toInt(model.preBwData.keyinExp);
         }
         var _loc2_:String = LocaleMgr.ins.getStr(30609017,[costNum,_loc3_]);
         AlertUtil.float(_loc2_,DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,50)),-1,null,null,0);
         playProgressBarEff(param1,model.preBwData.keyin,param1.keyin > model.preBwData.keyin);
         ProtoUtils.copyParams(param1,model.selectedTreasure);
      }
      
      private function playProgressBarEff(param1:BaoWu, param2:int, param3:Boolean) : void
      {
         _barEffect = new ProgressBarAddEffect(this.progressBar,getEndValue(Uint64Util.toInt(param1.keyinExp),param1.keyin,param2),null,null,new Handler(perEffectOver,[param1,param3])).setTweenTime(0.4);
         _barEffect.startAnim();
      }
      
      private function getEndValue(param1:int, param2:int, param3:int) : Number
      {
         if(model.currentKeyinVo.exp > 0)
         {
            return param1 / model.currentKeyinVo.exp + param2 - param3;
         }
         return param2 - param3;
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
            playStarUpEff(model.selectedTreasure.keyin);
         }
         else
         {
            show();
         }
         ObserverMgr.ins.sendNotice("treasure_freeze_selector",true);
      }
      
      private function showLvlUpTip() : void
      {
         var _loc3_:StcItemVo = model.selectedTreasureItemVo;
         if(!_loc3_)
         {
            return;
         }
         var _loc2_:String = TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(_loc3_.name),ColorLib.qualityColor(_loc3_.quality));
         var _loc1_:String = LocaleMgr.ins.getStr(30609010,[_loc2_,model.selectedTreasure.keyin]);
         AlertUtil.float(_loc1_,DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50)),-1,showTextTipCpl,null,1);
      }
      
      private function showTextTipCpl() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         this.show();
      }
      
      private function setFloatPos(param1:NpcPropVo, param2:int, param3:Array) : void
      {
         param1.floatPos = DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50));
      }
      
      public function updateLiansuoLvl() : void
      {
      }
      
      public function set weaoponRef(param1:Object) : void
      {
         _weapon = param1 as UIWeapon3D;
         if(!_weapon)
         {
            return;
         }
         if(model.selectedTreasure && StcMgr.ins.getItemVo(model.selectedTreasure.baseId).quality >= 5)
         {
            _weapon.visible = true;
         }
         else
         {
            _weapon.visible = false;
         }
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(show);
         TweenLite.killDelayedCallsTo(showLvlUpTip);
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_item_num_change"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msg_item_num_change" === _loc3_)
         {
            if(costVo.itemId == param2.itemId)
            {
               updateCost();
            }
         }
      }
   }
}
