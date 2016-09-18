package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class StrenEquipMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function StrenEquipMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ModuleMgr.ins.showModule(30500,data,ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
