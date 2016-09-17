package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   
   public class FamilyBossBossBuffNotify extends Message
   {
      
      public static const BUFFIDS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.FamilyBossBossBuffNotify.buffids","buffids",8 | 0);
       
      
      public var buffids:Array;
      
      public function FamilyBossBossBuffNotify()
      {
         buffids = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.buffids.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,this.buffids[_loc2_]);
            _loc2_++;
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
         var _loc3_:* = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            if(!((_loc3_ >> 3) - 1))
            {
               if((_loc3_ & 7) == 2)
               {
                  ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.buffids);
               }
               else
               {
                  this.buffids.push(ReadUtils.read$TYPE_UINT32(param1));
               }
            }
            else
            {
               super.readUnknown(param1,_loc3_);
            }
         }
      }
   }
}
