package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class CteamSimpleReport extends Message
   {
      
      public static const WINNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CteamSimpleReport.winName","winName",8 | 2);
      
      public static const WINDIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamSimpleReport.winDist","winDist",16 | 0);
      
      public static const WINOP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CteamSimpleReport.winOp","winOp",24 | 2);
      
      public static const LOSENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CteamSimpleReport.loseName","loseName",32 | 2);
      
      public static const LOSEDIST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamSimpleReport.loseDist","loseDist",40 | 0);
      
      public static const LOSEOP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.CteamSimpleReport.loseOp","loseOp",48 | 2);
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamSimpleReport.id","id",56 | 0);
      
      public static const POS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.CteamSimpleReport.pos","pos",64 | 0);
       
      
      public var winName:String;
      
      public var winDist:uint;
      
      public var winOp:String;
      
      public var loseName:String;
      
      public var loseDist:uint;
      
      public var loseOp:String;
      
      public var id:uint;
      
      private var pos$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function CteamSimpleReport()
      {
         super();
      }
      
      public function clearPos() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         pos$field = new uint();
      }
      
      public function get hasPos() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set pos(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         pos$field = param1;
      }
      
      public function get pos() : uint
      {
         return pos$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         WriteUtils.writeTag(param1,2,1);
         WriteUtils.write$TYPE_STRING(param1,this.winName);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.winDist);
         WriteUtils.writeTag(param1,2,3);
         WriteUtils.write$TYPE_STRING(param1,this.winOp);
         WriteUtils.writeTag(param1,2,4);
         WriteUtils.write$TYPE_STRING(param1,this.loseName);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.loseDist);
         WriteUtils.writeTag(param1,2,6);
         WriteUtils.write$TYPE_STRING(param1,this.loseOp);
         WriteUtils.writeTag(param1,0,7);
         WriteUtils.write$TYPE_UINT32(param1,this.id);
         if(hasPos)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,pos$field);
         }
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:* = 0;
         var _loc9_:uint = 0;
         var _loc11_:uint = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc8_:uint = 0;
         var _loc10_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: CteamSimpleReport.winName cannot be set twice.");
                  }
                  _loc9_++;
                  this.winName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 1:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: CteamSimpleReport.winDist cannot be set twice.");
                  }
                  _loc11_++;
                  this.winDist = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CteamSimpleReport.winOp cannot be set twice.");
                  }
                  _loc4_++;
                  this.winOp = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CteamSimpleReport.loseName cannot be set twice.");
                  }
                  _loc6_++;
                  this.loseName = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: CteamSimpleReport.loseDist cannot be set twice.");
                  }
                  _loc3_++;
                  this.loseDist = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: CteamSimpleReport.loseOp cannot be set twice.");
                  }
                  _loc8_++;
                  this.loseOp = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: CteamSimpleReport.id cannot be set twice.");
                  }
                  _loc10_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CteamSimpleReport.pos cannot be set twice.");
                  }
                  _loc5_++;
                  this.pos = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
