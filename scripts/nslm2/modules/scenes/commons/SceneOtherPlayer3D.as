package nslm2.modules.scenes.commons
{
   import flash.events.Event;
   import nslm2.common.vo.PlayerVo;
   import nslm2.modules.foundations.vip.consts.VipUtils;
   import flash.utils.setTimeout;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import away3d.containers.ObjectContainer3D;
   
   public class SceneOtherPlayer3D extends ScenePlayer3D
   {
       
      
      public function SceneOtherPlayer3D(param1:ObjectContainer3D = null)
      {
         super(param1);
         this.overMethodEnabled = true;
         this.overMethodColor = 16046112;
         this.addEventListener("unitMouseClick",avatar_onClick);
      }
      
      private function avatar_onClick(param1:Event) : void
      {
         var _loc2_:PlayerVo = new PlayerVo();
         _loc2_.playerId = playerInfo.baseInfo.id;
         _loc2_.name = playerInfo.baseInfo.name;
         _loc2_.level = playerInfo.baseInfo.lv;
         _loc2_.baseId = playerInfo.baseInfo.npcId;
         _loc2_.disID = playerInfo.baseInfo.dist;
         _loc2_.gmtype = playerInfo.baseInfo.gmType;
         _loc2_.vipInfoVo = VipUtils.vipInfoVo(playerInfo.baseInfo);
         setTimeout(showModuel,0,_loc2_);
         ModuleMgr.ins.showModule(96200,_loc2_);
      }
      
      private function showModuel(param1:Object) : void
      {
         ObserverMgr.ins.sendNotice("notice_refresh_module_see_player_data",param1);
      }
   }
}
