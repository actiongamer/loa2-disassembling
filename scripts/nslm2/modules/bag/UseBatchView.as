package nslm2.modules.bag
{
   import game.ui.BagModules.UseBatchViewUI;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.events.Event;
   import nslm2.utils.WealthUtil;
   import morn.core.utils.StringUtils;
   import morn.core.handlers.Handler;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import morn.customs.expands.MornExpandUtil;
   
   public class UseBatchView extends UseBatchViewUI
   {
       
      
      private var wealthVo:WealthVo;
      
      private var showParam:nslm2.modules.bag.UseBatchShowParam;
      
      public function UseBatchView()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.numBar.addEventListener("evt_numbar_value_change",numBar_change);
      }
      
      public function get numBar() : NumBarS1
      {
         return this.numBarUI as NumBarS1;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_ok !== _loc3_)
         {
            if(this.btn_cancel === _loc3_)
            {
               ModuleMgr.ins.closeModule(this.moduleId);
            }
         }
         else
         {
            server_bagItemUse();
         }
      }
      
      private function numBar_change(param1:Event) : void
      {
         validateCost();
      }
      
      private function validateCost() : void
      {
         var _loc1_:WealthVo = WealthUtil.parseCostStr(wealthVo.stcItemVo.use_cost);
         _loc1_.count = _loc1_.count * int(numBar.nowNum);
         this.renderCost.wealthVo = _loc1_;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         super.preShow(param1);
         if(param1 is nslm2.modules.bag.UseBatchShowParam)
         {
            showParam = param1 as nslm2.modules.bag.UseBatchShowParam;
            wealthVo = showParam.wealthVo;
         }
         else
         {
            wealthVo = param1 as WealthVo;
         }
         if(showParam && showParam.title)
         {
            this.panelBg.txt_titleName.text = showParam.title;
         }
         else
         {
            this.panelBg.titleImgId = this.moduleId;
         }
         this.renderItem.wealthVo = wealthVo;
         if(showParam && showParam.maxCount)
         {
            _loc2_ = showParam.maxCount;
         }
         else
         {
            _loc2_ = wealthVo.item.count;
         }
         if(showParam && showParam.defaultCount > 0)
         {
            _loc3_ = showParam.defaultCount;
         }
         else
         {
            _loc3_ = wealthVo.item.count;
         }
         this.numBar.init(1,_loc2_,_loc3_);
         if(!StringUtils.isNull(wealthVo.stcItemVo.use_cost))
         {
            this.boxItem.y = 60;
            this.boxBtns.y = 198;
            validateCost();
         }
         else
         {
            this.boxCost.visible = false;
         }
      }
      
      public function server_bagItemUse() : void
      {
         if(showParam && showParam.useHandler)
         {
            Handler.execute(showParam.useHandler,[this.numBar.nowNum]);
         }
         else if(wealthVo.stcItemVo.kind != 97)
         {
            if(wealthVo.stcItemVo.kind == 99)
            {
               new UseItemTask(wealthVo.item.id,wealthVo.item.itemId,this.numBar.nowNum,false).addHandlers(useItemTaskCpl,diamondBoxErr).exec();
            }
            else
            {
               new UseItemTask(wealthVo.item.id,wealthVo.item.itemId,this.numBar.nowNum,false).addHandlers(useItemTaskCpl).exec();
            }
         }
         else
         {
            ModuleMgr.ins.showModule(11921,new UseHeroSelectBoxViewVo(wealthVo,this.numBar.nowNum,useItemTaskCpl),11000);
         }
      }
      
      private function diamondBoxErr(param1:UseItemTask) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = param1.errorMsg;
         if(300002005 !== _loc4_)
         {
            if(300004024 === _loc4_)
            {
               _loc2_ = StcMgr.ins.getItemVo(wealthVo.item.itemId);
               if(_loc2_.use_cost)
               {
                  _loc3_ = WealthUtil.parseCostStr(_loc2_.use_cost);
                  _loc3_.count = _loc3_.count * this.numBar.nowNum;
                  AlertUtil.lackItem(_loc3_);
               }
            }
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(10000020,[wealthVo.stcItemVo.need_level]));
         }
      }
      
      private function useItemTaskCpl() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
   }
}
