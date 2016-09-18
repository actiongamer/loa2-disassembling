package org.specter3d.net
{
   import flash.utils.ByteArray;
   
   public class MessageHeadClient
   {
      
      public static const UPLINK:int = 0;
      
      public static const UPLINK_PHP:int = 2;
      
      private static var br:ByteArray = null;
       
      
      public function MessageHeadClient()
      {
         super();
      }
      
      public static function getMessageHead(param1:int, param2:int, param3:int) : ByteArray
      {
         var _loc4_:int = 0;
         if(param1 > 1000)
         {
            _loc4_ = param1.toString().substring(0,2);
         }
         else
         {
            _loc4_ = param1.toString().substring(0,1);
         }
         if(br == null)
         {
            br = new ByteArray();
            br.endian = "littleEndian";
            br.writeUnsignedInt(param2 + 8 + 5);
            br.writeUnsignedInt(param3 << 24 | _loc4_ << 16 | param1);
            br.writeUnsignedInt(0);
            br.writeByte(0);
         }
         else
         {
            br.position = 0;
            br.writeUnsignedInt(param2 + 8 + 5);
            br.writeUnsignedInt(param3 << 24 | _loc4_ << 16 | param1);
         }
         return br;
      }
   }
}
