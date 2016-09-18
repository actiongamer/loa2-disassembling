package nslm2.modules.battles.battlefields.ctrls
{
   import nslm2.modules.scenes.commons.ScenePlayer3D;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.utils.Uint64Util;
   import proto.BgStagePlayerInfo;
   import flash.events.Event;
   import nslm2.mgrs.MouseIconManager;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.battles.battlefields.vos.BattlefieldGatherVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import com.mz.core.utils.MathUtil;
   import flash.geom.Point;
   import nslm2.modules.battles.battlefields.service.BattlefieldBattleService;
   
   public class BattlefieldEnemyCtrl extends BattlefieldPlayerBaseCtrl
   {
       
      
      public function BattlefieldEnemyCtrl()
      {
         super();
      }
      
      override public function bind(param1:ScenePlayer3D) : BattlefieldPlayerBaseCtrl
      {
         player = param1;
         player.addEventListener("unitMouseClick",avatar_onClick);
         player.addEventListener("unitMouseOver",avatar_mouseOver3D);
         player.addEventListener("unitMouseOut",avatar_mouseOut3D);
         player.overMethodEnabled = true;
         player.overMethodColor = 16723968;
         var _loc2_:BgStagePlayerInfo = BattlefieldModel.ins.bgStagePlayers.getValue(Uint64Util.toString(player.roleId));
         showDeathBuff(_loc2_.conDeathNum);
         showNoviceBuff(_loc2_.noviceBuffLayer);
         bgStagePlayerInfo = BattlefieldModel.ins.bgStagePlayers.getValue(Uint64Util.toString(player.roleId));
         this.showHpBar(_loc2_);
         this.player.tag3DVBox.showBattlefieldSide(_loc2_.side);
         return this;
      }
      
      override protected function get hpBarSkin() : String
      {
         return "png.a5.comps.progresses.progress_S3";
      }
      
      protected function avatar_mouseOver3D(param1:Event) : void
      {
         MouseIconManager.ins.addMouseFor3D(player);
         MouseIconManager.ins.showSpecialMouseCursor("mouse_fight_big");
      }
      
      protected function avatar_mouseOut3D(param1:Event) : void
      {
         MouseIconManager.reset();
         MouseIconManager.ins.hideSpecialMouseCursor();
      }
      
      private function avatar_onClick(param1:Event) : void
      {
         var _loc2_:* = null;
         if(BattlefieldModel.ins.isDied)
         {
            return;
         }
         BattlefieldMsgs.ins.dispatchEvent(new MzEvent("msgCryStopGather",new BattlefieldGatherVo(0,PlayerModel.ins.playerInfo.id)));
         if(BattlefieldUtil.canClickTarget(player.pos2d))
         {
            runHandler();
         }
         else
         {
            _loc2_ = MathUtil.nextPoint(this.player.pos2d,MathUtil.roWith2Point(player.pos2d,scene.playerHero.pos2d),100);
            scene.playerHero.runTo(_loc2_.x,_loc2_.y,runHandler);
         }
      }
      
      protected function runHandler() : void
      {
         BattlefieldBattleService.ins.attackOtherPlayer(this.player.roleId,this.player.pos2d);
      }
      
      override public function dispose() : void
      {
         if(player)
         {
            player.removeEventListener("unitMouseClick",avatar_onClick);
            player.removeEventListener("unitMouseOver",avatar_mouseOver3D);
            player.removeEventListener("unitMouseOut",avatar_mouseOut3D);
         }
         super.dispose();
      }
   }
}
