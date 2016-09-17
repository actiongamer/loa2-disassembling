package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class LuckTreeMemberInfo extends Message
   {
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeMemberInfo.score","score",8 | 0);
      
      public static const CURLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeMemberInfo.curlevel","curlevel",16 | 0);
      
      public static const CUREXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.LuckTreeMemberInfo.curexp","curexp",24 | 0);
      
      public static const BUYINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.LuckTreeMemberInfo.buyinfo","buyinfo",32 | 2,LuckTreeBuyItemInfo);
      
      public static const LEVELW:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.LuckTreeMemberInfo.levelw","levelw",40 | 0);
      
      public static const LEVELP:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.LuckTreeMemberInfo.levelp","levelp",48 | 0);
       
      
      public var score:uint;
      
      public var curlevel:uint;
      
      public var curexp:uint;
      
      public var buyinfo:Array;
      
      public var levelw:Array;
      
      public var levelp:Array;
      
      public function LuckTreeMemberInfo()
      {
         buyinfo = [];
         levelw = [];
         levelp = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         var _loc4_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.score);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.curlevel);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.curexp);
         _loc3_ = uint(0);
         while(_loc3_ < this.buyinfo.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buyinfo[_loc3_]);
            _loc3_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.levelw.length)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,this.levelw[_loc2_]);
            _loc2_++;
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.levelp.length)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,this.levelp[_loc4_]);
            _loc4_++;
         }
         var _loc7_:int = 0;
         var _loc6_:* = this;
         for(var _loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeMemberInfo.score cannot be set twice.");
                  }
                  _loc5_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeMemberInfo.curlevel cannot be set twice.");
                  }
                  _loc3_++;
                  this.curlevel = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: LuckTreeMemberInfo.curexp cannot be set twice.");
                  }
                  _loc6_++;
                  this.curexp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  this.buyinfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new LuckTreeBuyItemInfo()));
                  continue;
               case 4:
                  if((_loc4_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.levelw);
                  }
                  else
                  {
                     this.levelw.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 5:
                  if((_loc4_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.levelp);
                  }
                  else
                  {
                     this.levelp.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
            }
         }
      }
   }
}
