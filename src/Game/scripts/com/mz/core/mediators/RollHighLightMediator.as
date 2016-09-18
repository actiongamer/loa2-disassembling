package com.mz.core.mediators
{
   import flash.display.DisplayObject;
   import com.mz.core.utils.FilterUtil;
   import flash.display.InteractiveObject;
   
   public class RollHighLightMediator extends RollMediator
   {
       
      
      public var target:DisplayObject;
      
      public var highLightVal:Number;
      
      public function RollHighLightMediator(param1:InteractiveObject, param2:DisplayObject = null, param3:Number = 0.2)
      {
         super(param1,this.rollHandler);
         if(param2 == null)
         {
            param2 = param1;
         }
         this.target = param2;
         this.highLightVal = param3;
      }
      
      private function rollHandler(param1:Boolean) : void
      {
         if(this.actived == false)
         {
            return;
         }
         if(param1)
         {
            target.filters = [FilterUtil.getLightFilter(highLightVal)];
         }
         else
         {
            target.filters = null;
         }
      }
   }
}
