package nslm2.modules.cultivates.treasure.view.compose
{
   import game.ui.treasures.runeBag.RuneBatchComposePanelUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.utils.LocalData;
   import nslm2.modules.cultivates.treasure.vo.RuneTypeVo;
   import nslm2.modules.cultivates.treasure.service.TreasureService;
   import proto.BaoWuMoshiAllRes;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   
   public class RuneBatchCompsePanel extends RuneBatchComposePanelUI
   {
       
      
      private var runeTypeArr:Array;
      
      public function RuneBatchCompsePanel()
      {
         super();
         btn_ok.clickHandler = okBtnClickHandler;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc4_:int = 0;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(30600206);
         TreasureModel.ins.autoBatchMaxLvl = 2;
         runeTypeArr = TreasureModel.ins.initAutoBatchRuneTypeArr();
         list_type.dataSource = TreasureModel.ins.initAutoBatchRuneTypeArr();
         list_type.selectedIndex = 0;
         var _loc3_:Array = [];
         _loc4_ = 2;
         while(_loc4_ <= DefindConsts.FUMO_MAXLV)
         {
            _loc3_.push(LocaleMgr.ins.getStr(30600214,[_loc4_]));
            _loc4_++;
         }
         comb_level.labels = _loc3_.join(",");
         var _loc2_:int = LocalData.insCurPlayer.load("RUNE_COMPOSE_LEVEL",0);
         comb_level.selectedIndex = _loc2_;
         comb_level.selectHandler = combSelectedHandler;
         TreasureModel.ins.autoBatchMaxLvl = comb_level.selectedIndex + 2;
         super.preShow();
      }
      
      private function combSelectedHandler() : void
      {
         TreasureModel.ins.autoBatchMaxLvl = comb_level.selectedIndex + 2;
      }
      
      private function okBtnClickHandler(param1:Object) : void
      {
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = runeTypeArr;
         for each(var _loc3_ in runeTypeArr)
         {
            if(_loc3_.selected)
            {
               _loc2_.push(_loc3_.type);
            }
         }
         TreasureService.ins.runeBatchCompose(_loc2_,TreasureModel.ins.autoBatchMaxLvl,false,getResutHandler);
         LocalData.insCurPlayer.save("RUNE_COMPOSE_LEVEL",comb_level.selectedIndex);
      }
      
      private function getResutHandler(param1:BaoWuMoshiAllRes) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _loc2_ = WealthUtil.rewardArrToWealthVoArr(param1.reward);
            _loc2_.sort(TreasureUtil.sortRune);
            ModuleMgr.ins.showModule(30605,_loc2_,30604);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30600212));
         }
      }
   }
}
