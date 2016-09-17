package away3d.animators.nodes
{
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import §away3d:arcane§._usesCycle;
   import §away3d:arcane§._usesPhase;
   import away3d.animators.states.ParticleScaleState;
   import away3d.animators.IAnimator;
   import away3d.animators.data.ParticleProperties;
   import flash.geom.Vector3D;
   import §away3d:arcane§._minScale;
   import §away3d:arcane§._maxScale;
   import §away3d:arcane§._cycleDuration;
   import §away3d:arcane§._cyclePhase;
   
   public class ParticleScaleNode extends ParticleNodeBase
   {
      
      static const SCALE_INDEX:uint = 0;
      
      public static const SCALE_VECTOR3D:String = "ScaleVector3D";
       
      
      var _usesCycle:Boolean;
      
      var _usesPhase:Boolean;
      
      var _minScale:Number;
      
      var _maxScale:Number;
      
      var _cycleDuration:Number;
      
      var _cyclePhase:Number;
      
      public function ParticleScaleNode(param1:uint, param2:Boolean, param3:Boolean, param4:Number = 1, param5:Number = 1, param6:Number = 1, param7:Number = 0)
      {
         var _loc8_:int = 2;
         if(param2)
         {
            _loc8_++;
         }
         if(param3)
         {
            _loc8_++;
         }
         super("ParticleScale",param1,_loc8_,3);
         _stateClass = ParticleScaleState;
         _usesCycle = param2;
         _usesPhase = param3;
         _minScale = param4;
         _maxScale = param5;
         _cycleDuration = param6;
         _cyclePhase = param7;
      }
      
      override public function getAGALVertexCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc5_:String = "";
         var _loc4_:ShaderRegisterElement = param2.getFreeVertexSingleTemp();
         var _loc3_:ShaderRegisterElement = _mode == 0?param2.getFreeVertexConstant():param2.getFreeVertexAttribute();
         param2.setRegisterIndex(this,0,_loc3_.index);
         if(_usesCycle)
         {
            _loc5_ = _loc5_ + ("mul " + _loc4_ + "," + param2.vertexTime + "," + _loc3_ + ".z\n");
            if(_usesPhase)
            {
               _loc5_ = _loc5_ + ("add " + _loc4_ + "," + _loc4_ + "," + _loc3_ + ".w\n");
            }
            _loc5_ = _loc5_ + ("sin " + _loc4_ + "," + _loc4_ + "\n");
         }
         _loc5_ = _loc5_ + ("mul " + _loc4_ + "," + _loc3_ + ".y," + (!!_usesCycle?_loc4_:param2.vertexLife) + "\n");
         _loc5_ = _loc5_ + ("add " + _loc4_ + "," + _loc3_ + ".x," + _loc4_ + "\n");
         _loc5_ = _loc5_ + ("mul " + param2.scaleAndRotateTarget + "," + param2.scaleAndRotateTarget + "," + _loc4_ + "\n");
         return _loc5_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleScaleState
      {
         return param1.getAnimationState(this) as ParticleScaleState;
      }
      
      override function generatePropertyOfOneParticle(param1:ParticleProperties) : void
      {
         var _loc2_:Vector3D = param1["ScaleVector3D"];
         if(!_loc2_)
         {
            throw new Error("there is no ScaleVector3D in param!");
         }
         if(_usesCycle)
         {
            _oneData[0] = (_loc2_.x + _loc2_.y) / 2;
            _oneData[1] = Math.abs(_minScale - _maxScale) / 2;
            if(_loc2_.z <= 0)
            {
               throw new Error("the cycle duration must be greater than zero");
            }
            _oneData[2] = 3.14159265358979 * 2 / _loc2_.z;
            if(_usesPhase)
            {
               _oneData[3] = _loc2_.w * 3.14159265358979 / 180;
            }
         }
         else
         {
            _oneData[0] = _loc2_.x;
            _oneData[1] = _loc2_.y - _loc2_.x;
         }
      }
   }
}
