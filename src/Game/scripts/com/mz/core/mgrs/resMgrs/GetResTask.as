package com.mz.core.mgrs.resMgrs
{
   import com.mz.core.utils2.task.TaskBase;
   
   public class GetResTask extends TaskBase
   {
       
      
      public var rs;
      
      private var priority:int;
      
      public var resType:int;
      
      public var isSustained:Boolean;
      
      public function GetResTask(param1:int, param2:String, param3:uint = 3, param4:Boolean = false)
      {
         super(param2);
         resType = param1;
         this.priority = param3;
         this.isSustained = param4;
      }
      
      public function get url() : String
      {
         return this.tag as String;
      }
      
      override public function exec() : void
      {
         super.exec();
         ResMgr.ins.load(resType,url,get_onComplete,priority,isSustained);
      }
      
      private function get_onComplete(param1:String, param2:*) : void
      {
         if(param2 == null)
         {
            this.onError("url io error");
         }
         else
         {
            rs = param2;
            this.onComplete();
         }
      }
   }
}
