package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class FamilyBossSupperRankData extends Message
   {
      
      public static const KILLBOSSCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossSupperRankData.killbosscount","killbosscount",8 | 0);
      
      public static const TOTALHURT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossSupperRankData.totalhurt","totalhurt",16 | 0);
      
      public static const TOTALABLITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossSupperRankData.totalablity","totalablity",24 | 0);
      
      public static const FAMILYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.FamilyBossSupperRankData.familyname","familyname",32 | 2);
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyBossSupperRankData.rewards","rewards",40 | 2,Reward);
      
      public static const MEMBERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.FamilyBossSupperRankData.members","members",48 | 2,RankMember);
      
      public static const CURRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossSupperRankData.currank","currank",56 | 0);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.FamilyBossSupperRankData.rank","rank",64 | 0);
       
      
      public var killbosscount:uint;
      
      public var totalhurt:uint;
      
      public var totalablity:uint;
      
      public var familyname:String;
      
      public var rewards:Array;
      
      public var members:Array;
      
      public var currank:uint;
      
      public var rank:uint;
      
      public function FamilyBossSupperRankData()
      {
         rewards = [];
         members = [];
         super();
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         WriteUtils.writeTag(param1,0,1);
         WriteUtils.write$TYPE_UINT32(param1,this.killbosscount);
         WriteUtils.writeTag(param1,0,2);
         WriteUtils.write$TYPE_UINT32(param1,this.totalhurt);
         WriteUtils.writeTag(param1,0,3);
         WriteUtils.write$TYPE_UINT32(param1,this.totalablity);
         WriteUtils.writeTag(param1,2,4);
         WriteUtils.write$TYPE_STRING(param1,this.familyname);
         _loc2_ = uint(0);
         while(_loc2_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards[_loc2_]);
            _loc2_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.members.length)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.members[_loc3_]);
            _loc3_++;
         }
         WriteUtils.writeTag(param1,0,7);
         WriteUtils.write$TYPE_UINT32(param1,this.currank);
         WriteUtils.writeTag(param1,0,8);
         WriteUtils.write$TYPE_UINT32(param1,this.rank);
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
         var _loc8_:uint = 0;
         var _loc5_:uint = 0;
         var _loc9_:uint = 0;
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            switch((_loc6_ >> 3) - 1)
            {
               case 0:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyBossSupperRankData.killbosscount cannot be set twice.");
                  }
                  _loc4_++;
                  this.killbosscount = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 1:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyBossSupperRankData.totalhurt cannot be set twice.");
                  }
                  _loc8_++;
                  this.totalhurt = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyBossSupperRankData.totalablity cannot be set twice.");
                  }
                  _loc5_++;
                  this.totalablity = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 3:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyBossSupperRankData.familyname cannot be set twice.");
                  }
                  _loc9_++;
                  this.familyname = ReadUtils.read$TYPE_STRING(param1);
                  continue;
               case 4:
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Reward()));
                  continue;
               case 5:
                  this.members.push(ReadUtils.read$TYPE_MESSAGE(param1,new RankMember()));
                  continue;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyBossSupperRankData.currank cannot be set twice.");
                  }
                  _loc7_++;
                  this.currank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
               case 7:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FamilyBossSupperRankData.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  continue;
            }
         }
      }
   }
}
