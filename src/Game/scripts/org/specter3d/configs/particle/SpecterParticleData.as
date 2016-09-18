package org.specter3d.configs.particle
{
   import org.specter3d.configs.Specter3DConfig;
   import org.specter3d.display.particle.SpecterLine;
   import org.specter3d.debug.DebugEngineLog;
   import org.specter3d.configs.particle.node.RotationData;
   import org.specter3d.configs.particle.node.ScaleData;
   import org.specter3d.configs.particle.node.FollowData;
   import org.specter3d.configs.particle.node.ColorData;
   import org.specter3d.configs.particle.node.OrbitData;
   import org.specter3d.configs.particle.node.OscillatorData;
   import org.specter3d.configs.particle.node.BezierData;
   import org.specter3d.configs.particle.node.UVSheetData;
   import org.specter3d.configs.particle.node.UVScrollData;
   
   public class SpecterParticleData extends Specter3DConfig
   {
      
      public static const POINT:String = "point";
      
      public static const LINE:String = "line";
      
      public static const BOX:String = "box";
      
      public static const CYLINDER:String = "cylinder";
      
      public static const SPHERE:String = "sphere";
      
      public static const THUNDER:String = "thunder";
       
      
      public var total:int = 1;
      
      public var emissivity:int = 1;
      
      public var speed:Number = 1;
      
      public var randomStart:Boolean = true;
      
      public var minDuration:Number = 0;
      
      public var maxDuration:Number = 1;
      
      public var minStartTime:Number = 0;
      
      public var maxStartTime:Number = 0;
      
      public var usesDelay:Boolean = false;
      
      public var delay:Number = 0;
      
      public var usesLooping:Boolean = false;
      
      public var yCut:Boolean = false;
      
      public var emitterType:String = "point";
      
      public var lines:Vector.<SpecterLine>;
      
      public var boxDepth:Number = 100;
      
      public var boxWidth:Number = 100;
      
      public var boxHeight:Number = 100;
      
      public var radius:Number = 100;
      
      public var angel:int = 360;
      
      public var cylinderHeight:Number = 100;
      
      public var fixedRadius:Boolean = false;
      
      public var velocity_x:Number = 0;
      
      public var velocity_y:Number = 0;
      
      public var velocity_z:Number = 0;
      
      public var velocity_x_max:Number = 0;
      
      public var velocity_y_max:Number = 0;
      
      public var velocity_z_max:Number = 0;
      
      public var accelerationType:uint = 0;
      
      public var acceleration_x:Number = 0;
      
      public var acceleration_y:Number = 0;
      
      public var acceleration_z:Number = 0;
      
      public var diffusion:Number = 0;
      
      public var diffusionSync:Boolean = false;
      
      public var diffusion_x:Boolean = true;
      
      public var diffusion_y:Boolean = true;
      
      public var diffusion_z:Boolean = true;
      
      public var rotationData:RotationData;
      
      public var scaleData:ScaleData;
      
      public var followData:FollowData;
      
      public var colorData:ColorData;
      
      public var meshData:org.specter3d.configs.particle.MeshData;
      
      public var orbitData:OrbitData;
      
      public var oscillatorData:OscillatorData;
      
      public var bezierData:BezierData;
      
      public var uvSheetData:UVSheetData;
      
      public var uvScrollData:UVScrollData;
      
      public var keyFrames:Vector.<org.specter3d.configs.particle.KeyFrameData>;
      
      public var isKeyFramesLoop:Boolean = false;
      
      public function SpecterParticleData()
      {
         rotationData = new RotationData();
         scaleData = new ScaleData();
         followData = new FollowData();
         colorData = new ColorData();
         meshData = new org.specter3d.configs.particle.MeshData();
         orbitData = new OrbitData();
         oscillatorData = new OscillatorData();
         bezierData = new BezierData();
         uvSheetData = new UVSheetData();
         uvScrollData = new UVScrollData();
         keyFrames = new Vector.<org.specter3d.configs.particle.KeyFrameData>();
         super(1);
      }
      
      public function set url(param1:String) : void
      {
         DebugEngineLog.toWindowError("url- " + param1 + " 无法写入");
      }
      
      public function hasVelNode() : Boolean
      {
         return velocity_x + velocity_y + velocity_z + velocity_x_max + velocity_y_max + velocity_z_max != 0;
      }
      
      public function isVelGlobal() : Boolean
      {
         if(velocity_x == velocity_x_max && velocity_y == velocity_y_max && velocity_z == velocity_z_max)
         {
            return true;
         }
         return false;
      }
      
      public function clone() : SpecterParticleData
      {
         var _loc2_:int = 0;
         var _loc1_:SpecterParticleData = new SpecterParticleData();
         _loc1_.total = total;
         _loc1_.emissivity = emissivity;
         _loc1_.speed = speed;
         _loc1_.minDuration = minDuration;
         _loc1_.maxDuration = maxDuration;
         _loc1_.minStartTime = minStartTime;
         _loc1_.maxStartTime = maxStartTime;
         _loc1_.usesDelay = usesDelay;
         _loc1_.delay = delay;
         _loc1_.usesLooping = usesLooping;
         _loc1_.velocity_x = velocity_x;
         _loc1_.velocity_y = velocity_y;
         _loc1_.velocity_z = velocity_z;
         _loc1_.velocity_x_max = velocity_x;
         _loc1_.velocity_y_max = velocity_y;
         _loc1_.velocity_z_max = velocity_z;
         _loc1_.diffusion = diffusion;
         _loc1_.accelerationType = accelerationType;
         _loc1_.acceleration_x = acceleration_x;
         _loc1_.acceleration_y = acceleration_y;
         _loc1_.acceleration_z = acceleration_z;
         _loc1_.emitterType = emitterType;
         if(lines)
         {
            _loc1_.lines = new Vector.<SpecterLine>();
            _loc2_ = 0;
            while(_loc2_ < lines.length)
            {
               _loc1_.lines.push(new SpecterLine(lines[_loc2_].startPoint.clone(),lines[_loc2_].endPoint.clone()));
               _loc2_++;
            }
         }
         _loc1_.boxDepth = boxDepth;
         _loc1_.boxWidth = boxWidth;
         _loc1_.boxHeight = boxHeight;
         _loc1_.radius = radius;
         _loc1_.angel = angel;
         _loc1_.cylinderHeight = cylinderHeight;
         _loc1_.fixedRadius = fixedRadius;
         _loc1_.rotationData = rotationData.clone() as RotationData;
         _loc1_.scaleData = scaleData.clone() as ScaleData;
         _loc1_.followData = followData.clone() as FollowData;
         _loc1_.colorData = colorData.clone() as ColorData;
         _loc1_.orbitData = orbitData.clone() as OrbitData;
         _loc1_.oscillatorData = oscillatorData.clone() as OscillatorData;
         _loc1_.bezierData = bezierData.clone() as BezierData;
         _loc1_.uvSheetData = uvSheetData.clone() as UVSheetData;
         _loc1_.uvScrollData = uvScrollData.clone() as UVScrollData;
         _loc1_.meshData = meshData.clone() as org.specter3d.configs.particle.MeshData;
         _loc1_.isKeyFramesLoop = isKeyFramesLoop;
         _loc2_ = 0;
         while(_loc2_ < keyFrames.length)
         {
            _loc1_.keyFrames.push(keyFrames[_loc2_].clone());
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function cloneKeyFrames(param1:Vector.<org.specter3d.configs.particle.KeyFrameData>, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         if(keyFrames.length > 0)
         {
            keyFrames = new Vector.<org.specter3d.configs.particle.KeyFrameData>();
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            keyFrames.push(param1[_loc3_].clone());
            _loc3_++;
         }
         isKeyFramesLoop = param2;
      }
   }
}
