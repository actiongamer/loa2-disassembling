package nslm2.modules.funnies.teamGuajiScenes.subpalaceBoss
{
   import nslm2.modules.scenes.ctrls.SceneNpcCtrlBase;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import flash.events.Event;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import proto.GuajiBossFightStartRes;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.MathUtil;
   import flash.geom.Point;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcGuajiVo;
   import nslm2.common.model.PlayerModel;
   
   public class SubpalaceBossSceneCtrl extends SceneNpcCtrlBase
   {
       
      
      private var boss:nslm2.modules.funnies.teamGuajiScenes.subpalaceBoss.SubpalaceBossUnit3D;
      
      private var npcGroupId:int;
      
      private var stage_id:int;
      
      public function SubpalaceBossSceneCtrl(param1:nslm2.modules.funnies.teamGuajiScenes.subpalaceBoss.SubpalaceBossUnit3D, param2:int, param3:int)
      {
         this.boss = param1;
         this.autoRo = false;
         this.npcGroupId = param2;
         this.stage_id = param3;
         super();
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         boss.addEventListener("unitMouseTrigger",npc_onMouse);
      }
      
      private function onAttackBoss(param1:Event) : void
      {
         TeamGuajiService.ins.requestChallengBoss(killBoss,fightError);
      }
      
      private function killBoss(param1:GuajiBossFightStartRes) : void
      {
         var _loc2_:SubpalaceBossDungeonVo = new SubpalaceBossDungeonVo(stage_id,npcGroupId);
         ModuleMgr.ins.showModule(41215,{
            "vo":_loc2_,
            "res":param1
         });
      }
      
      override protected function npc_onMouse(... rest) : void
      {
         var _loc2_:* = null;
         if(scene.focusNpcCtrl)
         {
            ObserverMgr.ins.sendNotice("MSG_NPC_FUNC_CLICK_OHTER");
         }
         else
         {
            _loc2_ = MathUtil.nextPoint(this.boss.pos2d,MathUtil.roWith2Point(boss.pos2d,scene.playerHero.pos2d),120);
            scene.playerHero.runTo(_loc2_.x,_loc2_.y,runHandler);
         }
      }
      
      private function fightError() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(41210114));
      }
      
      override protected function runHandler() : void
      {
         var _loc1_:StcGuajiVo = StcMgr.ins.getGuajiVo(TeamGuajiService.ins.sceneInfo.curGuajiId);
         if(PlayerModel.ins.level < _loc1_.boss_lv_limit)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(41210812,[_loc1_.boss_lv_limit]));
            AlertUtil.lackLevel(_loc1_.boss_lv_limit);
            return;
         }
         TeamGuajiService.ins.requestChallengBoss(killBoss,fightError);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
