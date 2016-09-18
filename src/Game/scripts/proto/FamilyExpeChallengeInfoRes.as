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
   
   public class FamilyExpeChallengeInfoRes extends Message
   {
      
      public static const SELFFAMILY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeChallengeInfoRes.selfFamily","selfFamily",8 | 2,proto.FamilyExpeFamilyInfo);
      
      public static const ENEMYFAMILIES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyExpeChallengeInfoRes.enemyFamilies","enemyFamilies",16 | 2,proto.FamilyExpeFamilyInfo);
       
      
      private var selfFamily$field:proto.FamilyExpeFamilyInfo;
      
      public var enemyFamilies:Array;
      
      public function FamilyExpeChallengeInfoRes()
      {
         enemyFamilies = [];
         super();
      }
      
      public function clearSelfFamily() : void
      {
         selfFamily$field = null;
      }
      
      public function get hasSelfFamily() : Boolean
      {
         return selfFamily$field != null;
      }
      
      public function set selfFamily(param1:proto.FamilyExpeFamilyInfo) : void
      {
         selfFamily$field = param1;
      }
      
      public function get selfFamily() : proto.FamilyExpeFamilyInfo
      {
         return selfFamily$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         if(hasSelfFamily)
         {
            WriteUtils.writeTag(param1,2,1);
            WriteUtils.write$TYPE_MESSAGE(param1,selfFamily$field);
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.enemyFamilies.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.enemyFamilies[_loc2_]);
            _loc2_++;
         }
         var _loc5_:int = 0;
         var _loc4_:* = this;
         for(var _loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc4_ >> 3) - 1)
            {
               case 0:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyExpeChallengeInfoRes.selfFamily cannot be set twice.");
                  }
                  _loc3_++;
                  this.selfFamily = new proto.FamilyExpeFamilyInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.selfFamily);
                  continue;
               case 1:
                  this.enemyFamilies.push(ReadUtils.read$TYPE_MESSAGE(param1,new proto.FamilyExpeFamilyInfo()));
                  continue;
            }
         }
      }
   }
}
