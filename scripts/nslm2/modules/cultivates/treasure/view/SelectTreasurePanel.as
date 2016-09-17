package nslm2.modules.cultivates.treasure.view
{
   import game.ui.treasures.strens.SelectTreausrePanelUI;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import morn.core.components.Button;
   import nslm2.modules.cultivates.treasure.vo.TreasureVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.compsEffects.ImgMoveEffect;
   import morn.customs.components.WealthRender;
   import flash.geom.Point;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class SelectTreasurePanel extends SelectTreausrePanelUI
   {
       
      
      private var model:TreasureModel;
      
      public function SelectTreasurePanel()
      {
         model = TreasureModel.ins;
         super();
         list_treasure.changeHandler = selectHandler;
         btnOK.btn_ok.clickHandler = btnOKHandler;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000097);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         list_treasure.dataSource = model.idleTreasureList;
         txt_num.text = model.selectedNum + "";
         super.preShow(param1);
      }
      
      private function btnOKHandler(param1:Button) : void
      {
         btnCloseHandler(null);
      }
      
      private function selectHandler() : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc1_:TreasureVo = list_treasure.selectedItem as TreasureVo;
         if(model.selectedNum >= 6)
         {
            if(!_loc1_.selected)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(999000098));
               return;
            }
         }
         if(!_loc1_.selected)
         {
            _loc1_.selected = !_loc1_.selected;
            _loc3_ = new ImgMoveEffect();
            _loc2_ = list_treasure.selection as WealthRender;
            _loc4_ = _loc2_.ref_img_icon.localToGlobal(new Point());
            _loc3_.init(_loc2_.ref_img_icon,_loc4_,txt_num.localToGlobal(new Point(10,-5)),iconFlyCompleteHandler);
            _loc3_.config(0.3,0.5);
            _loc3_.startAnim();
         }
         else
         {
            _loc1_.selected = !_loc1_.selected;
            txt_num.text = model.selectedNum + "";
         }
         list_treasure.changeItem(list_treasure.selectedIndex,_loc1_);
      }
      
      private function iconFlyCompleteHandler() : void
      {
         txt_num.text = model.selectedNum + "";
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         ObserverMgr.ins.sendNotice("treasure_update_selected_list");
         super.btnCloseHandler(param1);
      }
   }
}
