package org.specter3d.loaders.parsers
{
   import away3d.loaders.parsers.ParserBase;
   import away3d.animators.nodes.SkeletonClipNode;
   import flash.utils.ByteArray;
   import away3d.core.math.Quaternion;
   import away3d.loaders.parsers.utils.ParserUtil;
   import org.specter3d.loaders.AssetLib;
   import away3d.events.AssetEvent;
   import org.specter3d.debug.DevLog;
   import flash.geom.Vector3D;
   import away3d.animators.data.SkeletonPose;
   import away3d.animators.data.JointPose;
   
   public class S3DAnimParsers extends ParserBase
   {
       
      
      private var _baseFrameData:Vector.<BaseFrameData>;
      
      private var _bounds:Vector.<BoundsData>;
      
      private var _clip:SkeletonClipNode;
      
      private var _fileType:String;
      
      private var _frameData:Vector.<FrameData>;
      
      private var _frameRate:uint;
      
      private var _hierarchy:Vector.<HierarchyData>;
      
      private var _input:ByteArray;
      
      private var _numAnimatedComponents:uint;
      
      private var _numFrames:uint;
      
      private var _numJoints:uint;
      
      private var _rotationQuat:Quaternion;
      
      private var _version:int;
      
      public function S3DAnimParsers(param1:Vector3D = null, param2:Number = 0)
      {
         super("binary");
         _rotationQuat = new Quaternion();
         var _loc4_:Quaternion = new Quaternion();
         var _loc3_:Quaternion = new Quaternion();
         _loc4_.fromAxisAngle(Vector3D.X_AXIS,-1.5707963267949);
         _loc3_.fromAxisAngle(Vector3D.Y_AXIS,-1.5707963267949);
         _rotationQuat.multiply(_loc3_,_loc4_);
         if(param1)
         {
            _rotationQuat.multiply(_loc3_,_loc4_);
            _loc4_.fromAxisAngle(param1,param2);
            _rotationQuat.multiply(_loc4_,_rotationQuat);
         }
      }
      
      public static function supportsType(param1:String) : Boolean
      {
         param1 = param1.toLowerCase();
         return param1 == "s3dAnim";
      }
      
      override protected function proceedParsing() : Boolean
      {
         _input = ParserUtil.toByteArray(_data);
         if(AssetLib.checkResourceServer())
         {
            _input.uncompress();
         }
         _input.position = 0;
         _input.endian = "littleEndian";
         fileHeaderHandle();
         readHierarchy();
         readBounds();
         readBaseFrame();
         readFrame();
         _clip = new SkeletonClipNode(_frameRate);
         translateClip();
         finalizeAsset(_clip);
         return true;
      }
      
      private function onWorkerParser(param1:Object) : void
      {
         if(hasEventListener("assetComplete"))
         {
            dispatchEvent(new AssetEvent("assetComplete",param1));
         }
         finishParsing();
         _input.clear();
         _input = null;
      }
      
      private function fileHeaderHandle() : void
      {
         _fileType = readString();
         _version = _input.readUnsignedInt();
         _numFrames = _input.readUnsignedInt();
         _bounds = new Vector.<BoundsData>();
         _frameData = new Vector.<FrameData>();
         _numJoints = _input.readUnsignedInt();
         _hierarchy = new Vector.<HierarchyData>(_numJoints,true);
         _baseFrameData = new Vector.<BaseFrameData>(_numJoints,true);
         _frameRate = _input.readUnsignedInt();
         _numAnimatedComponents = _input.readUnsignedInt();
         if(_frameRate > 30)
         {
            DevLog.error(this.name + " 目前动作为每秒" + _frameRate + "帧, 请调整至每秒30帧以下");
         }
      }
      
      private function readBaseFrame() : void
      {
         var _loc2_:* = 0;
         var _loc1_:* = null;
         _loc2_ = uint(0);
         while(_loc2_ < _numJoints)
         {
            _loc1_ = new BaseFrameData();
            _loc1_.position = readVector3D();
            _loc1_.orientation = readQuaternion();
            _baseFrameData[_loc2_] = _loc1_;
            _loc2_++;
         }
      }
      
      private function readBounds() : void
      {
         var _loc2_:* = 0;
         var _loc1_:* = null;
         _loc2_ = uint(0);
         while(_loc2_ < _numFrames)
         {
            _loc1_ = new BoundsData();
            _loc1_.min = readVector3D();
            _loc1_.max = readVector3D();
            _bounds[_loc2_] = _loc1_;
            _loc2_++;
         }
      }
      
      private function readFrame() : void
      {
         var _loc4_:* = 0;
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc4_ = uint(0);
         while(_loc4_ < _numFrames)
         {
            _loc1_ = new FrameData();
            _loc1_.components = new Vector.<Number>(_numAnimatedComponents,true);
            _loc2_ = 0;
            while(_loc2_ < _numAnimatedComponents)
            {
               _loc1_.components[_loc2_] = _input.readFloat();
               _loc2_++;
            }
            _loc3_++;
            _frameData[_loc3_] = _loc1_;
            _loc4_++;
         }
      }
      
      private function readHierarchy() : void
      {
         var _loc2_:* = 0;
         var _loc1_:* = null;
         _loc2_ = uint(0);
         while(_loc2_ < _numJoints)
         {
            _loc1_ = new HierarchyData();
            _loc1_.name = readString();
            _loc1_.parentIndex = _input.readInt();
            _loc1_.flags = _input.readInt();
            _loc1_.startIndex = _input.readInt();
            _hierarchy[_loc2_] = _loc1_;
            _loc2_++;
         }
      }
      
      private function readQuaternion() : Quaternion
      {
         var _loc1_:Quaternion = new Quaternion();
         _loc1_.x = _input.readFloat();
         _loc1_.y = _input.readFloat();
         _loc1_.z = _input.readFloat();
         var _loc2_:Number = 1 - _loc1_.x * _loc1_.x - _loc1_.y * _loc1_.y - _loc1_.z * _loc1_.z;
         _loc1_.w = _loc2_ < 0?0:Number(-Math.sqrt(_loc2_));
         return _loc1_;
      }
      
      private function readString() : String
      {
         var _loc2_:int = _input.readUnsignedShort();
         var _loc1_:String = _input.readUTFBytes(_loc2_);
         _input.readByte();
         return _loc1_;
      }
      
      private function readVector3D() : Vector3D
      {
         var _loc1_:Vector3D = new Vector3D();
         _loc1_.x = _input.readFloat();
         _loc1_.y = _input.readFloat();
         _loc1_.z = _input.readFloat();
         return _loc1_;
      }
      
      private function translateClip() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _numFrames)
         {
            _clip.addFrame(translatePose(_frameData[_loc1_]),1000 / _frameRate);
            _loc1_++;
         }
      }
      
      private function translatePose(param1:FrameData) : SkeletonPose
      {
         var _loc12_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc11_:Vector3D = new Vector3D();
         var _loc2_:Quaternion = new Quaternion();
         var _loc13_:Vector.<Number> = param1.components;
         var _loc3_:SkeletonPose = new SkeletonPose();
         var _loc6_:Vector.<JointPose> = _loc3_.jointPoses;
         _loc7_ = 0;
         while(_loc7_ < _numJoints)
         {
            _loc5_ = 0;
            _loc9_ = new JointPose();
            _loc12_ = _hierarchy[_loc7_];
            _loc9_.name = _loc12_.name;
            _loc10_ = _baseFrameData[_loc7_];
            _loc4_ = _loc12_.flags;
            _loc11_.x = _loc10_.position.x;
            _loc11_.y = _loc10_.position.y;
            _loc11_.z = _loc10_.position.z;
            _loc2_.x = _loc10_.orientation.x;
            _loc2_.y = _loc10_.orientation.y;
            _loc2_.z = _loc10_.orientation.z;
            if(_loc4_ & 1)
            {
               _loc5_++;
               _loc11_.x = _loc13_[_loc12_.startIndex + _loc5_];
            }
            if(_loc4_ & 2)
            {
               _loc5_++;
               _loc11_.y = _loc13_[_loc12_.startIndex + _loc5_];
            }
            if(_loc4_ & 4)
            {
               _loc5_++;
               _loc11_.z = _loc13_[_loc12_.startIndex + _loc5_];
            }
            if(_loc4_ & 8)
            {
               _loc5_++;
               _loc2_.x = _loc13_[_loc12_.startIndex + _loc5_];
            }
            if(_loc4_ & 16)
            {
               _loc5_++;
               _loc2_.y = _loc13_[_loc12_.startIndex + _loc5_];
            }
            if(_loc4_ & 32)
            {
               _loc5_++;
               _loc2_.z = _loc13_[_loc12_.startIndex + _loc5_];
            }
            _loc8_ = 1 - _loc2_.x * _loc2_.x - _loc2_.y * _loc2_.y - _loc2_.z * _loc2_.z;
            _loc2_.w = _loc8_ < 0?0:Number(-Math.sqrt(_loc8_));
            if(_loc12_.parentIndex < 0)
            {
               _loc9_.orientation.multiply(_rotationQuat,_loc2_);
               _loc9_.translation = _rotationQuat.rotatePoint(_loc11_);
            }
            else
            {
               _loc9_.orientation.copyFrom(_loc2_);
               _loc9_.translation.x = _loc11_.x;
               _loc9_.translation.y = _loc11_.y;
               _loc9_.translation.z = _loc11_.z;
            }
            _loc9_.orientation.y = -_loc9_.orientation.y;
            _loc9_.orientation.z = -_loc9_.orientation.z;
            _loc9_.translation.x = -_loc9_.translation.x;
            _loc6_[_loc7_] = _loc9_;
            _loc7_++;
         }
         return _loc3_;
      }
   }
}

class HierarchyData
{
    
   
   public var flags:int;
   
   public var name:String;
   
   public var parentIndex:int;
   
   public var startIndex:int;
   
   function HierarchyData()
   {
      super();
   }
}

import flash.geom.Vector3D;

class BoundsData
{
    
   
   public var max:Vector3D;
   
   public var min:Vector3D;
   
   function BoundsData()
   {
      super();
   }
}

import away3d.core.math.Quaternion;
import flash.geom.Vector3D;

class BaseFrameData
{
    
   
   public var orientation:Quaternion;
   
   public var position:Vector3D;
   
   function BaseFrameData()
   {
      super();
   }
}

class FrameData
{
    
   
   public var components:Vector.<Number>;
   
   public var index:int;
   
   function FrameData()
   {
      super();
   }
}
