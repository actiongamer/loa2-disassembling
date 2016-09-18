package org.specter3d.utils
{
   import flash.system.System;
   import flash.net.LocalConnection;
   import flash.geom.Point;
   import away3d.core.base.Object3D;
   import flash.geom.Vector3D;
   import com.greensock.TweenLite;
   import org.specter3d.context.AppGlobalContext;
   
   public class SpecterUtils
   {
      
      public static const COORDINATE_ANGEL:Number = 90;
      
      public static const ALPHA_THRESHOLD:Number = 0.5;
      
      public static const PI1_2:Number = 1.5707963267948966;
      
      public static const MS_PER_FRAME:Number = 16.666666666666668;
      
      public static const GAME_DEFAULT_FRAME:int = 60;
      
      public static const GAME_ONE_FRAME_TIME:int = 16;
      
      public static const ADDx2:String = "addx2";
       
      
      public function SpecterUtils()
      {
         super();
      }
      
      public static function gc() : void
      {
         System.gc();
         try
         {
            new LocalConnection().connect("222");
            new LocalConnection().connect("222");
            return;
         }
         catch(error:Error)
         {
            return;
         }
      }
      
      public static function getRangePoint(param1:Number, param2:Object3D, param3:Number) : Point
      {
         return new Point(param1 * Math.sin(param3 / 180 * 3.14159265358979) + param2.x,param1 * Math.cos(param3 / 180 * 3.14159265358979) + param2.z);
      }
      
      public static function randomRange(param1:Number = 0, param2:Number = 1) : Number
      {
         return param1 + Math.random() * (param2 - param1);
      }
      
      public static function minu(param1:Vector3D, param2:Vector3D) : Vector3D
      {
         return new Vector3D(param2.x - param1.x,param2.y,param2.z - param1.z);
      }
      
      public static function multEqual(param1:Vector3D, param2:Number) : Vector3D
      {
         param1.x = param1.x * param2;
         param1.z = param1.z * param2;
         param1.y = param1.y * param2;
         param1.w = param2;
         return param1;
      }
      
      public static function getRotation(param1:Object3D, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         var _loc7_:Number = Math.atan2(param2 - param4,param3 - param5) / 3.14159265358979 * 180;
         var _loc6_:int = param1.rotationY - _loc7_;
         while(_loc6_ < 0)
         {
            _loc6_ = _loc6_ + 360;
         }
         _loc6_ = _loc6_ % 360;
         return _loc6_ > 15 && _loc6_ < 345?_loc7_:Number(param1.rotationY);
      }
      
      public static function setRotation(param1:Object3D, param2:Number, param3:Boolean = true) : void
      {
         if(Math.abs(param1.rotationY - param2) > 180)
         {
            param2 = param2 - 360;
         }
         if(param3)
         {
            §§push(TweenLite.to(param1,2,{"rotationY":param2}));
         }
         else
         {
            var _loc4_:* = param2;
            param1.rotationY = _loc4_;
            §§push(_loc4_);
         }
      }
      
      public static function stringToBoolean(param1:String) : Boolean
      {
         return param1 == "true";
      }
      
      public static function stringToVector3D(param1:String) : Vector3D
      {
         var _loc2_:Array = param1.split(",");
         return _loc2_.length == 4?new Vector3D(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]):null;
      }
      
      public static function getVolMutiByDis(param1:int, param2:int) : Number
      {
         if(!AppGlobalContext.stage3d || !AppGlobalContext.stage3d.cameraController || !AppGlobalContext.stage3d.cameraController.lookAtPosition)
         {
            return 0;
         }
         var _loc5_:Number = AppGlobalContext.stage3d.cameraController.lookAtPosition.x;
         var _loc6_:Number = AppGlobalContext.stage3d.cameraController.lookAtPosition.z;
         var _loc4_:Number = MathR.distance(param1,param2,_loc5_,_loc6_);
         var _loc3_:Number = Math.max(AppGlobalContext.stageMaxWidth,AppGlobalContext.stageMaxHeight) * 0.45;
         if(_loc4_ < _loc3_)
         {
            return (_loc3_ - _loc4_) / _loc3_;
         }
         return 0;
      }
   }
}
