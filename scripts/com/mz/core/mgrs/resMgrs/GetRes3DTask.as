package com.mz.core.mgrs.resMgrs
{
   import com.mz.core.utils2.task.TaskBase;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import org.specter3d.loaders.AssetLib;
   
   public class GetRes3DTask extends TaskBase
   {
       
      
      public function GetRes3DTask(param1:String)
      {
         super(param1);
      }
      
      public function get url() : String
      {
         return this.tag as String;
      }
      
      override public function exec() : void
      {
         super.exec();
         AppGlobalContext.QueueLoader.loadOne(new ResourceVo(url),get_onComplete);
      }
      
      private function get_onComplete() : void
      {
         if(AssetLib.getData(url) == null)
         {
            this.onError("io error " + url);
         }
         else
         {
            this.onComplete();
         }
      }
   }
}
