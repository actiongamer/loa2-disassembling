package nslm2.modules.cultivates.treasure.view
{
   import game.ui.treasures.purify.TreasurePurifyPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import morn.customs.components.ClipList;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import proto.BaoWuPurifyReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.BaoWuRemouldReq;
   import nslm2.modules.cultivates.treasure.view.render.TreasureRemouldPropRender;
   import proto.BaoWuRemouldRes;
   import nslm2.common.model.HeroModel;
   import proto.HeroInfo;
   import proto.BaoWu;
   import nslm2.utils.Uint64Util;
   import nslm2.utils.ProtoUtils;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.LabelUtils;
   import game.ui.roleInfos.NpcPropVo;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.cultivates.treasure.view.render.TreasureRemouldPropRender2;
   import proto.BaoWuBuff;
   import nslm2.modules.footstones.tooltipsModules.TooltipUtils;
   
   public class TreasurePurifyPanel extends TreasurePurifyPanelUI implements IViewStackPage, ITreasurePanel, IObserver
   {
       
      
      private var model:TreasureModel;
      
      private var _curOldIndex:int = 0;
      
      public function TreasurePurifyPanel()
      {
         model = TreasureModel.ins;
         super();
         check_function.selectedIndex = 1;
         check_function.selectHandler = changeFunctionHandler;
         changeFunctionHandler();
         this.btn_action.clickHandler = purifyClickHandler;
         this.btn_save.clickHandler = saveClickHandler;
         this.list_remouldOld.changeHandler = oldSelectHandler;
         txt_rule.toolTip = LocaleMgr.ins.getStr(30616011);
         txt_rule.mouseEnabled = true;
         txt_rule.buttonMode = true;
         txt_rule.mouseChildren = false;
         TooltipUtils.preventHideByMouseDown(txt_rule);
         this.costRender.dataSource = WealthUtil.parseCostStr(DefindConsts.TREASURE_CHONGZHU_COST_7);
         show();
      }
      
      private function cplHandler() : void
      {
      }
      
      public function updateLiansuoLvl() : void
      {
      }
      
      public function set weaoponRef(param1:Object) : void
      {
      }
      
      public function get liansuoTxt() : ClipList
      {
         return null;
      }
      
      public function viewStackIn() : void
      {
         visible = true;
         this.visible = true;
         this.fadeIn();
         ObserverMgr.ins.regObserver(this);
      }
      
      public function viewStackOut() : void
      {
         visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
      
      private function oldSelectHandler(param1:int) : void
      {
         if(model.selectedTreasure.remould > 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30616014));
            this.list_remouldOld.selectedIndex = _curOldIndex;
         }
         else
         {
            _curOldIndex = param1;
            refreshProp();
         }
      }
      
      private function purifyClickHandler() : void
      {
         var _loc1_:WealthVo = WealthUtil.parseCostStr(DefindConsts.TREASURE_CHONGZHU_COST_7);
         if(BagModel.ins.getStcCount(_loc1_.sid) < _loc1_.showCount)
         {
            AlertUtil.lackItem(_loc1_);
            return;
         }
         if(model.selectedTreasure.remould == 0)
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(30616019),confirmed);
         }
         else
         {
            confirmed();
         }
      }
      
      private function saveClickHandler() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(isPurify())
         {
            _loc2_ = new BaoWuPurifyReq();
            _loc2_.hero = model.selectedHeroInfo.baseInfo.id;
            _loc2_.id = model.selectedTreasure.id;
            _loc2_.kind = 2;
            _loc2_.lock = [];
            ServerEngine.ins.send(5114,_loc2_,cplHandler);
         }
         else
         {
            _loc1_ = new BaoWuRemouldReq();
            _loc1_.hero = model.selectedHeroInfo.baseInfo.id;
            _loc1_.id = model.selectedTreasure.id;
            _loc1_.kind = 2;
            _loc1_.attr = (this.list_remouldOld.selection as TreasureRemouldPropRender).currentId;
            ServerEngine.ins.send(5113,_loc1_,remould2CplHandler);
         }
      }
      
      private function confirmed() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(isPurify())
         {
            _loc2_ = new BaoWuPurifyReq();
            _loc2_.hero = model.selectedHeroInfo.baseInfo.id;
            _loc2_.id = model.selectedTreasure.id;
            _loc2_.kind = 1;
            _loc2_.lock = [];
            ServerEngine.ins.send(5114,_loc2_,cplHandler);
         }
         else
         {
            _loc1_ = new BaoWuRemouldReq();
            _loc1_.hero = model.selectedHeroInfo.baseInfo.id;
            _loc1_.id = model.selectedTreasure.id;
            _loc1_.kind = 1;
            _loc1_.attr = (this.list_remouldOld.selection as TreasureRemouldPropRender).currentId;
            ServerEngine.ins.send(5113,_loc1_,remouldCplHandler);
         }
      }
      
      private function remouldCplHandler(param1:BaoWuRemouldRes) : void
      {
         model.updateTreasureData(param1.info,2);
         model.selectedTreasure = param1.info;
         var _loc7_:int = 0;
         var _loc6_:* = HeroModel.ins.teamHeroInfoArr;
         for each(var _loc2_ in HeroModel.ins.teamHeroInfoArr)
         {
            var _loc5_:int = 0;
            var _loc4_:* = _loc2_.baowu;
            for each(var _loc3_ in _loc2_.baowu)
            {
               if(Uint64Util.equal(model.selectedTreasure.id,_loc3_.id))
               {
                  ProtoUtils.copyParams(param1.info,_loc3_);
               }
            }
         }
         AlertUtil.float(LocaleMgr.ins.getStr(30616020));
         show();
      }
      
      private function remould2CplHandler(param1:BaoWuRemouldRes) : void
      {
         model.updateTreasureData(param1.info,2);
         model.selectedTreasure = param1.info;
         show();
      }
      
      private function updateTreasureName() : void
      {
         var _loc1_:StcItemVo = model.selectedTreasureItemVo;
         txt_treasureName.color = ColorLib.qualityColor(_loc1_.quality);
         txt_treasureName.text = LocaleMgr.ins.getStr(_loc1_.name);
         txt_treasureName.text = LocaleMgr.ins.getStr(_loc1_.name) + " +" + model.selectedTreasure.level;
      }
      
      public function show() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(model.selectedTreasure)
         {
            updateTreasureName();
            if(StcMgr.ins.getItemVo(model.selectedTreasure.baseId).quality >= 7)
            {
               box_notavail.visible = false;
               box_operation.visible = true;
               refreshProp();
               _loc1_ = WealthUtil.parseCostStr(DefindConsts.TREASURE_CHONGZHU_COST_7);
               _loc2_ = BagModel.ins.getStcCount(_loc1_.sid);
               txt_has.text = LocaleMgr.ins.getStr(30609006,[_loc2_]);
               txt_has.color = LabelUtils.getCountNeedColor(_loc2_,_loc1_.showCount);
            }
            else
            {
               box_notavail.visible = true;
               box_operation.visible = false;
            }
         }
      }
      
      private function refreshProp() : void
      {
         var _loc5_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = NpcPropVo.parseFightProp(model.selectedTreasure.random,"+",1);
         if(isPurify())
         {
            this.list_purifyOld.dataSource = ArrayUtil.concat(_loc1_,model.selectedTreasure.buff);
            this.list_purifyNew.dataSource = ArrayUtil.concat(_loc1_,model.selectedTreasure.buff);
            this.list_purifyOld.selectedIndex = 0;
         }
         else
         {
            this.list_remouldNew.itemRender = TreasureRemouldPropRender2;
            this.list_remouldOld.dataSource = ArrayUtil.concat(_loc1_.concat(),model.selectedTreasure.buff.sortOn("id",16));
            _loc5_ = ArrayUtil.concat(_loc1_,model.selectedTreasure.buff.sortOn("id",16));
            _loc3_ = 0;
            while(_loc3_ < _loc5_.length)
            {
               if(_loc5_[_loc3_] is NpcPropVo)
               {
                  if((_loc5_[_loc3_] as NpcPropVo).propId == model.selectedTreasure.remould)
                  {
                     _curOldIndex = _loc3_;
                     this.list_remouldOld.selectedIndex = _loc3_;
                  }
               }
               else if((_loc5_[_loc3_] as BaoWuBuff).id == model.selectedTreasure.remould)
               {
                  _curOldIndex = _loc3_;
                  this.list_remouldOld.selectedIndex = _loc3_;
               }
               _loc3_++;
            }
            if(model.selectedTreasure.remould > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc5_.length)
               {
                  _loc2_ = null;
                  if(_loc5_[_loc4_] is NpcPropVo)
                  {
                     if(model.selectedTreasure.tmpRemouldId > 0 && (_loc5_[_loc4_] as NpcPropVo).propId == model.selectedTreasure.remould || model.selectedTreasure.tmpRemouldId == 0 && _loc4_ == list_remouldOld.selectedIndex)
                     {
                        if(model.selectedTreasure.tmpRemouldId > 0)
                        {
                           if(model.selectedTreasure.tmpRemouldId <= 34)
                           {
                              _loc2_ = new NpcPropVo(model.selectedTreasure.tmpRemouldId,model.selectedTreasure.tmpRemouldVal,"+",null,1,true);
                           }
                           else
                           {
                              _loc2_ = new BaoWuBuff();
                              _loc2_.id = model.selectedTreasure.tmpRemouldId;
                              _loc2_.value = model.selectedTreasure.tmpRemouldVal;
                           }
                        }
                        ArrayUtil.replaceItem(_loc5_,_loc5_[_loc4_],_loc2_);
                     }
                  }
                  else if(model.selectedTreasure.tmpRemouldId > 0 && (_loc5_[_loc4_] as BaoWuBuff).id == model.selectedTreasure.remould || model.selectedTreasure.tmpRemouldId == 0 && _loc4_ == list_remouldOld.selectedIndex)
                  {
                     if(model.selectedTreasure.tmpRemouldId > 0)
                     {
                        if(model.selectedTreasure.tmpRemouldId <= 34)
                        {
                           _loc2_ = new NpcPropVo(model.selectedTreasure.tmpRemouldId,model.selectedTreasure.tmpRemouldVal,"+",null,1,true);
                        }
                        else
                        {
                           _loc2_ = new BaoWuBuff();
                           _loc2_.id = model.selectedTreasure.tmpRemouldId;
                           _loc2_.value = model.selectedTreasure.tmpRemouldVal;
                        }
                     }
                     ArrayUtil.replaceItem(_loc5_,_loc5_[_loc4_],_loc2_);
                  }
                  _loc4_++;
               }
            }
            else
            {
               ArrayUtil.replaceItem(_loc5_,_loc5_[_curOldIndex],null);
            }
            this.list_remouldNew.dataSource = _loc5_;
            if(this.list_remouldNew.selectedIndex == -1)
            {
               this.list_remouldNew.selectedIndex = 0;
            }
            if(this.list_remouldOld.selectedIndex == -1)
            {
               this.list_remouldOld.selectedIndex = 0;
            }
         }
      }
      
      private function isPurify() : Boolean
      {
         return check_function.selectedIndex == 0;
      }
      
      private function changeFunctionHandler() : void
      {
         box_purify.visible = check_function.selectedIndex != 1;
         box_remould.visible = check_function.selectedIndex == 1;
         show();
      }
      
      public function getFocusNotices() : Array
      {
         return [];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
      }
   }
}
