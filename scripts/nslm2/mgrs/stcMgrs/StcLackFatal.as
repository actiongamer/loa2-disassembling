package nslm2.mgrs.stcMgrs
{
   import com.mz.core.logging.logs.LogFatalBase;
   
   public class StcLackFatal extends LogFatalBase
   {
       
      
      public function StcLackFatal(param1:*, param2:String, param3:*)
      {
         super(param1,param2 + "表缺少数据(主键值:" + param3 + ")");
      }
   }
}
