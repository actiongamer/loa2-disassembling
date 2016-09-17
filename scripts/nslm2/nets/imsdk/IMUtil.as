package nslm2.nets.imsdk
{
   import flash.utils.ByteArray;
   
   public class IMUtil
   {
       
      
      public function IMUtil()
      {
         super();
      }
      
      public static function createByteArray() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.endian = "bigEndian";
         return _loc1_;
      }
   }
}
