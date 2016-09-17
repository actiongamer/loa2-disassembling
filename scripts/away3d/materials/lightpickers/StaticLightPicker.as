package away3d.materials.lightpickers
{
   import away3d.lights.LightBase;
   import away3d.lights.PointLight;
   import away3d.lights.DirectionalLight;
   import away3d.lights.LightProbe;
   import flash.events.Event;
   import away3d.events.LightEvent;
   
   public class StaticLightPicker extends LightPickerBase
   {
       
      
      private var _lights:Array;
      
      public function StaticLightPicker(param1:Array)
      {
         super();
         this.lights = param1;
      }
      
      public function get lights() : Array
      {
         return _lights;
      }
      
      public function set lights(param1:Array) : void
      {
         var _loc6_:* = null;
         var _loc8_:* = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc2_:uint = 0;
         var _loc9_:uint = 0;
         if(_lights)
         {
            clearListeners();
         }
         _lights = param1;
         _allPickedLights = Vector.<LightBase>(param1);
         _pointLights = new Vector.<PointLight>();
         _castingPointLights = new Vector.<PointLight>();
         _directionalLights = new Vector.<DirectionalLight>();
         _castingDirectionalLights = new Vector.<DirectionalLight>();
         _lightProbes = new Vector.<LightProbe>();
         var _loc5_:uint = param1.length;
         _loc8_ = uint(0);
         while(_loc8_ < _loc5_)
         {
            _loc6_ = param1[_loc8_];
            _loc6_.addEventListener("castsShadowChange",onCastShadowChange);
            if(_loc6_ is PointLight)
            {
               if(_loc6_.castsShadows)
               {
                  _castingPointLights[_loc4_++] = PointLight(_loc6_);
               }
               else
               {
                  _pointLights[_loc7_++] = PointLight(_loc6_);
               }
            }
            else if(_loc6_ is DirectionalLight)
            {
               if(_loc6_.castsShadows)
               {
                  _castingDirectionalLights[_loc2_++] = DirectionalLight(_loc6_);
               }
               else
               {
                  _directionalLights[_loc3_++] = DirectionalLight(_loc6_);
               }
            }
            else if(_loc6_ is LightProbe)
            {
               _lightProbes[_loc9_++] = LightProbe(_loc6_);
            }
            _loc8_++;
         }
         if(_numDirectionalLights == _loc3_ && _numPointLights == _loc7_ && _numLightProbes == _loc9_ && _numCastingPointLights == _loc4_ && _numCastingDirectionalLights == _loc2_)
         {
            return;
         }
         _numDirectionalLights = _loc3_;
         _numCastingDirectionalLights = _loc2_;
         _numPointLights = _loc7_;
         _numCastingPointLights = _loc4_;
         _numLightProbes = _loc9_;
         _lightProbeWeights = new Vector.<Number>(Math.ceil(_loc9_ / 4) * 4,true);
         dispatchEvent(new Event("change"));
      }
      
      private function clearListeners() : void
      {
         var _loc2_:int = 0;
         var _loc1_:uint = _lights.length;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            _lights[_loc2_].removeEventListener("castsShadowChange",onCastShadowChange);
            _loc2_++;
         }
      }
      
      private function onCastShadowChange(param1:LightEvent) : void
      {
         var _loc2_:LightBase = LightBase(param1.target);
         if(_loc2_ is PointLight)
         {
            updatePointCasting(_loc2_ as PointLight);
         }
         else if(_loc2_ is DirectionalLight)
         {
            updateDirectionalCasting(_loc2_ as DirectionalLight);
         }
         dispatchEvent(new Event("change"));
      }
      
      private function updateDirectionalCasting(param1:DirectionalLight) : void
      {
         if(param1.castsShadows)
         {
            _numDirectionalLights = _numDirectionalLights - 1;
            _numCastingDirectionalLights = _numCastingDirectionalLights + 1;
            _directionalLights.splice(_directionalLights.indexOf(param1 as DirectionalLight),1);
            _castingDirectionalLights.push(param1);
         }
         else
         {
            _numDirectionalLights = _numDirectionalLights + 1;
            _numCastingDirectionalLights = _numCastingDirectionalLights - 1;
            _castingDirectionalLights.splice(_castingDirectionalLights.indexOf(param1 as DirectionalLight),1);
            _directionalLights.push(param1);
         }
      }
      
      private function updatePointCasting(param1:PointLight) : void
      {
         if(param1.castsShadows)
         {
            _numPointLights = _numPointLights - 1;
            _numCastingPointLights = _numCastingPointLights + 1;
            _pointLights.splice(_pointLights.indexOf(param1 as PointLight),1);
            _castingPointLights.push(param1);
         }
         else
         {
            _numPointLights = _numPointLights + 1;
            _numCastingPointLights = _numCastingPointLights - 1;
            _castingPointLights.splice(_castingPointLights.indexOf(param1 as PointLight),1);
            _pointLights.push(param1);
         }
      }
   }
}
