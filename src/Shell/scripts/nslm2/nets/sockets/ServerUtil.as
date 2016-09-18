package nslm2.nets.sockets
{
   import flash.utils.ByteArray;
   
   public class ServerUtil
   {
       
      
      public function ServerUtil()
      {
         super();
      }
      
      public static function getTypeId(param1:ByteArray) : int
      {
         param1.position = 0;
         return param1.readInt();
      }
      
      public static function getHeadData(param1:ByteArray, param2:int) : int
      {
         param1.position = param2 * 4;
         return param1.readInt();
      }
      
      public static function createByteArray() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.endian = "littleEndian";
         return _loc1_;
      }
      
      public static function compress(param1:ByteArray) : void
      {
         param1.compress("deflate");
      }
      
      public static function uncompress(param1:ByteArray) : void
      {
         param1.uncompress("deflate");
      }
   }
}
