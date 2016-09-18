package away3d.loaders.parsers
{
   import away3d.core.math.Quaternion;
   import away3d.animators.nodes.SkeletonClipNode;
   import away3d.animators.data.SkeletonPose;
   import flash.geom.Vector3D;
   import away3d.animators.data.JointPose;
   
   public class MD5AnimParser extends ParserBase
   {
      
      private static const VERSION_TOKEN:String = "MD5Version";
      
      private static const COMMAND_LINE_TOKEN:String = "commandline";
      
      private static const NUM_FRAMES_TOKEN:String = "numFrames";
      
      private static const NUM_JOINTS_TOKEN:String = "numJoints";
      
      private static const FRAME_RATE_TOKEN:String = "frameRate";
      
      private static const NUM_ANIMATED_COMPONENTS_TOKEN:String = "numAnimatedComponents";
      
      private static const HIERARCHY_TOKEN:String = "hierarchy";
      
      private static const BOUNDS_TOKEN:String = "bounds";
      
      private static const BASE_FRAME_TOKEN:String = "baseframe";
      
      private static const FRAME_TOKEN:String = "frame";
      
      private static const COMMENT_TOKEN:String = "//";
       
      
      private var _textData:String;
      
      private var _startedParsing:Boolean;
      
      private var _parseIndex:int;
      
      private var _reachedEOF:Boolean;
      
      private var _line:int;
      
      private var _charLineIndex:int;
      
      private var _version:int;
      
      private var _frameRate:int;
      
      private var _numFrames:int;
      
      private var _numJoints:int;
      
      private var _numAnimatedComponents:int;
      
      private var _hierarchy:Vector.<HierarchyData>;
      
      private var _bounds:Vector.<BoundsData>;
      
      private var _frameData:Vector.<FrameData>;
      
      private var _baseFrameData:Vector.<BaseFrameData>;
      
      private var _rotationQuat:Quaternion;
      
      private var _clip:SkeletonClipNode;
      
      public function MD5AnimParser(param1:Vector3D = null, param2:Number = 0)
      {
         super("plainText");
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
         return param1 == "md5anim";
      }
      
      public static function supportsData(param1:*) : Boolean
      {
         return false;
      }
      
      override protected function proceedParsing() : Boolean
      {
         var _loc1_:* = null;
         if(!_startedParsing)
         {
            _textData = getTextData();
            _startedParsing = true;
         }
         while(hasTime())
         {
            _loc1_ = getNextToken();
            var _loc2_:* = _loc1_;
            if("//" !== _loc2_)
            {
               if("" !== _loc2_)
               {
                  if("MD5Version" !== _loc2_)
                  {
                     if("commandline" !== _loc2_)
                     {
                        if("numFrames" !== _loc2_)
                        {
                           if("numJoints" !== _loc2_)
                           {
                              if("frameRate" !== _loc2_)
                              {
                                 if("numAnimatedComponents" !== _loc2_)
                                 {
                                    if("hierarchy" !== _loc2_)
                                    {
                                       if("bounds" !== _loc2_)
                                       {
                                          if("baseframe" !== _loc2_)
                                          {
                                             if("frame" !== _loc2_)
                                             {
                                                if(!_reachedEOF)
                                                {
                                                   sendUnknownKeywordError();
                                                }
                                             }
                                             else
                                             {
                                                parseFrame();
                                             }
                                          }
                                          else
                                          {
                                             parseBaseFrame();
                                          }
                                       }
                                       else
                                       {
                                          parseBounds();
                                       }
                                    }
                                    else
                                    {
                                       parseHierarchy();
                                    }
                                 }
                                 else
                                 {
                                    _numAnimatedComponents = getNextInt();
                                 }
                              }
                              else
                              {
                                 _frameRate = getNextInt();
                              }
                           }
                           else
                           {
                              _numJoints = getNextInt();
                              _hierarchy = new Vector.<HierarchyData>(_numJoints,true);
                              _baseFrameData = new Vector.<BaseFrameData>(_numJoints,true);
                           }
                        }
                        else
                        {
                           _numFrames = getNextInt();
                           _bounds = new Vector.<BoundsData>();
                           _frameData = new Vector.<FrameData>();
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
            }
            else
            {
               ignoreLine();
            }
            if(_reachedEOF)
            {
               _clip = new SkeletonClipNode();
               translateClip();
               finalizeAsset(_clip);
               return true;
            }
         }
         return false;
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
               _loc9_.translation.copyFrom(_loc11_);
            }
            _loc9_.orientation.y = -_loc9_.orientation.y;
            _loc9_.orientation.z = -_loc9_.orientation.z;
            _loc9_.translation.x = -_loc9_.translation.x;
            _loc6_[_loc7_] = _loc9_;
            _loc7_++;
         }
         return _loc3_;
      }
      
      private function parseHierarchy() : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc1_:String = getNextToken();
         var _loc4_:int = 0;
         if(_loc1_ != "{")
         {
            sendUnknownKeywordError();
         }
         do
         {
            if(_reachedEOF)
            {
               sendEOFError();
            }
            _loc2_ = new HierarchyData();
            _loc2_.name = parseLiteralString();
            _loc2_.parentIndex = getNextInt();
            _loc2_.flags = getNextInt();
            _loc2_.startIndex = getNextInt();
            _loc4_++;
            _hierarchy[_loc4_] = _loc2_;
            _loc3_ = getNextChar();
            if(_loc3_ == "/")
            {
               putBack();
               _loc3_ = getNextToken();
               if(_loc3_ == "//")
               {
                  ignoreLine();
               }
               _loc3_ = getNextChar();
            }
            if(_loc3_ != "}")
            {
               putBack();
            }
         }
         while(_loc3_ != "}");
         
      }
      
      private function parseBounds() : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc1_:String = getNextToken();
         var _loc4_:int = 0;
         if(_loc1_ != "{")
         {
            sendUnknownKeywordError();
         }
         do
         {
            if(_reachedEOF)
            {
               sendEOFError();
            }
            _loc2_ = new BoundsData();
            _loc2_.min = parseVector3D();
            _loc2_.max = parseVector3D();
            _loc4_++;
            _bounds[_loc4_] = _loc2_;
            _loc3_ = getNextChar();
            if(_loc3_ == "/")
            {
               putBack();
               _loc3_ = getNextToken();
               if(_loc3_ == "//")
               {
                  ignoreLine();
               }
               _loc3_ = getNextChar();
            }
            if(_loc3_ != "}")
            {
               putBack();
            }
         }
         while(_loc3_ != "}");
         
      }
      
      private function parseBaseFrame() : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc1_:String = getNextToken();
         var _loc4_:int = 0;
         if(_loc1_ != "{")
         {
            sendUnknownKeywordError();
         }
         do
         {
            if(_reachedEOF)
            {
               sendEOFError();
            }
            _loc2_ = new BaseFrameData();
            _loc2_.position = parseVector3D();
            _loc2_.orientation = parseQuaternion();
            _loc4_++;
            _baseFrameData[_loc4_] = _loc2_;
            _loc3_ = getNextChar();
            if(_loc3_ == "/")
            {
               putBack();
               _loc3_ = getNextToken();
               if(_loc3_ == "//")
               {
                  ignoreLine();
               }
               _loc3_ = getNextChar();
            }
            if(_loc3_ != "}")
            {
               putBack();
            }
         }
         while(_loc3_ != "}");
         
      }
      
      private function parseFrame() : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         _loc3_ = getNextInt();
         _loc1_ = getNextToken();
         if(_loc1_ != "{")
         {
            sendUnknownKeywordError();
         }
         do
         {
            if(_reachedEOF)
            {
               sendEOFError();
            }
            _loc2_ = new FrameData();
            _loc2_.components = new Vector.<Number>(_numAnimatedComponents,true);
            _loc5_ = 0;
            while(_loc5_ < _numAnimatedComponents)
            {
               _loc2_.components[_loc5_] = getNextNumber();
               _loc5_++;
            }
            _frameData[_loc3_] = _loc2_;
            _loc4_ = getNextChar();
            if(_loc4_ == "/")
            {
               putBack();
               _loc4_ = getNextToken();
               if(_loc4_ == "//")
               {
                  ignoreLine();
               }
               _loc4_ = getNextChar();
            }
            if(_loc4_ != "}")
            {
               putBack();
            }
         }
         while(_loc4_ != "}");
         
      }
      
      private function putBack() : void
      {
         _parseIndex = Number(_parseIndex) - 1;
         _charLineIndex = Number(_charLineIndex) - 1;
         _reachedEOF = _parseIndex >= _textData.length;
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
         if(_parseIndex == _textData.length)
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
         _loc2_.x = getNextNumber();
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
         var _loc3_:String = getNextToken();
         if(_loc3_ != "(")
         {
            sendParseError("(");
         }
         _loc1_.x = getNextNumber();
         _loc1_.y = getNextNumber();
         _loc1_.z = getNextNumber();
         var _loc2_:Number = 1 - _loc1_.x * _loc1_.x - _loc1_.y * _loc1_.y - _loc1_.z * _loc1_.z;
         _loc1_.w = _loc2_ < 0?0:Number(-Math.sqrt(_loc2_));
         if(getNextToken() != ")")
         {
            sendParseError(")");
         }
         return _loc1_;
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

class HierarchyData
{
    
   
   public var name:String;
   
   public var parentIndex:int;
   
   public var flags:int;
   
   public var startIndex:int;
   
   function HierarchyData()
   {
      super();
   }
}

import flash.geom.Vector3D;

class BoundsData
{
    
   
   public var min:Vector3D;
   
   public var max:Vector3D;
   
   function BoundsData()
   {
      super();
   }
}

import flash.geom.Vector3D;
import away3d.core.math.Quaternion;

class BaseFrameData
{
    
   
   public var position:Vector3D;
   
   public var orientation:Quaternion;
   
   function BaseFrameData()
   {
      super();
   }
}

class FrameData
{
    
   
   public var index:int;
   
   public var components:Vector.<Number>;
   
   function FrameData()
   {
      super();
   }
}
