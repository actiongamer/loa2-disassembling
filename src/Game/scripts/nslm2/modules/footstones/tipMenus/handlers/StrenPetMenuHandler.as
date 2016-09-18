package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.roleInfos.equipPanels.EquipPetVo;
   
   public class StrenPetMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function StrenPetMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ModuleMgr.ins.showModule(32000,[(data as EquipPetVo).petId,1],ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
