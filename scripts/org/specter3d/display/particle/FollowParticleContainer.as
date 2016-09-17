package org.specter3d.display.particle
{
   import away3d.containers.ObjectContainer3D;
   import flash.geom.Matrix3D;
   import away3d.entities.Mesh;
   import flash.geom.Vector3D;
   
   public class FollowParticleContainer extends ObjectContainer3D
   {
       
      
      private var _identityTransform:Matrix3D;
      
      private var _followTarget:TargetObject3D;
      
      private var _updatePositionMeshes:Vector.<Mesh>;
      
      public function FollowParticleContainer()
      {
         super();
         _identityTransform = new Matrix3D();
         _updatePositionMeshes = new Vector.<Mesh>();
         _followTarget = new TargetObject3D(this);
         addChild(_followTarget);
      }
      
      public function addFollowParticle(param1:SpecterParticle) : void
      {
         param1.mesh.forceRenderWithoutFrustum = true;
         param1.followTarget = _followTarget;
         addChild(param1.mesh);
         if(!param1.driver.pData.followData.usesPosition)
         {
            _updatePositionMeshes.push(param1.mesh);
         }
      }
      
      public function removeFollowParticle(param1:SpecterParticle) : void
      {
         param1.followTarget = null;
         removeChild(param1.mesh);
         _updatePositionMeshes.splice(_updatePositionMeshes.indexOf(param1.mesh),1);
      }
      
      public function get originalSceneTransform() : Matrix3D
      {
         return super.sceneTransform;
      }
      
      override public function get sceneTransform() : Matrix3D
      {
         var _loc2_:* = null;
         var _loc1_:Vector.<Vector3D> = null;
         var _loc3_:Vector.<Number> = null;
         if(_sceneTransformDirty)
         {
            _loc1_ = _sceneTransform.decompose();
            _identityTransform.identity();
            _identityTransform.prependScale(_loc1_[2].x,_loc1_[2].y,_loc1_[2].z);
            _identityTransform.prependRotation(0.1,Vector3D.Y_AXIS);
         }
         if(_followTarget.sceneTransformDirty)
         {
            var _loc5_:int = 0;
            var _loc4_:* = _updatePositionMeshes;
            for each(_loc2_ in _updatePositionMeshes)
            {
               _loc2_.position = _followTarget.specificPos;
            }
         }
         return _identityTransform;
      }
      
      override public function dispose() : void
      {
         _identityTransform = null;
         _followTarget = null;
         _updatePositionMeshes = null;
         super.dispose();
      }
   }
}

import away3d.containers.ObjectContainer3D;
import org.specter3d.display.particle.FollowParticleContainer;
import flash.geom.Vector3D;

class TargetObject3D extends ObjectContainer3D
{
    
   
   private var _container:FollowParticleContainer;
   
   public var specificPos:Vector3D;
   
   private var specificEulers:Vector3D;
   
   function TargetObject3D(param1:FollowParticleContainer)
   {
      super();
      specificPos = new Vector3D();
      specificEulers = new Vector3D();
      _container = param1;
   }
   
   public function get sceneTransformDirty() : Boolean
   {
      return _sceneTransformDirty;
   }
   
   private function validateTransform(param1:uint) : void
   {
      if(_sceneTransformDirty == false)
      {
         return;
      }
      var _loc2_:Vector.<Vector3D> = _container.originalSceneTransform.decompose();
      if(param1 >= 1)
      {
         specificPos = _loc2_[0];
         specificPos.x = specificPos.x / _loc2_[2].x;
         specificPos.y = specificPos.y / _loc2_[2].y;
         specificPos.z = specificPos.z / _loc2_[2].z;
      }
      if(param1 <= 1)
      {
         specificEulers = _loc2_[1];
         specificEulers.scaleBy(0.0174532925199433);
      }
      _sceneTransformDirty = false;
   }
   
   override public function dispose() : void
   {
      _container = null;
      specificPos = null;
      specificEulers = null;
      super.dispose();
   }
   
   override function invalidateTransform() : void
   {
      super.invalidateTransform();
      if(_sceneTransformDirty)
      {
         validateTransform(1);
      }
   }
   
   override public function get x() : Number
   {
      if(_sceneTransformDirty)
      {
         validateTransform(2);
      }
      return specificPos.x;
   }
   
   override public function get y() : Number
   {
      if(_sceneTransformDirty)
      {
         validateTransform(2);
      }
      return specificPos.y;
   }
   
   override public function get z() : Number
   {
      if(_sceneTransformDirty)
      {
         validateTransform(2);
      }
      return specificPos.z;
   }
   
   override public function get position() : Vector3D
   {
      if(_sceneTransformDirty)
      {
         validateTransform(2);
      }
      return specificPos;
   }
   
   override public function get rotationX() : Number
   {
      if(_sceneTransformDirty)
      {
         validateTransform(0);
      }
      return specificEulers.x;
   }
   
   override public function get rotationY() : Number
   {
      if(_sceneTransformDirty)
      {
         validateTransform(0);
      }
      return specificEulers.y;
   }
   
   override public function get rotationZ() : Number
   {
      if(_sceneTransformDirty)
      {
         validateTransform(0);
      }
      return specificEulers.z;
   }
}
