package nslm2.modules.cultivates.treasure.view
{
   import game.ui.treasures.fuwen.TreasureFuwenKeyinPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.cultivates.equipGrows.jinglians.ProgressBarPreFlickerEffCtrl;
   import nslm2.common.compsEffects.ProgressBarAddEffect;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.scenes.commons.UIWeapon3D;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import proto.BaoWuKeyinRes;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.cultivates.treasure.service.TreasureService;
   import proto.BaoWu;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import nslm2.utils.ProtoUtils;
   import morn.core.handlers.Handler;
   import nslm2.modules.cultivates.equipGrows.jinglians.ComponentFlickerEff;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.ColorLib;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.components.ClipList;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuFuwenKeyinVo;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import nslm2.common.ctrls.ProgressBarCtrl;
   import nslm2.modules.footstones.tooltipsModules.TooltipUtils;
   
   public class TreasureFuwenKeyinPanel extends TreasureFuwenKeyinPanelUI implements IViewStackPage, ITreasurePanel, IObserver
   {
       
      
      private var model:TreasureModel;
      
      private var pgBarPreEff:ProgressBarPreFlickerEffCtrl;
      
      private var _barEffect:ProgressBarAddEffect;
      
      private var costVo:WealthVo;
      
      private var _weapon:UIWeapon3D;
      
      private var equipEff:BmcSpriteSheet;
      
      private var costNum:int;
      
      private var starUpEff:BmcSpriteSheet;
      
      public function TreasureFuwenKeyinPanel()
      {
         model = TreasureModel.ins;
         super();
         this.parts.push(new FloatUpDownEffCtrl().config(0.4).init(this.list_up,this.list_up.y,2,2));
         pgBarPreEff = new ProgressBarPreFlickerEffCtrl(this.progressBar);
         parts.push(pgBarPreEff);
         this.parts.push(new ProgressBarCtrl(this.progressBar));
         btn_autoKeyin.clickHandler = autoKeyin;
         btn_keyin.clickHandler = doKeyin;
         btn_shengjie.clickHandler = doKeyin;
         txt_rule.toolTip = LocaleMgr.ins.getStr(30616012);
         txt_rule.mouseEnabled = true;
         txt_rule.buttonMode = true;
         txt_rule.mouseChildren = false;
         TooltipUtils.preventHideByMouseDown(txt_rule);
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
         if(model.preBwData && model.preBwData.fuwenkeyin % 10 == 9)
         {
            TweenLite.delayedCall(1,showCpl);
         }
         showEffect(param1.info);
      }
      
      private function showCpl() : void
      {
         ModuleMgr.ins.showModule(30617,model.preBwData,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function doKeyin() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = WealthUtil.parseCostStrToArr(model.currentFuwenKeyinVo.cost);
         for each(var _loc1_ in WealthUtil.parseCostStrToArr(model.currentFuwenKeyinVo.cost))
         {
            if(_loc1_.count > BagModel.ins.getStcCount(_loc1_.sid))
            {
               AlertUtil.lackItem(_loc1_);
               return;
            }
         }
         model.preBwData = model.selectedTreasure;
         TreasureService.ins.baoWuFuwenKeyin(model.selectedHeroInfo.baseInfo.id,model.selectedTreasure.id,keyinSuccessHandler);
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
            TreasureService.ins.baoWuFuwenKeyin(model.selectedHeroInfo.baseInfo.id,model.selectedTreasure.id,keyinSuccessHandler,2);
         }
      }
      
      private function showEffect(param1:BaoWu) : void
      {
         showAddExpTips(param1);
      }
      
      private function showAddExpTips(param1:BaoWu) : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:int = param1.fuwenkeyin - model.preBwData.fuwenkeyin;
         var _loc3_:int = Uint64Util.toInt(param1.fuwenkeyinExp) - Uint64Util.toInt(model.preBwData.fuwenkeyinExp);
         if(_loc4_)
         {
            _loc5_ = StcMgr.ins.getVoByColumnValue("static_baowu_fuwen_keyin","level",model.preBwData.fuwenkeyin).exp;
            _loc3_ = Uint64Util.toInt(param1.fuwenkeyinExp) + _loc5_ - Uint64Util.toInt(model.preBwData.fuwenkeyinExp);
         }
         else
         {
            _loc3_ = Uint64Util.toInt(param1.fuwenkeyinExp) - Uint64Util.toInt(model.preBwData.fuwenkeyinExp);
         }
         if(model.preBwData.fuwenkeyin % 10 != 9)
         {
            _loc2_ = LocaleMgr.ins.getStr(30609017,[costNum,_loc3_]);
            AlertUtil.float(_loc2_,DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,50)),-1,null,null,0);
         }
         playProgressBarEff(param1,model.preBwData.fuwenkeyin,param1.fuwenkeyin > model.preBwData.fuwenkeyin);
         ProtoUtils.copyParams(param1,model.selectedTreasure);
      }
      
      private function playProgressBarEff(param1:BaoWu, param2:int, param3:Boolean) : void
      {
         _barEffect = new ProgressBarAddEffect(this.progressBar,getEndValue(Uint64Util.toInt(param1.fuwenkeyinExp),param1.fuwenkeyin,param2),null,null,new Handler(perEffectOver,[param1,param3])).setTweenTime(0.4);
         _barEffect.startAnim();
      }
      
      private function getEndValue(param1:int, param2:int, param3:int) : Number
      {
         if(model.currentFuwenKeyinVo.exp > 0)
         {
            return param1 / model.currentFuwenKeyinVo.exp + param2 - param3;
         }
         return param2 - param3;
      }
      
      private function perEffectOver(param1:BaoWu, param2:Boolean) : void
      {
         new ComponentFlickerEff(progressBar).showLight();
         showLvlUpTextTips(param2);
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
         starUpEff.x = this.list_stars.x + 32 * (param1 - 1) - 49 - 16;
         starUpEff.y = this.list_stars.y - 50;
         starUpEff.scale = 0.7;
         TweenLite.delayedCall(0.5,show);
         TweenLite.delayedCall(0.5,showLvlUpTip);
      }
      
      private function showLvlUpTip() : void
      {
         var _loc3_:StcItemVo = model.selectedTreasureItemVo;
         if(!_loc3_)
         {
            return;
         }
         var _loc2_:String = TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(_loc3_.name),ColorLib.qualityColor(_loc3_.quality));
         var _loc1_:String = LocaleMgr.ins.getStr(30616018,[_loc2_,int(model.selectedTreasure.fuwenkeyin / 10),model.selectedTreasure.fuwenkeyin % 10]);
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
      
      private function showLvlUpTextTips(param1:Boolean) : void
      {
         if(param1 && model.preBwData && model.preBwData.fuwenkeyin % 10 != 9)
         {
            playStarUpEff(model.selectedTreasure.fuwenkeyin % 10 == 0?10:Number(model.selectedTreasure.fuwenkeyin % 10));
         }
         else
         {
            show();
         }
         ObserverMgr.ins.sendNotice("treasure_freeze_selector",true);
      }
      
      public function viewStackIn() : void
      {
         visible = true;
         this.visible = true;
         this.fadeIn();
         ObserverMgr.ins.regObserver(this);
      }
      
      public function get liansuoTxt() : ClipList
      {
         return null;
      }
      
      public function viewStackOut() : void
      {
         visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
      
      public function getFocusNotices() : Array
      {
         return [];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
      }
      
      public function show() : void
      {
         if(model.selectedTreasure)
         {
            if(StcMgr.ins.getItemVo(model.selectedTreasure.baseId).quality >= 5)
            {
               updateTreasureName();
               updateProgressBar();
               updateStars();
               updateRandomProp();
               setBtnEnable(true);
               updateCost();
               box_notavail.visible = false;
               box_operation.visible = true;
               if(_weapon)
               {
                  _weapon.visible = true;
               }
               if(toMaxLevel())
               {
                  setBtnEnable(false);
                  txt_maxStar.visible = true;
                  box_cost.visible = false;
               }
               else
               {
                  txt_maxStar.visible = false;
                  box_cost.visible = true;
               }
               if(model.selectedTreasure.fuwenkeyin % 10 == 9)
               {
                  box_shengjie.visible = true;
                  box_bottom.visible = false;
               }
               else
               {
                  box_shengjie.visible = false;
                  box_bottom.visible = true;
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
      
      private function setBtnEnable(param1:Boolean) : void
      {
         var _loc2_:* = !param1;
         btn_autoKeyin.disabled = _loc2_;
         btn_keyin.disabled = _loc2_;
      }
      
      private function updateStars() : void
      {
         list_stars.dataSource = TreasureModel.getStarLightArray(model.selectedTreasure.fuwenkeyin % 10);
      }
      
      private function updateTreasureName() : void
      {
         var _loc1_:StcItemVo = model.selectedTreasureItemVo;
         txt_treasureName.color = ColorLib.qualityColor(_loc1_.quality);
         txt_treasureName.text = LocaleMgr.ins.getStr(_loc1_.name);
         txt_treasureName.text = LocaleMgr.ins.getStr(_loc1_.name) + " +" + model.selectedTreasure.level;
      }
      
      private function updateCost() : void
      {
         var _loc1_:StcBaowuFuwenKeyinVo = model.currentFuwenKeyinVo;
         costRender.showMultipleSign = true;
         costVo = WealthUtil.parseCostStr(_loc1_.cost).set_useMiniIcon(2);
         costRender.dataSource = WealthUtil.parseCostStr(_loc1_.cost).set_useMiniIcon(2);
         txt_has.text = LocaleMgr.ins.getStr(30609006,[BagModel.ins.getStcCount(costVo.sid)]);
      }
      
      private function updateProgressBar() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         if(model.selectedTreasure)
         {
            _loc2_ = model.currentFuwenKeyinVo;
            if(_loc2_)
            {
               _loc1_ = Uint64Util.toNumber(model.selectedTreasure.fuwenkeyinExp);
               txt_progress.text = _loc1_ + "/" + _loc2_.exp;
               if(_loc2_.exp > 0)
               {
                  progressBar.value = Uint64Util.toNumber(model.selectedTreasure.fuwenkeyinExp) / _loc2_.exp;
               }
               else
               {
                  progressBar.value = 1;
               }
            }
         }
      }
      
      private function updateRandomProp() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(model.selectedTreasure)
         {
            _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_baowu_fuwen_keyin",["quality","level"],[StcMgr.ins.getItemVo(model.selectedTreasure.baseId).quality,model.selectedTreasure.fuwenkeyin]);
            _loc1_ = NpcPropVo.parseArrStr(_loc2_.normal_attr);
            this.txt_propNowDesc.text = LocaleMgr.ins.getStr(30616002,[int(model.selectedTreasure.fuwenkeyin / 10),int(_loc2_.fuwen_attr * 100) + "%"]);
            list_prop.repeatY = _loc1_.length;
            list_prop.dataSource = _loc1_;
            _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_baowu_fuwen_keyin",["quality","level"],[StcMgr.ins.getItemVo(model.selectedTreasure.baseId).quality,model.selectedTreasure.fuwenkeyin + 1]);
            if(!_loc2_)
            {
               _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_baowu_fuwen_keyin",["quality","level"],[StcMgr.ins.getItemVo(model.selectedTreasure.baseId).quality,model.selectedTreasure.fuwenkeyin]);
               this.txt_propTitleNext.text = LocaleMgr.ins.getStr(30616022,[int((model.selectedTreasure.fuwenkeyin + 1) / 10),model.selectedTreasure.fuwenkeyin % 10]);
               list_stars.dataSource = TreasureModel.getStarLightArray(9);
               list_up.visible = false;
            }
            else
            {
               this.txt_propTitleNext.text = LocaleMgr.ins.getStr(30616022,[int((model.selectedTreasure.fuwenkeyin + 1) / 10),(model.selectedTreasure.fuwenkeyin + 1) % 10]);
               list_up.visible = true;
            }
            _loc1_ = NpcPropVo.parseArrStr(_loc2_.normal_attr);
            list_nextProp.repeatY = _loc1_.length;
            list_nextProp.dataSource = _loc1_;
            this.txt_propTitleNow.text = LocaleMgr.ins.getStr(30616022,[int(model.selectedTreasure.fuwenkeyin / 10),model.selectedTreasure.fuwenkeyin % 10]);
            this.txt_propCur.text = LocaleMgr.ins.getStr(30616004,[int(model.selectedTreasure.fuwenkeyin / 10),model.selectedTreasure.fuwenkeyin % 10]);
            _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_baowu_fuwen_keyin",["quality","level"],[StcMgr.ins.getItemVo(model.selectedTreasure.baseId).quality,(int(model.selectedTreasure.fuwenkeyin / 10) + 1) * 10]);
            if(!_loc2_)
            {
               _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_baowu_fuwen_keyin",["quality","level"],[StcMgr.ins.getItemVo(model.selectedTreasure.baseId).quality,model.selectedTreasure.fuwenkeyin]);
            }
            this.txt_propNextDesc.text = LocaleMgr.ins.getStr(30616003,[int(_loc2_.level / 10),int(_loc2_.fuwen_attr * 100) + "%"]);
            list_gradeUp.dataSource = WealthUtil.parseCostStrToArr(model.currentFuwenKeyinVo.cost);
            renderHad.wealthVo = WealthUtil.countVo(20,60114);
            txt_desc2.text = LocaleMgr.ins.getStr(30616010,[int(_loc2_.fuwen_attr * 100) + "%"]);
         }
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
      
      private function toMaxLevel() : Boolean
      {
         if(StcMgr.ins.getItemVo(model.selectedTreasure.baseId).quality == 5 && model.selectedTreasure.fuwenkeyin == 40)
         {
            return true;
         }
         if(StcMgr.ins.getItemVo(model.selectedTreasure.baseId).quality == 6 && model.selectedTreasure.fuwenkeyin == 60)
         {
            return true;
         }
         if(StcMgr.ins.getItemVo(model.selectedTreasure.baseId).quality == 7 && model.selectedTreasure.fuwenkeyin == 80)
         {
            return true;
         }
         return false;
      }
   }
}
