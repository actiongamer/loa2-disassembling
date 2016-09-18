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
   
   public class OnlineSceneNotify extends Message
   {
      
      public static const SCENEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.OnlineSceneNotify.sceneId","sceneId",8 | 0);
      
      public static const SEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.OnlineSceneNotify.sex","sex",16 | 0);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.OnlineSceneNotify.name","name",24 | 2);
      
      public static const LANGNOW:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.OnlineSceneNotify.langNow","langNow",32 | 2);
       
      
      private var sceneId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var sex$field:uint;
      
      private var name$field:String;
      
      private var langNow$field:String;
      
      public function OnlineSceneNotify()
      {
         super();
      }
      
      public function clearSceneId() : void
      {
         hasField$0 = hasField$0 & 4294967294;
         sceneId$field = new uint();
      }
      
      public function get hasSceneId() : Boolean
      {
         return (hasField$0 & 1) != 0;
      }
      
      public function set sceneId(param1:uint) : void
      {
         hasField$0 = hasField$0 | 1;
         sceneId$field = param1;
      }
      
      public function get sceneId() : uint
      {
         return sceneId$field;
      }
      
      public function clearSex() : void
      {
         hasField$0 = hasField$0 & 4294967293;
         sex$field = new uint();
      }
      
      public function get hasSex() : Boolean
      {
         return (hasField$0 & 2) != 0;
      }
      
      public function set sex(param1:uint) : void
      {
         hasField$0 = hasField$0 | 2;
         sex$field = param1;
      }
      
      public function get sex() : uint
      {
         return sex$field;
      }
      
      public function clearName() : void
      {
         name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         name$field = param1;
      }
      
      public function get name() : String
      {
         return name$field;
      }
      
      public function clearLangNow() : void
      {
         langNow$field = null;
      }
      
      public function get hasLangNow() : Boolean
      {
         return langNow$field != null;
      }
      
      public function set langNow(param1:String) : void
      {
         langNow$field = param1;
      }
      
      public function get langNow() : String
      {
         return langNow$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasSceneId)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,sceneId$field);
         }
         if(hasSex)
         {
            WriteUtils.writeTag(param1,0,2);
            WriteUtils.write$TYPE_UINT32(param1,sex$field);
         }
         if(hasName)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_STRING(param1,name$field);
         }
         if(hasLangNow)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_STRING(param1,langNow$field);
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
         var _loc5_:* = 0;
         var _loc4_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc5_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: OnlineSceneNotify.sceneId cannot be set twice.");
                  }
                  _loc4_++;
                  this.sceneId = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: OnlineSceneNotify.sex cannot be set twice.");
                  }
                  _loc6_++;
                  this.sex = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: OnlineSceneNotify.name cannot be set twice.");
                  }
                  _loc3_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 3:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: OnlineSceneNotify.langNow cannot be set twice.");
                  }
                  _loc7_++;
                  this.langNow = ReadUtils.read$TYPE_STRING(param1);
                  continue;
            }
         }
      }
   }
}
