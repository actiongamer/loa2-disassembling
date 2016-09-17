package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class StaticCharmRankTimeModel extends Message
   {
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticCharmRankTimeModel.id","id",8 | 0);
      
      public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticCharmRankTimeModel.version","version",16 | 0);
      
      public static const STARTTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticCharmRankTimeModel.startTm","startTm",24 | 2);
      
      public static const ENDTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticCharmRankTimeModel.endTm","endTm",32 | 2);
      
      public static const OPENTM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.StaticCharmRankTimeModel.openTm","openTm",40 | 0);
      
      public static const TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticCharmRankTimeModel.title","title",48 | 2);
      
      public static const JIFENSTARTTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticCharmRankTimeModel.jifenStartTm","jifenStartTm",56 | 2);
      
      public static const JIFENENDTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticCharmRankTimeModel.jifenEndTm","jifenEndTm",64 | 2);
      
      public static const CHOOSESTARTTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticCharmRankTimeModel.chooseStartTm","chooseStartTm",72 | 2);
      
      public static const CHOOSEENDTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticCharmRankTimeModel.chooseEndTm","chooseEndTm",80 | 2);
      
      public static const BUYSTARTTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticCharmRankTimeModel.buyStartTm","buyStartTm",88 | 2);
      
      public static const BUYENDTM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticCharmRankTimeModel.buyEndTm","buyEndTm",96 | 2);
      
      public static const PANELIMG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticCharmRankTimeModel.panelImg","panelImg",104 | 2);
      
      public static const SHOPIMG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.StaticCharmRankTimeModel.shopImg","shopImg",112 | 2);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var version$field:uint;
      
      private var startTm$field:String;
      
      private var endTm$field:String;
      
      private var openTm$field:uint;
      
      private var title$field:String;
      
      private var jifenStartTm$field:String;
      
      private var jifenEndTm$field:String;
      
      private var chooseStartTm$field:String;
      
      private var chooseEndTm$field:String;
      
      private var buyStartTm$field:String;
      
      private var buyEndTm$field:String;
      
      private var panelImg$field:String;
      
      private var shopImg$field:String;
      
      public function StaticCharmRankTimeModel()
      {
         super();
      }
      
      public function clearId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         id$field = param1;
      }
      
      public function get id() : uint
      {
         return id$field;
      }
      
      public function clearVersion() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         version$field = new uint();
      }
      
      public function get hasVersion() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set version(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         version$field = param1;
      }
      
      public function get version() : uint
      {
         return version$field;
      }
      
      public function clearStartTm() : void
      {
         startTm$field = null;
      }
      
      public function get hasStartTm() : Boolean
      {
         return startTm$field != null;
      }
      
      public function set startTm(param1:String) : void
      {
         startTm$field = param1;
      }
      
      public function get startTm() : String
      {
         return startTm$field;
      }
      
      public function clearEndTm() : void
      {
         endTm$field = null;
      }
      
      public function get hasEndTm() : Boolean
      {
         return endTm$field != null;
      }
      
      public function set endTm(param1:String) : void
      {
         endTm$field = param1;
      }
      
      public function get endTm() : String
      {
         return endTm$field;
      }
      
      public function clearOpenTm() : void
      {
         hasField$0 = hasField$0 & 4294967291;
         openTm$field = new uint();
      }
      
      public function get hasOpenTm() : Boolean
      {
         return (hasField$0 & 4) != 0;
      }
      
      public function set openTm(param1:uint) : void
      {
         hasField$0 = hasField$0 | 4;
         openTm$field = param1;
      }
      
      public function get openTm() : uint
      {
         return openTm$field;
      }
      
      public function clearTitle() : void
      {
         title$field = null;
      }
      
      public function get hasTitle() : Boolean
      {
         return title$field != null;
      }
      
      public function set title(param1:String) : void
      {
         title$field = param1;
      }
      
      public function get title() : String
      {
         return title$field;
      }
      
      public function clearJifenStartTm() : void
      {
         jifenStartTm$field = null;
      }
      
      public function get hasJifenStartTm() : Boolean
      {
         return jifenStartTm$field != null;
      }
      
      public function set jifenStartTm(param1:String) : void
      {
         jifenStartTm$field = param1;
      }
      
      public function get jifenStartTm() : String
      {
         return jifenStartTm$field;
      }
      
      public function clearJifenEndTm() : void
      {
         jifenEndTm$field = null;
      }
      
      public function get hasJifenEndTm() : Boolean
      {
         return jifenEndTm$field != null;
      }
      
      public function set jifenEndTm(param1:String) : void
      {
         jifenEndTm$field = param1;
      }
      
      public function get jifenEndTm() : String
      {
         return jifenEndTm$field;
      }
      
      public function clearChooseStartTm() : void
      {
         chooseStartTm$field = null;
      }
      
      public function get hasChooseStartTm() : Boolean
      {
         return chooseStartTm$field != null;
      }
      
      public function set chooseStartTm(param1:String) : void
      {
         chooseStartTm$field = param1;
      }
      
      public function get chooseStartTm() : String
      {
         return chooseStartTm$field;
      }
      
      public function clearChooseEndTm() : void
      {
         chooseEndTm$field = null;
      }
      
      public function get hasChooseEndTm() : Boolean
      {
         return chooseEndTm$field != null;
      }
      
      public function set chooseEndTm(param1:String) : void
      {
         chooseEndTm$field = param1;
      }
      
      public function get chooseEndTm() : String
      {
         return chooseEndTm$field;
      }
      
      public function clearBuyStartTm() : void
      {
         buyStartTm$field = null;
      }
      
      public function get hasBuyStartTm() : Boolean
      {
         return buyStartTm$field != null;
      }
      
      public function set buyStartTm(param1:String) : void
      {
         buyStartTm$field = param1;
      }
      
      public function get buyStartTm() : String
      {
         return buyStartTm$field;
      }
      
      public function clearBuyEndTm() : void
      {
         buyEndTm$field = null;
      }
      
      public function get hasBuyEndTm() : Boolean
      {
         return buyEndTm$field != null;
      }
      
      public function set buyEndTm(param1:String) : void
      {
         buyEndTm$field = param1;
      }
      
      public function get buyEndTm() : String
      {
         return buyEndTm$field;
      }
      
      public function clearPanelImg() : void
      {
         panelImg$field = null;
      }
      
      public function get hasPanelImg() : Boolean
      {
         return panelImg$field != null;
      }
      
      public function set panelImg(param1:String) : void
      {
         panelImg$field = param1;
      }
      
      public function get panelImg() : String
      {
         return panelImg$field;
      }
      
      public function clearShopImg() : void
      {
         shopImg$field = null;
      }
      
      public function get hasShopImg() : Boolean
      {
         return shopImg$field != null;
      }
      
      public function set shopImg(param1:String) : void
      {
         shopImg$field = param1;
      }
      
      public function get shopImg() : String
      {
         return shopImg$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,id$field);
         }
         if(hasVersion)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,version$field);
         }
         if(hasStartTm)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,startTm$field);
         }
         if(hasEndTm)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,endTm$field);
         }
         if(hasOpenTm)
         {
            WriteUtils.writeTag(param1,0,5);
            WriteUtils.write$TYPE_UINT32(param1,openTm$field);
         }
         if(hasTitle)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_STRING(param1,title$field);
         }
         if(hasJifenStartTm)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_STRING(param1,jifenStartTm$field);
         }
         if(hasJifenEndTm)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_STRING(param1,jifenEndTm$field);
         }
         if(hasChooseStartTm)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_STRING(param1,chooseStartTm$field);
         }
         if(hasChooseEndTm)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_STRING(param1,chooseEndTm$field);
         }
         if(hasBuyStartTm)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_STRING(param1,buyStartTm$field);
         }
         if(hasBuyEndTm)
         {
            WriteUtils.writeTag(param1,2,12);
            WriteUtils.write$TYPE_STRING(param1,buyEndTm$field);
         }
         if(hasPanelImg)
         {
            WriteUtils.writeTag(param1,2,13);
            WriteUtils.write$TYPE_STRING(param1,panelImg$field);
         }
         if(hasShopImg)
         {
            WriteUtils.writeTag(param1,2,14);
            WriteUtils.write$TYPE_STRING(param1,shopImg$field);
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
         var _loc15_:uint = 0;
         var _loc12_:uint = 0;
         var _loc14_:uint = 0;
         var _loc5_:uint = 0;
         var _loc9_:uint = 0;
         var _loc11_:uint = 0;
         var _loc16_:uint = 0;
         var _loc10_:uint = 0;
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         var _loc17_:uint = 0;
         var _loc6_:uint = 0;
         var _loc8_:uint = 0;
         var _loc13_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc7_ >> 3) - 1)
            {
               case 0:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankTimeModel.id cannot be set twice.");
                  }
                  _loc15_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankTimeModel.version cannot be set twice.");
                  }
                  _loc12_++;
                  this.version = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankTimeModel.startTm cannot be set twice.");
                  }
                  _loc14_++;
                  this.startTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankTimeModel.endTm cannot be set twice.");
                  }
                  _loc5_++;
                  this.endTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankTimeModel.openTm cannot be set twice.");
                  }
                  _loc9_++;
                  this.openTm = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 5:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankTimeModel.title cannot be set twice.");
                  }
                  _loc11_++;
                  this.title = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 6:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankTimeModel.jifenStartTm cannot be set twice.");
                  }
                  _loc16_++;
                  this.jifenStartTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 7:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankTimeModel.jifenEndTm cannot be set twice.");
                  }
                  _loc10_++;
                  this.jifenEndTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 8:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankTimeModel.chooseStartTm cannot be set twice.");
                  }
                  _loc4_++;
                  this.chooseStartTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 9:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankTimeModel.chooseEndTm cannot be set twice.");
                  }
                  _loc3_++;
                  this.chooseEndTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 10:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankTimeModel.buyStartTm cannot be set twice.");
                  }
                  _loc17_++;
                  this.buyStartTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 11:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankTimeModel.buyEndTm cannot be set twice.");
                  }
                  _loc6_++;
                  this.buyEndTm = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 12:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankTimeModel.panelImg cannot be set twice.");
                  }
                  _loc8_++;
                  this.panelImg = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 13:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: StaticCharmRankTimeModel.shopImg cannot be set twice.");
                  }
                  _loc13_++;
                  this.shopImg = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
