package nslm2.modules.scenes.ctrls
{
   import flash.geom.Point;
   import com.greensock.TweenLite;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.scenes.commons.SceneModel;
   import proto.CrossSceneMoveReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.PlayerMoveReq;
   import away3d.events.MouseEvent3D;
   import com.mz.core.mgrs.ObserverMgr;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import org.specter3d.display.particle.SpecterEffect;
   import nslm2.utils.TransformUtil;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import com.mz.core.event.ChangeValueEvent;
   import nslm2.modules.scenes.commons.SceneUnit3D;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class ScenePlayerMoveCtrl extends SceneCtrlBase
   {
       
      
      public var needSendMsg:Boolean = true;
      
      private var lastSendXY:Point;
      
      private var _tweenCamera:TweenLite;
      
      private var aimPoi:Point;
      
      private var _isDragBool:Boolean = false;
      
      private var _dragLookAtPoint:Point;
      
      private var _mouseDownPoint:Point;
      
      public function ScenePlayerMoveCtrl()
      {
         lastSendXY = new Point(0,0);
         super();
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         this.switchEventListeners(true);
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            TimerManager.ins.doLoop(1000,sendPos);
            this.scene.multiBgLayer.addEventListener("mouseDown3d",img3d_onMouseDown);
            this.scene.multiBgLayer.addEventListener("mouseUp3d",img3d_onMouseUp);
            this.scene.multiBgLayer.addEventListener("mouseMove3d",img3d_onMouseMove);
            this.scene.playerHero.addEventListener("changeValue",playerHeroChange);
         }
         else
         {
            TimerManager.ins.clearTimer(sendPos);
            this.scene.multiBgLayer.removeEventListener("mouseDown3d",img3d_onMouseDown);
            this.scene.multiBgLayer.removeEventListener("mouseUp3d",img3d_onMouseUp);
            this.scene.multiBgLayer.removeEventListener("mouseMove3d",img3d_onMouseMove);
            this.scene.playerHero.removeEventListener("changeValue",playerHeroChange);
         }
      }
      
      private function sendPos() : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(!needSendMsg)
         {
            TimerManager.ins.clearTimer(this.sendPos);
            return;
         }
         var _loc1_:Point = scene.playerHero.pos2d;
         if(this.lastSendXY.equals(_loc1_) == false)
         {
            SceneModel.ins.playerRole.x = _loc1_.x;
            SceneModel.ins.playerRole.y = _loc1_.y;
            if(SceneModel.ins.isCrossScene)
            {
               _loc3_ = new CrossSceneMoveReq();
               _loc3_.x = _loc1_.x;
               _loc3_.y = _loc1_.y;
               ServerEngine.ins.send(4300,_loc3_);
            }
            else
            {
               _loc2_ = new PlayerMoveReq();
               _loc2_.x = _loc1_.x;
               _loc2_.y = _loc1_.y;
               ServerEngine.ins.send(7000,_loc2_);
            }
            this.lastSendXY = _loc1_;
         }
      }
      
      private function img3d_onMouseDown(param1:MouseEvent3D) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(scene.isDragBool)
         {
            _dragLookAtPoint = scene.lookAtPos2d;
            _mouseDownPoint = new Point(param1.screenX,param1.screenY);
            _isDragBool = true;
            App.stage.addEventListener("mouseUp",stageMouseUp);
            App.stage.addEventListener("focusOut",stageFocusOut);
            return;
         }
         if(this.isActived == false)
         {
            return;
         }
         if(scene.focusNpcCtrl)
         {
            ObserverMgr.ins.sendNotice("MSG_NPC_FUNC_CLICK_OHTER");
         }
         else
         {
            aimPoi = scene.lookAtPos2d;
            _loc4_ = new Point(param1.screenX - AppGlobalContext.stage3d.width / 2 + aimPoi.x,param1.screenY - AppGlobalContext.stage3d.height / 2 + aimPoi.y);
            _loc3_ = scene.playerHero.runTo(_loc4_.x,_loc4_.y);
            if(_loc3_ && _loc3_.length > 0)
            {
               _loc2_ = EffectManager.createEffect(Effect3DUtils.getUrlBySid(104),true,scene.avatarLayer);
               _loc2_.scaleAll = 1.6;
               _loc2_.position = TransformUtil.tran2DTo3DByPoi(_loc3_[_loc3_.length - 1]);
               ObserverMgr.ins.sendNotice("msg_player_hero_run",_loc3_);
            }
         }
      }
      
      protected function stageFocusOut(param1:FocusEvent) : void
      {
         App.stage.removeEventListener("mouseUp",stageMouseUp);
         App.stage.removeEventListener("focusOut",stageFocusOut);
         _isDragBool = false;
      }
      
      protected function stageMouseUp(param1:MouseEvent) : void
      {
         App.stage.removeEventListener("mouseUp",stageMouseUp);
         App.stage.removeEventListener("focusOut",stageFocusOut);
         _isDragBool = false;
      }
      
      protected function img3d_onMouseUp(param1:MouseEvent3D) : void
      {
         _isDragBool = false;
      }
      
      protected function img3d_onMouseMove(param1:MouseEvent3D) : void
      {
         var _loc2_:* = null;
         if(_isDragBool)
         {
            _loc2_ = _dragLookAtPoint.subtract(new Point(param1.screenX - _mouseDownPoint.x,param1.screenY - _mouseDownPoint.y));
            scene.lookAtPos2d = _loc2_;
         }
      }
      
      private function playerHeroChange(param1:ChangeValueEvent) : void
      {
         if(this.isActived == false)
         {
            return;
         }
         var _loc3_:SceneUnit3D = param1.currentTarget as SceneUnit3D;
         aimPoi = _loc3_.pos2d;
         var _loc2_:Boolean = false;
         if(_loc2_)
         {
            TimerManager.ins.doFrameLoop(1,this.cameraOnLoop);
         }
         else
         {
            scene.lookAtPos2d = aimPoi.add(DefindConsts.SCENE45_CUR_OFFSET);
         }
      }
      
      private function cameraOnLoop() : void
      {
         var _loc1_:* = NaN;
         if(aimPoi)
         {
            if(aimPoi.subtract(scene.lookAtPos2d).length < 2)
            {
               scene.lookAtPos2d = aimPoi;
               aimPoi = null;
               TimerManager.ins.clearTimer(this.cameraOnLoop);
            }
            else
            {
               _loc1_ = 0.08;
               scene.lookAtPos2d = new Point((aimPoi.x - scene.lookAtPos2d.x) * _loc1_ + scene.lookAtPos2d.x,(aimPoi.y - scene.lookAtPos2d.y) * _loc1_ + scene.lookAtPos2d.y);
            }
         }
      }
      
      override public function set isActived(param1:Boolean) : void
      {
         .super.isActived = param1;
         if(isActived == false && aimPoi)
         {
            scene.lookAtPos2d = aimPoi;
            aimPoi = null;
         }
      }
      
      override public function dispose() : void
      {
         if(_tweenCamera != null)
         {
            _tweenCamera.kill();
            _tweenCamera = null;
         }
         TimerManager.ins.clearTimer(this.cameraOnLoop);
         this.switchEventListeners(false);
         super.dispose();
      }
   }
}
