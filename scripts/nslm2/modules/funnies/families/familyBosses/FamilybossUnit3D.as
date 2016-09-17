package nslm2.modules.funnies.families.familyBosses
{
   import nslm2.modules.scenes.commons.SceneUnit3D;
   import nslm2.modules.funnies.teamGuajiScenes.BossRandomRun;
   import game.ui.resourceDg.ResTalkUI;
   import nslm2.common.compsEffects.SummaryZoomInEffCtrl2;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.mgrs.MouseIconManager;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.MathUtil;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.Event;
   import nslm2.utils.TransformUtil;
   import flash.geom.Vector3D;
   import com.greensock.TweenLite;
   import com.mz.core.utils.DisplayUtils;
   import away3d.containers.ObjectContainer3D;
   
   public class FamilybossUnit3D extends SceneUnit3D
   {
       
      
      public var bossId:int;
      
      public var playReviveAct:Boolean;
      
      private var randomRunCtr:BossRandomRun;
      
      private var talkBox:ResTalkUI;
      
      private var szc:SummaryZoomInEffCtrl2;
      
      public var sceneBase:Scene45Base;
      
      public function FamilybossUnit3D(param1:ObjectContainer3D = null)
      {
         super(param1);
         overMethodEnabled = true;
         overMethodColor = 16723968;
      }
      
      override protected function setMouseCursorOver() : void
      {
         MouseIconManager.ins.addMouseFor3D(this);
         MouseIconManager.ins.showSpecialMouseCursor("mouse_fight_big");
      }
      
      public function setSummaryView(param1:Boolean = false) : void
      {
         var _loc2_:* = null;
         if(szc)
         {
            szc.dispose();
         }
         if(param1)
         {
            _loc2_ = StcMgr.ins.getNpcGroupVo(bossId).permanent_dialogue;
            if(talkBox == null)
            {
               talkBox = new ResTalkUI();
               this.sceneBase.addChild(talkBox);
            }
            this.talkBox.visible = true;
            talkBox.txt_summary.text = LocaleMgr.ins.getStr(_loc2_);
            szc = new SummaryZoomInEffCtrl2(this.talkBox.bg,MathUtil.random(5,2),5);
            UIMgr.stage.addEventListener("enterFrame",onEF);
         }
         else
         {
            if(this.talkBox)
            {
               this.talkBox.visible = false;
            }
            UIMgr.stage.removeEventListener("enterFrame",onEF);
         }
      }
      
      protected function onEF(param1:Event) : void
      {
         var _loc2_:* = null;
         if(this.talkBox && this.talkBox.stage)
         {
            _loc2_ = TransformUtil.stage3Dto2D(this.tag3DVBox.scenePosition,sceneBase);
            this.talkBox.x = _loc2_.x + 20;
            this.talkBox.y = _loc2_.y;
         }
      }
      
      public function born() : void
      {
         action = "skill_1";
      }
      
      public function revive() : void
      {
         action = "skill_1";
      }
      
      public function dead() : void
      {
         action = "dead";
      }
      
      public function startRamodmRun() : void
      {
         if(!randomRunCtr)
         {
            randomRunCtr = new BossRandomRun(this,80,10);
            randomRunCtr.setOriPos(pos2d.clone());
         }
         var _loc1_:Number = MathUtil.random(0.5,2);
         TweenLite.delayedCall(_loc1_,randomRunCtr.start);
      }
      
      public function stopRandomRun() : void
      {
         if(randomRunCtr)
         {
            randomRunCtr.stop();
         }
      }
      
      override protected function switchActionRun(param1:Boolean) : void
      {
         if(param1)
         {
            if(avatar)
            {
               avatar.action = "run";
            }
         }
         else if(avatar)
         {
            avatar.action = "std_2";
         }
      }
      
      override public function dispose() : void
      {
         if(talkBox)
         {
            DisplayUtils.removeSelf(talkBox);
            talkBox = null;
         }
         if(randomRunCtr)
         {
            TweenLite.killDelayedCallsTo(randomRunCtr.start);
            randomRunCtr.dispose();
            randomRunCtr = null;
         }
         if(szc)
         {
            szc.dispose();
            szc = null;
         }
         sceneBase = null;
         super.dispose();
      }
   }
}
