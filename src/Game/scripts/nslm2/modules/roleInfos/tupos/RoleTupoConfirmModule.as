package nslm2.modules.roleInfos.tupos
{
   import game.ui.roleInfos.tupos.RoleTupoConfirmModuleUI;
   import nslm2.common.model.HeroModel;
   import morn.core.components.Button;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class RoleTupoConfirmModule extends RoleTupoConfirmModuleUI
   {
       
      
      private var _vo:nslm2.modules.roleInfos.tupos.RoleTupoConfirmVo;
      
      public function RoleTupoConfirmModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc4_:int = 0;
         _vo = param1 as nslm2.modules.roleInfos.tupos.RoleTupoConfirmVo;
         this.panelBg.titleImgId = 10100;
         this.list_feedheros.dataSource = _vo.feedHeroList;
         var _loc3_:* = -1;
         var _loc2_:int = _vo.feedHeroList.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            if(HeroModel.ins.isDefaultHero(_vo.feedHeroList[_loc4_]) == false)
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         if(_loc3_ != -1)
         {
            this.box_alert.visible = true;
            this.box_alert.x = this.list_feedheros.x + 66 * (int(_loc3_ % this.list_feedheros.repeatX)) - 105;
            this.box_alert.y = this.list_feedheros.y + 74 * (int(_loc3_ / this.list_feedheros.repeatX)) - 52;
            this.btnOk.btn_ok.disabled = true;
         }
         else
         {
            this.box_alert.visible = false;
            this.btnOk.btn_ok.disabled = false;
         }
         super.preShow(param1);
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btnOk.btn_ok !== _loc2_)
         {
            if(this.btnCancel.btn_cancel === _loc2_)
            {
               Handler.execute(_vo.handlerNo);
               ModuleMgr.ins.closeModule(this.moduleId);
            }
         }
         else
         {
            Handler.execute(_vo.handlerYes);
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         Handler.execute(_vo.handlerNo);
         super.preClose(param1);
      }
   }
}
