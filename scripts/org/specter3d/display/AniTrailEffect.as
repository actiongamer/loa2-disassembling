package org.specter3d.display
{
   import away3d.containers.View3D;
   import away3d.materials.TextureMaterial;
   import flash.geom.Vector3D;
   import away3d.containers.ObjectContainer3D;
   import away3d.entities.Mesh;
   import away3d.core.base.Geometry;
   import away3d.entities.Entity;
   import flash.utils.getTimer;
   import away3d.core.math.Vector3DUtils;
   import away3d.core.base.SubGeometry;
   import away3d.core.base.SubMesh;
   import org.specter3d.context.AppGlobalContext;
   import away3d.materials.utils.DefaultMaterialManager;
   
   public class AniTrailEffect
   {
       
      
      private var _view3D:View3D;
      
      private var _trailMat:TextureMaterial;
      
      private var _bPos:Vector3D;
      
      private var _ePos:Vector3D;
      
      private var _anchor:ObjectContainer3D;
      
      private var _trailContainer:ObjectContainer3D;
      
      private var _tempV:Vector.<Vector3D>;
      
      private var _posV:Vector.<Vector3D>;
      
      private var _rangePosA:Vector3D;
      
      private var _rangePosB:Vector3D;
      
      private var _mesh:Mesh;
      
      private var _samplingGap:int = 30;
      
      private var _fragments:int = 30;
      
      private var _fadeOut:Number = 0.05;
      
      private var _offsetU:Number = 0;
      
      private var _offsetV:Number = 0;
      
      private var _uvRotation:Number = 0;
      
      private var _divide:int = 10;
      
      private var _isPlaying:Boolean;
      
      private var _heatFlag:int;
      
      private var _timestamp:int;
      
      public function AniTrailEffect(param1:TextureMaterial = null, param2:View3D = null)
      {
         _bPos = new Vector3D();
         _ePos = new Vector3D();
         _tempV = new Vector.<Vector3D>();
         _posV = new Vector.<Vector3D>();
         _rangePosA = new Vector3D(0,0,0);
         _rangePosB = new Vector3D(10,0,0);
         super();
         if(param2 == null)
         {
            param2 = AppGlobalContext.stage3d.view3d;
         }
         if(param1 == null)
         {
            param1 = DefaultMaterialManager.getDefaultMaterial();
         }
         _view3D = param2;
         _trailMat = param1;
         _trailMat.alphaBlending = true;
         _trailMat.bothSides = true;
         _trailMat.repeat = false;
         _trailMat.animateUVs = true;
      }
      
      public function set uvRotation(param1:Number) : void
      {
         _uvRotation = param1;
      }
      
      public function set offsetV(param1:Number) : void
      {
         _offsetV = param1;
      }
      
      public function set offsetU(param1:Number) : void
      {
         _offsetU = param1;
      }
      
      public function set samplingGap(param1:int) : void
      {
         _samplingGap = param1;
      }
      
      public function set fragments(param1:int) : void
      {
         _fragments = param1;
      }
      
      public function setRange(param1:Vector3D, param2:Vector3D) : void
      {
         _rangePosA = param1;
         _rangePosB = param2;
      }
      
      public function set fadeOut(param1:Number) : void
      {
         _fadeOut = param1;
      }
      
      public function startTrail(param1:ObjectContainer3D, param2:int = 0) : void
      {
         if(_isPlaying)
         {
            return;
         }
         _isPlaying = true;
         _anchor = param1;
         _trailContainer = new ObjectContainer3D();
         _view3D.scene.addChild(_trailContainer);
         _heatFlag = param2;
         if(_mesh == null)
         {
            _mesh = new Mesh(new Geometry(),_trailMat);
            _mesh.renderLayer = Entity.TOP_LAYER;
            _trailContainer.addChild(_mesh);
         }
      }
      
      public function update() : void
      {
         if(!_isPlaying)
         {
            return;
         }
         var _loc1_:int = getTimer();
         if(_loc1_ - _timestamp < _samplingGap)
         {
            return;
         }
         _timestamp = _loc1_;
         _bPos = _anchor.sceneTransform.transformVector(_rangePosA);
         _ePos = _anchor.sceneTransform.transformVector(_rangePosB);
         samplingMesh();
      }
      
      private function interpolation() : void
      {
         var _loc9_:int = 0;
         var _loc5_:Vector3D = _tempV[0];
         var _loc3_:Vector3D = _tempV[1];
         var _loc2_:Vector3D = _tempV[2];
         var _loc4_:Vector3D = _tempV[3];
         if(_loc5_.nearEquals(_loc2_,10) || _loc3_.nearEquals(_loc4_,10))
         {
            _posV = _tempV.concat();
            _trailMat.alpha = _trailMat.alpha - _fadeOut;
            return;
         }
         _trailMat.alpha = 1;
         var _loc1_:Vector.<Vector3D> = Vector3DUtils.divide(_loc5_,_loc2_,_divide);
         var _loc7_:Vector.<Vector3D> = Vector3DUtils.divide(_loc3_,_loc4_,_divide);
         var _loc6_:Number = Vector3D.distance(_loc5_,_loc3_);
         var _loc8_:int = _divide + 1;
         _loc9_ = 0;
         while(_loc9_ < _loc8_)
         {
            _posV.push(_loc1_[_loc9_]);
            _posV.push(getEndVector3D(_loc1_[_loc9_],_loc7_[_loc9_],_loc6_));
            _loc9_++;
         }
      }
      
      private function getEndVector3D(param1:Vector3D, param2:Vector3D, param3:Number) : Vector3D
      {
         var _loc4_:Vector3D = new Vector3D();
         var _loc5_:Number = Vector3D.distance(param1,param2);
         var _loc6_:Number = Math.asin((param2.z - param1.z) / _loc5_);
         _loc4_.x = param1.x + param3 / Math.cos(_loc6_) / _loc5_ * (param2.x - param1.x);
         _loc4_.y = param1.y + param3 / Math.cos(_loc6_) / _loc5_ * (param2.y - param1.y);
         _loc4_.z = param2.z;
         return _loc4_;
      }
      
      private function samplingMesh() : void
      {
         var _loc9_:int = 0;
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc11_:int = 0;
         var _loc10_:int = 0;
         var _loc3_:* = undefined;
         var _loc8_:* = null;
         var _loc7_:int = 0;
         var _loc2_:* = null;
         var _loc6_:* = undefined;
         var _loc5_:int = 0;
         _tempV.push(_bPos);
         _tempV.push(_ePos);
         _loc9_ = _tempV.length;
         if(_loc9_ >= 4 && _loc9_ % 2 == 0)
         {
            interpolation();
            _tempV.shift();
            _tempV.shift();
         }
         _loc9_ = _posV.length;
         if(_loc9_ > 0)
         {
            _loc1_ = _loc9_ / 2 - 1;
            _loc11_ = 0;
            _loc10_ = 0;
            _loc11_ = 0;
            while(_loc11_ < _loc1_)
            {
               _loc3_ = new Vector.<Number>();
               _loc10_ = 0;
               while(_loc10_ < 4)
               {
                  _loc4_ = _posV[_loc11_ * 2 + _loc10_];
                  _loc3_.push(_loc4_.x,_loc4_.y,_loc4_.z);
                  _loc10_++;
               }
               _trailMat.alpha = 1;
               this.creatSubGeo(_loc3_);
               _loc11_++;
            }
         }
         _loc9_ = _mesh.geometry.subGeometries.length;
         _loc7_ = 0;
         while(_loc7_ < _loc9_)
         {
            _loc8_ = _mesh.geometry.subGeometries[_loc7_] as SubGeometry;
            _loc2_ = [1 - _loc7_ / _fragments,0,1 - _loc7_ / _fragments,1,1 - (_loc7_ + 1) / _fragments,0,1 - (_loc7_ + 1) / _fragments,1];
            _loc6_ = Vector.<Number>(_loc2_);
            _loc8_.updateUVData(_loc6_);
            _loc7_++;
         }
         if(_loc9_ > _fragments)
         {
            _loc5_ = _loc9_ - _fragments;
            while(true)
            {
               _loc5_--;
               if(!_loc5_)
               {
                  break;
               }
               _loc8_ = _mesh.geometry.subGeometries[0] as SubGeometry;
               _mesh.geometry.removeSubGeometry(_loc8_);
               _loc8_.dispose();
            }
         }
         _loc9_ = _posV.length;
         if(_loc9_)
         {
            _tempV[0] = _posV[_loc9_ - 2];
            _tempV[1] = _posV[_loc9_ - 1];
            _posV.length = 0;
         }
         updateMeshs();
      }
      
      private function creatSubGeo(param1:Vector.<Number>) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         _loc3_ = new SubGeometry();
         _loc3_.updateVertexData(param1);
         _loc3_.updateIndexData(Vector.<uint>([0,1,3,0,2,3]));
         _loc2_ = _mesh.geometry;
         _loc2_.addSubGeometry(_loc3_);
         var _loc4_:SubMesh = _mesh.getSubMeshForSubGeometry(_loc3_);
         _loc4_.postEffectData.heatFlag = _heatFlag;
      }
      
      private function updateMeshs() : void
      {
         var _loc2_:* = null;
         if(_offsetU == 0 && _offsetV == 0 && _uvRotation == 0)
         {
            return;
         }
         var _loc1_:int = _mesh.subMeshes.length;
         while(true)
         {
            _loc1_--;
            if(_loc1_ <= -1)
            {
               break;
            }
            _loc2_ = _mesh.subMeshes[_loc1_];
            _loc2_.offsetU = _loc2_.offsetU + _offsetU;
            _loc2_.offsetV = _loc2_.offsetV + _offsetV;
            _loc2_.uvRotation = _loc2_.uvRotation + _uvRotation * 0.0174532925199433;
         }
      }
      
      public function stopTrail() : void
      {
         if(!_isPlaying)
         {
            return;
         }
         _isPlaying = false;
         _mesh.geometry.dispose();
         _mesh.dispose();
         _mesh = null;
      }
      
      public function dispose() : void
      {
         stopTrail();
         _view3D = null;
         _trailMat = null;
         _bPos = null;
         _ePos = null;
         _anchor = null;
         _trailContainer = null;
         _tempV = null;
         _posV = null;
         _rangePosA = null;
         _rangePosB = null;
      }
   }
}
