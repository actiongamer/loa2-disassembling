package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class EquipRecycleTipMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function EquipRecycleTipMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ModuleMgr.ins.showModule(11300,{"index":1});
      }
   }
}
