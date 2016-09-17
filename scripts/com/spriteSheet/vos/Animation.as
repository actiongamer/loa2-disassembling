package com.spriteSheet.vos
{
   import com.mz.core.interFace.IDispose;
   import com.spriteSheet.SpriteFrame;
   import flash.geom.Point;
   
   public class Animation implements IDispose
   {
       
      
      public var seqName:String;
      
      public var delay:Number;
      
      public var alwaysLoop:Boolean;
      
      public var arFrames:Vector.<SpriteFrame>;
      
      public var center:Point;
      
      public var needLoopCnt:int;
      
      public var loopedCnt:int;
      
      public function Animation(param1:String, param2:Vector.<SpriteFrame>, param3:Number = 0, param4:Boolean = true, param5:int = 1)
      {
         super();
         this.seqName = param1;
         this.delay = 0;
         if(param3 > 0)
         {
            delay = 1 / param3;
         }
         this.arFrames = param2;
         this.alwaysLoop = param4;
         this.needLoopCnt = param5;
         this.center = new Point(param2[0].centerX,param2[0].centerY);
      }
      
      public function dispose() : void
      {
         arFrames = null;
      }
   }
}
