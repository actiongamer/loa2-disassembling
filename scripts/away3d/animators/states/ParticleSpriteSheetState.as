package away3d.animators.states
{
   import away3d.animators.nodes.ParticleSpriteSheetNode;
   import away3d.core.managers.Stage3DProxy;
   import away3d.core.base.IRenderable;
   import away3d.animators.data.AnimationSubGeometry;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.cameras.Camera3D;
   import away3d.animators.ParticleAnimator;
   
   public class ParticleSpriteSheetState extends ParticleStateBase
   {
       
      
      private var _particleSpriteSheetNode:ParticleSpriteSheetNode;
      
      private var _usesCycle:Boolean;
      
      private var _usesPhase:Boolean;
      
      private var _totalFrames:int;
      
      private var _numColumns:int;
      
      private var _numRows:int;
      
      private var _cycleDuration:Number;
      
      private var _cyclePhase:Number;
      
      private var _spriteSheetData:Vector.<Number>;
      
      public function ParticleSpriteSheetState(param1:ParticleAnimator, param2:ParticleSpriteSheetNode)
      {
         super(param1,param2);
         _particleSpriteSheetNode = param2;
         _usesCycle = _particleSpriteSheetNode._usesCycle;
         _usesPhase = _particleSpriteSheetNode._usesPhase;
         _totalFrames = _particleSpriteSheetNode._totalFrames;
         _numColumns = _particleSpriteSheetNode._numColumns;
         _numRows = _particleSpriteSheetNode._numRows;
         _cycleDuration = _particleSpriteSheetNode._cycleDuration;
         _cyclePhase = _particleSpriteSheetNode._cyclePhase;
         updateSpriteSheetData();
      }
      
      public function get cyclePhase() : Number
      {
         return _cyclePhase;
      }
      
      public function set cyclePhase(param1:Number) : void
      {
         _cyclePhase = param1;
         updateSpriteSheetData();
      }
      
      public function get cycleDuration() : Number
      {
         return _cycleDuration;
      }
      
      public function set cycleDuration(param1:Number) : void
      {
         _cycleDuration = param1;
         updateSpriteSheetData();
      }
      
      override public function setRenderState(param1:Stage3DProxy, param2:IRenderable, param3:AnimationSubGeometry, param4:AnimationRegisterCache, param5:Camera3D) : void
      {
         var _loc6_:int = 0;
         if(param4.needUVAnimation)
         {
            param4.setVertexConst(param4.getRegisterIndex(_animationNode,0),_spriteSheetData[0],_spriteSheetData[1],_spriteSheetData[2],_spriteSheetData[3]);
            if(_usesCycle)
            {
               if(_registerIndex == null)
               {
                  _registerIndex = param4.getRegisterIndexVectror(_animationNode);
               }
               _loc6_ = _registerIndex[1];
               if(_particleSpriteSheetNode.mode == 1)
               {
                  if(_usesPhase)
                  {
                     param3.activateVertexBuffer(_loc6_,_particleSpriteSheetNode.dataOffset,param1,"float3");
                  }
                  else
                  {
                     param3.activateVertexBuffer(_loc6_,_particleSpriteSheetNode.dataOffset,param1,"float2");
                  }
               }
               else
               {
                  param4.setVertexConst(_loc6_,_spriteSheetData[4],_spriteSheetData[5]);
               }
            }
         }
      }
      
      private function updateSpriteSheetData() : void
      {
         _spriteSheetData = new Vector.<Number>(8,true);
         var _loc1_:Number = _totalFrames / _numColumns;
         _spriteSheetData[0] = _loc1_;
         _spriteSheetData[1] = 1 / _numColumns;
         _spriteSheetData[2] = 1 / _numRows;
         if(_usesCycle)
         {
            if(_cycleDuration <= 0)
            {
               throw new Error("the cycle duration must be greater than zero");
            }
            _spriteSheetData[4] = _loc1_ / _cycleDuration;
            _spriteSheetData[5] = _cycleDuration;
            if(_usesPhase)
            {
               _spriteSheetData[6] = _cyclePhase;
            }
         }
      }
   }
}
