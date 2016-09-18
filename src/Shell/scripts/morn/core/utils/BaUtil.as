package morn.core.utils
{
   import flash.utils.ByteArray;
   import com.mz.core.mgrs.resMgrs.ZipBaVo;
   
   public class BaUtil
   {
       
      
      public function BaUtil()
      {
         super();
      }
      
      public static function createByteArray(param1:String = null) : ByteArray
      {
         if(param1 == null)
         {
            param1 = "bigEndian";
         }
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.endian = param1;
         return _loc2_;
      }
      
      public static function compress(param1:ByteArray) : void
      {
         param1.compress("lzma");
      }
      
      public static function uncompress(param1:ByteArray) : void
      {
         param1.uncompress("lzma");
      }
      
      public static function writeKeyValue(param1:ByteArray, param2:String, param3:ByteArray) : void
      {
         var _loc5_:ByteArray = new ByteArray();
         _loc5_.writeUTFBytes(param2);
         var _loc4_:int = _loc5_.length;
         param1.writeUnsignedInt(_loc4_);
         param1.writeUnsignedInt(param3.length);
         param1.writeUTFBytes(param2);
         param1.writeBytes(param3,0,param3.length);
      }
      
      public static function zipOneStr(param1:String, param2:String, param3:Boolean = true) : ByteArray
      {
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeUTFBytes(param2);
         return zipOne(param1,_loc4_,param3);
      }
      
      public static function zipOne(param1:String, param2:ByteArray, param3:Boolean = true) : ByteArray
      {
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeUnsignedInt(StringUtils.byteLen(param1));
         _loc4_.writeUnsignedInt(param2.length);
         _loc4_.writeUTFBytes(param1);
         _loc4_.writeBytes(param2,0,param2.length);
         if(param3)
         {
            _loc4_.compress("lzma");
         }
         return _loc4_;
      }
      
      public static function unzipArr(param1:ByteArray, param2:Boolean = true) : Vector.<ZipBaVo>
      {
         var _loc3_:Vector.<ZipBaVo> = new Vector.<ZipBaVo>();
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeBytes(param1,0,param1.length);
         _loc4_.position = 0;
         if(param2)
         {
            _loc4_.uncompress("lzma");
         }
         while(true)
         {
            _loc3_.push(unzipOne(_loc4_,false));
            if(_loc4_.bytesAvailable != 0)
            {
               continue;
            }
            break;
         }
         return _loc3_;
      }
      
      public static function unzipOne(param1:ByteArray, param2:Boolean = true) : ZipBaVo
      {
         if(param2)
         {
            param1.uncompress("lzma");
         }
         var _loc6_:int = param1.readUnsignedInt();
         var _loc5_:int = param1.readUnsignedInt();
         var _loc4_:String = param1.readUTFBytes(_loc6_);
         var _loc3_:ByteArray = new ByteArray();
         param1.readBytes(_loc3_,0,_loc5_);
         return new ZipBaVo(_loc4_,_loc3_);
      }
   }
}
