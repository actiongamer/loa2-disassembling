package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyHeroDonationReceiveRes extends Message
   {
      
      public static const PLY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyHeroDonationReceiveRes.ply","ply",8 | 2,proto.FamilyHeroDonatePlayer);
      
      public static const LIST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyHeroDonationReceiveRes.list","list",16 | 2,proto.FamilyHeroDoanteList);
       
      
      private var ply$field:proto.FamilyHeroDonatePlayer;
      
      private var list$field:proto.FamilyHeroDoanteList;
      
      public function FamilyHeroDonationReceiveRes()
      {
         super();
      }
      
      public function clearPly() : void
      {
         ply$field = null;
      }
      
      public function get hasPly() : Boolean
      {
         return ply$field != null;
      }
      
      public function set ply(param1:proto.FamilyHeroDonatePlayer) : void
      {
         ply$field = param1;
      }
      
      public function get ply() : proto.FamilyHeroDonatePlayer
      {
         return ply$field;
      }
      
      public function clearList() : void
      {
         list$field = null;
      }
      
      public function get hasList() : Boolean
      {
         return list$field != null;
      }
      
      public function set list(param1:proto.FamilyHeroDoanteList) : void
      {
         list$field = param1;
      }
      
      public function get list() : proto.FamilyHeroDoanteList
      {
         return list$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         if(hasPly)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,ply$field);
         }
         if(hasList)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,list$field);
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
         var _loc4_:* = 0;
         var _loc3_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyHeroDonationReceiveRes.ply cannot be set twice.");
                  }
                  _loc3_++;
                  this.ply = new proto.FamilyHeroDonatePlayer();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.ply);
                  continue;
               case 1:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyHeroDonationReceiveRes.list cannot be set twice.");
                  }
                  _loc5_++;
                  this.list = new proto.FamilyHeroDoanteList();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.list);
                  continue;
            }
         }
      }
   }
}
