package away3d.animators.states
{
   import away3d.animators.nodes.ParticleFollowNode;
   import away3d.core.base.Object3D;
   import flash.geom.Vector3D;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.data.ParticleAnimationData;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleFollowState extends ParticleStateBase
   {
       
      
      private var _particleFollowNode:ParticleFollowNode;
      
      private var _followTarget:Object3D;
      
      private var _targetPos:Vector3D;
      
      private var _targetEuler:Vector3D;
      
      private var _prePos:Vector3D;
      
      private var _preEuler:Vector3D;
      
      private var _smooth:Boolean;
      
      private var temp:Vector3D;
      
      public function ParticleFollowState(param1:ParticleAnimator, param2:ParticleFollowNode)
      {
         _targetPos = new Vector3D();
         _targetEuler = new Vector3D();
         temp = new Vector3D();
         super(param1,param2,true);
         _particleFollowNode = param2;
         _smooth = param2._smooth;
      }
      
      public function get followTarget() : Object3D
      {
         return _followTarget;
      }
      
      public function set followTarget(param1:Object3D) : void
      {
         _followTarget = param1;
      }
      
      public function get smooth() : Boolean
      {
         return _smooth;
      }
      
      public function set smooth(param1:Boolean) : void
      {
         _smooth = param1;
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         param2 = param2;
         param5 = param5;
         if(_followTarget)
         {
            if(_particleFollowNode._usesPosition && _particleFollowNode._usesRotation)
            {
               _followTarget.invalidateTransform();
            }
            if(_particleFollowNode._usesPosition)
            {
               _targetPos.x = _followTarget.position.x / param2.sourceEntity.scaleX;
               _targetPos.y = _followTarget.position.y / param2.sourceEntity.scaleY;
               _targetPos.z = _followTarget.position.z / param2.sourceEntity.scaleZ;
            }
            if(_particleFollowNode._usesRotation)
            {
               _targetEuler.x = _followTarget.rotationX;
               _targetEuler.y = _followTarget.rotationY;
               _targetEuler.z = _followTarget.rotationZ;
               _targetEuler.scaleBy(0.0174532925199433);
            }
         }
         if(!_prePos)
         {
            _prePos = _targetPos.clone();
         }
         if(!_preEuler)
         {
            _preEuler = _targetEuler.clone();
         }
         var _loc7_:Number = _time / 1000;
         var _loc9_:Number = param3.previousTime;
         var _loc8_:Number = _loc7_ - _loc9_;
         var _loc6_:* = _loc9_ != _loc7_;
         if(_particleFollowNode._usesPosition && _particleFollowNode._usesRotation)
         {
            if(_loc6_)
            {
               processPositionAndRotation(_loc7_,_loc8_,param3);
            }
            param3.activateVertexBuffer(param4.getRegisterIndex(_animationNode,0),_particleFollowNode.dataOffset,param1,"float3");
            param3.activateVertexBuffer(param4.getRegisterIndex(_animationNode,1),_particleFollowNode.dataOffset + 3,param1,"float3");
         }
         else if(_particleFollowNode._usesPosition)
         {
            if(_loc6_)
            {
               processPosition(_loc7_,_loc8_,param3);
            }
            param3.activateVertexBuffer(param4.getRegisterIndex(_animationNode,0),_particleFollowNode.dataOffset,param1,"float3");
         }
         else if(_particleFollowNode._usesRotation)
         {
            if(_loc6_)
            {
               precessRotation(_loc7_,_loc8_,param3);
            }
            param3.activateVertexBuffer(param4.getRegisterIndex(_animationNode,1),_particleFollowNode.dataOffset,param1,"float3");
         }
         _prePos.copyFrom(_targetPos);
         _preEuler.copyFrom(_targetEuler);
         param3.previousTime = _loc7_;
      }
      
      private function processPosition(param1:Number, param2:Number, param3:AnimationSubGeometry) : void
      {
         var _loc14_:* = null;
         var _loc4_:* = null;
         var _loc10_:* = 0;
         var _loc8_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc7_:* = 0;
         var _loc5_:Vector.<ParticleAnimationData> = param3.animationParticles;
         var _loc13_:Vector.<Number> = param3.vertexData;
         var _loc9_:Boolean = false;
         var _loc6_:uint = _loc5_.length;
         if(_smooth)
         {
            _loc4_ = _prePos.subtract(_targetPos);
            _loc4_.scaleBy(1 / param2);
         }
         else
         {
            _loc14_ = _targetPos;
         }
         _loc10_ = uint(0);
         while(_loc10_ < _loc6_)
         {
            _loc8_ = (param1 - _loc5_[_loc10_].startTime) / _loc5_[_loc10_].totalTime;
            _loc11_ = (_loc8_ - Math.floor(_loc8_)) * _loc5_[_loc10_].totalTime;
            if(_loc11_ - param2 <= 0)
            {
               _loc12_ = _loc5_[_loc10_].startVertexIndex * param3.totalLenOfOneVertex + _particleFollowNode.dataOffset;
               if(_smooth)
               {
                  temp.copyFrom(_loc4_);
                  temp.scaleBy(_loc11_);
                  _loc14_ = _targetPos.add(temp);
               }
               if(_loc13_[_loc12_] != _loc14_.x || _loc13_[_loc12_ + 1] != _loc14_.y || _loc13_[_loc12_ + 2] != _loc14_.z)
               {
                  _loc9_ = true;
                  _loc7_ = uint(0);
                  while(_loc7_ < _loc5_[_loc10_].numVertices)
                  {
                     _loc12_++;
                     _loc13_[_loc12_] = _loc14_.x;
                     _loc12_++;
                     _loc13_[_loc12_] = _loc14_.y;
                     _loc12_++;
                     _loc13_[_loc12_] = _loc14_.z;
                     _loc7_++;
                  }
               }
            }
            _loc10_++;
         }
         if(_loc9_)
         {
            param3.invalidateBuffer();
         }
      }
      
      private function precessRotation(param1:Number, param2:Number, param3:AnimationSubGeometry) : void
      {
         var _loc10_:* = null;
         var _loc13_:* = null;
         var _loc9_:* = 0;
         var _loc7_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc6_:* = 0;
         var _loc4_:Vector.<ParticleAnimationData> = param3.animationParticles;
         var _loc14_:Vector.<Number> = param3.vertexData;
         var _loc8_:Boolean = false;
         var _loc5_:uint = _loc4_.length;
         if(_smooth)
         {
            _loc13_ = _preEuler.subtract(_targetEuler);
            _loc13_.scaleBy(1 / param2);
         }
         else
         {
            _loc10_ = _targetEuler;
         }
         _loc9_ = uint(0);
         while(_loc9_ < _loc5_)
         {
            _loc7_ = (param1 - _loc4_[_loc9_].startTime) / _loc4_[_loc9_].totalTime;
            _loc11_ = (_loc7_ - Math.floor(_loc7_)) * _loc4_[_loc9_].totalTime;
            if(_loc11_ - param2 <= 0)
            {
               _loc12_ = _loc4_[_loc9_].startVertexIndex * param3.totalLenOfOneVertex + _particleFollowNode.dataOffset;
               if(_smooth)
               {
                  temp.copyFrom(_loc13_);
                  temp.scaleBy(_loc11_);
                  _loc10_ = _targetEuler.add(temp);
               }
               if(_loc14_[_loc12_] != _loc10_.x || _loc14_[_loc12_ + 1] != _loc10_.y || _loc14_[_loc12_ + 2] != _loc10_.z)
               {
                  _loc8_ = true;
                  _loc6_ = uint(0);
                  while(_loc6_ < _loc4_[_loc9_].numVertices)
                  {
                     _loc12_++;
                     _loc14_[_loc12_] = _loc10_.x;
                     _loc12_++;
                     _loc14_[_loc12_] = _loc10_.y;
                     _loc12_++;
                     _loc14_[_loc12_] = _loc10_.z;
                     _loc6_++;
                  }
               }
            }
            _loc9_++;
         }
         if(_loc8_)
         {
            param3.invalidateBuffer();
         }
      }
      
      private function processPositionAndRotation(param1:Number, param2:Number, param3:AnimationSubGeometry) : void
      {
         var _loc16_:* = null;
         var _loc12_:* = null;
         var _loc4_:* = null;
         var _loc14_:* = null;
         var _loc10_:* = 0;
         var _loc8_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc13_:int = 0;
         var _loc7_:* = 0;
         var _loc5_:Vector.<ParticleAnimationData> = param3.animationParticles;
         var _loc15_:Vector.<Number> = param3.vertexData;
         var _loc9_:Boolean = false;
         var _loc6_:uint = _loc5_.length;
         if(_smooth)
         {
            _loc4_ = _prePos.subtract(_targetPos);
            _loc4_.scaleBy(1 / param2);
            _loc14_ = _preEuler.subtract(_targetEuler);
            _loc14_.scaleBy(1 / param2);
         }
         else
         {
            _loc16_ = _targetPos;
            _loc12_ = _targetEuler;
         }
         _loc10_ = uint(0);
         while(_loc10_ < _loc6_)
         {
            _loc8_ = (param1 - _loc5_[_loc10_].startTime) / _loc5_[_loc10_].totalTime;
            _loc11_ = (_loc8_ - Math.floor(_loc8_)) * _loc5_[_loc10_].totalTime;
            if(_loc11_ - param2 <= 0)
            {
               _loc13_ = _loc5_[_loc10_].startVertexIndex * param3.totalLenOfOneVertex + _particleFollowNode.dataOffset;
               if(_smooth)
               {
                  temp.copyFrom(_loc4_);
                  temp.scaleBy(_loc11_);
                  _loc16_ = _targetPos.add(temp);
                  temp.copyFrom(_loc14_);
                  temp.scaleBy(_loc11_);
                  _loc12_ = _targetEuler.add(temp);
               }
               if(_loc15_[_loc13_] != _loc16_.x || _loc15_[_loc13_ + 1] != _loc16_.y || _loc15_[_loc13_ + 2] != _loc16_.z || _loc15_[_loc13_ + 3] != _loc12_.x || _loc15_[_loc13_ + 4] != _loc12_.y || _loc15_[_loc13_ + 5] != _loc12_.z)
               {
                  _loc9_ = true;
                  _loc7_ = uint(0);
                  while(_loc7_ < _loc5_[_loc10_].numVertices)
                  {
                     _loc13_++;
                     _loc15_[_loc13_] = _loc16_.x;
                     _loc13_++;
                     _loc15_[_loc13_] = _loc16_.y;
                     _loc13_++;
                     _loc15_[_loc13_] = _loc16_.z;
                     _loc13_++;
                     _loc15_[_loc13_] = _loc12_.x;
                     _loc13_++;
                     _loc15_[_loc13_] = _loc12_.y;
                     _loc13_++;
                     _loc15_[_loc13_] = _loc12_.z;
                     _loc7_++;
                  }
               }
            }
            _loc10_++;
         }
         if(_loc9_)
         {
            param3.invalidateBuffer();
         }
      }
   }
}
