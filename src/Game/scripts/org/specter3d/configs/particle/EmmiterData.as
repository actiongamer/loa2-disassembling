package org.specter3d.configs.particle
{
   public class EmmiterData
   {
       
      
      public var name:String = "";
      
      public var url:String = "";
      
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
      
      public var keyFrames:Vector.<org.specter3d.configs.particle.KeyFrameData>;
      
      public var isKeyFramesLoop:Boolean = false;
      
      public var modelUrl:String = "";
      
      public var modelTextureUrl:String;
      
      public var modelAction:String = "";
      
      public var modelAlpha_type:int = 0;
      
      public var modelAddMode:int = 0;
      
      public var renderLayer:int = 0;
      
      public var pData:org.specter3d.configs.particle.SpecterParticleData;
      
      public function EmmiterData()
      {
         keyFrames = new Vector.<org.specter3d.configs.particle.KeyFrameData>();
         super();
      }
   }
}
