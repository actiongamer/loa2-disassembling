package org.specter3d.display.particle.extend
{
   import away3d.animators.nodes.ParticleNodeBase;
   import flash.geom.Vector3D;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.animators.IAnimator;
   import away3d.animators.ParticleAnimationSet;
   
   public class ParticleUVScrollNode extends ParticleNodeBase
   {
      
      public static const UV_INDEX:int = 0;
       
      
      public var speed:Vector3D;
      
      public function ParticleUVScrollNode(param1:Number = 1, param2:Number = 1)
      {
         super("ParticleUVScroll",0,4,9 + 1);
         _stateClass = ParticleUVScrollState;
         speed = new Vector3D(param1,param2);
      }
      
      override public function getAGALUVCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc6_:String = "";
         if(param2.needUVAnimation)
         {
            _loc4_ = new ShaderRegisterElement(param2.uvTarget.regName,param2.uvTarget.index);
            _loc5_ = param2.getFreeVertexConstant();
            param2.setRegisterIndex(this,0,_loc5_.index);
            _loc3_ = param2.getFreeVertexSingleTemp();
            if(speed.x != 0)
            {
               _loc6_ = _loc6_ + ("mov " + _loc3_ + ", " + param2.vertexLife + " \n");
               _loc6_ = _loc6_ + ("mul " + _loc3_ + ", " + _loc3_ + ", " + _loc5_ + ".x \n");
               _loc6_ = _loc6_ + ("add " + _loc4_ + ".x, " + _loc4_ + ".x, " + _loc3_ + " \n");
            }
            if(speed.y != 0)
            {
               _loc6_ = _loc6_ + ("mov " + _loc3_ + ", " + param2.vertexLife + " \n");
               _loc6_ = _loc6_ + ("mul " + _loc3_ + ", " + _loc3_ + ", " + _loc5_ + ".y \n");
               _loc6_ = _loc6_ + ("add " + _loc4_ + ".y, " + _loc4_ + ".y, " + _loc3_ + " \n");
            }
         }
         return _loc6_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleUVScrollState
      {
         return param1.getAnimationState(this) as ParticleUVScrollState;
      }
      
      override function processAnimationSetting(param1:ParticleAnimationSet) : void
      {
         param1.hasUVNode = true;
      }
   }
}
