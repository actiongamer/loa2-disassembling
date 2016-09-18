package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class SuperSaleInfoRes extends Message
   {
      
      public static const CURRENTVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SuperSaleInfoRes.currentvalue","currentvalue",8 | 0);
      
      public static const MAXVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SuperSaleInfoRes.maxvalue","maxvalue",16 | 0);
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.SuperSaleInfoRes.items","items",24 | 2,SuperSaleItem);
      
      public static const LASTRESETTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SuperSaleInfoRes.lastresettime","lastresettime",32 | 0);
      
      public static const NEXTRESETTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SuperSaleInfoRes.nextresettime","nextresettime",40 | 0);
      
      public static const ALREADYBUY:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.SuperSaleInfoRes.alreadybuy","alreadybuy",48 | 0);
      
      public static const ALLCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SuperSaleInfoRes.allcount","allcount",56 | 0);
      
      public static const ALREADYGET:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.SuperSaleInfoRes.alreadyget","alreadyget",64 | 0);
      
      public static const CANRECHARGE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.SuperSaleInfoRes.canrecharge","canrecharge",72 | 0);
      
      public static const LIMITTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SuperSaleInfoRes.limittime","limittime",80 | 0);
      
      public static const RECHARGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.SuperSaleInfoRes.recharge","recharge",88 | 0);
      
      public static const GETLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.SuperSaleInfoRes.getList","getList",96 | 2,generalWalfareInfo);
       
      
      public var currentvalue:uint;
      
      public var maxvalue:uint;
      
      public var items:Array;
      
      public var lastresettime:uint;
      
      public var nextresettime:uint;
      
      public var alreadybuy:Array;
      
      public var allcount:uint;
      
      public var alreadyget:Array;
      
      public var canrecharge:Boolean;
      
      public var limittime:uint;
      
      public var recharge:uint;
      
      public var getList:Array;
      
      public function SuperSaleInfoRes()
      {
         items = [];
         alreadybuy = [];
         alreadyget = [];
         getList = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc6_:* = 0;
         var _loc2_:* = 0;
         var _loc4_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.currentvalue);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.maxvalue);
         _loc3_ = uint(0);
         while(_loc3_ < this.items.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc3_]);
            _loc3_++;
         }
         WriteUtils.writeTag(param1,0,4);
         WriteUtils.write$TYPE_UINT32(param1,this.lastresettime);
         WriteUtils.writeTag(param1,0,5);
         WriteUtils.write$TYPE_UINT32(param1,this.nextresettime);
         _loc6_ = uint(0);
         while(_loc6_ < this.alreadybuy.length)
         {
            WriteUtils.writeTag(param1,0,6);
            WriteUtils.write$TYPE_UINT32(param1,this.alreadybuy[_loc6_]);
            _loc6_++;
         }
         WriteUtils.writeTag(param1,0,7);
         WriteUtils.write$TYPE_UINT32(param1,this.allcount);
         _loc2_ = uint(0);
         while(_loc2_ < this.alreadyget.length)
         {
            WriteUtils.writeTag(param1,0,8);
            WriteUtils.write$TYPE_UINT32(param1,this.alreadyget[_loc2_]);
            _loc2_++;
         }
         WriteUtils.writeTag(param1,0,9);
         WriteUtils.write$TYPE_BOOL(param1,this.canrecharge);
         WriteUtils.writeTag(param1,0,10);
         WriteUtils.write$TYPE_UINT32(param1,this.limittime);
         WriteUtils.writeTag(param1,0,11);
         WriteUtils.write$TYPE_UINT32(param1,this.recharge);
         _loc4_ = uint(0);
         while(_loc4_ < this.getList.length)
         {
            WriteUtils.writeTag(param1,2,12);
            WriteUtils.write$TYPE_MESSAGE(param1,this.getList[_loc4_]);
            _loc4_++;
         }
         var _loc8_:int = 0;
         var _loc7_:* = this;
         for(var _loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:* = 0;
         var _loc6_:uint = 0;
         var _loc9_:uint = 0;
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc11_:uint = 0;
         var _loc5_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: SuperSaleInfoRes.currentvalue cannot be set twice.");
                  }
                  _loc6_++;
                  this.currentvalue = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: SuperSaleInfoRes.maxvalue cannot be set twice.");
                  }
                  _loc9_++;
                  this.maxvalue = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new SuperSaleItem()));
                  continue;
               case 3:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: SuperSaleInfoRes.lastresettime cannot be set twice.");
                  }
                  _loc8_++;
                  this.lastresettime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: SuperSaleInfoRes.nextresettime cannot be set twice.");
                  }
                  _loc3_++;
                  this.nextresettime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if((_loc7_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.alreadybuy);
                  }
                  else
                  {
                     this.alreadybuy.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 6:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: SuperSaleInfoRes.allcount cannot be set twice.");
                  }
                  _loc4_++;
                  this.allcount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if((_loc7_ & 7) == 2)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.alreadyget);
                  }
                  else
                  {
                     this.alreadyget.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  continue;
               case 8:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: SuperSaleInfoRes.canrecharge cannot be set twice.");
                  }
                  _loc11_++;
                  this.canrecharge = ReadUtils.read$TYPE_BOOL(param1);
                  continue;
               case 9:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: SuperSaleInfoRes.limittime cannot be set twice.");
                  }
                  _loc5_++;
                  this.limittime = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 10:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: SuperSaleInfoRes.recharge cannot be set twice.");
                  }
                  _loc10_++;
                  this.recharge = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 11:
                  this.getList.push(ReadUtils.read$TYPE_MESSAGE(param1,new generalWalfareInfo()));
                  continue;
            }
         }
      }
   }
}
