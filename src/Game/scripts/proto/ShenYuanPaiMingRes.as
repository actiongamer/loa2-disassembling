package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ShenYuanPaiMingRes extends Message
   {
      
      public static const PLAYERSHENYUANINFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ShenYuanPaiMingRes.playerShenyuanInfos","playerShenyuanInfos",8 | 2,PlayerShenYuanInfo);
      
      public static const MYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ShenYuanPaiMingRes.myRank","myRank",16 | 0);
       
      
      public var playerShenyuanInfos:Array;
      
      private var myRank$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function ShenYuanPaiMingRes()
      {
         playerShenyuanInfos = [];
         super();
      }
      
      public function clearMyRank() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         myRank$field = new uint();
      }
      
      public function get hasMyRank() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set myRank(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         myRank$field = param1;
      }
      
      public function get myRank() : uint
      {
         return myRank$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.playerShenyuanInfos.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.playerShenyuanInfos[_loc2_]);
            _loc2_++;
         }
         if(hasMyRank)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,myRank$field);
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  this.playerShenyuanInfos.push(ReadUtils.read$TYPE_MESSAGE(param1,new PlayerShenYuanInfo()));
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ShenYuanPaiMingRes.myRank cannot be set twice.");
                  }
                  _loc3_++;
                  this.myRank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
