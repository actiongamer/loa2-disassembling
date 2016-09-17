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
   
   public class StageStarRankRes extends Message
   {
      
      public static const RANK:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.StageStarRankRes.rank","rank",8 | 2,StageStarRankData);
      
      public static const MYSTAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StageStarRankRes.mystar","mystar",16 | 0);
      
      public static const MYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StageStarRankRes.myrank","myrank",24 | 0);
      
      public static const PAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StageStarRankRes.page","page",32 | 0);
       
      
      public var rank:Array;
      
      public var mystar:uint;
      
      public var myrank:uint;
      
      public var page:uint;
      
      public function StageStarRankRes()
      {
         rank = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < this.rank.length)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rank[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.mystar);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.myrank);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.page);
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
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  this.rank.push(ReadUtils.read$TYPE_MESSAGE(param1,new StageStarRankData()));
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StageStarRankRes.mystar cannot be set twice.");
                  }
                  _loc5_++;
                  this.mystar = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StageStarRankRes.myrank cannot be set twice.");
                  }
                  _loc3_++;
                  this.myrank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StageStarRankRes.page cannot be set twice.");
                  }
                  _loc4_++;
                  this.page = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
