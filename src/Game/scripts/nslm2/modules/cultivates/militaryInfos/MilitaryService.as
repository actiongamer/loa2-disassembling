package nslm2.modules.cultivates.militaryInfos
{
   import flash.events.EventDispatcher;
   import proto.PlayerMilitaryrankUpgradeReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.PlayerMilitaryrankUpgradeRes;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.Uint64Util;
   import com.mz.core.event.MzEvent;
   import proto.PlayerMilitaryrankInfoReq;
   import proto.PlayerMilitaryrankInfoRes;
   
   public class MilitaryService extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.cultivates.militaryInfos.MilitaryService;
       
      
      public function MilitaryService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.militaryInfos.MilitaryService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.militaryInfos.MilitaryService();
         }
         return _ins;
      }
      
      public function upgrade() : void
      {
         var _loc1_:PlayerMilitaryrankUpgradeReq = new PlayerMilitaryrankUpgradeReq();
         ServerEngine.ins.send(7012,_loc1_,server_militaryUpgrade);
      }
      
      private function server_militaryUpgrade(param1:PlayerMilitaryrankUpgradeRes) : void
      {
         if(param1.ok == true)
         {
            PlayerModel.ins.playerInfo.militaryrank = param1.id;
            MilitaryModel.ins.totalFightValue = Uint64Util.clone(param1.ability);
            this.dispatchEvent(new MzEvent("evtUpgradeCpl"));
         }
      }
      
      public function getMilitaryInfo() : void
      {
         var _loc1_:PlayerMilitaryrankInfoReq = new PlayerMilitaryrankInfoReq();
         ServerEngine.ins.send(7017,null,server_militaryRankInfo);
      }
      
      private function server_militaryRankInfo(param1:PlayerMilitaryrankInfoRes) : void
      {
         MilitaryModel.ins.totalFightValue = Uint64Util.clone(param1.totalability);
         this.dispatchEvent(new MzEvent("evtGetInfoCpl"));
      }
   }
}
