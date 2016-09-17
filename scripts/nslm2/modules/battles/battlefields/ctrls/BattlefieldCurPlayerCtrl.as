package nslm2.modules.battles.battlefields.ctrls
{
   import nslm2.modules.battles.battlefields.scene.BattlefieldGatherProgressBar;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import away3d.events.MouseEvent3D;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.PlayerModel;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.battles.battlefields.vos.BattlefieldGatherVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.mgrs.stcMgrs.vos.StcBgresGatherVo;
   import nslm2.utils.TransformUtil;
   import com.mz.core.mgrs.UIMgr;
   import flash.geom.Vector3D;
   import nslm2.utils.Uint64Util;
   
   public class BattlefieldCurPlayerCtrl extends BattlefieldPlayerBaseCtrl
   {
       
      
      public var gatherProgress:BattlefieldGatherProgressBar;
      
      public function BattlefieldCurPlayerCtrl()
      {
         super();
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.scene.multiBgLayer.addEventListener("mouseDown3d",img3d_onMouseDown);
            BattlefieldMsgs.ins.addEventListener("msgCrySelfGathered",onMineGathered);
            BattlefieldMsgs.ins.addEventListener("msgStopRun",onStopRun);
         }
         else
         {
            this.scene.multiBgLayer.removeEventListener("mouseDown3d",img3d_onMouseDown);
            BattlefieldMsgs.ins.removeEventListener("msgCrySelfGathered",onMineGathered);
            BattlefieldMsgs.ins.removeEventListener("msgStopRun",onStopRun);
         }
      }
      
      private function img3d_onMouseDown(param1:MouseEvent3D) : void
      {
         onStopGather(null);
      }
      
      private function onMineGathered(param1:MzEvent) : void
      {
         var _loc2_:int = param1.data as int;
         AlertUtil.float(LocaleMgr.ins.getStr(50500125) + "+" + _loc2_);
      }
      
      private function onStopRun(param1:MzEvent) : void
      {
         if(PlayerModel.ins.isCurPlayer(param1.data as UInt64))
         {
            this.player.stopRun();
         }
      }
      
      override protected function onBeginGather(param1:MzEvent) : void
      {
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:BattlefieldGatherVo = param1.data as BattlefieldGatherVo;
         if(PlayerModel.ins.isCurPlayer(_loc3_.playerId))
         {
            _gathingId = _loc3_.gatherId;
            _loc2_ = StcMgr.ins.getStageNpcRelationVo(_gathingId);
            _loc5_ = StcMgr.ins.getVoByMultiColumnValue("static_bgres_gather",["stage_id","display_npc"],[_loc2_.stage_id,_loc2_.display_npc]);
            if(_loc5_ != null)
            {
               _loc4_ = TransformUtil.stage3Dto2D(this.player.scenePosition,UIMgr.ins.dragLayer);
               gatherProgress.x = _loc4_.x - 100;
               gatherProgress.y = _loc4_.y - 100;
               gatherProgress.show(_loc5_.time_consume);
            }
         }
      }
      
      override protected function onStopGather(param1:MzEvent) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _loc2_ = param1.data as BattlefieldGatherVo;
            if(_loc2_.gatherId != 0 && _gathingId == _loc2_.gatherId && Uint64Util.equal(player.roleId,_loc2_.playerId) || _loc2_.gatherId == 0 && Uint64Util.equal(player.roleId,_loc2_.playerId))
            {
               gatherProgress.stop();
            }
         }
         else
         {
            gatherProgress.stop();
         }
      }
   }
}
