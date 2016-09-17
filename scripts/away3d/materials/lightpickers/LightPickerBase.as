package away3d.materials.lightpickers
{
   import flash.events.EventDispatcher;
   import away3d.lights.LightBase;
   import away3d.lights.PointLight;
   import away3d.lights.DirectionalLight;
   import away3d.lights.LightProbe;
   import away3d.core.base.IRenderable;
   import away3d.core.traverse.EntityCollector;
   import flash.geom.Vector3D;
   
   public class LightPickerBase extends EventDispatcher
   {
       
      
      protected var _numPointLights:uint;
      
      protected var _numDirectionalLights:uint;
      
      protected var _numCastingPointLights:uint;
      
      protected var _numCastingDirectionalLights:uint;
      
      protected var _numLightProbes:uint;
      
      protected var _allPickedLights:Vector.<LightBase>;
      
      protected var _pointLights:Vector.<PointLight>;
      
      protected var _castingPointLights:Vector.<PointLight>;
      
      protected var _directionalLights:Vector.<DirectionalLight>;
      
      protected var _castingDirectionalLights:Vector.<DirectionalLight>;
      
      protected var _lightProbes:Vector.<LightProbe>;
      
      protected var _lightProbeWeights:Vector.<Number>;
      
      public var name:String;
      
      public function LightPickerBase()
      {
         super();
      }
      
      public function get numDirectionalLights() : uint
      {
         return _numDirectionalLights;
      }
      
      public function get numPointLights() : uint
      {
         return _numPointLights;
      }
      
      public function get numCastingDirectionalLights() : uint
      {
         return _numCastingDirectionalLights;
      }
      
      public function get numCastingPointLights() : uint
      {
         return _numCastingPointLights;
      }
      
      public function get numLightProbes() : uint
      {
         return _numLightProbes;
      }
      
      public function get pointLights() : Vector.<PointLight>
      {
         return _pointLights;
      }
      
      public function get directionalLights() : Vector.<DirectionalLight>
      {
         return _directionalLights;
      }
      
      public function get castingPointLights() : Vector.<PointLight>
      {
         return _castingPointLights;
      }
      
      public function get castingDirectionalLights() : Vector.<DirectionalLight>
      {
         return _castingDirectionalLights;
      }
      
      public function get lightProbes() : Vector.<LightProbe>
      {
         return _lightProbes;
      }
      
      public function get lightProbeWeights() : Vector.<Number>
      {
         return _lightProbeWeights;
      }
      
      public function get allPickedLights() : Vector.<LightBase>
      {
         return _allPickedLights;
      }
      
      public function collectLights(param1:IRenderable, param2:EntityCollector) : void
      {
         updateProbeWeights(param1);
      }
      
      private function updateProbeWeights(param1:IRenderable) : void
      {
         var _loc10_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc11_:int = 0;
         var _loc8_:Vector3D = param1.sourceEntity.scenePosition;
         var _loc9_:Number = _loc8_.x;
         var _loc12_:Number = _loc8_.y;
         var _loc4_:Number = _loc8_.z;
         var _loc3_:* = 0;
         _loc11_ = 0;
         while(_loc11_ < _numLightProbes)
         {
            _loc10_ = _lightProbes[_loc11_].scenePosition;
            _loc5_ = _loc9_ - _loc10_.x;
            _loc6_ = _loc12_ - _loc10_.y;
            _loc7_ = _loc4_ - _loc10_.z;
            _loc2_ = _loc5_ * _loc5_ + _loc6_ * _loc6_ + _loc7_ * _loc7_;
            _loc2_ = _loc2_ > 0.00001?1 / _loc2_:50000000;
            _lightProbeWeights[_loc11_] = _loc2_;
            _loc3_ = Number(_loc3_ + _loc2_);
            _loc11_++;
         }
         _loc3_ = Number(1 / _loc3_);
         _loc11_ = 0;
         while(_loc11_ < _numLightProbes)
         {
            var _loc13_:* = _loc11_;
            var _loc14_:* = _lightProbeWeights[_loc13_] * _loc3_;
            _lightProbeWeights[_loc13_] = _loc14_;
            _loc11_++;
         }
      }
   }
}
