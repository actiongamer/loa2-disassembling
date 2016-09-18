package away3d.tools.helpers
{
   import away3d.entities.Mesh;
   import away3d.core.base.Object3D;
   import away3d.tools.utils.Bounds;
   import away3d.containers.ObjectContainer3D;
   import away3d.core.base.Geometry;
   import away3d.core.base.ISubGeometry;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import away3d.core.base.SubGeometry;
   import away3d.materials.MaterialBase;
   import away3d.materials.utils.DefaultMaterialManager;
   import flash.utils.Dictionary;
   import away3d.core.base.data.UV;
   import away3d.core.base.data.Vertex;
   
   public class MeshHelper
   {
      
      private static const LIMIT:uint = 196605;
       
      
      public function MeshHelper()
      {
         super();
      }
      
      public static function boundingRadius(param1:Mesh) : Number
      {
         var _loc2_:Number = NaN;
         try
         {
            _loc2_ = Math.max((param1.maxX - param1.minX) * Object3D(param1).scaleX,(param1.maxY - param1.minY) * Object3D(param1).scaleY,(param1.maxZ - param1.minZ) * Object3D(param1).scaleZ);
         }
         catch(e:Error)
         {
            Bounds.getMeshBounds(param1);
            _loc2_ = Math.max((Bounds.maxX - Bounds.minX) * Object3D(param1).scaleX,(Bounds.maxY - Bounds.minY) * Object3D(param1).scaleY,(Bounds.maxZ - Bounds.minZ) * Object3D(param1).scaleZ);
         }
         return _loc2_ * 0.5;
      }
      
      public static function boundingRadiusContainer(param1:ObjectContainer3D) : Number
      {
         Bounds.getObjectContainerBounds(param1);
         var _loc2_:Number = Math.max((Bounds.maxX - Bounds.minX) * Object3D(param1).scaleX,(Bounds.maxY - Bounds.minY) * Object3D(param1).scaleY,(Bounds.maxZ - Bounds.minZ) * Object3D(param1).scaleZ);
         return _loc2_ * 0.5;
      }
      
      public static function recenter(param1:Mesh, param2:Boolean = true) : void
      {
         Bounds.getMeshBounds(param1);
         var _loc3_:Number = (Bounds.minX + Bounds.maxX) * 0.5;
         var _loc4_:Number = (Bounds.minY + Bounds.maxY) * 0.5;
         var _loc5_:Number = (Bounds.minZ + Bounds.maxZ) * 0.5;
         applyPosition(param1,-_loc3_,-_loc4_,-_loc5_);
         if(param2)
         {
            param1.x = param1.x - _loc3_;
            param1.y = param1.y - _loc4_;
            param1.z = param1.z - _loc5_;
         }
      }
      
      public static function recenterContainer(param1:ObjectContainer3D, param2:Boolean = true) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = 0;
         if(param1 is Mesh && ObjectContainer3D(param1).numChildren == 0)
         {
            recenter(Mesh(param1),param2);
         }
         _loc4_ = uint(0);
         while(_loc4_ < ObjectContainer3D(param1).numChildren)
         {
            _loc3_ = ObjectContainer3D(param1).getChildAt(_loc4_);
            recenterContainer(_loc3_,param2);
            _loc4_++;
         }
      }
      
      public static function applyRotations(param1:Mesh) : void
      {
         var _loc6_:* = undefined;
         var _loc12_:* = undefined;
         var _loc4_:* = 0;
         var _loc7_:* = 0;
         var _loc9_:* = 0;
         var _loc2_:* = 0;
         var _loc15_:* = null;
         var _loc8_:* = false;
         var _loc10_:* = 0;
         var _loc11_:Geometry = param1.geometry;
         var _loc5_:Vector.<ISubGeometry> = _loc11_.subGeometries;
         var _loc14_:int = _loc5_.length;
         var _loc13_:Matrix3D = param1.transform;
         var _loc3_:Vector3D = new Vector3D();
         _loc10_ = uint(0);
         while(_loc10_ < _loc14_)
         {
            _loc15_ = SubGeometry(_loc5_[_loc10_]);
            _loc6_ = _loc15_.vertexData;
            _loc12_ = _loc15_.vertexNormalData;
            _loc4_ = uint(_loc6_.length);
            _loc8_ = _loc12_.length == _loc4_;
            _loc7_ = uint(0);
            while(_loc7_ < _loc4_)
            {
               _loc3_.x = _loc6_[_loc7_];
               _loc9_ = uint(_loc7_ + 1);
               _loc3_.y = _loc6_[_loc7_ + 1];
               _loc2_ = uint(_loc7_ + 2);
               _loc3_.z = _loc6_[_loc7_ + 2];
               _loc3_ = _loc13_.deltaTransformVector(_loc3_);
               _loc6_[_loc7_] = _loc3_.x;
               _loc6_[_loc9_] = _loc3_.y;
               _loc6_[_loc2_] = _loc3_.z;
               if(_loc8_)
               {
                  _loc3_.x = _loc12_[_loc7_];
                  _loc3_.y = _loc12_[_loc9_];
                  _loc3_.z = _loc12_[_loc2_];
                  _loc3_ = _loc13_.deltaTransformVector(_loc3_);
                  _loc12_[_loc7_] = _loc3_.x;
                  _loc12_[_loc9_] = _loc3_.y;
                  _loc12_[_loc2_] = _loc3_.z;
               }
               _loc7_ = uint(_loc7_ + 3);
            }
            _loc15_.updateVertexData(_loc6_);
            if(_loc8_)
            {
               _loc15_.updateVertexNormalData(_loc12_);
            }
            _loc10_++;
         }
         var _loc16_:* = 0;
         param1.rotationZ = _loc16_;
         _loc16_ = _loc16_;
         param1.rotationY = _loc16_;
         param1.rotationX = _loc16_;
      }
      
      public static function applyRotationsContainer(param1:ObjectContainer3D) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         if(param1 is Mesh && ObjectContainer3D(param1).numChildren == 0)
         {
            applyRotations(Mesh(param1));
         }
         _loc3_ = uint(0);
         while(_loc3_ < ObjectContainer3D(param1).numChildren)
         {
            _loc2_ = ObjectContainer3D(param1).getChildAt(_loc3_);
            applyRotationsContainer(_loc2_);
            _loc3_++;
         }
      }
      
      public static function applyScales(param1:Mesh, param2:Number, param3:Number, param4:Number, param5:ObjectContainer3D = null) : void
      {
         var _loc7_:* = undefined;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc8_:* = null;
         var _loc12_:* = 0;
         if(param2 == 1 && param3 == 1 && param4 == 1)
         {
            return;
         }
         if(param1.animator)
         {
            param1.scaleX = param2;
            param1.scaleY = param3;
            param1.scaleZ = param4;
            return;
         }
         var _loc6_:Vector.<ISubGeometry> = param1.geometry.subGeometries;
         var _loc9_:int = _loc6_.length;
         _loc12_ = uint(0);
         while(_loc12_ < _loc9_)
         {
            _loc8_ = SubGeometry(_loc6_[_loc12_]);
            _loc7_ = _loc8_.vertexData;
            _loc10_ = uint(_loc7_.length);
            _loc11_ = uint(0);
            while(_loc11_ < _loc10_)
            {
               var _loc13_:* = _loc11_;
               var _loc14_:* = _loc7_[_loc13_] * param2;
               _loc7_[_loc13_] = _loc14_;
               _loc14_ = _loc11_ + 1;
               _loc13_ = _loc7_[_loc14_] * param3;
               _loc7_[_loc14_] = _loc13_;
               _loc13_ = _loc11_ + 2;
               _loc14_ = _loc7_[_loc13_] * param4;
               _loc7_[_loc13_] = _loc14_;
               _loc11_ = uint(_loc11_ + 3);
            }
            _loc8_.updateVertexData(_loc7_);
            _loc12_++;
         }
         _loc14_ = 1;
         param1.scaleZ = _loc14_;
         _loc13_ = _loc14_;
         param1.scaleY = _loc13_;
         param1.scaleX = _loc13_;
         if(param5)
         {
            param1.x = param1.x * param2;
            param1.y = param1.y * param3;
            param1.z = param1.z * param4;
         }
      }
      
      public static function applyScalesContainer(param1:ObjectContainer3D, param2:Number, param3:Number, param4:Number, param5:ObjectContainer3D = null) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = 0;
         if(param1 is Mesh && ObjectContainer3D(param1).numChildren == 0)
         {
            applyScales(Mesh(param1),param2,param3,param4,param1);
         }
         _loc7_ = uint(0);
         while(_loc7_ < ObjectContainer3D(param1).numChildren)
         {
            _loc6_ = ObjectContainer3D(param1).getChildAt(_loc7_);
            applyScalesContainer(_loc6_,param2,param3,param4,param1);
            _loc7_++;
         }
      }
      
      public static function applyPosition(param1:Mesh, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc7_:* = undefined;
         var _loc5_:* = 0;
         var _loc10_:* = 0;
         var _loc8_:* = null;
         var _loc11_:* = 0;
         var _loc12_:Geometry = param1.geometry;
         var _loc6_:Vector.<ISubGeometry> = _loc12_.subGeometries;
         var _loc9_:int = _loc6_.length;
         _loc11_ = uint(0);
         while(_loc11_ < _loc9_)
         {
            _loc8_ = SubGeometry(_loc6_[_loc11_]);
            _loc7_ = _loc8_.vertexData;
            _loc5_ = uint(_loc7_.length);
            _loc10_ = uint(0);
            while(_loc10_ < _loc5_)
            {
               var _loc13_:* = _loc10_;
               var _loc14_:* = _loc7_[_loc13_] + param2;
               _loc7_[_loc13_] = _loc14_;
               _loc14_ = _loc10_ + 1;
               _loc13_ = _loc7_[_loc14_] + param3;
               _loc7_[_loc14_] = _loc13_;
               _loc13_ = _loc10_ + 2;
               _loc14_ = _loc7_[_loc13_] + param4;
               _loc7_[_loc13_] = _loc14_;
               _loc10_ = uint(_loc10_ + 3);
            }
            _loc8_.updateVertexData(_loc7_);
            _loc11_++;
         }
         param1.x = param1.x - param2;
         param1.y = param1.y - param3;
         param1.z = param1.z - param4;
      }
      
      public static function clone(param1:Mesh, param2:String = "") : Mesh
      {
         var _loc4_:Geometry = param1.geometry.clone();
         var _loc3_:Mesh = new Mesh(_loc4_,param1.material);
         _loc3_.name = param2;
         return _loc3_;
      }
      
      public static function invertFacesInContainer(param1:ObjectContainer3D) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         if(param1 is Mesh && ObjectContainer3D(param1).numChildren == 0)
         {
            invertFaces(Mesh(param1));
         }
         _loc3_ = uint(0);
         while(_loc3_ < ObjectContainer3D(param1).numChildren)
         {
            _loc2_ = ObjectContainer3D(param1).getChildAt(_loc3_);
            invertFacesInContainer(_loc2_);
            _loc3_++;
         }
      }
      
      public static function invertFaces(param1:Mesh, param2:Boolean = false) : void
      {
         var _loc10_:* = undefined;
         var _loc7_:* = undefined;
         var _loc13_:* = undefined;
         var _loc3_:* = undefined;
         var _loc5_:* = 0;
         var _loc4_:* = 0;
         var _loc9_:* = 0;
         var _loc8_:* = 0;
         var _loc12_:* = null;
         var _loc6_:Vector.<ISubGeometry> = param1.geometry.subGeometries;
         var _loc11_:uint = _loc6_.length;
         _loc5_ = uint(0);
         while(_loc5_ < _loc11_)
         {
            _loc12_ = SubGeometry(_loc6_[_loc5_]);
            _loc10_ = _loc12_.indexData;
            _loc7_ = _loc12_.vertexNormalData;
            _loc3_ = _loc12_.vertexTangentData;
            _loc4_ = uint(0);
            while(_loc4_ < _loc10_.length)
            {
               _loc8_ = uint(_loc10_[_loc4_]);
               _loc9_ = uint(_loc4_ + 1);
               _loc10_[_loc4_] = _loc10_[_loc4_ + 1];
               _loc10_[_loc9_] = _loc8_;
               _loc4_ = uint(_loc4_ + 3);
            }
            _loc4_ = uint(0);
            while(_loc4_ < _loc7_.length)
            {
               _loc7_[_loc4_] = _loc7_[_loc4_] * -1;
               _loc3_[_loc4_] = _loc3_[_loc4_] * -1;
               _loc4_++;
            }
            _loc12_.updateIndexData(_loc10_);
            _loc12_.updateVertexNormalData(_loc7_);
            _loc12_.updateVertexTangentData(_loc3_);
            if(param2)
            {
               _loc13_ = _loc12_.UVData;
               _loc4_ = uint(0);
               while(_loc4_ < _loc13_.length)
               {
                  _loc13_[_loc4_] = 1 - _loc13_[_loc4_];
                  _loc4_++;
                  _loc4_++;
               }
               _loc12_.updateUVData(_loc13_);
            }
            _loc5_++;
         }
      }
      
      public static function build(param1:Vector.<Number>, param2:Vector.<uint>, param3:Vector.<Number> = null, param4:String = "", param5:MaterialBase = null, param6:Boolean = true, param7:Boolean = true) : Mesh
      {
         var _loc23_:* = null;
         var _loc20_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = 0;
         var _loc9_:* = 0;
         var _loc17_:* = 0;
         var _loc12_:* = 0;
         var _loc11_:int = 0;
         var _loc22_:SubGeometry = new SubGeometry();
         _loc22_.autoDeriveVertexNormals = true;
         _loc22_.autoDeriveVertexTangents = true;
         var _loc13_:Geometry = new Geometry();
         _loc13_.addSubGeometry(_loc22_);
         param5 = !param5 && param7?DefaultMaterialManager.getDefaultMaterial():param5;
         var _loc10_:Mesh = new Mesh(_loc13_,param5);
         if(param4 != "")
         {
            _loc10_.name = param4;
         }
         var _loc24_:Vector.<Number> = new Vector.<Number>();
         var _loc14_:Vector.<Number> = new Vector.<Number>();
         var _loc8_:Vector.<uint> = new Vector.<uint>();
         var _loc18_:Vector.<Number> = Vector.<Number>([0,1,0.5,0,1,1,0.5,0]);
         var _loc21_:uint = 0;
         if(param6)
         {
            _loc23_ = new Dictionary();
            _loc20_ = new UV();
         }
         var _loc19_:Vertex = new Vertex();
         _loc12_ = uint(0);
         for(; _loc12_ < param2.length; _loc12_++)
         {
            _loc17_ = uint(param2[_loc12_] * 3);
            _loc19_.x = param1[_loc17_];
            _loc19_.y = param1[_loc17_ + 1];
            _loc19_.z = param1[_loc17_ + 2];
            if(_loc24_.length == 196605)
            {
               _loc22_.updateVertexData(_loc24_);
               _loc22_.updateIndexData(_loc8_);
               _loc22_.updateUVData(_loc14_);
               if(param6)
               {
                  _loc23_ = null;
                  _loc23_ = new Dictionary();
               }
               _loc22_ = new SubGeometry();
               _loc22_.autoDeriveVertexNormals = true;
               _loc22_.autoDeriveVertexTangents = true;
               _loc13_.addSubGeometry(_loc22_);
               _loc21_ = 0;
               _loc24_ = new Vector.<Number>();
               _loc8_ = new Vector.<uint>();
               _loc14_ = new Vector.<Number>();
            }
            _loc9_ = uint(_loc24_.length / 3);
            _loc16_ = uint(param2[_loc12_] * 2);
            if(param6)
            {
               _loc20_.u = param3[_loc16_];
               _loc20_.v = param3[_loc16_ + 1];
               _loc15_ = _loc19_.toString() + _loc20_.toString();
               if(_loc23_[_loc15_])
               {
                  _loc8_[_loc8_.length] = _loc23_[_loc15_];
                  continue;
               }
               _loc23_[_loc15_] = _loc9_;
            }
            _loc8_[_loc8_.length] = _loc9_;
            _loc24_.push(_loc19_.x,_loc19_.y,_loc19_.z);
            if(!param3 || _loc16_ > param3.length - 2)
            {
               _loc14_.push(_loc18_[_loc21_],_loc18_[_loc21_ + 1]);
               if(_loc21_ + 2 > 3)
               {
                  §§push(0);
               }
               else
               {
                  _loc21_ = _loc21_ + 2;
                  §§push(_loc21_ + 2);
               }
               _loc21_ = §§pop();
            }
            else
            {
               _loc14_.push(param3[_loc16_],param3[_loc16_ + 1]);
            }
         }
         if(param6)
         {
            _loc23_ = null;
         }
         _loc22_.updateVertexData(_loc24_);
         _loc22_.updateIndexData(_loc8_);
         _loc22_.updateUVData(_loc14_);
         return _loc10_;
      }
      
      public static function splitMesh(param1:Mesh, param2:Boolean = false) : Vector.<Mesh>
      {
         var _loc5_:* = undefined;
         var _loc13_:* = undefined;
         var _loc16_:* = undefined;
         var _loc11_:* = undefined;
         var _loc6_:* = undefined;
         var _loc15_:* = null;
         var _loc7_:* = null;
         var _loc10_:* = null;
         var _loc17_:* = null;
         var _loc12_:* = null;
         var _loc9_:* = 0;
         var _loc3_:Vector.<Mesh> = new Vector.<Mesh>();
         var _loc4_:Vector.<ISubGeometry> = param1.geometry.subGeometries;
         var _loc14_:uint = _loc4_.length;
         if(_loc14_ == 1)
         {
            _loc3_.push(param1);
            return _loc3_;
         }
         var _loc8_:uint = 0;
         _loc9_ = uint(0);
         while(_loc9_ < _loc14_)
         {
            _loc15_ = SubGeometry(_loc4_[_loc9_]);
            _loc5_ = _loc15_.vertexData;
            _loc13_ = _loc15_.indexData;
            _loc16_ = _loc15_.UVData;
            try
            {
               _loc11_ = _loc15_.vertexNormalData;
               _loc15_.autoDeriveVertexNormals = false;
            }
            catch(e:Error)
            {
               _loc15_.autoDeriveVertexNormals = true;
               _loc11_ = new Vector.<Number>();
               _loc8_ = 0;
               while(_loc8_ < _loc5_.length)
               {
                  _loc11_[_loc8_++] = 0;
               }
            }
            try
            {
               _loc6_ = _loc15_.vertexTangentData;
               _loc15_.autoDeriveVertexTangents = false;
            }
            catch(e:Error)
            {
               _loc15_.autoDeriveVertexTangents = true;
               _loc6_ = new Vector.<Number>();
               _loc8_ = 0;
               while(_loc8_ < _loc5_.length)
               {
                  _loc6_[_loc8_++] = 0;
               }
            }
            _loc5_.fixed = false;
            _loc13_.fixed = false;
            _loc16_.fixed = false;
            _loc11_.fixed = false;
            _loc6_.fixed = false;
            _loc7_ = new Geometry();
            _loc17_ = new Mesh(_loc7_,!!param1.subMeshes[_loc9_].material?param1.subMeshes[_loc9_].material:_loc12_);
            _loc10_ = new SubGeometry();
            _loc10_.updateVertexData(_loc5_);
            _loc10_.updateIndexData(_loc13_);
            _loc10_.updateUVData(_loc16_);
            _loc10_.updateVertexNormalData(_loc11_);
            _loc10_.updateVertexTangentData(_loc6_);
            _loc7_.addSubGeometry(_loc10_);
            _loc3_.push(_loc17_);
            _loc9_++;
         }
         if(param2)
         {
            param1 = null;
         }
         return _loc3_;
      }
   }
}
