package nslm2.modules.cultivates.pet
{
   import game.ui.petModule.PetSelectModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import nslm2.modules.cultivates.pet.service.PetService;
   import morn.core.handlers.Handler;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.PetInfo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class PetSelectModule extends PetSelectModuleUI
   {
       
      
      public function PetSelectModule()
      {
         super();
      }
      
      public function get pageBar() : IPageBar
      {
         return pageBarRef as IPageBar;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.pageBar.bindList(this.list_pet);
         this.panelBg.txt_titleName.text = "选择战宠";
         var _loc2_:Array = PetModel.ins.canSelectPetList();
         while(_loc2_.length < 8)
         {
            _loc2_.push(new PetInfoVo(0));
         }
         this.list_pet.dataSource = _loc2_;
         this.list_pet.selectHandler = changePet;
         super.preShow(param1);
      }
      
      private function changePet() : void
      {
         PetService.ins.petOnBattle((this.list_pet.selectedItem as PetInfoVo).id,1,new Handler(changeOnBattleSuccess,[1]));
      }
      
      private function changeOnBattleSuccess(param1:int) : void
      {
         var _loc2_:* = null;
         AlertUtil.float(LocaleMgr.ins.getStr(32000022));
         if(PetModel.ins.onBattlePetID)
         {
            _loc2_ = PetModel.ins.getPetInfo(PetModel.ins.onBattlePetID);
         }
         if(_loc2_)
         {
            _loc2_.position = 0;
         }
         if(param1 == 1)
         {
            PetModel.ins.onBattlePetID = (this.list_pet.selectedItem as PetInfoVo).id;
         }
         else
         {
            PetModel.ins.onBattlePetID = 0;
         }
         var _loc3_:PetInfo = PetModel.ins.getPetInfo(PetModel.ins.onBattlePetID);
         _loc3_.position = 7;
         PetModel.ins.sortPetList();
         ObserverMgr.ins.sendNotice("refresh_pet_list");
         ModuleMgr.ins.closeModule(this.moduleId);
      }
   }
}
