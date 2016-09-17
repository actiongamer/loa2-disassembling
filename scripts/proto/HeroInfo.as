package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class HeroInfo extends Message
   {
      
      public static const BASEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.HeroInfo.baseInfo","baseInfo",8 | 2,proto.HeroBaseInfo);
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.HeroInfo.items","items",16 | 2,Item);
      
      public static const PROP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.HeroInfo.prop","prop",24 | 2,proto.FightProp);
      
      public static const BAOWU:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.HeroInfo.baowu","baowu",32 | 2,BaoWu);
      
      public static const SHENGRIDINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.HeroInfo.shengridinfo","shengridinfo",40 | 2,proto.ShenGridPageInfo);
       
      
      private var baseInfo$field:proto.HeroBaseInfo;
      
      public var items:Array;
      
      private var prop$field:proto.FightProp;
      
      public var baowu:Array;
      
      private var shengridinfo$field:proto.ShenGridPageInfo;
      
      public function HeroInfo()
      {
         items = [];
         baowu = [];
         super();
      }
      
      public function clearBaseInfo() : void
      {
         baseInfo$field = null;
      }
      
      public function get hasBaseInfo() : Boolean
      {
         return baseInfo$field != null;
      }
      
      public function set baseInfo(param1:proto.HeroBaseInfo) : void
      {
         baseInfo$field = param1;
      }
      
      public function get baseInfo() : proto.HeroBaseInfo
      {
         return baseInfo$field;
      }
      
      public function clearProp() : void
      {
         prop$field = null;
      }
      
      public function get hasProp() : Boolean
      {
         return prop$field != null;
      }
      
      public function set prop(param1:proto.FightProp) : void
      {
         prop$field = param1;
      }
      
      public function get prop() : proto.FightProp
      {
         return prop$field;
      }
      
      public function clearShengridinfo() : void
      {
         shengridinfo$field = null;
      }
      
      public function get hasShengridinfo() : Boolean
      {
         return shengridinfo$field != null;
      }
      
      public function set shengridinfo(param1:proto.ShenGridPageInfo) : void
      {
         shengridinfo$field = param1;
      }
      
      public function get shengridinfo() : proto.ShenGridPageInfo
      {
         return shengridinfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         if(hasBaseInfo)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,baseInfo$field);
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.items.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc3_]);
            _loc3_++;
         }
         if(hasProp)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,prop$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.baowu.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.baowu[_loc2_]);
            _loc2_++;
         }
         if(hasShengridinfo)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,shengridinfo$field);
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
         var _loc6_:* = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: HeroInfo.baseInfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.baseInfo = new proto.HeroBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.baseInfo);
                  continue;
               case 1:
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new Item()));
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: HeroInfo.prop cannot be set twice.");
                  }
                  _loc3_++;
                  this.prop = new proto.FightProp();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.prop);
                  continue;
               case 3:
                  this.baowu.push(ReadUtils.read$TYPE_MESSAGE(param1,new BaoWu()));
                  continue;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: HeroInfo.shengridinfo cannot be set twice.");
                  }
                  _loc5_++;
                  this.shengridinfo = new proto.ShenGridPageInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.shengridinfo);
                  continue;
            }
         }
      }
   }
}
