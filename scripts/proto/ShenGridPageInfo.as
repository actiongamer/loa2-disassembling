package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class ShenGridPageInfo extends Message
   {
      
      public static const PAGENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.ShenGridPageInfo.pagenum","pagenum",8 | 0);
      
      public static const DINGNODES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ShenGridPageInfo.dingnodes","dingnodes",16 | 2,ShenGridDingNodeInfo);
      
      public static const NODESINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.ShenGridPageInfo.nodesinfo","nodesinfo",24 | 2,ShenGridNodeInfo);
       
      
      public var pagenum:uint;
      
      public var dingnodes:Array;
      
      public var nodesinfo:Array;
      
      public function ShenGridPageInfo()
      {
         dingnodes = [];
         nodesinfo = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.pagenum);
         _loc2_ = uint(0);
         while(_loc2_ < this.dingnodes.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.dingnodes[_loc2_]);
            _loc2_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.nodesinfo.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.nodesinfo[_loc3_]);
            _loc3_++;
         }
         var _loc6_:int = 0;
         var _loc5_:* = this;
         for(var _loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc3_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ShenGridPageInfo.pagenum cannot be set twice.");
                  }
                  _loc4_++;
                  this.pagenum = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  this.dingnodes.push(ReadUtils.read$TYPE_MESSAGE(param1,new ShenGridDingNodeInfo()));
                  continue;
               case 2:
                  this.nodesinfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new ShenGridNodeInfo()));
                  continue;
            }
         }
      }
   }
}
