package nslm2.mgrs.stcMgrs
{
   import com.mz.core.logging.logs.LogFatalBase;
   
   public class StcLackFieldValueFatal extends LogFatalBase
   {
       
      
      public function StcLackFieldValueFatal(param1:*, param2:String, param3:String, param4:*)
      {
         super(param1,param2 + "表PK为" + param4 + "的条目缺少数据(字段: " + param3 + ")");
      }
   }
}
