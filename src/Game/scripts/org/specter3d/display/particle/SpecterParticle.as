package org.specter3d.display.particle
{
   import org.specter3d.utils.HashMap;
   import away3d.entities.Mesh;
   import away3d.core.base.Object3D;
   import away3d.entities.Entity;
   
   public class SpecterParticle
   {
      
      private static var _meshCacheMap:HashMap = new HashMap();
       
      
      private var _mesh:Mesh;
      
      private var _animator:org.specter3d.display.particle.SpecterParticleAnimator;
      
      private var _driver:org.specter3d.display.particle.ParticleDirver;
      
      private var _renderLayer:uint;
      
      public var isDispose:Boolean = false;
      
      public function SpecterParticle(param1:org.specter3d.display.particle.ParticleDirver)
      {
         _renderLayer = Entity.EFFECT_LAYER;
         super();
         _driver = param1;
      }
      
      public static function cleanCache() : void
      {
         _meshCacheMap.forEach(function(param1:Vector.<Mesh>):void
         {
            var _loc2_:int = 0;
            _loc2_ = 0;
            while(_loc2_ < param1.length)
            {
               try
               {
                  param1[_loc2_].dispose();
               }
               catch(err:Error)
               {
               }
               _loc2_++;
            }
         });
         _meshCacheMap.clear();
      }
      
      public function get renderLayer() : uint
      {
         return _renderLayer;
      }
      
      public function set renderLayer(param1:uint) : void
      {
         _renderLayer = param1;
      }
      
      public function initMesh() : void
      {
         var _loc1_:Vector.<Mesh> = _meshCacheMap.getValue(_driver.emmiterUrl) as Vector.<Mesh>;
         if(_loc1_ && _loc1_.length > 0)
         {
            _mesh = _loc1_.pop();
         }
         if(_mesh && _mesh.material.isDestroy || _mesh == null)
         {
            if(_driver.pData.meshData.shapeType == "trail")
            {
               _mesh = new Mesh(_driver.geometry,null,false);
            }
            else
            {
               _mesh = new Mesh(_driver.geometry,_driver.material);
            }
         }
         _mesh.renderLayer = _renderLayer;
         if(_driver.pData.meshData.useHeatFilter)
         {
            _mesh.subMeshes[0].postEffectData.heatFlag = _driver.pData.meshData.heatFlag;
            EffectManager.addHeatFilter();
         }
         if(_driver.animationSet)
         {
            _animator = new org.specter3d.display.particle.SpecterParticleAnimator(_driver.animationSet,_driver.pData);
            _mesh.animator = _animator;
         }
      }
      
      public function get mesh() : Mesh
      {
         return _mesh;
      }
      
      public final function get particleAnimator() : org.specter3d.display.particle.SpecterParticleAnimator
      {
         return _animator;
      }
      
      public function set followTarget(param1:Object3D) : void
      {
         if(this.isDispose)
         {
            return;
         }
         if(_driver && _driver.followNode && _driver.followNode.getAnimationState(_animator))
         {
            _driver.followNode.getAnimationState(_animator).followTarget = param1;
         }
      }
      
      public function get driver() : org.specter3d.display.particle.ParticleDirver
      {
         return _driver;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = undefined;
         if(this.isDispose)
         {
            return;
         }
         isDispose = false;
         if(_animator)
         {
            _animator.dispose();
            _animator = null;
         }
         if(_mesh)
         {
            if(true && _mesh.material && !_mesh.material.isDestroy)
            {
               if(_meshCacheMap.containsKey(_driver.emmiterUrl) == false)
               {
                  _loc1_ = _meshCacheMap.put(_driver.emmiterUrl,new Vector.<Mesh>());
               }
               else
               {
                  _loc1_ = _meshCacheMap.getValue(_driver.emmiterUrl) as Vector.<Mesh>;
               }
               _loc1_.push(_mesh);
            }
            else
            {
               _mesh.dispose();
            }
            _mesh = null;
         }
         _driver = null;
      }
   }
}
