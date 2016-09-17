package org.specter3d.utils
{
   import flash.display.Sprite;
   import org.specter3d.debug.DevLog;
   
   public class MathR
   {
       
      
      public function MathR()
      {
         super();
         DevLog.debug("engine","数学类已载入");
      }
      
      public static function round(param1:Number, param2:int) : Number
      {
         return Math.round(param1 * Math.pow(10,param2)) / Math.pow(10,param2);
      }
      
      public static function getRnd(param1:Number, param2:Number = 0) : Number
      {
         return Math.round(Math.random() * (param1 - param2 + 1) + param2);
      }
      
      public static function getRndArray(param1:Number, param2:Number, param3:int, param4:Boolean = true) : Array
      {
         var _loc6_:int = 0;
         var _loc5_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < param3)
         {
            _loc5_.push(getRnd(param1,param2));
            _loc6_++;
         }
         return _loc5_;
      }
      
      public static function distance(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return Math.sqrt((param3 - param1) * (param3 - param1) + (param4 - param2) * (param4 - param2));
      }
      
      public static function DtoR(param1:Number) : Number
      {
         return param1 * 3.14159265358979 / 180;
      }
      
      public static function RtoD(param1:Number) : Number
      {
         return param1 * 180 / 3.14159265358979;
      }
      
      public static function sin(param1:Number) : Number
      {
         return Math.sin(param1 * 3.14159265358979 / 180);
      }
      
      public static function cos(param1:Number) : Number
      {
         return Math.cos(param1 * 3.14159265358979 / 180);
      }
      
      public static function tan(param1:Number) : Number
      {
         return Math.tan(param1 * 3.14159265358979 / 180);
      }
      
      public static function atan(param1:Number) : Number
      {
         return Math.atan(param1) * 180 / 3.14159265358979;
      }
      
      public static function atan2(param1:Number, param2:Number) : Number
      {
         return Math.atan2(param2,param1) * 180 / 3.14159265358979;
      }
      
      public static function angle2(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return atan2(param4 - param2,param3 - param1);
      }
      
      public static function angle(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return atan2(param3 - param1,param4 - param2);
      }
      
      public static function asin(param1:Number) : Number
      {
         return Math.round(Math.asin(param1) * 180 / 3.14159265358979);
      }
      
      public static function acos(param1:Number) : Number
      {
         return Math.round(Math.acos(param1) * 180 / 3.14159265358979);
      }
      
      public static function makeCircle(param1:Number = 20, param2:Number = 0) : Sprite
      {
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginFill(param2);
         _loc4_.graphics.drawCircle(0,0,param1);
         _loc4_.graphics.endFill();
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginFill(16777215);
         _loc3_.graphics.drawCircle(10,0,4);
         _loc3_.graphics.endFill();
         _loc4_.addChild(_loc3_);
         return _loc4_;
      }
      
      public static function makeBall(param1:Number = 20, param2:Number = 0) : Sprite
      {
         var _loc3_:Sprite = new Sprite();
         _loc3_.mouseEnabled = false;
         _loc3_.mouseChildren = false;
         _loc3_.graphics.beginFill(param2);
         _loc3_.graphics.drawCircle(0,0,param1);
         _loc3_.graphics.endFill();
         return _loc3_;
      }
   }
}
