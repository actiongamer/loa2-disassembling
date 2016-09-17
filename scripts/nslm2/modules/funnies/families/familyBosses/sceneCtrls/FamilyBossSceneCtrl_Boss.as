package nslm2.modules.funnies.families.familyBosses.sceneCtrls
{
   import nslm2.modules.scenes.ctrls.SceneNpcCtrlBase;
   import nslm2.modules.scenes.commons.SceneUnit3D;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.MathUtil;
   import flash.geom.Point;
   
   public class FamilyBossSceneCtrl_Boss extends SceneNpcCtrlBase
   {
       
      
      private var boss:SceneUnit3D;
      
      public function FamilyBossSceneCtrl_Boss(param1:SceneUnit3D)
      {
         super();
         this.boss = param1;
         this.autoRo = false;
         needScaleScene = false;
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         boss.addEventListener("unitMouseTrigger",npc_onMouse);
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
      
      override protected function runHandler() : void
      {
         super.runHandler();
         var _loc1_:int = MathUtil.disWith2Point(scene.playerHero.pos2d,boss.pos2d);
         if(_loc1_ <= 300)
         {
            ObserverMgr.ins.sendNotice("family_boss_attack_boss",npcRelationId);
         }
      }
      
      override public function dispose() : void
      {
         if(boss)
         {
            boss.dispose();
            this.scene.removeFamilyBoss(boss);
         }
         super.dispose();
      }
   }
}
