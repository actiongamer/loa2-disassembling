package away3d.animators.data
{
   import flash.display3D.VertexBuffer3D;
   import flash.display3D.Context3D;
   import away3d.core.managers.Stage3DProxy;
   
   public class AnimationSubGeometry
   {
      
      private static var _count:int = 0;
       
      
      protected var _vertexData:Vector.<Number>;
      
      protected var _vertexBuffer:Vector.<VertexBuffer3D>;
      
      protected var _bufferContext:Vector.<Context3D>;
      
      protected var _bufferDirty:Vector.<Boolean>;
      
      private var _numVertices:uint;
      
      private var _totalLenOfOneVertex:uint;
      
      public var numProcessedVertices:int = 0;
      
      public var previousTime:Number = 0;
      
      public var animationParticles:Vector.<away3d.animators.data.ParticleAnimationData>;
      
      public function AnimationSubGeometry()
      {
         var _loc1_:int = 0;
         _vertexBuffer = new Vector.<VertexBuffer3D>(8);
         _bufferContext = new Vector.<Context3D>(8);
         _bufferDirty = new Vector.<Boolean>(8);
         animationParticles = new Vector.<away3d.animators.data.ParticleAnimationData>();
         super();
         _loc1_ = 0;
         while(_loc1_ < 8)
         {
            _bufferDirty[_loc1_] = true;
            _loc1_++;
         }
      }
      
      public function createVertexData(param1:uint, param2:uint) : void
      {
         _numVertices = param1;
         _totalLenOfOneVertex = param2;
         _vertexData = new Vector.<Number>(param1 * param2,true);
      }
      
      public function activateVertexBuffer(param1:int, param2:int, param3:Stage3DProxy, param4:String) : void
      {
         var _loc7_:int = param3.stage3DIndex;
         var _loc6_:Context3D = param3.context3D;
         var _loc5_:* = _vertexBuffer[_loc7_];
         if(!_loc5_ || _bufferContext[_loc7_] != _loc6_)
         {
            var _loc8_:* = _loc6_.createVertexBuffer(_numVertices,_totalLenOfOneVertex);
            _vertexBuffer[_loc7_] = _loc8_;
            _loc5_ = _loc8_;
            _bufferContext[_loc7_] = _loc6_;
            invalidateBuffer();
         }
         if(_bufferDirty[_loc7_])
         {
            _loc5_.uploadFromVector(_vertexData,0,_numVertices);
            _bufferDirty[_loc7_] = false;
         }
         _loc6_.setVertexBufferAt(param1,_loc5_,param2,param4);
      }
      
      public function dispose() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _vertexBuffer.length)
         {
            if(_vertexBuffer[_loc2_])
            {
               _vertexBuffer[_loc2_].dispose();
               _vertexBuffer[_loc2_] = null;
            }
            _loc2_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _bufferContext.length)
         {
            _bufferContext[_loc1_] = null;
            _bufferDirty[_loc1_] = true;
            _loc1_++;
         }
      }
      
      public function invalidateBuffer() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < 8)
         {
            _bufferDirty[_loc1_] = true;
            _loc1_++;
         }
      }
      
      public function get vertexData() : Vector.<Number>
      {
         return _vertexData;
      }
      
      public function get numVertices() : uint
      {
         return _numVertices;
      }
      
      public function get totalLenOfOneVertex() : uint
      {
         return _totalLenOfOneVertex;
      }
   }
}
