package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class StrenTreasureMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function StrenTreasureMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ModuleMgr.ins.showModule(30600,data,ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
