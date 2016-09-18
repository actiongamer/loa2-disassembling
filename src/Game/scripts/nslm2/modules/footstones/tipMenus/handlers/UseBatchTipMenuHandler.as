package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class UseBatchTipMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function UseBatchTipMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ModuleMgr.ins.showModule(11030,this.data,ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
