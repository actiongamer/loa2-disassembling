package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class SkillTimePoint extends Message
   {
      
      public static const TIME_POINT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.SkillTimePoint.time_point","timePoint",8 | 0);
      
      public static const OBJ_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.SkillTimePoint.obj_id","objId",16 | 0);
       
      
      public var timePoint:int;
      
      public var objId:int;
      
      public function SkillTimePoint()
      {
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_INT32(param1,this.timePoint);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_INT32(param1,this.objId);
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: SkillTimePoint.timePoint cannot be set twice.");
                  }
                  _loc5_++;
                  this.timePoint = ReadUtils.read$TYPE_INT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: SkillTimePoint.objId cannot be set twice.");
                  }
                  _loc3_++;
                  this.objId = ReadUtils.read$TYPE_INT32(param1);
                  continue;
            }
         }
      }
   }
}
