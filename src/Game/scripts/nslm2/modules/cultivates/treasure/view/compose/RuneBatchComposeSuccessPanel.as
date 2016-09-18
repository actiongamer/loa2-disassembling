package nslm2.modules.cultivates.treasure.view.compose
{
   import game.ui.treasures.runeBag.RuneBatchComposeSuccessUI;
   import flash.events.MouseEvent;
   import morn.customs.components.WealthRender;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.common.uiEffects.IconFlyEff;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class RuneBatchComposeSuccessPanel extends RuneBatchComposeSuccessUI
   {
       
      
      public function RuneBatchComposeSuccessPanel()
      {
         super();
         moduleFadeInType = 2;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         list_item.repeatX = param1.length;
         list_item.dataSource = param1;
         list_item.x = box_bg.width - list_item.width >> 1;
         this.addEventListener("click",onClick);
         super.preShow();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc2_:* = null;
         var _loc3_:Array = list_item.dataSource as Array;
         var _loc5_:int = _loc3_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc4_ = list_item.getCell(_loc7_) as WealthRender;
            _loc6_ = _loc3_[_loc7_];
            _loc2_ = TreasureModel.ins.getRuneCategoryPositon(_loc6_.sid);
            IconFlyEff.createFlyTo(_loc4_.ref_img_icon,_loc2_[0]).set_scaleTo(_loc2_[1]).exec();
            _loc7_++;
         }
         ModuleMgr.ins.closeModule(30606);
         ObserverMgr.ins.sendNotice("treasure_update_rune_data");
      }
   }
}
