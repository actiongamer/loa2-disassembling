package away3d.animators.nodes
{
   import §away3d:arcane§._numColumns;
   import §away3d:arcane§._numRows;
   import §away3d:arcane§._totalFrames;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import §away3d:arcane§._usesCycle;
   import §away3d:arcane§._usesPhase;
   import away3d.animators.states.ParticleSpriteSheetState;
   import away3d.animators.IAnimator;
   import away3d.animators.ParticleAnimationSet;
   import away3d.animators.data.ParticleProperties;
   import flash.geom.Vector3D;
   import §away3d:arcane§._cyclePhase;
   import §away3d:arcane§._cycleDuration;
   
   public class ParticleSpriteSheetNode extends ParticleNodeBase
   {
      
      static const UV_INDEX_0:uint = 0;
      
      static const UV_INDEX_1:uint = 1;
      
      public static const UV_VECTOR3D:String = "UVVector3D";
       
      
      var _usesCycle:Boolean;
      
      var _usesPhase:Boolean;
      
      var _totalFrames:int;
      
      var _numColumns:int;
      
      var _numRows:int;
      
      var _cycleDuration:Number;
      
      var _cyclePhase:Number;
      
      public function ParticleSpriteSheetNode(param1:uint, param2:Boolean, param3:Boolean, param4:int = 1, param5:uint = 1, param6:Number = 1, param7:Number = 0, param8:uint = 4294967295)
      {
         var _loc9_:int = 0;
         if(param2)
         {
            _loc9_ = 2;
            if(param3)
            {
               _loc9_++;
            }
         }
         super("ParticleSpriteSheet",param1,_loc9_,9 + 1);
         _stateClass = ParticleSpriteSheetState;
         _usesCycle = param2;
         _usesPhase = param3;
         _numColumns = param4;
         _numRows = param5;
         _cyclePhase = param7;
         _cycleDuration = param6;
         _totalFrames = Math.min(param8,param4 * param5);
      }
      
      public function get numColumns() : Number
      {
         return _numColumns;
      }
      
      public function get numRows() : Number
      {
         return _numRows;
      }
      
      public function get totalFrames() : Number
      {
         return _totalFrames;
      }
      
      override public function getAGALUVCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc12_:ShaderRegisterElement = param2.getFreeVertexConstant();
         var _loc13_:ShaderRegisterElement = _mode == 0?param2.getFreeVertexConstant():param2.getFreeVertexAttribute();
         param2.setRegisterIndex(this,0,_loc12_.index);
         param2.setRegisterIndex(this,1,_loc13_.index);
         var _loc6_:ShaderRegisterElement = new ShaderRegisterElement(_loc12_.regName,_loc12_.index,0);
         var _loc14_:ShaderRegisterElement = new ShaderRegisterElement(_loc12_.regName,_loc12_.index,1);
         var _loc17_:ShaderRegisterElement = new ShaderRegisterElement(_loc12_.regName,_loc12_.index,2);
         var _loc16_:ShaderRegisterElement = new ShaderRegisterElement(_loc13_.regName,_loc13_.index,0);
         var _loc3_:ShaderRegisterElement = new ShaderRegisterElement(_loc13_.regName,_loc13_.index,1);
         var _loc8_:ShaderRegisterElement = new ShaderRegisterElement(_loc13_.regName,_loc13_.index,2);
         var _loc15_:ShaderRegisterElement = param2.getFreeVertexVectorTemp();
         var _loc11_:ShaderRegisterElement = new ShaderRegisterElement(_loc15_.regName,_loc15_.index,0);
         var _loc5_:ShaderRegisterElement = new ShaderRegisterElement(_loc15_.regName,_loc15_.index,1);
         _loc15_ = new ShaderRegisterElement(_loc15_.regName,_loc15_.index,2);
         var _loc10_:ShaderRegisterElement = new ShaderRegisterElement(_loc15_.regName,_loc15_.index,3);
         var _loc9_:ShaderRegisterElement = new ShaderRegisterElement(param2.uvTarget.regName,param2.uvTarget.index,0);
         var _loc7_:ShaderRegisterElement = new ShaderRegisterElement(param2.uvTarget.regName,param2.uvTarget.index,1);
         var _loc4_:String = "";
         _loc4_ = _loc4_ + ("mul " + _loc9_ + "," + _loc9_ + "," + _loc14_ + "\n");
         if(_numRows > 1)
         {
            _loc4_ = _loc4_ + ("mul " + _loc7_ + "," + _loc7_ + "," + _loc17_ + "\n");
         }
         if(_usesCycle)
         {
            if(_usesPhase)
            {
               _loc4_ = _loc4_ + ("add " + _loc11_ + "," + param2.vertexTime + "," + _loc8_ + "\n");
            }
            else
            {
               _loc4_ = _loc4_ + ("mov " + _loc11_ + "," + param2.vertexTime + "\n");
            }
            _loc4_ = _loc4_ + ("div " + _loc11_ + "," + _loc11_ + "," + _loc3_ + "\n");
            _loc4_ = _loc4_ + ("frc " + _loc11_ + "," + _loc11_ + "\n");
            _loc4_ = _loc4_ + ("mul " + _loc11_ + "," + _loc11_ + "," + _loc3_ + "\n");
            _loc4_ = _loc4_ + ("mul " + _loc15_ + "," + _loc11_ + "," + _loc16_ + "\n");
         }
         else
         {
            _loc4_ = _loc4_ + ("mul " + _loc15_.toString() + "," + param2.vertexLife + "," + _loc6_ + "\n");
         }
         if(_numRows > 1)
         {
            _loc4_ = _loc4_ + ("frc " + _loc10_ + "," + _loc15_ + "\n");
            _loc4_ = _loc4_ + ("sub " + _loc5_ + "," + _loc15_ + "," + _loc10_ + "\n");
            _loc4_ = _loc4_ + ("mul " + _loc5_ + "," + _loc5_ + "," + _loc17_ + "\n");
            _loc4_ = _loc4_ + ("add " + _loc7_ + "," + _loc7_ + "," + _loc5_ + "\n");
         }
         _loc4_ = _loc4_ + ("div " + _loc10_ + "," + _loc15_ + "," + _loc14_ + "\n");
         _loc4_ = _loc4_ + ("frc " + _loc15_ + "," + _loc10_ + "\n");
         _loc4_ = _loc4_ + ("sub " + _loc10_ + "," + _loc10_ + "," + _loc15_ + "\n");
         _loc4_ = _loc4_ + ("mul " + _loc15_ + "," + _loc10_ + "," + _loc14_ + "\n");
         if(_numRows > 1)
         {
            _loc4_ = _loc4_ + ("frc " + _loc15_ + "," + _loc15_ + "\n");
         }
         _loc4_ = _loc4_ + ("add " + _loc9_ + "," + _loc9_ + "," + _loc15_ + "\n");
         return _loc4_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleSpriteSheetState
      {
         return param1.getAnimationState(this) as ParticleSpriteSheetState;
      }
      
      override function processAnimationSetting(param1:ParticleAnimationSet) : void
      {
         param1.hasUVNode = true;
      }
      
      override function generatePropertyOfOneParticle(param1:ParticleProperties) : void
      {
         var _loc3_:* = null;
         var _loc2_:Number = NaN;
         if(_usesCycle)
         {
            _loc3_ = param1["UVVector3D"];
            if(!_loc3_)
            {
               throw new Error("there is no UVVector3D in param!");
            }
            if(_loc3_.x <= 0)
            {
               throw new Error("the cycle duration must be greater than zero");
            }
            _loc2_ = _totalFrames / _numColumns;
            _oneData[0] = _loc2_ / _loc3_.x;
            _oneData[1] = _loc3_.x;
            if(_usesPhase)
            {
               _oneData[2] = _loc3_.y;
            }
         }
      }
   }
}
