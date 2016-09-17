package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class PlayerGetSaddleHorsesRes extends Message
   {
      
      public static const HORSEID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.PlayerGetSaddleHorsesRes.horseid","horseid",8 | 0);
      
      public static const CURHORSE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerGetSaddleHorsesRes.curhorse","curhorse",16 | 0);
      
      public static const CURGLORY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerGetSaddleHorsesRes.curglory","curglory",24 | 0);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerGetSaddleHorsesRes.star","star",32 | 0);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.PlayerGetSaddleHorsesRes.exp","exp",40 | 0);
      
      public static const GLORIESID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.PlayerGetSaddleHorsesRes.gloriesid","gloriesid",48 | 0);
       
      
      public var horseid:Array;
      
      public var curhorse:uint;
      
      public var curglory:uint;
      
      public var star:uint;
      
      public var exp:uint;
      
      public var gloriesid:Array;
      
      public function PlayerGetSaddleHorsesRes()
      {
         horseid = [];
         gloriesid = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         _loc3_ = uint(0);
         while(_loc3_ < this.horseid.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,this.horseid[_loc3_]);
            _loc3_++;
         }
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.curhorse);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.curglory);
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.star);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.exp);
         _loc2_ = uint(0);
         while(_loc2_ < this.gloriesid.length)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,this.gloriesid[_loc2_]);
            _loc2_++;
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
         var _loc5_:* = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if((_loc5_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.horseid);
                  }
                  else
                  {
                     this.horseid.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerGetSaddleHorsesRes.curhorse cannot be set twice.");
                  }
                  _loc3_++;
                  this.curhorse = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerGetSaddleHorsesRes.curglory cannot be set twice.");
                  }
                  _loc4_++;
                  this.curglory = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerGetSaddleHorsesRes.star cannot be set twice.");
                  }
                  _loc7_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: PlayerGetSaddleHorsesRes.exp cannot be set twice.");
                  }
                  _loc6_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if((_loc5_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.gloriesid);
                  }
                  else
                  {
                     this.gloriesid.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
            }
         }
      }
   }
}
