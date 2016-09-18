package nslm2.modules.cultivates.treasure.view
{
   import game.ui.treasures.inlay.InlayViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import morn.customs.components.WealthRender;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.tooltipsModules.ToolTipLianSuoVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   import nslm2.modules.bag.itemModuels.BagModel;
   import morn.core.components.Box;
   import com.greensock.TweenLite;
   import morn.core.components.Component;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.skins.ColorLib;
   import morn.core.components.Button;
   import proto.BaoWuFumo;
   import nslm2.modules.cultivates.treasure.vo.TreasureRuneHoleVo;
   import nslm2.modules.cultivates.treasure.service.TreasureService;
   import nslm2.mgrs.MouseIconManager;
   import morn.core.handlers.Handler;
   import nslm2.utils.Uint64Util;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.compsEffects.ImgMoveEffect;
   import com.netease.protobuf.UInt64;
   import morn.customs.components.ClipList;
   import nslm2.modules.foundations.recycle.view.render.RecycleAlertRender;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import proto.HeroInfo;
   import nslm2.utils.ProtoUtils;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS1;
   
   public class TreasureInlayPanel extends InlayViewUI implements ITreasurePanel, IViewStackPage, IObserver
   {
       
      
      private var model:TreasureModel;
      
      private var crtRemoveRuneCell:WealthRender;
      
      private var openHoleCostView:nslm2.modules.cultivates.treasure.view.OpenHoleCostView;
      
      private var activateEff:BmcSpriteSheet;
      
      private const LAYOUT_6:Array = [[116,0],[8,73],[8,200],[116,265],[238,200],[238,76]];
      
      private const LAYOUT_5:Array = [[116,0],[-10,83],[31,240],[204,237],[245,84]];
      
      private const LAYOUT_4:Array = [[0,59],[0,207],[226,207],[226,59]];
      
      private const LAYOUT_3:Array = [[116,0],[-7,190],[235,190]];
      
      private var inlayTargetIndex:int;
      
      private var openHoleIndexArr:Array;
      
      private var bgGlowEff:BmcSpriteSheet;
      
      private var chainEff:BmcSpriteSheet;
      
      private var preHoleCnt:int = 0;
      
      private var _isShowingEffect:Boolean;
      
      public function TreasureInlayPanel()
      {
         model = TreasureModel.ins;
         super();
         (this.pageBar as PageBarS1).bindList(list_rune);
         bgGlowEff = new BmcSpriteSheet();
         bgGlowEff.init(3060006,1,"all",true);
         bgGlowEff.x = 118;
         bgGlowEff.y = 126;
         DisplayUtils.addChildBelow(bgGlowEff,img_centerBg);
         btn_openAll.toolTip = LocaleMgr.ins.getStr(30600310);
         btn_removeAll.toolTip = LocaleMgr.ins.getStr(30600311);
      }
      
      protected function liansuoClickHandler(param1:MouseEvent) : void
      {
         if(model.selectedHeroInfo.baowu.length < 2)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30100051),DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50)));
            return;
         }
         ModuleMgr.ins.showModule(30811,3,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function getToolTip() : ToolTipLianSuoVo
      {
         var _loc1_:* = null;
         if(model.selectedHeroInfo)
         {
            _loc1_ = new ToolTipLianSuoVo();
            _loc1_.kind = 4;
            _loc1_.level = model.selectedHeroInfo.baseInfo.baowuFumLs;
            _loc1_.lackEquip = model.selectedHeroInfo.baowu.length < 2;
         }
         return _loc1_;
      }
      
      public function show() : void
      {
         if(model.selectedTreasure)
         {
            updateTreasureName();
            updateLiansuoLvl();
            updateRuneHoleList();
            updateRuneList();
            layOutRuneHole();
            this.centerRender.dataSource = WealthUtil.treasureToVo(model.selectedTreasure);
         }
      }
      
      private function updateRuneHoleList() : void
      {
         var _loc1_:Array = TreasureUtil.pareseTreasureRuneArr(model.selectedTreasure.fumo,model.selectedTreasure.baseId);
         var _loc2_:int = TreasureUtil.getMaxOpenHoleCnt(model.selectedTreasure.baseId);
         _loc1_.length = _loc2_;
         list_runeHole.dataSource = _loc1_;
      }
      
      private function updateRuneList() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = BagModel.ins.getRunesArr();
         _loc1_.sort(TreasureUtil.sortRune);
         while(_loc1_.length == 0 || _loc1_.length % 10)
         {
            _loc1_.push(null);
         }
         list_rune.dataSource = _loc1_;
      }
      
      private function layOutRuneHole() : void
      {
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc5_:int = TreasureUtil.getMaxOpenHoleCnt(model.selectedTreasure.baseId);
         var _loc1_:Array = this["LAYOUT_" + _loc5_] as Array;
         var _loc4_:int = list_runeHole.cells.length;
         if(preHoleCnt == _loc5_)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc2_ = list_runeHole.cells[_loc6_];
               _loc2_.x = 142;
               _loc2_.y = 136;
               _loc6_++;
            }
         }
         preHoleCnt = _loc5_;
         if(_loc1_)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc2_ = list_runeHole.cells[_loc6_];
               _loc3_ = _loc1_[_loc6_];
               if(_loc3_)
               {
                  TweenLite.killTweensOf(_loc2_);
                  TweenLite.to(_loc2_,0.3,{
                     "x":_loc3_[0],
                     "y":_loc3_[1]
                  });
               }
               _loc6_++;
            }
         }
      }
      
      private function playActivateEff(param1:Component) : void
      {
         activateEff = new BmcSpriteSheet();
         activateEff.init(5005);
         activateEff.x = -26;
         activateEff.y = -70;
         param1.addChild(activateEff);
      }
      
      private function getRuneBgCellPos(param1:int) : Point
      {
         var _loc3_:* = null;
         var _loc8_:int = 0;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc6_:Array = list_rune.dataSource as Array;
         var _loc7_:int = _loc6_.length;
         var _loc2_:* = -1;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc5_ = _loc6_[_loc8_];
            if(_loc5_.sid == param1)
            {
               _loc2_ = _loc8_;
               break;
            }
            _loc8_++;
         }
         if(_loc2_ != -1)
         {
            if(_loc2_ >= list_rune.startIndex && _loc2_ < list_rune.startIndex + list_rune.repeatX * list_rune.repeatY)
            {
               _loc4_ = list_rune.getCell(_loc2_) as WealthRender;
               _loc3_ = _loc4_.localToGlobal(new Point());
            }
         }
         return _loc3_;
      }
      
      private function updateTreasureName() : void
      {
         var _loc1_:StcItemVo = model.selectedTreasureItemVo;
         txt_treasureName.color = ColorLib.qualityColor(_loc1_.quality);
         txt_treasureName.text = LocaleMgr.ins.getStr(_loc1_.name);
         txt_treasureName.text = LocaleMgr.ins.getStr(_loc1_.name) + " +" + model.selectedTreasure.level;
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = param1;
         if(btn_openAll !== _loc3_)
         {
            if(btn_removeAll === _loc3_)
            {
               if(!checkHasRune())
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(30600307),DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50)));
                  return;
               }
               AlertUtil.comfirm(LocaleMgr.ins.getStr(30600308),doRemoveAll);
            }
         }
         else
         {
            _loc2_ = TreasureUtil.getMaxOpenHoleCnt(model.selectedTreasure.baseId);
            if(model.selectedTreasure.fumo.length == _loc2_)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(30600305),DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50)));
               return;
            }
            showOpenHoleConfirmPanel(caculateOpenHoleCost(),LocaleMgr.ins.getStr(30600306),doOpenAllHole);
         }
      }
      
      private function checkHasRune() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:* = model.selectedTreasure.fumo;
         for each(var _loc1_ in model.selectedTreasure.fumo)
         {
            if(_loc1_.id > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      private function caculateOpenHoleCost(param1:int = 999) : Array
      {
         var _loc11_:int = 0;
         var _loc10_:int = 0;
         var _loc6_:int = 0;
         var _loc9_:int = 0;
         var _loc12_:int = 0;
         var _loc3_:* = null;
         openHoleIndexArr = [];
         var _loc8_:Array = list_runeHole.dataSource as Array;
         var _loc5_:int = _loc8_.length;
         var _loc7_:int = TreasureUtil.getMaxOpenHoleCnt(model.selectedTreasure.baseId);
         _loc12_ = 0;
         while(_loc12_ < _loc5_)
         {
            _loc3_ = _loc8_[_loc12_];
            _loc6_ = _loc12_ + 1;
            if(_loc3_.status != 2 && _loc6_ <= _loc7_)
            {
               _loc9_++;
               _loc11_ = _loc11_ + model.openHoleCostItem[_loc6_];
               openHoleIndexArr.push(_loc12_);
               _loc10_ = _loc10_ + int(model.openHoleCostDiamond[_loc6_ - 1]);
               if(_loc9_ >= param1)
               {
                  break;
               }
            }
            _loc12_++;
         }
         var _loc4_:WealthVo = WealthUtil.stcItemIdToHadWealthVoArr(model.openHoleCostItemID);
         _loc4_.count = _loc11_;
         var _loc2_:WealthVo = new WealthVo();
         _loc2_.kind = 3;
         _loc2_.sid = 0;
         _loc2_.count = _loc10_;
         return [_loc4_,_loc2_];
      }
      
      private function showOpenHoleConfirmPanel(param1:Array, param2:String, param3:*) : void
      {
         openHoleCostView = new nslm2.modules.cultivates.treasure.view.OpenHoleCostView();
         openHoleCostView.x = 380 - openHoleCostView.width >> 1;
         openHoleCostView.y = 50;
         openHoleCostView.show(param1,param2);
         AlertUtil.comfirm(openHoleCostView,param3);
      }
      
      private function doRemoveAll() : void
      {
         TreasureService.ins.oneKeyOperation(model.selectedHeroInfo.baseInfo.id,model.selectedTreasure.id,2,0);
      }
      
      private function doOpenAllHole() : void
      {
         TreasureService.ins.oneKeyOperation(model.selectedHeroInfo.baseInfo.id,model.selectedTreasure.id,1,TreasureModel.ins.openHoleCostType);
      }
      
      private function listRuneHoleMouseHandler(param1:MouseEvent, param2:int) : void
      {
         var _loc3_:* = null;
         if(!list_runeHole.array)
         {
            return;
         }
         _loc3_ = list_runeHole.getItem(param2) as TreasureRuneHoleVo;
         _loc3_ = list_runeHole.getItem(param2) as TreasureRuneHoleVo;
         var _loc4_:* = param1.type;
         if("rollOver" !== _loc4_)
         {
            if("rollOut" !== _loc4_)
            {
               if("click" === _loc4_)
               {
                  switch(int(_loc3_.status) - 1)
                  {
                     case 0:
                        showOpenHoleConfirmPanel(caculateOpenHoleCost(1),LocaleMgr.ins.getStr(999000099),new Handler(doOpenHoelHandler,[param2 + 1]));
                        break;
                     case 1:
                        if(_loc3_.runeVo)
                        {
                           crtRemoveRuneCell = list_runeHole.getCell(param2) as WealthRender;
                           doRemoveRune(param2 + 1);
                        }
                  }
               }
            }
            else
            {
               MouseIconManager.changeMouseCursor("auto");
            }
         }
         else
         {
            switch(int(_loc3_.status) - 1)
            {
               case 0:
                  MouseIconManager.changeMouseCursor("awl");
                  break;
               case 1:
                  if(_loc3_.runeVo)
                  {
                     MouseIconManager.changeMouseCursor("hammer");
                  }
            }
         }
      }
      
      private function doOpenHoelHandler(param1:int) : void
      {
         TreasureService.ins.requestOpenHole(model.selectedHeroInfo.baseInfo.id,model.selectedTreasure.id,param1,model.openHoleCostType);
      }
      
      private function doRemoveRune(param1:int) : void
      {
         TreasureService.ins.requestInlayRune(model.selectedHeroInfo.baseInfo.id,model.selectedTreasure.id,Uint64Util.fromNumber(0),param1);
      }
      
      private function addEvent() : void
      {
         ObserverMgr.ins.regObserver(this);
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         liansuoArea.toolTip = getToolTip;
         liansuoArea.addEventListener("click",liansuoClickHandler);
         list_runeHole.mouseHandler = listRuneHoleMouseHandler;
         list_rune.changeHandler = listRuneClickHandler;
      }
      
      private function removeEvent() : void
      {
         ObserverMgr.ins.unregObserver(this);
         MornExpandUtil.addHandlerForBtnAll(this,null);
         liansuoArea.toolTip = null;
         liansuoArea.removeEventListener("click",liansuoClickHandler);
         list_runeHole.mouseHandler = null;
         list_rune.changeHandler = null;
      }
      
      private function listRuneClickHandler(... rest) : void
      {
         var _loc2_:int = 0;
         if(_isShowingEffect)
         {
            return;
         }
         var _loc3_:WealthRender = list_rune.selection as WealthRender;
         if(!_loc3_.wealthVo)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.FUMO_LESS_ID)),ModuleMgr.ins.popLayer.curModuleId);
            return;
         }
         var _loc4_:WealthVo = _loc3_.wealthVo;
         if(_loc4_)
         {
            _loc2_ = TreasureUtil.getAddtionType(_loc4_.sid);
            if(model.crtTreasureRuneTypes.indexOf(_loc2_) >= 0)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(30600217),DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50)));
               return;
            }
            doInleyRune(_loc4_,_loc3_);
         }
      }
      
      private function doInleyRune(param1:WealthVo, param2:WealthRender) : void
      {
         var _loc3_:int = 0;
         var _loc9_:int = 0;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc8_:Array = list_runeHole.dataSource as Array;
         var _loc7_:int = _loc8_.length;
         _loc9_ = 0;
         while(_loc9_ < _loc7_)
         {
            _loc6_ = _loc8_[_loc9_];
            if(_loc6_.status == 2 && _loc6_.runeVo == null)
            {
               _loc3_ = _loc9_ + 1;
               break;
            }
            _loc9_++;
         }
         if(_loc3_ > 0)
         {
            _loc5_ = new ImgMoveEffect();
            _loc4_ = (list_runeHole.getCell(_loc3_ - 1) as WealthRender).ref_img_icon.localToGlobal(new Point());
            _loc5_.init(param2.ref_img_icon,param2.ref_img_icon.localToGlobal(new Point()),_loc4_,new Handler(imgMoveCompleteHndler,[param2.wealthVo.item.id,_loc3_]));
            _loc5_.config(0.2);
            _loc5_.startAnim();
            setRuneListEnable(false);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30600309),DisplayUtils.globarCenter(this).add(new Point(model.floatOffSet,-50)));
         }
      }
      
      private function imgMoveCompleteHndler(param1:UInt64, param2:int) : void
      {
         inlayTargetIndex = param2;
         TreasureService.ins.requestInlayRune(model.selectedHeroInfo.baseInfo.id,model.selectedTreasure.id,param1,param2);
      }
      
      public function updateLiansuoLvl() : void
      {
         lianSuoLvl.tweenValue = model.selectedHeroInfo.baseInfo.baowuFumLs;
      }
      
      public function set weaoponRef(param1:Object) : void
      {
      }
      
      public function get liansuoTxt() : ClipList
      {
         return this.lianSuoLvl;
      }
      
      public function viewStackIn() : void
      {
         addEvent();
         this.visible = true;
         this.fadeIn();
         model.floatOffSet = -95;
         this.render_recycle.dataSource = 30600;
         (this.render_recycle as RecycleAlertRender).autoHide();
      }
      
      public function viewStackOut() : void
      {
         removeEvent();
         this.visible = false;
      }
      
      override public function fadeView_fadeInCpl() : void
      {
         NGUtil.checkModuleShow(30600,this);
         super.fadeView_fadeInCpl();
      }
      
      public function getFocusNotices() : Array
      {
         return ["treasure_remove_rune_success","treasure_inlay_success","treasure_open_hole_success","treasure_inlay_fail","treasure_remove_all_rune_success","treasure_open_all_hole_success"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = param1;
         if("treasure_remove_rune_success" !== _loc5_)
         {
            if("treasure_remove_all_rune_success" !== _loc5_)
            {
               if("treasure_inlay_success" !== _loc5_)
               {
                  if("treasure_open_hole_success" !== _loc5_)
                  {
                     if("treasure_open_all_hole_success" !== _loc5_)
                     {
                        if("treasure_inlay_fail" === _loc5_)
                        {
                           setRuneListEnable(true);
                        }
                     }
                  }
                  playeOpenHoleEffect(openHoleIndexArr);
                  model.selectedTreasure = param2;
                  updateLiansuoLvl();
                  this.centerRender.dataSource = WealthUtil.treasureToVo(model.selectedTreasure);
               }
               else
               {
                  model.selectedTreasure = param2;
                  updateRuneHoleList();
                  updateRuneList();
                  this.centerRender.dataSource = WealthUtil.treasureToVo(model.selectedTreasure);
                  setRuneListEnable(true);
                  _loc3_ = list_runeHole.getCell(inlayTargetIndex - 1);
                  playActivateEff(_loc3_);
                  if(model.needShowLiansuoEffect)
                  {
                     model.needShowLiansuoEffect = false;
                     _loc4_ = new HeroInfo();
                     ProtoUtils.copyParams(model.selectedHeroInfo,_loc4_);
                     TweenLite.delayedCall(0.4,showChainEffect,[_loc4_]);
                  }
               }
            }
            else
            {
               model.selectedTreasure = param2;
               removeAllRune();
               updateLiansuoLvl();
               updateRuneHoleList();
               this.centerRender.dataSource = WealthUtil.treasureToVo(model.selectedTreasure);
            }
         }
         else
         {
            model.selectedTreasure = param2;
            showIocnMoveEffect(crtRemoveRuneCell);
            updateLiansuoLvl();
            updateRuneHoleList();
            this.centerRender.dataSource = WealthUtil.treasureToVo(model.selectedTreasure);
         }
      }
      
      private function showChainEffect(param1:HeroInfo) : void
      {
         chainEff = new BmcSpriteSheet();
         chainEff.y = 15;
         chainEff.x = 10;
         chainEff.init(3060005,1);
         DisplayUtils.addChildBelow(chainEff,img_centerBg);
         TweenLite.delayedCall(0.6,sendNotify,[param1]);
      }
      
      private function sendNotify(param1:HeroInfo) : void
      {
         ObserverMgr.ins.sendNotice("treasure_show_liansuo_lvlup_effect",[4,param1]);
      }
      
      private function playeOpenHoleEffect(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         var _loc5_:* = 0;
         var _loc4_:int = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc2_ = param1[_loc6_];
            _loc3_ = list_runeHole.getCell(_loc2_);
            TweenLite.delayedCall(_loc5_,addOpenHoleEffect,[_loc3_]);
            _loc5_ = Number(_loc5_ + 0.3);
            _loc6_++;
         }
         TweenLite.delayedCall(_loc5_,updateRuneHoleList);
      }
      
      private function addOpenHoleEffect(param1:Box) : void
      {
         var _loc2_:* = null;
         (param1.dataSource as TreasureRuneHoleVo).status = 2;
         param1.dataSource = param1.dataSource as TreasureRuneHoleVo;
         _loc2_ = new BmcSpriteSheet();
         _loc2_.init(3060001);
         _loc2_.x = 40;
         _loc2_.y = 4;
         param1.addChild(_loc2_);
      }
      
      private function setRuneListEnable(param1:Boolean) : void
      {
         _isShowingEffect = !param1;
      }
      
      private function showIocnMoveEffect(param1:WealthRender) : void
      {
         var _loc2_:ImgMoveEffect = new ImgMoveEffect();
         updateRuneList();
         var _loc3_:Point = getRuneBgCellPos(param1.wealthVo.sid);
         if(_loc3_)
         {
            _loc2_.config(0.2);
            _loc2_.init(param1.ref_img_icon,param1.ref_img_icon.localToGlobal(new Point()),_loc3_,moveRuneIconComplete);
            _loc2_.startAnim();
         }
      }
      
      private function removeAllRune() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = list_runeHole.cells.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = list_runeHole.getCell(_loc3_) as WealthRender;
            if(_loc1_.wealthVo)
            {
               showIocnMoveEffect(_loc1_);
            }
            _loc3_++;
         }
      }
      
      private function moveRuneIconComplete() : void
      {
      }
   }
}
