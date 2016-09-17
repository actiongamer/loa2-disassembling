package org.specter3d.utils
{
   import flash.utils.ByteArray;
   import flash.geom.Vector3D;
   import org.specter3d.geom.Vector2f;
   import org.specter3d.utils.xlsx.ExcelSheet;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.utils.getQualifiedSuperclassName;
   import flash.display.Bitmap;
   
   public class Tools
   {
      
      public static const charSet:String = "utf-8";
      
      public static const FIXED_HEAD:String = "S3D";
      
      public static const UNKNOWN_FILE:String = "unknown file type.";
       
      
      public function Tools()
      {
         super();
      }
      
      public static function getStringLength(param1:String) : uint
      {
         !param1 && "";
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeMultiByte(param1,"utf-8");
         var _loc3_:uint = _loc2_.length;
         _loc2_.clear();
         return _loc3_;
      }
      
      public static function readString(param1:ByteArray) : String
      {
         return param1.readMultiByte(param1.readUnsignedInt(),"utf-8");
      }
      
      public static function readStringArr(param1:ByteArray) : Array
      {
         var _loc3_:Array = [];
         var _loc2_:uint = param1.readUnsignedInt();
         while(_loc2_)
         {
            _loc3_.push(readString(param1));
            _loc2_--;
         }
         return _loc3_;
      }
      
      public static function writeString(param1:ByteArray, param2:String) : void
      {
         !param2 && "";
         var _loc3_:int = getStringLength(param2);
         param1.writeUnsignedInt(_loc3_);
         param1.writeUTFBytes(param2);
      }
      
      public static function writeStringArr(param1:ByteArray, param2:Array) : void
      {
         var _loc3_:uint = param2.length;
         param1.writeUnsignedInt(_loc3_);
         var _loc4_:uint = 0;
         while(_loc4_ < _loc3_)
         {
            writeString(param1,String(param2[_loc4_]));
            _loc4_++;
         }
      }
      
      public static function writeFileHead(param1:ByteArray, param2:Boolean = true) : ByteArray
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.endian = "littleEndian";
         _loc3_.writeUnsignedInt(param1.length);
         _loc3_.writeBytes(param1);
         param2 && INIEncrypt.encrypt(_loc3_);
         param1.clear();
         return _loc3_;
      }
      
      public static function exportFileHead(param1:ByteArray, param2:String, param3:Boolean = false) : ByteArray
      {
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.endian = "littleEndian";
         writeString(_loc4_,"S3D");
         writeString(_loc4_,param2);
         _loc4_.writeUnsignedInt(!!param3?1:0);
         _loc4_.writeUnsignedInt(param1.length);
         param3 && INIEncrypt.encrypt(param1);
         _loc4_.writeBytes(param1);
         param1.clear();
         return _loc4_;
      }
      
      public static function importingFileHead(param1:ByteArray) : uint
      {
         param1.endian = "littleEndian";
         var _loc4_:String = readString(param1);
         if(_loc4_ != "S3D")
         {
            throw Error("unknown file type.");
         }
         var _loc3_:String = readString(param1);
         var _loc2_:uint = param1.readUnsignedInt();
         _loc2_ && INIEncrypt.decrypt(param1);
         return param1.readUnsignedInt();
      }
      
      public static function readFileHead(param1:ByteArray, param2:Boolean = true) : uint
      {
         param1.endian = "littleEndian";
         param2 && INIEncrypt.decrypt(param1);
         return param1.readUnsignedInt();
      }
      
      public static function writeNumber(param1:Number) : int
      {
         return param1 * 10000;
      }
      
      public static function readNumber(param1:int) : Number
      {
         return param1 * 0.0001;
      }
      
      public static function numberRounding(param1:Number) : int
      {
         return param1 >> 0;
      }
      
      public static function vector3DRounding(param1:Vector3D) : void
      {
         if(param1)
         {
            param1.x = MathR.round(param1.x,2);
            param1.y = MathR.round(param1.y,2);
            param1.z = MathR.round(param1.z,2);
         }
      }
      
      public static function vector2fRounding(param1:Vector2f) : void
      {
         if(param1)
         {
            param1.x = param1.x >> 0;
            param1.y = param1.y >> 0;
         }
      }
      
      public static function transformToObject(param1:ExcelSheet, param2:uint) : Object
      {
         var _loc4_:uint = 0;
         var _loc3_:Object = {};
         while(_loc4_ < param1.cols)
         {
            if(param1.getData(0,_loc4_))
            {
               _loc3_[param1.getData(0,_loc4_)] = param1.getData(param2,_loc4_);
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function transformToVector3D(param1:String) : Vector3D
      {
         var _loc2_:Array = param1.split(",");
         return _loc2_.length > 3?new Vector3D(_loc2_.shift(),_loc2_.shift(),_loc2_.shift(),_loc2_.shift()):new Vector3D(_loc2_.shift(),_loc2_.shift(),_loc2_.shift());
      }
      
      public static function stringToNumberHandler(param1:*) : Number
      {
         var _loc2_:Number = param1;
         return !!isNaN(_loc2_)?0:Number(_loc2_);
      }
      
      public static function numberToStringHandler(param1:Number) : String
      {
         return !!isNaN(param1)?"0":param1.toString();
      }
      
      public static function getDisplayObjectFromLoader(param1:String, param2:Loader = null) : DisplayObject
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = param2;
         try
         {
            _loc4_ = param2.contentLoaderInfo;
            _loc5_ = _loc4_.applicationDomain.getDefinition(param1) as Class;
            if(getQualifiedSuperclassName(_loc5_) == "flash.display::BitmapData")
            {
               var _loc7_:* = new Bitmap(new _loc5_(0,0));
               return _loc7_;
            }
            var _loc8_:* = new _loc5_() as DisplayObject;
            return _loc8_;
         }
         catch(e:Error)
         {
            trace("Utils getClassFromLoader error:" + param1);
            var _loc9_:* = null;
            return _loc9_;
         }
         return null;
      }
      
      public static function trim(param1:String) : String
      {
         if(param1 == null)
         {
            return "";
         }
         var _loc2_:int = 0;
         while(isWhitespace(param1.charAt(_loc2_)))
         {
            _loc2_++;
         }
         var _loc3_:int = param1.length - 1;
         while(isWhitespace(param1.charAt(_loc3_)))
         {
            _loc3_--;
         }
         if(_loc3_ >= _loc2_)
         {
            return param1.slice(_loc2_,_loc3_ + 1);
         }
         return "";
      }
      
      public static function isWhitespace(param1:String) : Boolean
      {
         var _loc2_:* = param1;
         if(" " !== _loc2_)
         {
            if("\t" !== _loc2_)
            {
               if("\r" !== _loc2_)
               {
                  if("\n" !== _loc2_)
                  {
                     if("\f" !== _loc2_)
                     {
                        return false;
                     }
                  }
                  addr9:
                  return true;
               }
               addr8:
               §§goto(addr9);
            }
            addr7:
            §§goto(addr8);
         }
         §§goto(addr7);
      }
      
      public static function getCommaString(param1:uint) : String
      {
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:Array = [];
         var _loc3_:* = param1.toString();
         var _loc5_:int = Math.ceil(_loc3_.length / 3);
         var _loc2_:String = "";
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            if(_loc7_ == 0)
            {
               _loc4_.push(_loc3_.slice(0,_loc3_.length - (_loc5_ - 1) * 3));
               _loc2_ = _loc3_.slice(_loc3_.length - (_loc5_ - 1) * 3,_loc3_.length);
            }
            else
            {
               _loc4_.push(_loc3_.slice(0,3));
               _loc2_ = _loc3_.slice(3,_loc3_.length);
            }
            _loc3_ = _loc2_;
            _loc7_++;
         }
         _loc3_ = "";
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            if(_loc6_ == _loc4_.length - 1)
            {
               _loc3_ = _loc3_ + (_loc4_[_loc6_] + "");
            }
            else
            {
               _loc3_ = _loc3_ + (_loc4_[_loc6_] + ",");
            }
            _loc6_++;
         }
         return _loc3_;
      }
   }
}
