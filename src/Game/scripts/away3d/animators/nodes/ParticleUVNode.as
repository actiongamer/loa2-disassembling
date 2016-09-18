package away3d.animators.nodes
{
   import flash.geom.Vector3D;
   import away3d.materials.passes.MaterialPassBase;
   import away3d.animators.data.AnimationRegisterCache;
   import away3d.materials.compilation.ShaderRegisterElement;
   import away3d.animators.states.ParticleUVState;
   import away3d.animators.IAnimator;
   import §away3d:arcane§._uvData;
   import away3d.animators.ParticleAnimationSet;
   
   public class ParticleUVNode extends ParticleNodeBase
   {
      
      static const UV_INDEX:uint = 0;
      
      public static const GLOBAL:uint = 1;
      
      public static const U_AXIS:String = "x";
      
      public static const V_AXIS:String = "y";
       
      
      var _uvData:Vector3D;
      
      private var _cycle:Number;
      
      private var _scale:Number;
      
      private var _axis:String;
      
      public function ParticleUVNode(param1:uint, param2:Number = 1, param3:Number = 1, param4:String = "x")
      {
         super("ParticleUV",param1,4,9 + 1);
         _stateClass = ParticleUVState;
         _cycle = param2;
         _scale = param3;
         _axis = param4;
         updateUVData();
      }
      
      public function get cycle() : Number
      {
         return _cycle;
      }
      
      public function set cycle(param1:Number) : void
      {
         _cycle = param1;
         updateUVData();
      }
      
      public function get scale() : Number
      {
         return _scale;
      }
      
      public function set scale(param1:Number) : void
      {
         _scale = param1;
         updateUVData();
      }
      
      public function get axis() : String
      {
         return _axis;
      }
      
      public function set axis(param1:String) : void
      {
         _axis = param1;
      }
      
      override public function getAGALUVCode(param1:MaterialPassBase, param2:AnimationRegisterCache) : String
      {
         var _loc5_:* = null;
         var _loc7_:Number = NaN;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc6_:String = "";
         if(param2.needUVAnimation)
         {
            _loc5_ = param2.getFreeVertexConstant();
            param2.setRegisterIndex(this,0,_loc5_.index);
            _loc7_ = _axis == "x"?0:Number(_axis == "y"?1:2);
            _loc4_ = new ShaderRegisterElement(param2.uvTarget.regName,param2.uvTarget.index,_loc7_);
            _loc3_ = param2.getFreeVertexSingleTemp();
            if(_scale != 1)
            {
               _loc6_ = _loc6_ + ("mul " + _loc4_ + "," + _loc4_ + "," + _loc5_ + ".y\n");
            }
            _loc6_ = _loc6_ + ("mul " + _loc3_ + "," + param2.vertexTime + "," + _loc5_ + ".x\n");
            _loc6_ = _loc6_ + ("sin " + _loc3_ + "," + _loc3_ + "\n");
            _loc6_ = _loc6_ + ("add " + _loc4_ + "," + _loc4_ + "," + _loc3_ + "\n");
         }
         return _loc6_;
      }
      
      public function getAnimationState(param1:IAnimator) : ParticleUVState
      {
         return param1.getAnimationState(this) as ParticleUVState;
      }
      
      private function updateUVData() : void
      {
         _uvData = new Vector3D(3.14159265358979 * 2 / _cycle,_scale,0,0);
      }
      
      override function processAnimationSetting(param1:ParticleAnimationSet) : void
      {
         param1.hasUVNode = true;
      }
   }
}
