package nslm2.nets.imsdk
{
   import flash.utils.ByteArray;
   import com.mz.core.logging.Log;
   
   public class MsgPacket
   {
      
      private static var _msgver:String = "0.01";
      
      public static var HEAD_LENGTH:int = 10;
       
      
      public var _readBuff:ByteArray;
      
      public function MsgPacket()
      {
         super();
         _readBuff = IMUtil.createByteArray();
      }
      
      public function onDataRun(param1:IMSocket) : void
      {
         if(_readBuff.length < HEAD_LENGTH)
         {
            Log.debug(this,"包头不够等下一次","_readBuff:",_readBuff.length,"HEAD_LENGTH:",HEAD_LENGTH);
            return;
         }
         var _loc4_:MsgHeader = new MsgHeader();
         _loc4_.buffLen = _readBuff.readInt() - 6;
         if(_readBuff.length < HEAD_LENGTH + _loc4_.buffLen)
         {
            _readBuff.position = _readBuff.position - 4;
            Log.debug(this,"数据不够等下一次","_readBuff:",_readBuff.length,"HEAD_LENGTH:",HEAD_LENGTH,"$bodyLen:",_loc4_.buffLen);
            return;
         }
         _loc4_.msgid = _readBuff.readUTFBytes(2);
         _loc4_.msgver = _readBuff.readUTFBytes(4);
         var _loc2_:ByteArray = IMUtil.createByteArray();
         _readBuff.readBytes(_loc2_,0,_loc4_.buffLen);
         param1.onMessage(_loc4_,_loc2_);
         var _loc3_:ByteArray = IMUtil.createByteArray();
         _readBuff.readBytes(_loc3_);
         _readBuff = _loc3_;
         if(_readBuff.length)
         {
            onDataRun(param1);
         }
      }
      
      public function sendMsgPacket(param1:IMSocket, param2:String, param3:String) : void
      {
         var _loc5_:ByteArray = IMUtil.createByteArray();
         var _loc4_:ByteArray = IMUtil.createByteArray();
         _loc4_.writeMultiByte(param3,"utf-8");
         _loc5_.writeInt(_loc4_.length + 6);
         _loc5_.writeUTFBytes(param2);
         _loc5_.writeUTFBytes(_msgver);
         _loc5_.writeMultiByte(param3,"utf-8");
         param1.sendBuff(param2,_loc5_);
      }
   }
}
