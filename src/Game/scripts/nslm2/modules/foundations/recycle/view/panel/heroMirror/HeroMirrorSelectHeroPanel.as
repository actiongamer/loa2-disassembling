package nslm2.modules.foundations.recycle.view.panel.heroMirror
{
   import game.ui.recycleModules.heroRecycle.RecSelectHeroPanelUI;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import morn.core.components.Button;
   import nslm2.modules.foundations.recycle.vo.RecycleVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import morn.customs.components.WealthRender;
   import flash.geom.Point;
   import nslm2.common.compsEffects.ImgMoveEffect;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class HeroMirrorSelectHeroPanel extends RecSelectHeroPanelUI
   {
       
      
      private var recModel:RecycleModel;
      
      public function HeroMirrorSelectHeroPanel()
      {
         recModel = RecycleModel.ins;
         super();
         list_hero.changeHandler = selectHandler;
         btnOK.btn_ok.clickHandler = btnOKHandler;
         this.panelBg.titleImgId = 11310;
         countPoint.visible = true;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         list_hero.dataSource = param1;
         txt_selectedNum.text = recModel.mirrorSelectedHeroNum + "/5";
         countPoint.txt_count.text = recModel.mirrorSelectedHeroNum + "";
         super.preShow(param1);
      }
      
      private function btnOKHandler(param1:Button) : void
      {
         btnCloseHandler();
      }
      
      private function selectHandler() : void
      {
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:RecycleVo = list_hero.selectedItem as RecycleVo;
         if(recModel.mirrorSelectedHeroNum >= 5)
         {
            if(!_loc2_.isSelected)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(109001025));
               return;
            }
         }
         if(!_loc2_.isSelected)
         {
            if(PlayerModel.ins.level < DefindConsts.HERO_CHANGE_LV_LIMIT)
            {
               if(!RecycleModel.ins.cheakGroup(_loc2_))
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(109001021,[DefindConsts.HERO_CHANGE_LV_LIMIT]));
                  return;
               }
               _loc6_ = StcMgr.ins.getNpcVo(RecycleModel.ins.rewardHeroId);
               if(_loc6_ && _loc6_.group != _loc2_.wealthVo.stcNpcVo.group)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(109001026,[DefindConsts.HERO_CHANGE_LV_LIMIT]));
                  return;
               }
            }
            _loc2_.isSelected = !_loc2_.isSelected;
            _loc3_ = list_hero.selection as WealthRender;
            _loc5_ = _loc3_.ref_img_icon.localToGlobal(new Point());
            _loc4_ = new ImgMoveEffect();
            _loc4_.init(_loc3_.ref_img_icon,_loc5_,countPoint.txt_count.localToGlobal(new Point(10,-5)),iconFlyCompleteHandler);
            _loc4_.config(0.3,0.5);
            _loc4_.startAnim();
            _loc7_ = 0;
            while(_loc7_ < 5)
            {
               if(recModel.rewardHeroIdArr[_loc7_] == null)
               {
                  recModel.rewardHeroIdArr[_loc7_] = _loc2_;
                  break;
               }
               _loc7_++;
            }
         }
         else
         {
            _loc2_.isSelected = !_loc2_.isSelected;
            countPoint.txt_count.text = recModel.mirrorSelectedHeroNum + "";
            txt_selectedNum.text = recModel.mirrorSelectedHeroNum + "/5";
            _loc1_ = recModel.rewardHeroIdArr.indexOf(_loc2_);
            if(_loc1_ != -1)
            {
               recModel.rewardHeroIdArr[_loc1_] = null;
            }
            else
            {
               trace("移除有问题");
            }
         }
         list_hero.changeItem(list_hero.selectedIndex,_loc2_);
      }
      
      private function iconFlyCompleteHandler() : void
      {
         var _loc1_:RecycleVo = list_hero.selectedItem as RecycleVo;
         countPoint.txt_count.text = recModel.mirrorSelectedHeroNum + "";
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:Array = RecycleModel.ins.rewardHeroIdArr;
         if(PlayerModel.ins.level < DefindConsts.HERO_CHANGE_LV_LIMIT)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc2_ = _loc3_[_loc4_] as RecycleVo;
               if(_loc2_ && !RecycleModel.ins.cheakGroup(_loc2_))
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(109001021,[DefindConsts.HERO_CHANGE_LV_LIMIT]));
                  return;
               }
               _loc4_++;
            }
         }
         ObserverMgr.ins.sendNotice("recycle_notice_update_list");
         super.btnCloseHandler(param1);
      }
   }
}
