package nslm2.modules.footstones.tipMenus.handlers
{
   import com.mz.core.mgrs.ObserverMgr;
   
   public class RuneRecycleTipMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function RuneRecycleTipMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ObserverMgr.ins.sendNotice("treasure_open_recycle_rune_bag");
      }
   }
}
