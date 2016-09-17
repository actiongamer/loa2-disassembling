package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ZhuanPanInfoRes extends Message
   {
      
      public static const MEMBER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.ZhuanPanInfoRes.member","member",8 | 2,proto.ZhuanPanMemberInfo);
      
      public static const RANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ZhuanPanInfoRes.ranks","ranks",16 | 2,ZhuanPanScoreMemer);
      
      public static const STARTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ZhuanPanInfoRes.starttime","starttime",24 | 0);
      
      public static const ENDTIME1:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ZhuanPanInfoRes.endtime1","endtime1",32 | 0);
      
      public static const ENDTIME2:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ZhuanPanInfoRes.endtime2","endtime2",40 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ZhuanPanInfoRes.rank","rank",48 | 0);
       
      
      private var member$field:proto.ZhuanPanMemberInfo;
      
      public var ranks:Array;
      
      public var starttime:uint;
      
      public var endtime1:uint;
      
      public var endtime2:uint;
      
      public var rank:uint;
      
      public function ZhuanPanInfoRes()
      {
         ranks = [];
         super();
      }
      
      public function clearMember() : void
      {
         member$field = null;
      }
      
      public function get hasMember() : Boolean
      {
         return member$field != null;
      }
      
      public function set member(param1:proto.ZhuanPanMemberInfo) : void
      {
         member$field = param1;
      }
      
      public function get member() : proto.ZhuanPanMemberInfo
      {
         return member$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasMember)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,member$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.ranks.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.ranks[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.starttime);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.endtime1);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.endtime2);
         WriteUtils.writeTag(param1,0,6);
         WriteUtils.write$TYPE_UINT32(param1,this.rank);
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:* = 0;
         var _loc8_:uint = 0;
         var _loc7_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: ZhuanPanInfoRes.member cannot be set twice.");
                  }
                  _loc8_++;
                  this.member = new proto.ZhuanPanMemberInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.member);
                  continue;
               case 1:
                  this.ranks.push(ReadUtils.read$TYPE_MESSAGE(param1,new ZhuanPanScoreMemer()));
                  continue;
               case 2:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: ZhuanPanInfoRes.starttime cannot be set twice.");
                  }
                  _loc7_++;
                  this.starttime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ZhuanPanInfoRes.endtime1 cannot be set twice.");
                  }
                  _loc4_++;
                  this.endtime1 = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ZhuanPanInfoRes.endtime2 cannot be set twice.");
                  }
                  _loc5_++;
                  this.endtime2 = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: ZhuanPanInfoRes.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
