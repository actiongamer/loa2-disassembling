package org.specter3d.configs.particle
{
   public class KeyFrameData
   {
      
      public static const NO_SHAKE:int = 0;
      
      public static const SHAKE1:int = 1;
      
      public static const SHAKE2:int = 2;
      
      public static const SHAKE3:int = 3;
      
      public static const SHAKE4:int = 4;
      
      public static const SHAKE5:int = 5;
      
      public static const SHAKE6:int = 6;
      
      public static const SHAKE7:int = 7;
      
      public static const SHAKE8:int = 8;
      
      public static const SHAKE9:int = 9;
      
      public static const SHAKE10:int = 10;
       
      
      public var keyFrame:int = 0;
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var z:Number = 0;
      
      public var rotationX:Number = 0;
      
      public var rotationY:Number = 0;
      
      public var rotationZ:Number = 0;
      
      public var scaleX:Number = 1;
      
      public var scaleY:Number = 1;
      
      public var scaleZ:Number = 1;
      
      public var alpha:Number = 1;
      
      public var shake:int;
      
      public function KeyFrameData()
      {
         super();
      }
      
      public function clone() : KeyFrameData
      {
         var _loc1_:KeyFrameData = new KeyFrameData();
         _loc1_.keyFrame = keyFrame;
         _loc1_.x = x;
         _loc1_.y = y;
         _loc1_.z = z;
         _loc1_.rotationX = rotationX;
         _loc1_.rotationY = rotationY;
         _loc1_.rotationZ = rotationZ;
         _loc1_.scaleX = scaleX;
         _loc1_.scaleY = scaleY;
         _loc1_.scaleZ = scaleZ;
         _loc1_.alpha = alpha;
         _loc1_.shake = shake;
         return _loc1_;
      }
   }
}
