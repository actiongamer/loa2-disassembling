package nslm2.modules.cultivates.treasure.view
{
   import game.ui.treasures.phase.TreasurePhasePanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.scenes.commons.UIWeapon3D;
   import morn.customs.components.ClipList;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import game.ui.roleInfos.NpcPropVo;
   import proto.BaoWuBuff;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import proto.BaoWuGoldCombineReq;
   import nslm2.modules.cultivates.treasure.service.TreasureService;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.tooltipsModules.TooltipUtils;
   
   public class TreasurePhasePanel extends TreasurePhasePanelUI implements IViewStackPage, ITreasurePanel
   {
       
      
      private var _weapon:UIWeapon3D;
      
      public function TreasurePhasePanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.txt_10220000.text = LocaleMgr.ins.getStr(10220000);
         this.txt_30609001.text = LocaleMgr.ins.getStr(30609001);
         this.txt_30600902.text = LocaleMgr.ins.getStr(30600902);
         this.txt_30600903.text = LocaleMgr.ins.getStr(30600903);
         this.btn_phase.label = LocaleMgr.ins.getStr(30120000);
         this.txt_rule.toolTip = LocaleMgr.ins.getStr(30600905);
         this.txt_rule.mouseEnabled = true;
         this.txt_rule.buttonMode = true;
         this.txt_rule.mouseChildren = false;
         TooltipUtils.preventHideByMouseDown(txt_rule);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         visible = false;
      }
      
      public function get liansuoTxt() : ClipList
      {
         return null;
      }
      
      public function updateLiansuoLvl() : void
      {
      }
      
      public function set weaoponRef(param1:Object) : void
      {
         _weapon = param1 as UIWeapon3D;
      }
      
      public function show() : void
      {
         updateRandomProp();
      }
      
      private function updateRandomProp() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc12_:Number = NaN;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc11_:int = 0;
         var _loc1_:* = null;
         var _loc7_:int = 0;
         var _loc2_:* = null;
         var _loc9_:* = null;
         _loc8_ = null;
         _loc12_ = NaN;
         _loc6_ = null;
         var _loc10_:* = null;
         if(TreasureModel.ins.selectedTreasure)
         {
            if(StcMgr.ins.getItemVo(TreasureModel.ins.selectedTreasure.baseId).quality == 6)
            {
               _loc3_ = StcMgr.ins.getItemVo(TreasureModel.ins.selectedTreasure.baseId);
               _loc4_ = StcMgr.ins.getFashionSynVo(_loc3_.combineFashionSynId);
               _loc8_ = NpcPropVo.parseFightProp(TreasureModel.ins.selectedTreasure.random,"+",1);
               if(TreasureModel.ins.selectedTreasure.buff)
               {
                  var _loc15_:int = 0;
                  var _loc14_:* = TreasureModel.ins.selectedTreasure.buff;
                  for each(var _loc13_ in TreasureModel.ins.selectedTreasure.buff)
                  {
                     _loc12_ = _loc13_.value;
                     _loc6_ = new NpcPropVo(0,0,"+",null,1);
                     _loc6_.propId = _loc13_.id;
                     _loc6_.value = _loc12_;
                     _loc8_.push(_loc6_);
                  }
               }
               list_randomProp.repeatY = _loc8_.length;
               list_randomProp.dataSource = _loc8_;
               this.list_randomProp.commitMeasure();
               this.txt_30600903.y = this.list_randomProp.y + list_randomProp.height + 30;
               _loc5_ = TreasureUtil.getPorpListByStrenLvl(0);
               _loc11_ = _loc5_.length;
               _loc1_ = [];
               _loc7_ = 0;
               while(_loc7_ < _loc11_)
               {
                  _loc2_ = NpcPropVo.clone(_loc5_[_loc7_]);
                  _loc2_.value = Math.floor(_loc2_.value * (1 + Number(DefindConsts.TREASURE_REBORN_ATTR)));
                  _loc1_.push(_loc2_);
                  _loc7_++;
               }
               this.list_nowProp.dataSource = _loc5_;
               this.list_nextProp.dataSource = _loc1_;
               this.render_treasure.dataSource = WealthUtil.treasureToVo(TreasureModel.ins.selectedTreasure);
               this.render_cost.dataSource = WealthUtil.parseCostStr(_loc4_.costItem);
               this.render_goldCost.dataSource = WealthUtil.parseCostStr(_loc4_.extraCost);
               _loc9_ = StcMgr.ins.getItemVo(_loc4_.item);
               txt_treasureName.color = ColorLib.qualityColor(_loc9_.quality);
               txt_treasureName.text = LocaleMgr.ins.getStr(_loc9_.name);
               txt_treasureName.text = LocaleMgr.ins.getStr(_loc9_.name);
               this.box_notavail.visible = false;
               this.box_operation.visible = true;
               this.txt_30600903.visible = true;
            }
            else
            {
               this.box_notavail.visible = true;
               this.box_operation.visible = false;
               if(_weapon)
               {
                  _weapon.visible = false;
               }
               this.list_nowProp.dataSource = TreasureUtil.getPorpListByStrenLvl(0);
               _loc8_ = NpcPropVo.parseFightProp(TreasureModel.ins.selectedTreasure.random,"+",1);
               if(TreasureModel.ins.selectedTreasure.buff)
               {
                  var _loc17_:int = 0;
                  var _loc16_:* = TreasureModel.ins.selectedTreasure.buff;
                  for each(_loc13_ in TreasureModel.ins.selectedTreasure.buff)
                  {
                     _loc12_ = _loc13_.value;
                     _loc6_ = new NpcPropVo(0,0,"+",null,1);
                     _loc6_.propId = _loc13_.id;
                     _loc6_.value = _loc12_;
                     _loc8_.push(_loc6_);
                  }
               }
               list_randomProp.repeatY = _loc8_.length;
               list_randomProp.dataSource = _loc8_;
               this.txt_30600903.visible = false;
               _loc10_ = TreasureModel.ins.selectedTreasureItemVo;
               txt_treasureName.color = ColorLib.qualityColor(_loc10_.quality);
               txt_treasureName.text = LocaleMgr.ins.getStr(_loc10_.name);
               txt_treasureName.text = LocaleMgr.ins.getStr(_loc10_.name);
            }
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc7_:* = param1;
         if(this.btn_phase === _loc7_)
         {
            _loc4_ = StcMgr.ins.getItemVo(TreasureModel.ins.selectedTreasure.baseId);
            _loc5_ = StcMgr.ins.getFashionSynVo(_loc4_.combineFashionSynId);
            _loc2_ = WealthUtil.parseCostStr(_loc5_.extraCost);
            _loc6_ = WealthUtil.parseCostStr(_loc5_.costItem);
            if(PlayerModel.ins.getCountByWealthVo(_loc2_) < _loc2_.count)
            {
               ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(_loc2_),ModuleMgr.ins.popLayer.curModuleId);
            }
            else if(PlayerModel.ins.getCountByWealthVo(_loc6_) < _loc6_.count)
            {
               ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(_loc6_),ModuleMgr.ins.popLayer.curModuleId);
            }
            else
            {
               this.btn_phase.mouseEvent = false;
               ObserverMgr.ins.sendNotice("treasure_freeze_selector",false);
               _loc3_ = new BmcSpriteSheet();
               _loc3_.addEndHandler(doPhaseUp).init(3060008);
               _loc3_.x = 121;
               _loc3_.y = 221;
               this.addChild(_loc3_);
            }
         }
      }
      
      private function doPhaseUp() : void
      {
         this.btn_phase.mouseEvent = true;
         ObserverMgr.ins.sendNotice("treasure_freeze_selector",true);
         var _loc1_:BaoWuGoldCombineReq = new BaoWuGoldCombineReq();
         _loc1_.id = TreasureModel.ins.selectedTreasure.id;
         _loc1_.hero = TreasureModel.ins.selectedHeroInfo.baseInfo.id;
         TreasureService.ins.phaseUp(_loc1_);
      }
   }
}
