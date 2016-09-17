package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class UseGiveTipMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function UseGiveTipMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ModuleMgr.ins.showModule(13324,this.data,ModuleMgr.ins.popLayer.curModuleId);
      }
   }
}
