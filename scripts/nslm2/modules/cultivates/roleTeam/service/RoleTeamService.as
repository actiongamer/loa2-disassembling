package nslm2.modules.cultivates.roleTeam.service
{
   import com.netease.protobuf.UInt64;
   import proto.BuZhenListReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.BuZhenListRes;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import proto.BuZhenSupportReq;
   import proto.BuZhenSupportRes;
   
   public class RoleTeamService
   {
      
      private static var _ins:nslm2.modules.cultivates.roleTeam.service.RoleTeamService;
       
      
      public function RoleTeamService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.roleTeam.service.RoleTeamService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.roleTeam.service.RoleTeamService();
         }
         return _ins;
      }
      
      public function changeTeamMember(param1:uint, param2:UInt64) : void
      {
         var _loc3_:BuZhenListReq = new BuZhenListReq();
         _loc3_.position = param1;
         _loc3_.hero = param2;
         ServerEngine.ins.send(5032,_loc3_,server_zhenList);
      }
      
      private function server_zhenList(param1:BuZhenListRes) : void
      {
         RoleTeamModel.ins.updateHeroInfo(param1.info);
      }
      
      public function changeYuanJun(param1:int, param2:UInt64) : void
      {
         var _loc3_:BuZhenSupportReq = new BuZhenSupportReq();
         _loc3_.position = param1;
         _loc3_.hero = param2;
         ServerEngine.ins.send(5031,_loc3_,server_zhenSupport);
      }
      
      private function server_zhenSupport(param1:BuZhenSupportRes) : void
      {
         RoleTeamModel.ins.updateHeroInfo(param1.info,true);
      }
   }
}
