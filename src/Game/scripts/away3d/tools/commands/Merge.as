package away3d.tools.commands
{
   import away3d.entities.Mesh;
   import away3d.containers.ObjectContainer3D;
   import away3d.core.base.Geometry;
   import away3d.tools.utils.GeomUtil;
   import away3d.core.base.ISubGeometry;
   import away3d.materials.MaterialBase;
   
   public class Merge
   {
       
      
      private const LIMIT:uint = 196605;
      
      private var _objectSpace:Boolean;
      
      private var _keepMaterial:Boolean;
      
      private var _disposeSources:Boolean;
      
      private var _geomVOs:Vector.<GeometryVO>;
      
      public function Merge(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false)
      {
         super();
         _keepMaterial = param1;
         _disposeSources = param2;
         _objectSpace = param3;
      }
      
      public function set disposeSources(param1:Boolean) : void
      {
         _disposeSources = param1;
      }
      
      public function get disposeSources() : Boolean
      {
         return _disposeSources;
      }
      
      public function set keepMaterial(param1:Boolean) : void
      {
         _keepMaterial = param1;
      }
      
      public function get keepMaterial() : Boolean
      {
         return _keepMaterial;
      }
      
      public function set objectSpace(param1:Boolean) : void
      {
         _objectSpace = param1;
      }
      
      public function get objectSpace() : Boolean
      {
         return _objectSpace;
      }
      
      public function applyToContainer(param1:ObjectContainer3D, param2:String = "") : Mesh
      {
         var _loc3_:* = null;
         reset();
         _loc3_ = new Mesh(new Geometry(),null);
         _loc3_.position = param1.position;
         parseContainer(param1);
         merge(_loc3_);
         if(param2 != "")
         {
            _loc3_.name = param2;
         }
         return _loc3_;
      }
      
      public function applyToMeshes(param1:Mesh, param2:Vector.<Mesh>) : Mesh
      {
         var _loc3_:* = 0;
         reset();
         _loc3_ = uint(0);
         while(_loc3_ < param2.length)
         {
            collect(param2[_loc3_]);
            _loc3_++;
         }
         merge(param1);
         return param1;
      }
      
      public function apply(param1:Mesh, param2:Mesh) : void
      {
         reset();
         collect(param2);
         merge(param1);
      }
      
      private function reset() : void
      {
         _geomVOs = new Vector.<GeometryVO>();
      }
      
      private function merge(param1:Mesh) : void
      {
         var _loc8_:* = 0;
         var _loc6_:* = 0;
         var _loc5_:* = null;
         var _loc7_:* = false;
         var _loc2_:* = 0;
         var _loc4_:* = null;
         var _loc3_:* = undefined;
         _loc5_ = param1.geometry;
         _loc6_ = uint(param1.subMeshes.length);
         _loc7_ = _geomVOs.length > 0;
         _loc8_ = uint(0);
         while(_loc8_ < _geomVOs.length)
         {
            _loc4_ = _geomVOs[_loc8_];
            _loc3_ = GeomUtil.fromVectors(_loc4_.vertices,_loc4_.indices,_loc4_.uvs,_loc4_.normals,null,null,null);
            _loc2_ = uint(0);
            while(_loc2_ < _loc3_.length)
            {
               _loc5_.addSubGeometry(_loc3_[_loc2_]);
               if(_keepMaterial && _loc7_)
               {
                  param1.subMeshes[_loc6_].material = _loc4_.material;
               }
               _loc6_++;
               _loc2_++;
            }
            _loc8_++;
         }
         if(_keepMaterial && !_loc7_ && _geomVOs.length)
         {
            param1.material = _geomVOs[0].material;
         }
      }
      
      private function collect(param1:Mesh) : void
      {
         var _loc10_:* = 0;
         var _loc14_:* = undefined;
         var _loc11_:* = 0;
         var _loc8_:* = 0;
         var _loc21_:* = 0;
         var _loc2_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc17_:* = 0;
         var _loc22_:* = null;
         var _loc12_:* = null;
         var _loc7_:* = undefined;
         var _loc16_:* = undefined;
         var _loc4_:* = 0;
         var _loc9_:* = 0;
         var _loc15_:* = 0;
         var _loc3_:* = 0;
         var _loc23_:* = 0;
         var _loc13_:* = 0;
         var _loc18_:* = undefined;
         var _loc20_:* = undefined;
         var _loc19_:* = undefined;
         if(param1.geometry)
         {
            _loc14_ = param1.geometry.subGeometries;
            _loc10_ = uint(0);
            while(_loc10_ < _loc14_.length)
            {
               _loc22_ = _loc14_[_loc10_];
               _loc19_ = _loc22_.vertexData;
               _loc15_ = uint(_loc22_.vertexStride);
               _loc13_ = uint(_loc22_.vertexOffset);
               _loc18_ = _loc22_.vertexNormalData;
               _loc4_ = uint(_loc22_.vertexNormalStride);
               _loc3_ = uint(_loc22_.vertexNormalOffset);
               _loc20_ = _loc22_.UVData;
               _loc9_ = uint(_loc22_.UVStride);
               _loc23_ = uint(_loc22_.UVOffset);
               _loc12_ = getSubGeomData(param1.subMeshes[_loc10_].material || param1.material);
               _loc7_ = !!_objectSpace?_loc12_.vertices:new Vector.<Number>();
               _loc16_ = !!_objectSpace?_loc12_.normals:new Vector.<Number>();
               _loc21_ = uint(_loc7_.length);
               _loc2_ = uint(_loc16_.length);
               _loc5_ = uint(_loc12_.uvs.length);
               _loc8_ = uint(_loc22_.numVertices);
               _loc11_ = uint(0);
               while(_loc11_ < _loc8_)
               {
                  _loc7_[_loc21_++] = _loc19_[_loc13_ + _loc11_ * _loc15_ + 0];
                  _loc7_[_loc21_++] = _loc19_[_loc13_ + _loc11_ * _loc15_ + 1];
                  _loc7_[_loc21_++] = _loc19_[_loc13_ + _loc11_ * _loc15_ + 2];
                  _loc16_[_loc2_++] = _loc18_[_loc3_ + _loc11_ * _loc4_ + 0];
                  _loc16_[_loc2_++] = _loc18_[_loc3_ + _loc11_ * _loc4_ + 1];
                  _loc16_[_loc2_++] = _loc18_[_loc3_ + _loc11_ * _loc4_ + 2];
                  _loc12_.uvs[_loc5_++] = _loc20_[_loc23_ + _loc11_ * _loc9_ + 0];
                  _loc12_.uvs[_loc5_++] = _loc20_[_loc23_ + _loc11_ * _loc9_ + 1];
                  _loc11_++;
               }
               _loc17_ = uint(_loc12_.vertices.length / 3);
               _loc6_ = uint(_loc12_.indices.length);
               _loc8_ = uint(_loc22_.numTriangles);
               _loc11_ = uint(0);
               while(_loc11_ < _loc8_)
               {
                  _loc12_.indices[_loc6_++] = _loc22_.indexData[_loc11_ * 3 + 0] + _loc17_;
                  _loc12_.indices[_loc6_++] = _loc22_.indexData[_loc11_ * 3 + 1] + _loc17_;
                  _loc12_.indices[_loc6_++] = _loc22_.indexData[_loc11_ * 3 + 2] + _loc17_;
                  _loc11_++;
               }
               if(!_objectSpace)
               {
                  param1.sceneTransform.transformVectors(_loc7_,_loc7_);
                  param1.sceneTransform.transformVectors(_loc16_,_loc16_);
                  _loc21_ = uint(_loc12_.vertices.length);
                  _loc2_ = uint(_loc12_.normals.length);
                  _loc8_ = uint(_loc7_.length);
                  _loc11_ = uint(0);
                  while(_loc11_ < _loc8_)
                  {
                     _loc12_.vertices[_loc21_++] = _loc7_[_loc11_];
                     _loc12_.normals[_loc2_++] = _loc16_[_loc11_];
                     _loc11_++;
                  }
               }
               _geomVOs.push(_loc12_);
               _loc10_++;
            }
            if(_disposeSources)
            {
               param1.geometry.dispose();
            }
         }
      }
      
      private function getSubGeomData(param1:MaterialBase) : GeometryVO
      {
         var _loc2_:* = null;
         var _loc4_:* = 0;
         var _loc3_:* = 0;
         if(_keepMaterial)
         {
            _loc3_ = uint(_geomVOs.length);
            _loc4_ = uint(0);
            while(_loc4_ < _loc3_)
            {
               if(_geomVOs[_loc4_].material == param1)
               {
                  _loc2_ = _geomVOs[_loc4_];
                  break;
               }
               _loc4_++;
            }
         }
         else if(_geomVOs.length)
         {
            _loc2_ = _geomVOs[0];
         }
         if(!_loc2_)
         {
            _loc2_ = new GeometryVO();
            _loc2_.vertices = new Vector.<Number>();
            _loc2_.normals = new Vector.<Number>();
            _loc2_.uvs = new Vector.<Number>();
            _loc2_.indices = new Vector.<uint>();
            _loc2_.material = param1;
         }
         return _loc2_;
      }
      
      private function parseContainer(param1:ObjectContainer3D) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         if(param1 is Mesh)
         {
            collect(Mesh(param1));
         }
         _loc3_ = uint(0);
         while(_loc3_ < param1.numChildren)
         {
            _loc2_ = param1.getChildAt(_loc3_);
            parseContainer(_loc2_);
            _loc3_++;
         }
      }
   }
}

import away3d.materials.MaterialBase;

class GeometryVO
{
    
   
   public var uvs:Vector.<Number>;
   
   public var vertices:Vector.<Number>;
   
   public var normals:Vector.<Number>;
   
   public var indices:Vector.<uint>;
   
   public var material:MaterialBase;
   
   function GeometryVO()
   {
      super();
   }
}
