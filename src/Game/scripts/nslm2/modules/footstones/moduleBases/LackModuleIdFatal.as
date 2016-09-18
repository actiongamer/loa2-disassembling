package nslm2.modules.footstones.moduleBases
{
   import com.mz.core.logging.logs.LogFatalBase;
   
   public class LackModuleIdFatal extends LogFatalBase
   {
       
      
      public function LackModuleIdFatal(param1:*, param2:int)
      {
         super(param1,"缺少module id: " + param2,"请去RegModuleTask中注册");
      }
   }
}
