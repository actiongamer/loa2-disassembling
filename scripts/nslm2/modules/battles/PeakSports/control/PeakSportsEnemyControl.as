package nslm2.modules.battles.PeakSports.control
{
   import nslm2.modules.scenes.commons.ScenePlayer3D;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import nslm2.utils.Uint64Util;
   import flash.events.Event;
   import nslm2.modules.battles.PeakSports.utils.PeakSportsUtil;
   import com.mz.core.utils.MathUtil;
   import flash.geom.Point;
   import nslm2.modules.battles.PeakSports.service.PeakSportsBattleService;
   import nslm2.mgrs.MouseIconManager;
   
   public class PeakSportsEnemyControl extends PeakSportsPlayerBaseControl
   {
       
      
      public function PeakSportsEnemyControl()
      {
         super();
      }
      
      override public function bind(param1:ScenePlayer3D) : PeakSportsPlayerBaseControl
      {
         player = param1;
         player.addEventListener("unitMouseClick",avatar_onClick);
         player.addEventListener("unitMouseOver",avatar_mouseOver3D);
         player.addEventListener("unitMouseOut",avatar_mouseOut3D);
         player.overMethodEnabled = true;
         player.overMethodColor = 16723968;
         bkStagePlayerInfo = PeakSportsModel.ins.bkStagePlayers.getValue(Uint64Util.toString(player.roleId));
         showHpBar(bkStagePlayerInfo);
         player.tag3DVBox.showPeakSportsSide(bkStagePlayerInfo.side);
         return this;
      }
      
      private function avatar_onClick(param1:Event) : void
      {
         var _loc2_:* = null;
         if(PeakSportsModel.ins.isDied)
         {
            return;
         }
         if(PeakSportsUtil.canClickTarget(player.pos2d))
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
         PeakSportsBattleService.ins.attackOtherPlayer(player.roleId,player.pos2d);
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
      
      override protected function get hpBarSkin() : String
      {
         return "png.a5.comps.progresses.progress_S3";
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
