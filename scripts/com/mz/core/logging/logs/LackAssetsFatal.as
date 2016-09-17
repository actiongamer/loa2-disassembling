package com.mz.core.logging.logs
{
   public class LackAssetsFatal extends LogFatalBase
   {
       
      
      public function LackAssetsFatal(param1:*, param2:String)
      {
         super(param1,"缺少资源:" + param2);
      }
   }
}
