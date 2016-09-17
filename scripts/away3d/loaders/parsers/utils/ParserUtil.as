package away3d.loaders.parsers.utils
{
   import flash.utils.ByteArray;
   
   public class ParserUtil
   {
       
      
      public function ParserUtil()
      {
         super();
      }
      
      public static function toByteArray(param1:*) : ByteArray
      {
         if(param1 is Class)
         {
            param1 = new param1();
         }
         if(param1 is ByteArray)
         {
            return param1;
         }
         return null;
      }
      
      public static function toString(param1:*, param2:uint = 0) : String
      {
         var _loc3_:* = null;
         if(!param2)
         {
            param2 = 4294967295;
         }
         if(param1 is String)
         {
            return String(param1).substr(0,param2);
         }
         _loc3_ = toByteArray(param1);
         if(_loc3_)
         {
            _loc3_.position = 0;
            return _loc3_.readUTFBytes(Math.min(_loc3_.bytesAvailable,param2));
         }
         return null;
      }
   }
}
