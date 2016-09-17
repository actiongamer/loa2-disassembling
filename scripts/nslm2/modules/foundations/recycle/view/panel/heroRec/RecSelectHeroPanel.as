package nslm2.modules.foundations.recycle.view.panel.heroRec
{
   import game.ui.recycleModules.heroRecycle.RecSelectHeroPanelUI;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import morn.core.components.Button;
   import nslm2.modules.foundations.recycle.vo.RecycleVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.compsEffects.ImgMoveEffect;
   import morn.customs.components.WealthRender;
   import flash.geom.Point;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class RecSelectHeroPanel extends RecSelectHeroPanelUI
   {
       
      
      private var recModel:RecycleModel;
      
      public function RecSelectHeroPanel()
      {
         recModel = RecycleModel.ins;
         super();
         list_hero.changeHandler = selectHandler;
         btnOK.btn_ok.clickHandler = btnOKHandler;
         this.panelBg.titleImgId = 11301;
         countPoint.visible = true;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         list_hero.dataSource = recModel.idleHeroList;
         txt_selectedNum.text = recModel.selectedHeroNum + "/5";
         countPoint.txt_count.text = recModel.selectedHeroNum + "";
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
         var _loc1_:RecycleVo = list_hero.selectedItem as RecycleVo;
         if(recModel.selectedHeroNum >= 5)
         {
            if(!_loc1_.isSelected)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(999000336));
               return;
            }
         }
         if(!_loc1_.isSelected)
         {
            _loc1_.isSelected = !_loc1_.isSelected;
            _loc3_ = new ImgMoveEffect();
            _loc2_ = list_hero.selection as WealthRender;
            _loc4_ = _loc2_.ref_img_icon.localToGlobal(new Point());
            _loc3_.init(_loc2_.ref_img_icon,_loc4_,countPoint.txt_count.localToGlobal(new Point(10,-5)),iconFlyCompleteHandler);
            _loc3_.config(0.3,0.5);
            _loc3_.startAnim();
         }
         else
         {
            _loc1_.isSelected = !_loc1_.isSelected;
            countPoint.txt_count.text = recModel.selectedHeroNum + "";
            txt_selectedNum.text = recModel.selectedHeroNum + "/5";
         }
         list_hero.changeItem(list_hero.selectedIndex,_loc1_);
      }
      
      private function iconFlyCompleteHandler() : void
      {
         var _loc1_:RecycleVo = list_hero.selectedItem as RecycleVo;
         countPoint.txt_count.text = recModel.selectedHeroNum + "";
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         ObserverMgr.ins.sendNotice("recycle_notice_update_list");
         super.btnCloseHandler(param1);
      }
   }
}
