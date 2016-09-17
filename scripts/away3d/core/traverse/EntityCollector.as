package away3d.core.traverse
{
   import away3d.core.base.IRenderable;
   import away3d.core.data.RenderableListItem;
   import away3d.core.data.EntityListItem;
   import away3d.core.data.RenderableListItemPool;
   import away3d.core.data.EntityListItemPool;
   import away3d.lights.LightBase;
   import away3d.lights.DirectionalLight;
   import away3d.lights.PointLight;
   import away3d.lights.LightProbe;
   import away3d.cameras.Camera3D;
   import §away3d:arcane§._entryPoint;
   import away3d.core.partition.NodeBase;
   import §away3d:arcane§._collectionMark;
   import away3d.materials.MaterialBase;
   import away3d.entities.Entity;
   
   public class EntityCollector extends PartitionTraverser
   {
       
      
      protected var _skyBox:IRenderable;
      
      protected var _lightMapRenderableHead:RenderableListItem;
      
      protected var _opaqueRenderableHead:RenderableListItem;
      
      protected var _decalRenderableHead:RenderableListItem;
      
      protected var _blendedRenderableHead:RenderableListItem;
      
      protected var _effectRenderableHead:RenderableListItem;
      
      protected var _nameHead:RenderableListItem;
      
      protected var _mapHead:RenderableListItem;
      
      private var _entityHead:EntityListItem;
      
      protected var _renderableListItemPool:RenderableListItemPool;
      
      protected var _entityListItemPool:EntityListItemPool;
      
      protected var _lights:Vector.<LightBase>;
      
      private var _directionalLights:Vector.<DirectionalLight>;
      
      private var _pointLights:Vector.<PointLight>;
      
      private var _lightProbes:Vector.<LightProbe>;
      
      protected var _numEntities:uint;
      
      protected var _numTexLights:uint;
      
      protected var _numOpaques:uint;
      
      protected var _numAvatars:uint;
      
      protected var _numBlended:uint;
      
      protected var _numName:uint;
      
      protected var _numMap:uint;
      
      protected var _numLights:uint;
      
      protected var _numTriangles:uint;
      
      protected var _numMouseEnableds:uint;
      
      protected var _camera:Camera3D;
      
      private var _numDirectionalLights:uint;
      
      private var _numPointLights:uint;
      
      private var _numLightProbes:uint;
      
      public function EntityCollector()
      {
         super();
         init();
      }
      
      private function init() : void
      {
         _lights = new Vector.<LightBase>();
         _directionalLights = new Vector.<DirectionalLight>();
         _pointLights = new Vector.<PointLight>();
         _lightProbes = new Vector.<LightProbe>();
         _renderableListItemPool = new RenderableListItemPool();
         _entityListItemPool = new EntityListItemPool();
      }
      
      public function get numEntities() : uint
      {
         return _numEntities;
      }
      
      public function get numTexLights() : uint
      {
         return _numTexLights;
      }
      
      public function get numOpaques() : uint
      {
         return _numOpaques;
      }
      
      public function get numAvatars() : uint
      {
         return _numAvatars;
      }
      
      public function get numBlended() : uint
      {
         return _numBlended;
      }
      
      public function get numName() : uint
      {
         return _numName;
      }
      
      public function get numMap() : uint
      {
         return _numMap;
      }
      
      public final function get camera() : Camera3D
      {
         return _camera;
      }
      
      public function set camera(param1:Camera3D) : void
      {
         _camera = param1;
         _entryPoint = _camera.scenePosition;
      }
      
      public function get numMouseEnableds() : uint
      {
         return _numMouseEnableds;
      }
      
      public function get skyBox() : IRenderable
      {
         return _skyBox;
      }
      
      public function get mapHead() : RenderableListItem
      {
         return _mapHead;
      }
      
      public function set mapHead(param1:RenderableListItem) : void
      {
         _mapHead = param1;
      }
      
      public function get nameHead() : RenderableListItem
      {
         return _nameHead;
      }
      
      public function set nameHead(param1:RenderableListItem) : void
      {
         _nameHead = param1;
      }
      
      public function get opaqueRenderableHead() : RenderableListItem
      {
         return _opaqueRenderableHead;
      }
      
      public function set opaqueRenderableHead(param1:RenderableListItem) : void
      {
         _opaqueRenderableHead = param1;
      }
      
      public function get blendedRenderableHead() : RenderableListItem
      {
         return _blendedRenderableHead;
      }
      
      public function set blendedRenderableHead(param1:RenderableListItem) : void
      {
         _blendedRenderableHead = param1;
      }
      
      public function get decalRenderableHead() : RenderableListItem
      {
         return _decalRenderableHead;
      }
      
      public function set decalRenderableHead(param1:RenderableListItem) : void
      {
         _decalRenderableHead = param1;
      }
      
      public function get lightMapRenderableHead() : RenderableListItem
      {
         return _lightMapRenderableHead;
      }
      
      public function set lightMapRenderableHead(param1:RenderableListItem) : void
      {
         _lightMapRenderableHead = param1;
      }
      
      public function get entityHead() : EntityListItem
      {
         return _entityHead;
      }
      
      public function get effectRenderableHead() : RenderableListItem
      {
         return _effectRenderableHead;
      }
      
      public function get lights() : Vector.<LightBase>
      {
         return _lights;
      }
      
      public function get directionalLights() : Vector.<DirectionalLight>
      {
         return _directionalLights;
      }
      
      public function get pointLights() : Vector.<PointLight>
      {
         return _pointLights;
      }
      
      public function get lightProbes() : Vector.<LightProbe>
      {
         return _lightProbes;
      }
      
      public function clear() : void
      {
         _numAvatars = 0;
         _numTexLights = 0;
         _numLights = 0;
         _numBlended = 0;
         _numOpaques = 0;
         _numEntities = 0;
         _numMouseEnableds = 0;
         _numTriangles = 0;
         _lightMapRenderableHead = null;
         _decalRenderableHead = null;
         _blendedRenderableHead = null;
         _opaqueRenderableHead = null;
         _entityHead = null;
         _effectRenderableHead = null;
         _nameHead = null;
         _mapHead = null;
         _renderableListItemPool.freeAll();
         _entityListItemPool.freeAll();
         _skyBox = null;
         if(_numLights > 0)
         {
            _numLights = 0;
            _lights.length = 0;
         }
         if(_numDirectionalLights > 0)
         {
            _numDirectionalLights = 0;
            _directionalLights.length = 0;
         }
         if(_numPointLights > 0)
         {
            _numPointLights = 0;
            _pointLights.length = 0;
         }
         if(_numLightProbes > 0)
         {
            _numLightProbes = 0;
            _lightProbes.length = 0;
         }
      }
      
      override public function enterNode(param1:NodeBase) : Boolean
      {
         var _loc2_:Boolean = _collectionMark != param1._collectionMark && param1.isInFrustum(_camera);
         param1._collectionMark = _collectionMark;
         return _loc2_;
      }
      
      override public function applySkyBox(param1:IRenderable) : void
      {
         _skyBox = param1;
      }
      
      override public function applyRenderable(param1:IRenderable) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(param1.mouseEnabled)
         {
            _numMouseEnableds = _numMouseEnableds + 1;
         }
         _numTriangles = _numTriangles + param1.numTriangles;
         _loc3_ = param1.material;
         if(_loc3_ && param1.sourceEntity)
         {
            _loc2_ = _renderableListItemPool.getItem();
            _loc2_.renderable = param1;
            _loc2_.materialId = _loc3_._uniqueId;
            _loc2_.renderOrderId = _loc3_._renderOrderId;
            _loc2_.zIndex = param1.zIndex;
            _loc2_.renderPriority = _loc3_.renderPriority;
            if(param1.sourceEntity.renderLayer == Entity.SCENELIGHT_LAYER)
            {
               _loc2_.next = _lightMapRenderableHead;
               _lightMapRenderableHead = _loc2_;
               _numTexLights = _numTexLights + 1;
            }
            else if(param1.sourceEntity.renderLayer == Entity.EFFECT_LAYER)
            {
               _loc2_.next = _effectRenderableHead;
               _effectRenderableHead = _loc2_;
               _numTexLights = _numTexLights + 1;
            }
            else if(param1.sourceEntity.renderLayer == Entity.TOP_LAYER)
            {
               _loc2_.next = _nameHead;
               _nameHead = _loc2_;
               _numName = _numName + 1;
            }
            else if(param1.sourceEntity.renderLayer == Entity.MAP_TILE_LAYER)
            {
               _loc2_.next = _mapHead;
               _mapHead = _loc2_;
               _numMap = _numMap + 1;
            }
            else if(param1.sourceEntity.renderLayer == Entity.DECAL_LAYER)
            {
               _loc2_.next = _decalRenderableHead;
               _decalRenderableHead = _loc2_;
               _numBlended = _numBlended + 1;
            }
            else if(_loc3_.requiresBlending)
            {
               _loc2_.next = _blendedRenderableHead;
               _blendedRenderableHead = _loc2_;
               _numBlended = _numBlended + 1;
            }
            else
            {
               _loc2_.next = _opaqueRenderableHead;
               _opaqueRenderableHead = _loc2_;
               _numOpaques = _numOpaques + 1;
            }
         }
      }
      
      override public function applyEntity(param1:Entity) : void
      {
         _numEntities = _numEntities + 1;
         var _loc2_:EntityListItem = _entityListItemPool.getItem();
         _loc2_.entity = param1;
         _loc2_.next = _entityHead;
         _entityHead = _loc2_;
      }
      
      override public function applyUnknownLight(param1:LightBase) : void
      {
         _numLights = Number(_numLights) + 1;
         _lights[Number(_numLights)] = param1;
      }
      
      override public function applyDirectionalLight(param1:DirectionalLight) : void
      {
         _numLights = Number(_numLights) + 1;
         _lights[Number(_numLights)] = param1;
         _numDirectionalLights = Number(_numDirectionalLights) + 1;
         _directionalLights[Number(_numDirectionalLights)] = param1;
      }
      
      override public function applyPointLight(param1:PointLight) : void
      {
         _numLights = Number(_numLights) + 1;
         _lights[Number(_numLights)] = param1;
         _numPointLights = Number(_numPointLights) + 1;
         _pointLights[Number(_numPointLights)] = param1;
      }
      
      override public function applyLightProbe(param1:LightProbe) : void
      {
         _numLights = Number(_numLights) + 1;
         _lights[Number(_numLights)] = param1;
         _numLightProbes = Number(_numLightProbes) + 1;
         _lightProbes[Number(_numLightProbes)] = param1;
      }
      
      public function get numTriangles() : uint
      {
         return _numTriangles;
      }
      
      public function get numLights() : uint
      {
         return _numLights;
      }
      
      public function cleanUp() : void
      {
         var _loc1_:EntityListItem = _entityHead;
         while(_loc1_)
         {
            _loc1_.entity.popModelViewProjection();
            _loc1_ = _loc1_.next;
         }
      }
      
      public function get entityListItemPool() : EntityListItemPool
      {
         return _entityListItemPool;
      }
      
      public function get renderableListItemPool() : RenderableListItemPool
      {
         return _renderableListItemPool;
      }
      
      public function disposePool() : void
      {
         _renderableListItemPool.dispose();
         _entityListItemPool.dispose();
      }
   }
}
