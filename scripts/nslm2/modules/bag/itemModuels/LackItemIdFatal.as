package nslm2.modules.bag.itemModuels
{
   import com.mz.core.logging.logs.LogFatalBase;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class LackItemIdFatal extends LogFatalBase
   {
       
      
      public function LackItemIdFatal(param1:*, param2:*)
      {
         super(param1,LocaleMgr.ins.getStr(999000016) + param2);
      }
   }
}
