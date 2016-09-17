package morn.core.managers
{
   import com.mz.core.utils2.task.TaskBase;
   import morn.customs.tests.TestTimerCount;
   import flash.display.BitmapData;
   
   public class ParseResSwfTask extends TaskBase
   {
       
      
      private var swfClasses:Vector.<String>;
      
      public function ParseResSwfTask(param1:Vector.<String>)
      {
         super();
         this.swfClasses = param1;
      }
      
      override public function exec() : void
      {
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc2_:int = 0;
         super.exec();
         TestTimerCount.ins.start();
         var _loc4_:int = swfClasses.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc1_ = swfClasses[_loc5_];
            try
            {
               _loc3_ = App.asset.getBitmapData(_loc1_);
               _loc2_ = _loc3_.width;
            }
            catch($err:Error)
            {
            }
            _loc5_++;
         }
         this.onComplete();
      }
   }
}
