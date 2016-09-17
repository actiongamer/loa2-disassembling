package nslm2.modules.cultivates.treasure.view.compose
{
   import game.ui.treasures.runeBag.RuneBatchComposePreviewPanelUI;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.cultivates.treasure.vo.RuneTypeVo;
   import nslm2.modules.cultivates.treasure.service.TreasureService;
   import proto.BaoWuMoshiAllRes;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.ctrls.ListPageBarCtrl;
   
   public class RuneBatchComposePreviewPanel extends RuneBatchComposePreviewPanelUI
   {
       
      
      public function RuneBatchComposePreviewPanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         this.parts.push(new ListPageBarCtrl(list_item,null,btn_prev,btn_next));
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(okBtn.btn_ok !== _loc2_)
         {
            if(cacelBtn.btn_cancel === _loc2_)
            {
               ModuleMgr.ins.closeModule(30605);
            }
         }
         else
         {
            btnOkClickHandler();
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:Array = param1 as Array;
         if(_loc2_.length > 8)
         {
            btn_prev.visible = true;
            btn_next.visible = true;
         }
         else
         {
            btn_prev.visible = false;
            btn_next.visible = false;
         }
         list_item.dataSource = _loc2_;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(30600207);
         super.preShow();
      }
      
      private function btnOkClickHandler() : void
      {
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = TreasureModel.ins.autoBatchRuneTypeArr;
         for each(var _loc2_ in TreasureModel.ins.autoBatchRuneTypeArr)
         {
            if(_loc2_.selected)
            {
               _loc1_.push(_loc2_.type);
            }
         }
         TreasureService.ins.runeBatchCompose(_loc1_,TreasureModel.ins.autoBatchMaxLvl,true,batchComoposeResultHandler);
      }
      
      private function batchComoposeResultHandler(param1:BaoWuMoshiAllRes) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _loc2_ = WealthUtil.rewardArrToWealthVoArr(param1.reward);
            _loc2_.sort(TreasureUtil.sortRune);
            ModuleMgr.ins.showModule(30606,_loc2_,30600);
         }
      }
   }
}
