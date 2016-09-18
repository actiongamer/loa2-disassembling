package nslm2.modules.footstones.quickUseModules
{
   import game.ui.quickUseModules.QuickItemPanelUI;
   import proto.Item;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.utils.ServerTimer;
   import com.greensock.TweenLite;
   import morn.core.components.Button;
   import nslm2.modules.bag.UseItemTask;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.bag.UseHeroSelectBoxViewVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import morn.customs.expands.MornExpandUtil;
   
   public class QuickItemPanel extends QuickItemPanelUI implements IQuickUse
   {
       
      
      private var _item:Item;
      
      public function QuickItemPanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      private function get vo() : WealthVo
      {
         return WealthUtil.itemToVo(_item);
      }
      
      private function get numBar() : NumBarS1
      {
         return this.numBarRef as NumBarS1;
      }
      
      public function show(param1:Item) : void
      {
         _item = param1;
         this.render_item.dataSource = vo;
         this.numBar.init(1,param1.count,param1.count);
         this.btn_confirm.mouseEnabled = false;
         if(QuickUseModel.ins.lastClickedStamp + 1 - ServerTimer.ins.second > 0)
         {
            TweenLite.delayedCall(QuickUseModel.ins.lastClickedStamp + 1 - ServerTimer.ins.second,enableMouse);
         }
         else
         {
            this.btn_confirm.mouseEnabled = true;
         }
      }
      
      private function enableMouse() : void
      {
         this.btn_confirm.mouseEnabled = true;
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc4_:* = param1;
         if(this.btn_confirm === _loc4_)
         {
            if(ServerTimer.ins.second < QuickUseModel.ins.lastClickedStamp + 1)
            {
               return;
            }
            _loc3_ = vo;
            if(_loc3_.stcItemVo.kind != 97)
            {
               if(_loc3_.stcItemVo.kind == 99)
               {
                  new UseItemTask(_loc3_.item.id,_loc3_.item.itemId,this.numBar.nowNum).addHandlers(useItemTaskCpl,diamondBoxErr).exec();
               }
               else
               {
                  new UseItemTask(_loc3_.item.id,_loc3_.item.itemId,this.numBar.nowNum).addHandlers(useItemTaskCpl).exec();
               }
            }
            else
            {
               _loc2_ = ModuleMgr.ins.popLayer.curModuleId;
               if(_loc2_ == 96300)
               {
                  if(ModuleMgr.ins.popLayer.moduleList.length >= 2)
                  {
                     _loc2_ = ModuleMgr.ins.popLayer.moduleList[ModuleMgr.ins.popLayer.moduleList.length - 2].configVo.moduleId;
                  }
                  else
                  {
                     _loc2_ = 0;
                  }
               }
               ModuleMgr.ins.showModule(11921,new UseHeroSelectBoxViewVo(_loc3_,this.numBar.nowNum,useItemTaskCpl,startHandler),_loc2_);
            }
            QuickUseModel.ins.lastClickedStamp = ServerTimer.ins.second;
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
               _loc2_ = StcMgr.ins.getItemVo(vo.item.itemId);
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
            AlertUtil.float(LocaleMgr.ins.getStr(10000020,[vo.stcItemVo.need_level]));
         }
      }
      
      private function useItemTaskCpl() : void
      {
      }
      
      private function startHandler() : void
      {
         ModuleMgr.ins.closeModule(11921);
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(enableMouse);
         super.dispose();
      }
   }
}
