package com.mz.core.errors
{
   import com.mz.core.utils2.reflects.ReflectUtil;
   
   public class ArgClassError extends Error
   {
       
      
      public function ArgClassError(param1:*, param2:Array)
      {
         var _loc7_:int = 0;
         var _loc5_:* = undefined;
         var _loc3_:String = "对象类型错误,当前是" + ReflectUtil.getShortClassName(param1) + ",可以是: ";
         var _loc4_:Array = [];
         var _loc6_:int = param2.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc5_ = param2[_loc7_];
            _loc4_.push(ReflectUtil.getShortClassName(_loc5_));
            _loc7_++;
         }
         super(_loc3_ + _loc4_.join(","),0);
      }
   }
}
