package com.mz.core.logging.appenders
{
   import com.mz.core.interFace.IAppender;
   import com.mz.core.logging.LogConsts;
   
   public class TraceAppender extends AbstractAppender implements IAppender
   {
      
      private static var _ins:com.mz.core.logging.appenders.TraceAppender;
       
      
      public function TraceAppender()
      {
         super();
      }
      
      public static function get ins() : com.mz.core.logging.appenders.TraceAppender
      {
         if(_ins == null)
         {
            _ins = new com.mz.core.logging.appenders.TraceAppender();
         }
         return _ins;
      }
      
      override protected function isFiltered(param1:String) : Boolean
      {
         var _loc2_:* = param1;
         if("FPDebug" !== _loc2_)
         {
            return false;
         }
         return true;
      }
      
      override public function write(param1:int, param2:String, param3:Array) : Boolean
      {
         if(!super.write(param1,param2,param3))
         {
            return false;
         }
         trace(param3.join(" "),"[" + LogConsts.levelToString(param1) + "]",param2);
         return true;
      }
   }
}
