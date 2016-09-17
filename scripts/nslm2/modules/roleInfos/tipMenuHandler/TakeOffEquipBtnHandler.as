package nslm2.modules.roleInfos.tipMenuHandler
{
   import nslm2.modules.footstones.tipMenus.handlers.TipMenuHandlerBase;
   import proto.EquipChangeReq;
   import nslm2.modules.roleInfos.equipPanels.EquipHeroPosVo;
   import nslm2.utils.Uint64Util;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.cultivates.treasure.service.TreasureService;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   
   public class TakeOffEquipBtnHandler extends TipMenuHandlerBase
   {
       
      
      private var req:EquipChangeReq;
      
      private var pos:int;
      
      public function TakeOffEquipBtnHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         var _loc1_:EquipHeroPosVo = data as EquipHeroPosVo;
         pos = _loc1_.pos;
         if(_loc1_.pos < 8)
         {
            req = new EquipChangeReq();
            req.hero = _loc1_.heroId;
            req.item = Uint64Util.fromNumber(0);
            req.place = _loc1_.pos;
            ServerEngine.ins.send(8103,req,server_onChange);
         }
         else
         {
            TreasureService.ins.baoWuEquip(_loc1_.heroId,Uint64Util.fromNumber(0),_loc1_.pos,unEquipBaowuHandler);
         }
      }
      
      private function unEquipBaowuHandler(param1:Object) : void
      {
         ObserverMgr.ins.sendNotice("msg_role_info_change_treasure",[pos]);
         NGUtil.checkRuneNg(true,true);
      }
      
      private function server_onChange() : void
      {
         ObserverMgr.ins.sendNotice("msgRoleInfo_ChangeEquip",[req,null]);
      }
   }
}
