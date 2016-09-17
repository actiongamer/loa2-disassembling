package away3d.animators
{
   import away3d.animators.states.ParticleStateBase;
   import flash.utils.Dictionary;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.cameras.Camera3D;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.core.base.SubMesh;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.core.base.ISubGeometry;
   import away3d.animators.nodes.ParticleNodeBase;
   
   public class ParticleAnimator extends AnimatorBase implements IAnimator
   {
      
      private static var _updateDeltaTimeLemited:Number = 16;
       
      
      private var _particleAnimationSet:away3d.animators.ParticleAnimationSet;
      
      private var _animationParticleStates:Vector.<ParticleStateBase>;
      
      private var _animatorParticleStates:Vector.<ParticleStateBase>;
      
      private var _timeParticleStates:Vector.<ParticleStateBase>;
      
      private var _totalLenOfOneVertex:uint = 0;
      
      private var _animatorSubGeometries:Dictionary;
      
      private var _dt:int = 0;
      
      public function ParticleAnimator(param1:away3d.animators.ParticleAnimationSet)
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         _animationParticleStates = new Vector.<ParticleStateBase>();
         _animatorParticleStates = new Vector.<ParticleStateBase>();
         _timeParticleStates = new Vector.<ParticleStateBase>();
         _animatorSubGeometries = new Dictionary(true);
         super(param1);
         _particleAnimationSet = param1;
         var _loc5_:int = 0;
         var _loc4_:* = _particleAnimationSet.particleNodes;
         for each(_loc2_ in _particleAnimationSet.particleNodes)
         {
            _loc3_ = getAnimationState(_loc2_) as ParticleStateBase;
            if(_loc2_.mode == 2)
            {
               _animatorParticleStates.push(_loc3_);
               _loc2_.dataOffset = _totalLenOfOneVertex;
               _totalLenOfOneVertex = _totalLenOfOneVertex + _loc2_.dataLength;
            }
            else
            {
               _animationParticleStates.push(_loc3_);
            }
            if(_loc3_.needUpdateTime)
            {
               _timeParticleStates.push(_loc3_);
            }
         }
      }
      
      public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:int, param4:int, param5:Camera3D) : void
      {
         var _loc8_:* = null;
         var _loc9_:AnimationRegisterCache = _particleAnimationSet._animationRegisterCache;
         var _loc10_:SubMesh = param2 as SubMesh;
         if(!_loc10_)
         {
            throw new Error("Must be subMesh");
         }
         if(!_loc10_.animationSubGeometry)
         {
            _particleAnimationSet.generateAnimationSubGeometries(_loc10_.parentMesh);
         }
         var _loc7_:AnimationSubGeometry = _loc10_.animationSubGeometry;
         var _loc12_:int = 0;
         var _loc11_:* = _animationParticleStates;
         for each(_loc8_ in _animationParticleStates)
         {
            _loc8_.setRenderState(param1,param2,_loc7_,_loc9_,param5);
         }
         if(!_loc10_.animatorSubGeometry && _animatorParticleStates.length)
         {
            generateAnimatorSubGeometry(_loc10_);
         }
         var _loc6_:AnimationSubGeometry = _loc10_.animatorSubGeometry;
         var _loc14_:int = 0;
         var _loc13_:* = _animatorParticleStates;
         for each(_loc8_ in _animatorParticleStates)
         {
            _loc8_.setRenderState(param1,param2,_loc6_,_loc9_,param5);
         }
         param1.context3D.setProgramConstantsFromVector("vertex",_loc9_.vertexConstantOffset,_loc9_.vertexConstantData,_loc9_.numVertexConstant);
         if(_loc9_.numFragmentConstant > 0)
         {
            param1.context3D.setProgramConstantsFromVector("fragment",_loc9_.fragmentConstantOffset,_loc9_.fragmentConstantData,_loc9_.numFragmentConstant);
         }
      }
      
      public function testGPUCompatibility(param1:MaterialPassBase) : void
      {
      }
      
      override public function start() : void
      {
         super.start();
         var _loc3_:int = 0;
         var _loc2_:* = _timeParticleStates;
         for each(var _loc1_ in _timeParticleStates)
         {
            _loc1_.offset(_absoluteTime);
         }
      }
      
      override protected function updateDeltaTime(param1:Number) : void
      {
         _absoluteTime = _absoluteTime + param1;
         _dt = _dt + param1;
         if(_dt >= _updateDeltaTimeLemited || !this.autoUpdate)
         {
            var _loc4_:int = 0;
            var _loc3_:* = _timeParticleStates;
            for each(var _loc2_ in _timeParticleStates)
            {
               _loc2_.update(_absoluteTime);
            }
            _dt = 0;
         }
      }
      
      public function resetTime(param1:int = 0) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = _timeParticleStates;
         for each(var _loc2_ in _timeParticleStates)
         {
            _loc2_.offset(_absoluteTime + param1);
         }
      }
      
      private function generateAnimatorSubGeometry(param1:SubMesh) : void
      {
         var _loc2_:ISubGeometry = param1.subGeometry;
         var _loc4_:* = new AnimationSubGeometry();
         _animatorSubGeometries[_loc2_] = _loc4_;
         _loc4_ = _loc4_;
         param1.animatorSubGeometry = _loc4_;
         var _loc3_:* = _loc4_;
         _loc3_.createVertexData(_loc2_.numVertices,_totalLenOfOneVertex);
         _loc3_.animationParticles = param1.animationSubGeometry.animationParticles;
      }
   }
}
