package nslm2.modules.cultivates.otherRoleInfos
{
   import com.netease.protobuf.UInt64;
   import proto.ViewOtherPlayerReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ViewOtherPlayerRes;
   
   public class OtherRoleInfoService
   {
      
      private static var _ins:nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoService;
       
      
      public function OtherRoleInfoService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoService();
         }
         return _ins;
      }
      
      private function get model() : OtherRoleInfoModel
      {
         return OtherRoleInfoModel.ins;
      }
      
      public function viewOtherPlayer(param1:UInt64, param2:int) : void
      {
         var _loc3_:ViewOtherPlayerReq = new ViewOtherPlayerReq();
         _loc3_.id = param1;
         _loc3_.dist = param2;
         ServerEngine.ins.send(5310,_loc3_,server_otherPlayer);
      }
      
      private function server_otherPlayer(param1:ViewOtherPlayerRes) : void
      {
         model.onDataChangeOne(param1);
      }
   }
}
