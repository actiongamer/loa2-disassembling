package nslm2.modules.dungeons.scripts.cmds
{
   import com.mz.core.interFace.IDispose;
   import org.specter3d.display.Specter3D;
   import away3d.core.base.Object3D;
   import com.mz.core.utils.MathUtil;
   import com.greensock.TweenLite;
   
   public class ShakeLayerCtrl implements IDispose
   {
       
      
      public var layer:Specter3D;
      
      public var img:Object3D;
      
      public var imgOriY:int;
      
      public var rotationZMax:Number;
      
      public var yMax:Number;
      
      public var xMax:Number;
      
      public var index:int;
      
      private var _yaoLayar:Number = 0;
      
      public function ShakeLayerCtrl(param1:Specter3D, param2:Object3D)
      {
         super();
         this.layer = param1;
         this.img = param2;
         this.imgOriY = param2.y;
      }
      
      public function play(param1:Number, param2:int) : void
      {
         this.index = param2;
         if(index == 0)
         {
            rotationZMax = MathUtil.random(1.2);
            yMax = MathUtil.random(3,3);
         }
         else
         {
            rotationZMax = MathUtil.random(0.9);
            yMax = MathUtil.random(1,1);
         }
         TweenLite.delayedCall(param1,this.yao1);
      }
      
      private function yao1() : void
      {
         TweenLite.to(this,MathUtil.random(1.8,1.2),{
            "yaoLayar":MathUtil.random(1.4,1),
            "onComplete":yao2
         });
      }
      
      private function yao2() : void
      {
         if(index == 0)
         {
            TweenLite.to(this,MathUtil.random(1.8,1.2),{
               "yaoLayar":-MathUtil.random(1.4,1),
               "onComplete":yao1
            });
         }
         else
         {
            TweenLite.to(this,MathUtil.random(1.8,1.2),{
               "yaoLayar":-MathUtil.random(1,0.6),
               "onComplete":yao1
            });
         }
      }
      
      public function get yaoLayar() : Number
      {
         return _yaoLayar;
      }
      
      public function set yaoLayar(param1:Number) : void
      {
         _yaoLayar = param1;
         img.y = imgOriY + param1 * yMax;
         layer.rotationZ = param1 * rotationZMax;
      }
      
      public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(this.yao1);
         TweenLite.killTweensOf(this);
      }
   }
}
