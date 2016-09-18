package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import flash.geom.Vector3D;
   import away3d.animators.SkeletonAnimationSet;
   import flash.geom.Matrix3D;
   import away3d.core.base.Geometry;
   import flash.utils.ByteArray;
   import away3d.entities.Mesh;
   import away3d.core.math.Quaternion;
   import away3d.animators.data.Skeleton;
   import away3d.loaders.parsers.utils.ParserUtil;
   import org.specter3d.loaders.AssetLib;
   import away3d.core.base.SkinnedSubGeometry;
   import org.specter3d.context.AppGlobalContext;
   import flash.utils.Dictionary;
   import away3d.animators.data.JointData;
   import away3d.animators.data.SkeletonJoint;
   
   public class S3DMeshParsers extends ParserBase
   {
      
      private static const ROTATION_AXIS:Vector3D = Vector3D.Z_AXIS;
      
      private static var _meshNum:int = 0;
       
      
      private var _animationSet:SkeletonAnimationSet;
      
      private var _bindPoses:Vector.<Matrix3D>;
      
      private var _fileType:String;
      
      private var _geometry:Geometry;
      
      private var _input:ByteArray;
      
      private var _maxJointCount:int;
      
      private var _mesh:Mesh;
      
      private var _meshData:Vector.<InternalMeshData>;
      
      private var _numJoints:int;
      
      private var _numMeshes:int;
      
      private var _rotationQuat:Quaternion;
      
      private var _shaders:Vector.<String>;
      
      private var _skeleton:Skeleton;
      
      private var _version:int;
      
      public function S3DMeshParsers(param1:Vector3D = null, param2:Number = 0)
      {
         var _loc3_:* = null;
         _rotationQuat = new Quaternion();
         _rotationQuat.fromAxisAngle(Vector3D.X_AXIS,-1.5707963267949);
         param1 = ROTATION_AXIS;
         param2 = 3.14159265358979 * 0.5;
         if(param1)
         {
            _loc3_ = new Quaternion();
            _loc3_.fromAxisAngle(param1,param2);
            _rotationQuat.multiply(_rotationQuat,_loc3_);
         }
         super("binary");
      }
      
      public static function supportsType(param1:String) : Boolean
      {
         param1 = param1.toLowerCase();
         return param1 == "s3dmesh";
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _input = ParserUtil.toByteArray(_data);
         if(AssetLib.checkResourceServer())
         {
            _input.uncompress();
         }
         _input.position = 0;
         _input.endian = "littleEndian";
         fileHeaderHandle();
         jointsHandle();
         meshDataHandle();
         calculateMaxJointCount();
         _animationSet = new SkeletonAnimationSet(3);
         _geometry = new Geometry();
         _loc2_ = 0;
         while(_loc2_ < _meshData.length)
         {
            _loc1_ = translateGeom(_meshData[_loc2_].vertexData,_meshData[_loc2_].weightData,_meshData[_loc2_].indices);
            _loc1_.condenseIndexData();
            if(_loc1_.condensedNumJoints > AppGlobalContext.numJoint && _loc1_.jointsPerVertex <= 4)
            {
               splitSkinnedSubGeometry(_loc1_);
               _loc1_.dispose();
               _loc1_ = null;
            }
            else
            {
               _geometry.addSubGeometry(_loc1_);
            }
            _loc2_++;
         }
         _mesh = new Mesh(_geometry,null);
         _mesh.name = "S3DMeshParsers::" + _meshNum;
         finalizeAsset(_mesh);
         finalizeAsset(_skeleton);
         finalizeAsset(_animationSet);
         _animationSet = null;
         _bindPoses = null;
         _fileType = null;
         _geometry = null;
         _input = null;
         _maxJointCount = 0;
         _mesh = null;
         _meshData = null;
         _numJoints = 0;
         _numMeshes = 0;
         _shaders = null;
         _skeleton = null;
         _version = 0;
         return true;
      }
      
      private function splitSkinnedSubGeometry(param1:SkinnedSubGeometry) : void
      {
         var _loc9_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc2_:* = 0;
         var _loc4_:* = null;
         var _loc5_:uint = param1.indexData.length;
         var _loc11_:uint = param1.jointsPerVertex;
         var _loc3_:uint = 0;
         var _loc10_:uint = 0;
         var _loc12_:Dictionary = new Dictionary();
         var _loc13_:Dictionary = new Dictionary();
         var _loc8_:Section = new Section();
         _loc9_ = uint(0);
         while(_loc9_ < _loc5_)
         {
            _loc6_ = uint(0);
            while(_loc6_ < 3)
            {
               _loc2_ = uint(param1.indexData[_loc9_ + _loc6_]);
               if(_loc12_[_loc2_] == undefined)
               {
                  _loc12_[_loc2_] = _loc10_++;
                  _loc8_.Vecties.push(param1.vertexData[_loc2_ * 13],param1.vertexData[_loc2_ * 13 + 1],param1.vertexData[_loc2_ * 13 + 2]);
                  _loc8_.UVs.push(param1.vertexData[_loc2_ * 13 + 9],param1.vertexData[_loc2_ * 13 + 10]);
                  _loc7_ = uint(0);
                  while(_loc7_ < _loc11_)
                  {
                     _loc8_.WeightsData.push(param1.jointWeightsData[_loc2_ * _loc11_ + _loc7_]);
                     _loc8_.JointIndexData.push(param1.jointIndexData[_loc2_ * _loc11_ + _loc7_]);
                     if(_loc13_[param1.jointIndexData[_loc2_ * _loc11_ + _loc7_]] == undefined)
                     {
                        _loc13_[param1.jointIndexData[_loc2_ * _loc11_ + _loc7_]] = _loc3_++;
                     }
                     _loc7_++;
                  }
               }
               _loc8_.IndexData.push(_loc12_[_loc2_]);
               _loc6_++;
            }
            if(_loc3_ > AppGlobalContext.numJoint || _loc9_ + _loc6_ == _loc5_)
            {
               _loc4_ = new SkinnedSubGeometry(param1.jointsPerVertex);
               _loc4_.fromVectors(_loc8_.Vecties,_loc8_.UVs,null,null);
               _loc4_.updateIndexData(_loc8_.IndexData);
               _loc4_.updateJointIndexData(_loc8_.JointIndexData);
               _loc4_.updateJointWeightsData(_loc8_.WeightsData);
               _loc4_.vertexNormalData;
               _loc4_.vertexTangentData;
               _loc4_.autoDeriveVertexTangents = false;
               _loc4_.autoDeriveVertexNormals = false;
               _geometry.addSubGeometry(_loc4_);
               _loc3_ = _loc3_ - AppGlobalContext.numJoint;
               _loc10_ = 0;
               _loc12_ = new Dictionary();
               _loc13_ = new Dictionary();
               _loc8_ = new Section();
            }
            _loc9_ = uint(_loc9_ + 3);
         }
      }
      
      private function calculateMaxJointCount() : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc5_:* = undefined;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         _maxJointCount = 0;
         var _loc8_:int = _meshData.length;
         _loc7_ = 0;
         while(_loc7_ < _loc8_)
         {
            _loc6_ = _meshData[_loc7_];
            _loc5_ = _loc6_.vertexData;
            _loc2_ = _loc5_.length;
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = countZeroWeightJoints(_loc5_[_loc4_],_loc6_.weightData);
               _loc1_ = _loc5_[_loc4_].countWeight - _loc3_;
               if(_loc1_ > _maxJointCount)
               {
                  _maxJointCount = _loc1_;
               }
               _loc4_++;
            }
            _loc7_++;
         }
      }
      
      private final function countZeroWeightJoints(param1:VertexData, param2:Vector.<JointData>) : int
      {
         var _loc3_:Number = NaN;
         var _loc7_:* = 0;
         var _loc5_:int = param1.startWeight;
         var _loc6_:int = param1.startWeight + param1.countWeight;
         var _loc4_:int = 0;
         _loc7_ = _loc5_;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = param2[_loc7_].bias;
            if(_loc3_ == 0)
            {
               _loc4_++;
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      private function fileHeaderHandle() : void
      {
         _fileType = readString();
         if(_fileType != "s3dMesh")
         {
            dieWithError();
            throw new Error("模型解析错误");
         }
         _version = _input.readUnsignedInt();
         _numJoints = _input.readUnsignedInt();
         _bindPoses = new Vector.<Matrix3D>(_numJoints,true);
         _numMeshes = _input.readUnsignedInt();
      }
      
      private function jointsHandle() : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc1_:* = null;
         var _loc4_:* = 0;
         var _loc2_:* = null;
         _skeleton = new Skeleton();
         _loc4_ = uint(0);
         while(_loc4_ < _numJoints)
         {
            _loc3_ = new SkeletonJoint();
            _loc3_.name = readString();
            _loc3_.parentIndex = _input.readInt();
            _loc5_ = readVector3D();
            _loc5_ = _rotationQuat.rotatePoint(_loc5_);
            _loc1_ = readQuaternion();
            _bindPoses[_loc4_] = _loc1_.toMatrix3D();
            _bindPoses[_loc4_].appendTranslation(_loc5_.x,_loc5_.y,_loc5_.z);
            _loc2_ = _bindPoses[_loc4_].clone();
            _loc2_.invert();
            _loc3_.inverseBindPose = _loc2_.rawData;
            _skeleton.joints[_loc4_] = _loc3_;
            _loc4_++;
         }
      }
      
      private function meshDataHandle() : void
      {
         var _loc7_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc8_:int = 0;
         if(!_shaders)
         {
            _shaders = new Vector.<String>();
         }
         _shaders.push(readString());
         var _loc3_:int = _input.readInt();
         _loc7_ = new Vector.<VertexData>(_loc3_,true);
         _loc8_ = 0;
         while(_loc8_ < _loc3_)
         {
            readVertex(_loc7_);
            _loc8_++;
         }
         var _loc4_:int = _input.readInt();
         _loc6_ = new Vector.<uint>(_loc4_ * 3,true);
         _loc8_ = 0;
         while(_loc8_ < _loc4_)
         {
            readTri(_loc6_);
            _loc8_++;
         }
         var _loc1_:int = _input.readInt();
         _loc5_ = new Vector.<JointData>(_loc1_,true);
         _loc8_ = 0;
         while(_loc8_ < _loc1_)
         {
            readJoint(_loc5_);
            _loc8_++;
         }
         if(!_meshData)
         {
            _meshData = new Vector.<InternalMeshData>();
         }
         var _loc2_:uint = _meshData.length;
         _meshData[_loc2_] = new InternalMeshData();
         _meshData[_loc2_].vertexData = _loc7_;
         _meshData[_loc2_].weightData = _loc5_;
         _meshData[_loc2_].indices = _loc6_;
      }
      
      private final function readJoint(param1:Vector.<JointData>) : void
      {
         var _loc2_:JointData = new JointData();
         _loc2_.index = _input.readInt();
         _loc2_.joint = _input.readInt();
         _loc2_.bias = _input.readFloat();
         _loc2_.pos = readVector3D();
         param1[_loc2_.index] = _loc2_;
      }
      
      private function readQuaternion() : Quaternion
      {
         var _loc1_:Quaternion = new Quaternion();
         _loc1_.x = _input.readFloat();
         _loc1_.y = -_input.readFloat();
         _loc1_.z = -_input.readFloat();
         var _loc2_:Number = 1 - _loc1_.x * _loc1_.x - _loc1_.y * _loc1_.y - _loc1_.z * _loc1_.z;
         _loc1_.w = _loc2_ < 0?0:Number(-Math.sqrt(_loc2_));
         var _loc3_:Quaternion = new Quaternion();
         _loc3_.multiply(_rotationQuat,_loc1_);
         return _loc3_;
      }
      
      private function readString() : String
      {
         var _loc2_:int = _input.readUnsignedShort();
         var _loc1_:String = _input.readUTFBytes(_loc2_);
         _input.readByte();
         return _loc1_;
      }
      
      private final function readTri(param1:Vector.<uint>) : void
      {
         var _loc2_:int = _input.readInt() * 3;
         param1[_loc2_] = _input.readInt();
         param1[_loc2_ + 1] = _input.readInt();
         param1[_loc2_ + 2] = _input.readInt();
      }
      
      private final function readUV(param1:VertexData) : void
      {
         param1.s = _input.readFloat();
         param1.t = _input.readFloat();
      }
      
      private final function readVector3D() : Vector3D
      {
         var _loc1_:Vector3D = new Vector3D();
         _loc1_.x = -_input.readFloat();
         _loc1_.y = _input.readFloat();
         _loc1_.z = _input.readFloat();
         return _loc1_;
      }
      
      private final function readVertex(param1:Vector.<VertexData>) : void
      {
         var _loc2_:VertexData = new VertexData();
         _loc2_.index = _input.readInt();
         readUV(_loc2_);
         _loc2_.startWeight = _input.readInt();
         _loc2_.countWeight = _input.readInt();
         param1[_loc2_.index] = _loc2_;
      }
      
      private function translateGeom(param1:Vector.<VertexData>, param2:Vector.<JointData>, param3:Vector.<uint>) : SkinnedSubGeometry
      {
         var _loc9_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:* = 0;
         var _loc17_:* = null;
         var _loc6_:* = null;
         var _loc14_:* = null;
         var _loc16_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc15_:int = 0;
         var _loc13_:* = 0;
         var _loc12_:int = param1.length;
         var _loc19_:SkinnedSubGeometry = new SkinnedSubGeometry(_maxJointCount);
         var _loc20_:Vector.<Number> = new Vector.<Number>(_loc12_ * 2,true);
         var _loc8_:Vector.<Number> = new Vector.<Number>(_loc12_ * 3,true);
         var _loc18_:Vector.<Number> = new Vector.<Number>(_loc12_ * _maxJointCount,true);
         var _loc5_:Vector.<Number> = new Vector.<Number>(_loc12_ * _maxJointCount,true);
         _loc15_ = 0;
         while(_loc15_ < _loc12_)
         {
            _loc17_ = param1[_loc15_];
            _loc4_ = int(_loc17_.index * 3);
            _loc9_ = _loc4_ + 1;
            _loc7_ = _loc4_ + 2;
            var _loc21_:* = 0;
            _loc8_[_loc7_] = _loc21_;
            _loc21_ = _loc21_;
            _loc8_[_loc9_] = _loc21_;
            _loc8_[_loc4_] = _loc21_;
            _loc11_ = 0;
            _loc13_ = 0;
            while(_loc13_ < _loc17_.countWeight)
            {
               _loc6_ = param2[_loc17_.startWeight + _loc13_];
               if(_loc6_.bias > 0)
               {
                  _loc14_ = _bindPoses[_loc6_.joint];
                  _loc16_ = _loc14_.transformVector(_loc6_.pos);
                  _loc21_ = _loc4_;
                  var _loc22_:* = _loc8_[_loc21_] + _loc16_.x * _loc6_.bias;
                  _loc8_[_loc21_] = _loc22_;
                  _loc22_ = _loc9_;
                  _loc21_ = _loc8_[_loc22_] + _loc16_.y * _loc6_.bias;
                  _loc8_[_loc22_] = _loc21_;
                  _loc21_ = _loc7_;
                  _loc22_ = _loc8_[_loc21_] + _loc16_.z * _loc6_.bias;
                  _loc8_[_loc21_] = _loc22_;
                  _loc18_[_loc10_] = _loc6_.joint * 3;
                  _loc10_++;
                  _loc5_[_loc10_] = _loc6_.bias;
                  _loc11_++;
               }
               _loc13_++;
            }
            _loc13_ = _loc11_;
            while(_loc13_ < _maxJointCount)
            {
               _loc18_[_loc10_] = 0;
               _loc10_++;
               _loc5_[_loc10_] = 0;
               _loc13_++;
            }
            _loc4_ = _loc17_.index << 1;
            _loc4_++;
            _loc20_[_loc4_] = _loc17_.s;
            _loc20_[_loc4_] = _loc17_.t;
            _loc15_++;
         }
         _loc19_.updateIndexData(param3);
         _loc19_.fromVectors(_loc8_,_loc20_,null,null);
         _loc19_.vertexNormalData;
         _loc19_.vertexTangentData;
         _loc19_.autoDeriveVertexTangents = false;
         _loc19_.autoDeriveVertexNormals = false;
         _loc19_.updateJointIndexData(_loc18_);
         _loc19_.updateJointWeightsData(_loc5_);
         return _loc19_;
      }
   }
}

class VertexData
{
    
   
   public var countWeight:int;
   
   public var index:int;
   
   public var s:Number;
   
   public var startWeight:int;
   
   public var t:Number;
   
   function VertexData()
   {
      super();
   }
}

import away3d.animators.data.JointData;

class InternalMeshData
{
    
   
   public var indices:Vector.<uint>;
   
   public var vertexData:Vector.<VertexData>;
   
   public var weightData:Vector.<JointData>;
   
   function InternalMeshData()
   {
      super();
   }
}

class Section
{
    
   
   public var Vecties:Vector.<Number>;
   
   public var UVs:Vector.<Number>;
   
   public var IndexData:Vector.<uint>;
   
   public var WeightsData:Vector.<Number>;
   
   public var JointIndexData:Vector.<Number>;
   
   function Section()
   {
      Vecties = new Vector.<Number>();
      UVs = new Vector.<Number>();
      IndexData = new Vector.<uint>();
      WeightsData = new Vector.<Number>();
      JointIndexData = new Vector.<Number>();
      super();
   }
}
