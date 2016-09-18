package nslm2.modules.battles.PeakSports.control
{
   import nslm2.modules.scenes.ctrls.SceneCtrlBase;
   import nslm2.modules.scenes.commons.ScenePlayer3D;
   import proto.BkStagePlayerInfo;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import nslm2.utils.Uint64Util;
   import flash.events.Event;
   import nslm2.modules.battles.PeakSports.model.PeakFlagModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.modules.battles.PeakSports.type.PeakSportsMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.battles.PeakSports.model.vos.PeakSportsPlayerDiedVo;
   import com.netease.protobuf.UInt64;
   import proto.BkSceneMoveNotify;
   import nslm2.common.model.PlayerModel;
   import flash.geom.Point;
   
   public class PeakSportsPlayerBaseControl extends SceneCtrlBase
   {
       
      
      public var player:ScenePlayer3D;
      
      protected var bkStagePlayerInfo:BkStagePlayerInfo;
      
      public function PeakSportsPlayerBaseControl()
      {
         super();
      }
      
      public function bind(param1:ScenePlayer3D) : PeakSportsPlayerBaseControl
      {
         player = param1;
         player.addEventListener("EVENT_CHNAGE_SPEED",speedChangeHandler);
         bkStagePlayerInfo = PeakSportsModel.ins.bkStagePlayers.getValue(Uint64Util.toString(player.roleId));
         showHpBar(bkStagePlayerInfo);
         player.tag3DVBox.showPeakSportsSide(bkStagePlayerInfo.side);
         return this;
      }
      
      protected function speedChangeHandler(param1:Event) : void
      {
         var _loc2_:Array = PeakFlagModel.ins.flagOwnerIdArr;
         if(_loc2_.indexOf(player.roleId.toString()) >= 0)
         {
            this.player.moveSpeed = DefindConsts.MOVE_SPEED_DEFINE_BG_FLAG;
         }
      }
      
      public function showHpBar(param1:BkStagePlayerInfo) : void
      {
         this.player.tag3DVBox.showHpBar(param1.hpPercent / 100,hpBarSkin);
      }
      
      protected function get hpBarSkin() : String
      {
         return "png.a5.comps.progresses.progress_S13";
      }
      
      public function initScene(param1:Scene45Base) : PeakSportsPlayerBaseControl
      {
         this.init(param1);
         switchEventListeners(true);
         return this;
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            PeakSportsMsgs.ins.addEventListener("msgFightPlayerDied",onDie);
            PeakSportsMsgs.ins.addEventListener("msgFightPlayerRevived",onRevive);
            PeakSportsMsgs.ins.addEventListener("msgFightPlayerPosChanged",onPosChanged);
            PeakSportsMsgs.ins.addEventListener("msgFightHpChanged",onHpChanged);
            PeakSportsMsgs.ins.addEventListener("msgFightPlayerLeave",onLeave);
         }
         else
         {
            PeakSportsMsgs.ins.removeEventListener("msgFightPlayerDied",onDie);
            PeakSportsMsgs.ins.removeEventListener("msgFightPlayerRevived",onRevive);
            PeakSportsMsgs.ins.removeEventListener("msgFightPlayerPosChanged",onPosChanged);
            PeakSportsMsgs.ins.removeEventListener("msgFightHpChanged",onHpChanged);
            PeakSportsMsgs.ins.removeEventListener("msgFightPlayerLeave",onLeave);
         }
      }
      
      protected function onDie(param1:MzEvent) : void
      {
         var _loc2_:PeakSportsPlayerDiedVo = param1.data as PeakSportsPlayerDiedVo;
         if(Uint64Util.equal(_loc2_.playerId,player.roleId))
         {
            player.visible = false;
         }
      }
      
      protected function onRevive(param1:MzEvent) : void
      {
         var _loc2_:UInt64 = param1.data as UInt64;
         if(Uint64Util.equal(_loc2_,player.roleId))
         {
            player.visible = true;
            player.tag3DVBox.showHpBar(1,hpBarSkin);
         }
      }
      
      protected function onPosChanged(param1:MzEvent) : void
      {
         var _loc2_:BkSceneMoveNotify = param1.data;
         if(Uint64Util.equal(player.roleId,_loc2_.id))
         {
            if(PlayerModel.ins.isCurPlayer(_loc2_.id))
            {
               if(_loc2_.legal == false)
               {
                  player.stopRun();
                  player.pos2d = new Point(_loc2_.x,_loc2_.y);
               }
            }
            else
            {
               player.runTo(_loc2_.x,_loc2_.y);
            }
         }
      }
      
      protected function onHpChanged(param1:MzEvent) : void
      {
         var _loc2_:BkStagePlayerInfo = param1.data as BkStagePlayerInfo;
         if(Uint64Util.equal(_loc2_.playerInfo.baseInfo.id,player.roleId))
         {
            player.tag3DVBox.showHpBar(_loc2_.hpPercent / 100,hpBarSkin);
         }
      }
      
      protected function onLeave(param1:MzEvent) : void
      {
         var _loc2_:UInt64 = param1.data as UInt64;
         if(Uint64Util.equal(player.roleId,_loc2_))
         {
            this.scene.removeOtherRole(_loc2_);
            this.dispose();
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         player = null;
         bkStagePlayerInfo = null;
         super.dispose();
      }
   }
}
