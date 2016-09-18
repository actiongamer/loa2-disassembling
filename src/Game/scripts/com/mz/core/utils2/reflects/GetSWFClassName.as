package com.mz.core.utils2.reflects
{
   import flash.utils.ByteArray;
   import com.mz.core.logging.Log;
   
   public class GetSWFClassName
   {
      
      private static var bytes:ByteArray;
      
      private static var className:Vector.<String>;
      
      private static var tagNum:int;
       
      
      public function GetSWFClassName()
      {
         super();
      }
      
      public static function parse(param1:ByteArray, param2:* = null) : Vector.<String>
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:* = null;
         tagNum = 0;
         className = new Vector.<String>();
         bytes = new ByteArray();
         bytes.writeBytes(param1);
         bytes.position = 0;
         bytes.endian = "littleEndian";
         _loc4_ = bytes.readUTFBytes(3);
         if(_loc4_ != "FWS" && _loc4_ != "CWS")
         {
            Log.debug(GetSWFClassName,param2,"不能识别的SWF文件格式");
            return new Vector.<String>();
         }
         bytes.readByte();
         bytes.readUnsignedInt();
         bytes.readBytes(bytes);
         bytes.length = bytes.length - 8;
         if(_loc4_ == "CWS")
         {
            bytes.uncompress();
         }
         bytes.position = 13;
         while(bytes.bytesAvailable)
         {
            readSWFTag(bytes);
         }
         return className.splice(0,className.length);
      }
      
      private static function readSWFTag(param1:ByteArray) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = param1.readUnsignedShort();
         var _loc5_:* = _loc4_ >> 6;
         var _loc3_:* = _loc4_ & 63;
         if((_loc3_ & 63) == 63)
         {
            _loc3_ = int(param1.readUnsignedInt());
         }
         if(_loc5_ == 76)
         {
            _loc2_ = new ByteArray();
            if(_loc3_ != 0)
            {
               param1.readBytes(_loc2_,0,_loc3_);
            }
            getClass(_loc2_);
         }
         else
         {
            param1.position = param1.position + _loc3_;
         }
      }
      
      private static function getClass(param1:ByteArray) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = readUI16(param1);
         var _loc2_:int = 0;
         while(_loc2_ < _loc3_)
         {
            readUI16(param1);
            _loc4_ = readSwfString(param1);
            className.push(_loc4_);
            _loc2_++;
            tagNum = Number(tagNum) + 1;
            if(tagNum > 400)
            {
               return;
            }
         }
      }
      
      private static function readSwfString(param1:ByteArray) : String
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 1;
         var _loc2_:int = 0;
         while(true)
         {
            _loc2_ = param1.readByte();
            if(_loc2_ == 0)
            {
               break;
            }
            _loc4_++;
         }
         _loc5_ = new ByteArray();
         _loc5_.writeBytes(param1,param1.position - _loc4_,_loc4_);
         _loc5_.position = 0;
         _loc3_ = _loc5_.readUTFBytes(_loc4_);
         return _loc3_;
      }
      
      private static function readUI16(param1:ByteArray) : int
      {
         var _loc3_:* = param1.readUnsignedByte();
         var _loc2_:* = param1.readUnsignedByte();
         return _loc3_ + (_loc2_ << 8);
      }
   }
}
