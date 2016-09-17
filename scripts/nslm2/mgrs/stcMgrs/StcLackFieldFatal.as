package nslm2.mgrs.stcMgrs
{
   import com.mz.core.logging.logs.LogFatalBase;
   
   public class StcLackFieldFatal extends LogFatalBase
   {
       
      
      public function StcLackFieldFatal(param1:*, param2:String, param3:String, param4:*)
      {
         super(param1,param2 + "表缺少数据(字段: " + param3 + ":" + param4 + ")");
      }
   }
}
