package away3d.lights
{
   import away3d.entities.Entity;
   import away3d.lights.lightmaps.AreaLightMapper;
   import away3d.lights.shadowmaps.ShadowMapperBase;
   import away3d.events.LightEvent;
   import away3d.core.partition.EntityNode;
   import away3d.core.partition.LightNode;
   import away3d.errors.AbstractMethodError;
   import flash.geom.Matrix3D;
   import away3d.core.base.IRenderable;
   import §away3d:arcane§._ambientR;
   import §away3d:arcane§._ambientG;
   import §away3d:arcane§._ambientB;
   import §away3d:arcane§._diffuseR;
   import §away3d:arcane§._diffuseG;
   import §away3d:arcane§._diffuseB;
   import §away3d:arcane§._specularR;
   import §away3d:arcane§._specularG;
   import §away3d:arcane§._specularB;
   
   public class LightBase extends Entity
   {
       
      
      var _ambientB:Number = 0;
      
      var _ambientG:Number = 0;
      
      var _ambientR:Number = 0;
      
      var _diffuseB:Number = 1;
      
      var _diffuseG:Number = 1;
      
      var _diffuseR:Number = 1;
      
      var _specularB:Number = 1;
      
      var _specularG:Number = 1;
      
      var _specularR:Number = 1;
      
      private var _ambient:Number = 0;
      
      private var _ambientColor:uint = 16777215;
      
      private var _castsLightMap:Boolean = false;
      
      private var _castsShadows:Boolean;
      
      private var _color:uint = 16777215;
      
      private var _colorB:Number = 1;
      
      private var _colorG:Number = 1;
      
      private var _colorR:Number = 1;
      
      private var _diffuse:Number = 1;
      
      private var _lightMapper:AreaLightMapper;
      
      private var _shadowMapper:ShadowMapperBase;
      
      private var _specular:Number = 1;
      
      public function LightBase()
      {
         super();
      }
      
      public function get ambient() : Number
      {
         return _ambient;
      }
      
      public function set ambient(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 1)
         {
            param1 = 1;
         }
         _ambient = param1;
         updateAmbient();
      }
      
      public function get ambientColor() : uint
      {
         return _ambientColor;
      }
      
      public function set ambientColor(param1:uint) : void
      {
         _ambientColor = param1;
         updateAmbient();
      }
      
      public function get castsLightMap() : Boolean
      {
         return _castsLightMap;
      }
      
      public function set castsLightMap(param1:Boolean) : void
      {
         if(_castsLightMap == param1)
         {
            return;
         }
         _castsLightMap = param1;
         if(param1)
         {
            if(!_lightMapper)
            {
               _lightMapper = createLightMapper();
            }
         }
         else
         {
            if(_lightMapper)
            {
               _lightMapper.dispose();
            }
            _lightMapper = null;
         }
      }
      
      public function get castsShadows() : Boolean
      {
         return _castsShadows;
      }
      
      public function set castsShadows(param1:Boolean) : void
      {
         if(_castsShadows == param1)
         {
            return;
         }
         _castsShadows = param1;
         if(param1)
         {
            if(!_shadowMapper)
            {
               _shadowMapper = createShadowMapper();
            }
            _shadowMapper.light = this;
         }
         else
         {
            _shadowMapper.dispose();
            _shadowMapper = null;
         }
         dispatchEvent(new LightEvent("castsShadowChange"));
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
         _colorR = (_color >> 16 & 255) / 255;
         _colorG = (_color >> 8 & 255) / 255;
         _colorB = (_color & 255) / 255;
         updateDiffuse();
         updateSpecular();
      }
      
      public function get diffuse() : Number
      {
         return _diffuse;
      }
      
      public function set diffuse(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         _diffuse = param1;
         updateDiffuse();
      }
      
      public function get lightMapper() : AreaLightMapper
      {
         return _lightMapper;
      }
      
      public function get shadowMapper() : ShadowMapperBase
      {
         return _shadowMapper;
      }
      
      public function set shadowMapper(param1:ShadowMapperBase) : void
      {
         _shadowMapper = param1;
         _shadowMapper.light = this;
      }
      
      public function get specular() : Number
      {
         return _specular;
      }
      
      public function set specular(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         _specular = param1;
         updateSpecular();
      }
      
      override protected function createEntityPartitionNode() : EntityNode
      {
         return new LightNode(this);
      }
      
      protected function createLightMapper() : AreaLightMapper
      {
         return new AreaLightMapper(this);
      }
      
      protected function createShadowMapper() : ShadowMapperBase
      {
         throw new AbstractMethodError();
      }
      
      function getObjectProjectionMatrix(param1:IRenderable, param2:Matrix3D = null) : Matrix3D
      {
         throw new AbstractMethodError();
      }
      
      private function updateAmbient() : void
      {
         _ambientR = (_ambientColor >> 16 & 255) / 255 * _ambient;
         _ambientG = (_ambientColor >> 8 & 255) / 255 * _ambient;
         _ambientB = (_ambientColor & 255) / 255 * _ambient;
      }
      
      private function updateDiffuse() : void
      {
         _diffuseR = _colorR * _diffuse;
         _diffuseG = _colorG * _diffuse;
         _diffuseB = _colorB * _diffuse;
      }
      
      private function updateSpecular() : void
      {
         _specularR = _colorR * _specular;
         _specularG = _colorG * _specular;
         _specularB = _colorB * _specular;
      }
   }
}
