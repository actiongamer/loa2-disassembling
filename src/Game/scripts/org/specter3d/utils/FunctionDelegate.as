package org.specter3d.utils
{
   public class FunctionDelegate
   {
       
      
      public function FunctionDelegate()
      {
         super();
      }
      
      public static function create(param1:Function, ... rest) : Function
      {
         handler = param1;
         args = rest;
         return function(... rest):void
         {
            handler.apply(this,rest.concat(args));
         };
      }
   }
}
