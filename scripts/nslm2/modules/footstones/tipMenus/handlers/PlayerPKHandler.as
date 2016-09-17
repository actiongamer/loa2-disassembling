package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.scenes.commons.SceneModel;
   import proto.PlayerPvpReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.common.vo.PlayerVo;
   import proto.PlayerPvpRes;
   
   public class PlayerPKHandler extends TipMenuHandlerBase
   {
       
      
      public function PlayerPKHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         if(ModuleMgr.ins.sceneLayer.curModuleId == 50200)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000147));
            return;
         }
         if(SceneModel.ins.isCrossScene)
         {
            AlertUtil.float("跨服主城暂时不支持此功能,敬请期待");
            return;
         }
         var _loc1_:PlayerPvpReq = new PlayerPvpReq();
         _loc1_.playerId = vo.playerId;
         ServerEngine.ins.send(8521,_loc1_,onDataRet);
      }
      
      public function get vo() : PlayerVo
      {
         return this.data as PlayerVo;
      }
      
      private function onDataRet(param1:PlayerPvpRes) : void
      {
         ModuleMgr.ins.showModule(50100,param1);
      }
   }
}
