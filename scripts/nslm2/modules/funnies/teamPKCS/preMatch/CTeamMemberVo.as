package nslm2.modules.funnies.teamPKCS.preMatch
{
   import proto.CTeamMemberInfo;
   import com.netease.protobuf.UInt64;
   
   public class CTeamMemberVo
   {
       
      
      public var rank:int;
      
      public var info:CTeamMemberInfo;
      
      public var order:int;
      
      public var leaderId:UInt64;
      
      public function CTeamMemberVo()
      {
         super();
      }
   }
}
