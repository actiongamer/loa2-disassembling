package away3d.animators
{
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.animators.nodes.ParticleTimeNode;
   import flash.utils.Dictionary;
   import away3d.animators.nodes.ParticleNodeBase;
   import away3d.animators.nodes.AnimationNodeBase;
   import away3d.core.managers.Stage3DProxy;
   import away3d.materials.passes.MaterialPassBase;
   import §away3d:arcane§._animationRegisterCache;
   import flash.display3D.Context3D;
   import away3d.entities.Mesh;
   import away3d.core.base.ParticleGeometry;
   import away3d.core.base.SubMesh;
   import away3d.core.base.ISubGeometry;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.core.base.data.ParticleData;
   import away3d.animators.data.ParticleProperties;
   import away3d.animators.data.ParticleAnimationData;
   
   public class ParticleAnimationSet extends AnimationSetBase implements IAnimationSet
   {
      
      public static const POST_PRIORITY:int = 9;
      
      public static const COLOR_PRIORITY:int = 18;
       
      
      var _animationRegisterCache:AnimationRegisterCache;
      
      private var _timeNode:ParticleTimeNode;
      
      private var _animationSubGeometries:Dictionary;
      
      private var _particleNodes:Vector.<ParticleNodeBase>;
      
      private var _localDynamicNodes:Vector.<ParticleNodeBase>;
      
      private var _localStaticNodes:Vector.<ParticleNodeBase>;
      
      private var _totalLenOfOneVertex:int = 0;
      
      public var hasUVNode:Boolean;
      
      public var needVelocity:Boolean;
      
      public var hasBillboard:Boolean;
      
      public var hasColorMulNode:Boolean;
      
      public var hasColorAddNode:Boolean;
      
      public var initParticleFunc:Function;
      
      public function ParticleAnimationSet(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false)
      {
         _animationSubGeometries = new Dictionary(true);
         _particleNodes = new Vector.<ParticleNodeBase>();
         _localDynamicNodes = new Vector.<ParticleNodeBase>();
         _localStaticNodes = new Vector.<ParticleNodeBase>();
         super();
         _timeNode = new ParticleTimeNode(param1,param2,param3);
         addAnimation(new ParticleTimeNode(param1,param2,param3));
      }
      
      public function get particleNodes() : Vector.<ParticleNodeBase>
      {
         return _particleNodes;
      }
      
      override public function addAnimation(param1:AnimationNodeBase) : void
      {
         var _loc3_:int = 0;
         var _loc2_:ParticleNodeBase = param1 as ParticleNodeBase;
         _loc2_.processAnimationSetting(this);
         if(_loc2_.mode == 1)
         {
            _loc2_.dataOffset = _totalLenOfOneVertex;
            _totalLenOfOneVertex = _totalLenOfOneVertex + _loc2_.dataLength;
            _localStaticNodes.push(_loc2_);
         }
         else if(_loc2_.mode == 2)
         {
            _localDynamicNodes.push(_loc2_);
         }
         _loc3_ = _particleNodes.length;
         while(true)
         {
            _loc3_--;
            if(_loc3_ > -1)
            {
               if(_particleNodes[_loc3_].priority > _loc2_.priority)
               {
                  continue;
               }
               break;
            }
            break;
         }
         _particleNodes.splice(_loc3_ + 1,0,_loc2_);
         super.addAnimation(param1);
      }
      
      public final function activate(param1:Stage3DProxy, param2:MaterialPassBase) : void
      {
         _animationRegisterCache = param2.animationRegisterCache;
      }
      
      public final function deactivate(param1:Stage3DProxy, param2:MaterialPassBase) : void
      {
         var _loc6_:* = 0;
         var _loc3_:Context3D = param1.context3D;
         var _loc5_:int = _animationRegisterCache.vertexAttributesOffset;
         var _loc4_:int = _animationRegisterCache.numUsedStreams;
         _loc6_ = _loc5_;
         while(_loc6_ < _loc4_)
         {
            _loc3_.setVertexBufferAt(_loc6_,null);
            _loc6_++;
         }
      }
      
      public function getAGALVertexCode(param1:MaterialPassBase, param2:Vector.<String>, param3:Vector.<String>) : String
      {
         var _loc4_:* = null;
         var _loc6_:* = param1.animationRegisterCache || new AnimationRegisterCache();
         param1.animationRegisterCache = _loc6_;
         _animationRegisterCache = _loc6_;
         _animationRegisterCache.vertexConstantOffset = param1.numUsedVertexConstants;
         _animationRegisterCache.vertexAttributesOffset = param1.numUsedStreams;
         _animationRegisterCache.varyingsOffset = param1.numUsedVaryings;
         _animationRegisterCache.fragmentConstantOffset = param1.numUsedFragmentConstants;
         _animationRegisterCache.hasUVNode = hasUVNode;
         _animationRegisterCache.needVelocity = needVelocity;
         _animationRegisterCache.hasBillboard = hasBillboard;
         _animationRegisterCache.sourceRegisters = param2;
         _animationRegisterCache.targetRegisters = param3;
         _animationRegisterCache.needFragmentAnimation = param1.needFragmentAnimation;
         _animationRegisterCache.needUVAnimation = param1.needUVAnimation;
         _animationRegisterCache.hasColorAddNode = hasColorAddNode;
         _animationRegisterCache.hasColorMulNode = hasColorMulNode;
         _animationRegisterCache.reset();
         var _loc5_:String = "";
         _loc5_ = _loc5_ + _animationRegisterCache.getInitCode();
         var _loc8_:int = 0;
         var _loc7_:* = _particleNodes;
         for each(_loc4_ in _particleNodes)
         {
            if(_loc4_.priority < 9)
            {
               _loc5_ = _loc5_ + _loc4_.getAGALVertexCode(param1,_animationRegisterCache);
            }
         }
         _loc5_ = _loc5_ + _animationRegisterCache.getCombinationCode();
         var _loc10_:int = 0;
         var _loc9_:* = _particleNodes;
         for each(_loc4_ in _particleNodes)
         {
            if(_loc4_.priority >= 9 && _loc4_.priority < 18)
            {
               _loc5_ = _loc5_ + _loc4_.getAGALVertexCode(param1,_animationRegisterCache);
            }
         }
         _loc5_ = _loc5_ + _animationRegisterCache.initColorRegisters();
         var _loc12_:int = 0;
         var _loc11_:* = _particleNodes;
         for each(_loc4_ in _particleNodes)
         {
            if(_loc4_.priority >= 18)
            {
               _loc5_ = _loc5_ + _loc4_.getAGALVertexCode(param1,_animationRegisterCache);
            }
         }
         _loc5_ = _loc5_ + _animationRegisterCache.getColorPassCode();
         return _loc5_;
      }
      
      public function getAGALUVCode(param1:MaterialPassBase, param2:String, param3:String) : String
      {
         var _loc4_:* = null;
         var _loc5_:String = "";
         if(hasUVNode)
         {
            _animationRegisterCache.setUVSourceAndTarget(param2,param3);
            _loc5_ = _loc5_ + ("mov " + _animationRegisterCache.uvTarget.toString() + "," + _animationRegisterCache.uvAttribute.toString() + "\n");
            var _loc7_:int = 0;
            var _loc6_:* = _particleNodes;
            for each(_loc4_ in _particleNodes)
            {
               _loc5_ = _loc5_ + _loc4_.getAGALUVCode(param1,_animationRegisterCache);
            }
            _loc5_ = _loc5_ + ("mov " + _animationRegisterCache.uvVar.toString() + "," + _animationRegisterCache.uvTarget.toString() + "\n");
         }
         else
         {
            _loc5_ = _loc5_ + ("mov " + param3 + "," + param2 + "\n");
         }
         return _loc5_;
      }
      
      public function getAGALFragmentCode(param1:MaterialPassBase, param2:String) : String
      {
         var _loc3_:* = null;
         _animationRegisterCache.setShadedTarget(param2);
         var _loc4_:String = "";
         var _loc6_:int = 0;
         var _loc5_:* = _particleNodes;
         for each(_loc3_ in _particleNodes)
         {
            _loc4_ = _loc4_ + _loc3_.getAGALFragmentCode(param1,_animationRegisterCache);
         }
         _loc4_ = _loc4_ + _animationRegisterCache.getColorCombinationCode(param2);
         return _loc4_;
      }
      
      public function doneAGALCode(param1:MaterialPassBase) : void
      {
         _animationRegisterCache.setDataLength();
         _animationRegisterCache.setVertexConst(_animationRegisterCache.vertexZeroConst.index,0,1,2,0);
         if(_animationRegisterCache.numFragmentConstant > 0 && _animationRegisterCache.hasColorNode)
         {
            _animationRegisterCache.setFragmentConst(_animationRegisterCache.fragmentZeroConst.index,0,1,0,0);
         }
      }
      
      override public function get usesCPU() : Boolean
      {
         return false;
      }
      
      override public function cancelGPUCompatibility() : void
      {
      }
      
      function generateAnimationSubGeometries(param1:Mesh) : void
      {
         var _loc7_:int = 0;
         var _loc11_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         var _loc14_:* = null;
         var _loc9_:* = null;
         var _loc22_:* = null;
         var _loc13_:* = null;
         var _loc15_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc4_:int = 0;
         var _loc12_:* = undefined;
         var _loc8_:* = 0;
         var _loc21_:* = undefined;
         var _loc2_:* = 0;
         var _loc17_:* = 0;
         var _loc20_:* = 0;
         if(initParticleFunc == null)
         {
            throw new Error("no initParticleFunc set");
         }
         var _loc10_:ParticleGeometry = param1.geometry as ParticleGeometry;
         if(!_loc10_)
         {
            throw new Error("Particle animation can only be performed on a ParticleGeometry object");
         }
         _loc11_ = 0;
         while(_loc11_ < param1.subMeshes.length)
         {
            _loc9_ = param1.subMeshes[_loc11_];
            _loc14_ = _loc9_.subGeometry;
            _loc5_ = _animationSubGeometries[_loc14_];
            if(_loc5_)
            {
               _loc9_.animationSubGeometry = _loc5_;
            }
            else
            {
               var _loc25_:* = new AnimationSubGeometry();
               _animationSubGeometries[_loc14_] = _loc25_;
               _loc25_ = _loc25_;
               _loc9_.animationSubGeometry = _loc25_;
               _loc5_ = _loc25_;
               _loc6_ = true;
               _loc5_.createVertexData(_loc14_.numVertices,_totalLenOfOneVertex);
            }
            _loc11_++;
         }
         if(!_loc6_)
         {
            return;
         }
         var _loc23_:Vector.<ParticleData> = _loc10_.particles;
         var _loc16_:uint = _loc23_.length;
         var _loc24_:uint = _loc10_.numParticles;
         var _loc3_:ParticleProperties = new ParticleProperties();
         _loc3_.total = _loc24_;
         _loc3_.startTime = 0;
         _loc3_.particleDuration = 1000;
         _loc3_.delay = 0.1;
         _loc11_ = 0;
         _loc7_ = 0;
         while(_loc11_ < _loc24_)
         {
            _loc3_.index = _loc11_;
            initParticleFunc(_loc3_);
            var _loc27_:int = 0;
            var _loc26_:* = _localStaticNodes;
            for each(_loc22_ in _localStaticNodes)
            {
               _loc22_.generatePropertyOfOneParticle(_loc3_);
            }
            while(_loc7_ < _loc16_ && _loc23_[_loc7_].particleIndex == _loc11_)
            {
               _loc5_ = _animationSubGeometries[_loc13_.subGeometry];
               _loc8_ = uint(_loc13_.numVertices);
               _loc21_ = _loc5_.vertexData;
               _loc2_ = uint(_loc8_ * _totalLenOfOneVertex);
               _loc17_ = uint(_loc5_.numProcessedVertices * _totalLenOfOneVertex);
               var _loc29_:int = 0;
               var _loc28_:* = _localStaticNodes;
               for each(_loc22_ in _localStaticNodes)
               {
                  _loc12_ = _loc22_.oneData;
                  _loc15_ = _loc22_.dataLength;
                  _loc18_ = _loc17_ + _loc22_.dataOffset;
                  _loc19_ = 0;
                  while(_loc19_ < _loc2_)
                  {
                     _loc20_ = uint(_loc18_ + _loc19_);
                     _loc4_ = 0;
                     while(_loc4_ < _loc15_)
                     {
                        _loc21_[_loc20_ + _loc4_] = _loc12_[_loc4_];
                        _loc4_++;
                     }
                     _loc19_ = _loc19_ + _totalLenOfOneVertex;
                  }
               }
               if(_localDynamicNodes.length)
               {
                  _loc5_.animationParticles.push(new ParticleAnimationData(_loc11_,_loc3_.startTime,_loc3_.duration,_loc3_.delay,_loc13_));
               }
               _loc5_.numProcessedVertices = _loc5_.numProcessedVertices + _loc8_;
               _loc7_++;
            }
            _loc11_++;
         }
      }
      
      override public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _animationSubGeometries;
         for each(var _loc1_ in _animationSubGeometries)
         {
            _loc1_.dispose();
         }
         _loc1_ = null;
         super.dispose();
         initParticleFunc = null;
      }
   }
}
