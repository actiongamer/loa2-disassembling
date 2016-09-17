package away3d.loaders.parsers
{
   import away3d.entities.Mesh;
   import flash.geom.Matrix3D;
   import away3d.core.base.Geometry;
   import away3d.animators.data.Skeleton;
   import away3d.animators.SkeletonAnimationSet;
   import away3d.core.math.Quaternion;
   import away3d.animators.data.SkeletonJoint;
   import flash.geom.Vector3D;
   import away3d.core.base.SkinnedSubGeometry;
   
   public class MD5MeshParser extends ParserBase
   {
      
      private static const VERSION_TOKEN:String = "MD5Version";
      
      private static const COMMAND_LINE_TOKEN:String = "commandline";
      
      private static const NUM_JOINTS_TOKEN:String = "numJoints";
      
      private static const NUM_MESHES_TOKEN:String = "numMeshes";
      
      private static const COMMENT_TOKEN:String = "//";
      
      private static const JOINTS_TOKEN:String = "joints";
      
      private static const MESH_TOKEN:String = "mesh";
      
      private static const MESH_SHADER_TOKEN:String = "shader";
      
      private static const MESH_NUM_VERTS_TOKEN:String = "numverts";
      
      private static const MESH_VERT_TOKEN:String = "vert";
      
      private static const MESH_NUM_TRIS_TOKEN:String = "numtris";
      
      private static const MESH_TRI_TOKEN:String = "tri";
      
      private static const MESH_NUM_WEIGHTS_TOKEN:String = "numweights";
      
      private static const MESH_WEIGHT_TOKEN:String = "weight";
       
      
      private var _textData:String;
      
      private var _startedParsing:Boolean;
      
      private var _parseIndex:int;
      
      private var _reachedEOF:Boolean;
      
      private var _line:int;
      
      private var _charLineIndex:int;
      
      private var _version:int;
      
      private var _numJoints:int;
      
      private var _numMeshes:int;
      
      private var _mesh:Mesh;
      
      private var _shaders:Vector.<String>;
      
      private var _maxJointCount:int;
      
      private var _meshData:Vector.<MeshData>;
      
      private var _bindPoses:Vector.<Matrix3D>;
      
      private var _geometry:Geometry;
      
      private var _skeleton:Skeleton;
      
      private var _animationSet:SkeletonAnimationSet;
      
      private var _rotationQuat:Quaternion;
      
      public function MD5MeshParser(param1:Vector3D = null, param2:Number = 0)
      {
         var _loc3_:* = null;
         super("plainText");
         _rotationQuat = new Quaternion();
         _rotationQuat.fromAxisAngle(Vector3D.X_AXIS,-1.5707963267949);
         if(param1)
         {
            _loc3_ = new Quaternion();
            _loc3_.fromAxisAngle(param1,param2);
            _rotationQuat.multiply(_rotationQuat,_loc3_);
         }
      }
      
      public static function supportsType(param1:String) : Boolean
      {
         param1 = param1.toLowerCase();
         return param1 == "md5mesh";
      }
      
      public static function supportsData(param1:*) : Boolean
      {
         return false;
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(!_startedParsing)
         {
            _textData = getTextData();
            _startedParsing = true;
         }
         while(hasTime())
         {
            _loc1_ = getNextToken();
            var _loc3_:* = _loc1_;
            if("//" !== _loc3_)
            {
               if("MD5Version" !== _loc3_)
               {
                  if("commandline" !== _loc3_)
                  {
                     if("numJoints" !== _loc3_)
                     {
                        if("numMeshes" !== _loc3_)
                        {
                           if("joints" !== _loc3_)
                           {
                              if("mesh" !== _loc3_)
                              {
                                 if(!_reachedEOF)
                                 {
                                    sendUnknownKeywordError();
                                 }
                              }
                              else
                              {
                                 parseMesh();
                              }
                           }
                           else
                           {
                              parseJoints();
                           }
                        }
                        else
                        {
                           _numMeshes = getNextInt();
                        }
                     }
                     else
                     {
                        _numJoints = getNextInt();
                        _bindPoses = new Vector.<Matrix3D>(_numJoints,true);
                     }
                  }
                  else
                  {
                     parseCMD();
                  }
               }
               else
               {
                  _version = getNextInt();
                  if(_version != 10)
                  {
                     throw new Error("Unknown version number encountered!");
                  }
               }
            }
            else
            {
               ignoreLine();
            }
            if(_reachedEOF)
            {
               calculateMaxJointCount();
               _animationSet = new SkeletonAnimationSet(_maxJointCount);
               _mesh = new Mesh(new Geometry(),null);
               _geometry = _mesh.geometry;
               _loc2_ = 0;
               while(_loc2_ < _meshData.length)
               {
                  _geometry.addSubGeometry(translateGeom(_meshData[_loc2_].vertexData,_meshData[_loc2_].weightData,_meshData[_loc2_].indices));
                  _loc2_++;
               }
               finalizeAsset(_mesh);
               finalizeAsset(_skeleton);
               finalizeAsset(_animationSet);
               return true;
            }
         }
         return false;
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
      
      private function countZeroWeightJoints(param1:VertexData, param2:Vector.<JointData>) : int
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
      
      private function parseJoints() : void
      {
         var _loc5_:* = null;
         var _loc1_:* = null;
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc3_:String = getNextToken();
         if(_loc3_ != "{")
         {
            sendUnknownKeywordError();
         }
         _skeleton = new Skeleton();
         do
         {
            if(_reachedEOF)
            {
               sendEOFError();
            }
            _loc1_ = new SkeletonJoint();
            _loc1_.name = parseLiteralString();
            _loc1_.parentIndex = getNextInt();
            _loc7_ = parseVector3D();
            _loc7_ = _rotationQuat.rotatePoint(_loc7_);
            _loc2_ = parseQuaternion();
            _bindPoses[_loc6_] = _loc2_.toMatrix3D();
            _bindPoses[_loc6_].appendTranslation(_loc7_.x,_loc7_.y,_loc7_.z);
            _loc4_ = _bindPoses[_loc6_].clone();
            _loc4_.invert();
            _loc1_.inverseBindPose = _loc4_.rawData;
            _loc6_++;
            _skeleton.joints[_loc6_] = _loc1_;
            _loc5_ = getNextChar();
            if(_loc5_ == "/")
            {
               putBack();
               _loc5_ = getNextToken();
               if(_loc5_ == "//")
               {
                  ignoreLine();
               }
               _loc5_ = getNextChar();
            }
            if(_loc5_ != "}")
            {
               putBack();
            }
         }
         while(_loc5_ != "}");
         
      }
      
      private function putBack() : void
      {
         _parseIndex = Number(_parseIndex) - 1;
         _charLineIndex = Number(_charLineIndex) - 1;
         _reachedEOF = _parseIndex >= _textData.length;
      }
      
      private function parseMesh() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = undefined;
         var _loc1_:* = undefined;
         var _loc3_:* = undefined;
         var _loc2_:String = getNextToken();
         if(_loc2_ != "{")
         {
            sendUnknownKeywordError();
         }
         if(!_shaders)
         {
            _shaders = new Vector.<String>();
         }
         while(_loc4_ != "}")
         {
            _loc4_ = getNextToken();
            var _loc7_:* = _loc4_;
            if("//" !== _loc7_)
            {
               if("shader" !== _loc7_)
               {
                  if("numverts" !== _loc7_)
                  {
                     if("numtris" !== _loc7_)
                     {
                        if("numweights" !== _loc7_)
                        {
                           if("vert" !== _loc7_)
                           {
                              if("tri" !== _loc7_)
                              {
                                 if("weight" === _loc7_)
                                 {
                                    parseJoint(_loc1_);
                                 }
                              }
                              else
                              {
                                 parseTri(_loc3_);
                              }
                           }
                           else
                           {
                              parseVertex(_loc5_);
                           }
                        }
                        else
                        {
                           _loc1_ = new Vector.<JointData>(getNextInt(),true);
                        }
                     }
                     else
                     {
                        _loc3_ = new Vector.<uint>(getNextInt() * 3,true);
                     }
                  }
                  else
                  {
                     _loc5_ = new Vector.<VertexData>(getNextInt(),true);
                  }
               }
               else
               {
                  _shaders.push(parseLiteralString());
               }
            }
            else
            {
               ignoreLine();
            }
         }
         if(!_meshData)
         {
            _meshData = new Vector.<MeshData>();
         }
         var _loc6_:uint = _meshData.length;
         _meshData[_loc6_] = new MeshData();
         _meshData[_loc6_].vertexData = _loc5_;
         _meshData[_loc6_].weightData = _loc1_;
         _meshData[_loc6_].indices = _loc3_;
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
      
      private function parseTri(param1:Vector.<uint>) : void
      {
         var _loc2_:int = getNextInt() * 3;
         param1[_loc2_] = getNextInt();
         param1[_loc2_ + 1] = getNextInt();
         param1[_loc2_ + 2] = getNextInt();
      }
      
      private function parseJoint(param1:Vector.<JointData>) : void
      {
         var _loc2_:JointData = new JointData();
         _loc2_.index = getNextInt();
         _loc2_.joint = getNextInt();
         _loc2_.bias = getNextNumber();
         _loc2_.pos = parseVector3D();
         param1[_loc2_.index] = _loc2_;
      }
      
      private function parseVertex(param1:Vector.<VertexData>) : void
      {
         var _loc2_:VertexData = new VertexData();
         _loc2_.index = getNextInt();
         parseUV(_loc2_);
         _loc2_.startWeight = getNextInt();
         _loc2_.countWeight = getNextInt();
         param1[_loc2_.index] = _loc2_;
      }
      
      private function parseUV(param1:VertexData) : void
      {
         var _loc2_:String = getNextToken();
         if(_loc2_ != "(")
         {
            sendParseError("(");
         }
         param1.s = getNextNumber();
         param1.t = getNextNumber();
         if(getNextToken() != ")")
         {
            sendParseError(")");
         }
      }
      
      private function getNextToken() : String
      {
         var _loc2_:* = null;
         var _loc1_:String = "";
         while(!_reachedEOF)
         {
            _loc2_ = getNextChar();
            if(_loc2_ == " " || _loc2_ == "\r" || _loc2_ == "\n" || _loc2_ == "\t")
            {
               if(_loc1_ != "//")
               {
                  skipWhiteSpace();
               }
               if(_loc1_ != "")
               {
                  return _loc1_;
               }
            }
            else
            {
               _loc1_ = _loc1_ + _loc2_;
            }
            if(_loc1_ == "//")
            {
               return _loc1_;
            }
         }
         return _loc1_;
      }
      
      private function skipWhiteSpace() : void
      {
         var _loc1_:* = null;
         do
         {
            _loc1_ = getNextChar();
         }
         while(_loc1_ == "\n" || _loc1_ == " " || _loc1_ == "\r" || _loc1_ == "\t");
         
         putBack();
      }
      
      private function ignoreLine() : void
      {
         var _loc1_:* = null;
         while(!_reachedEOF && _loc1_ != "\n")
         {
            _loc1_ = getNextChar();
         }
      }
      
      private function getNextChar() : String
      {
         _parseIndex = Number(_parseIndex) + 1;
         var _loc1_:String = _textData.charAt(Number(_parseIndex));
         if(_loc1_ == "\n")
         {
            _line = _line + 1;
            _charLineIndex = 0;
         }
         else if(_loc1_ != "\r")
         {
            _charLineIndex = _charLineIndex + 1;
         }
         if(_parseIndex >= _textData.length)
         {
            _reachedEOF = true;
         }
         return _loc1_;
      }
      
      private function getNextInt() : int
      {
         var _loc1_:Number = parseInt(getNextToken());
         if(isNaN(_loc1_))
         {
            sendParseError("int type");
         }
         return _loc1_;
      }
      
      private function getNextNumber() : Number
      {
         var _loc1_:Number = parseFloat(getNextToken());
         if(isNaN(_loc1_))
         {
            sendParseError("float type");
         }
         return _loc1_;
      }
      
      private function parseVector3D() : Vector3D
      {
         var _loc2_:Vector3D = new Vector3D();
         var _loc1_:String = getNextToken();
         if(_loc1_ != "(")
         {
            sendParseError("(");
         }
         _loc2_.x = -getNextNumber();
         _loc2_.y = getNextNumber();
         _loc2_.z = getNextNumber();
         if(getNextToken() != ")")
         {
            sendParseError(")");
         }
         return _loc2_;
      }
      
      private function parseQuaternion() : Quaternion
      {
         var _loc1_:Quaternion = new Quaternion();
         var _loc4_:String = getNextToken();
         if(_loc4_ != "(")
         {
            sendParseError("(");
         }
         _loc1_.x = getNextNumber();
         _loc1_.y = -getNextNumber();
         _loc1_.z = -getNextNumber();
         var _loc2_:Number = 1 - _loc1_.x * _loc1_.x - _loc1_.y * _loc1_.y - _loc1_.z * _loc1_.z;
         _loc1_.w = _loc2_ < 0?0:Number(-Math.sqrt(_loc2_));
         if(getNextToken() != ")")
         {
            sendParseError(")");
         }
         var _loc3_:Quaternion = new Quaternion();
         _loc3_.multiply(_rotationQuat,_loc1_);
         return _loc3_;
      }
      
      private function parseCMD() : void
      {
         parseLiteralString();
      }
      
      private function parseLiteralString() : String
      {
         skipWhiteSpace();
         var _loc2_:String = getNextChar();
         var _loc1_:String = "";
         if(_loc2_ != "\"")
         {
            sendParseError("\"");
         }
         do
         {
            if(_reachedEOF)
            {
               sendEOFError();
            }
            _loc2_ = getNextChar();
            if(_loc2_ != "\"")
            {
               _loc1_ = _loc1_ + _loc2_;
            }
         }
         while(_loc2_ != "\"");
         
         return _loc1_;
      }
      
      private function sendEOFError() : void
      {
         throw new Error("Unexpected end of file");
      }
      
      private function sendParseError(param1:String) : void
      {
         throw new Error("Unexpected token at line " + (_line + 1) + ", character " + _charLineIndex + ". " + param1 + " expected, but " + _textData.charAt(_parseIndex - 1) + " encountered");
      }
      
      private function sendUnknownKeywordError() : void
      {
         throw new Error("Unknown keyword at line " + (_line + 1) + ", character " + _charLineIndex + ". ");
      }
   }
}

class VertexData
{
    
   
   public var index:int;
   
   public var s:Number;
   
   public var t:Number;
   
   public var startWeight:int;
   
   public var countWeight:int;
   
   function VertexData()
   {
      super();
   }
}

import flash.geom.Vector3D;

class JointData
{
    
   
   public var index:int;
   
   public var joint:int;
   
   public var bias:Number;
   
   public var pos:Vector3D;
   
   function JointData()
   {
      super();
   }
}

class MeshData
{
    
   
   public var vertexData:Vector.<VertexData>;
   
   public var weightData:Vector.<JointData>;
   
   public var indices:Vector.<uint>;
   
   function MeshData()
   {
      super();
   }
}
