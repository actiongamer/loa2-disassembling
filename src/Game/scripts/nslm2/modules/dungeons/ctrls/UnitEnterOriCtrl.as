package nslm2.modules.dungeons.ctrls
{
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.modules.dungeons.DungeonSceneModule;
   import nslm2.modules.dungeons.scripts.cmds.ScriptCmdBase;
   import nslm2.modules.dungeons.scripts.cmds.ScriptCmd_Camera;
   import nslm2.modules.fightPlayer.UnitView;
   import flash.geom.Point;
   import nslm2.modules.dungeons.scripts.cmds.ScriptCmd_JumpTo;
   import com.mz.core.utils.MathUtil;
   import nslm2.modules.dungeons.scripts.cmds.ScriptCmd_MoveTo;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   
   public class UnitEnterOriCtrl extends TaskBase
   {
       
      
      private var module:DungeonSceneModule;
      
      private var onlyLeft:Boolean;
      
      private var lockCamera:Boolean;
      
      private var onlyScene:Boolean;
      
      private var runArr:Vector.<ScriptCmdBase>;
      
      private var runHandlerVo:TimerHandlerVo;
      
      private var isStart:Boolean = false;
      
      public var moveSceneSpeed:Number = 0;
      
      public function UnitEnterOriCtrl(param1:DungeonSceneModule, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false)
      {
         runArr = new Vector.<ScriptCmdBase>();
         super();
         this.module = param1;
         this.onlyLeft = param2;
         this.lockCamera = param3;
         this.onlyScene = param4;
      }
      
      override public function exec() : void
      {
         var _loc1_:* = null;
         super.exec();
         module.unitViewHash.array.forEach(unitEnterOri);
         if(onlyLeft == false)
         {
            module.rightUnitViewHash.array.forEach(unitEnterOri);
         }
         if(!(lockCamera || this.module.cameraX == this.module.anchorPoi.x))
         {
            _loc1_ = new ScriptCmd_Camera();
            _loc1_.module = this.module;
            _loc1_.vo.x = this.module.anchorPoi.x;
            _loc1_.vo.speed = 550;
            runArr.push(_loc1_);
         }
         App.timer.doFrameLoop(1,onLoop,true,0);
      }
      
      private function unitEnterOri(param1:UnitView, param2:int, ... rest) : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc5_:Point = param1.vo.oriXY.clone();
         _loc5_.x = _loc5_.x + module.anchorPoi.x;
         if(this.onlyScene)
         {
            _loc5_.x = _loc5_.x - this.module.dunGeonBgLayer.configVo.initX;
         }
         _loc5_.y = _loc5_.y + module.anchorPoi.y;
         param1.visible = true;
         if(param1.vo.hp != 0 && !param1.vo.xy.equals(_loc5_))
         {
            if(module.dgVo.isElevator)
            {
               _loc6_ = new ScriptCmd_JumpTo();
               _loc6_.module = this.module;
               if(param1.vo.isAttack == 1)
               {
                  _loc6_.vo.id = "left:" + param2;
               }
               else
               {
                  _loc6_.vo.id = "right:" + param2;
               }
               _loc6_.vo.x = _loc5_.x;
               _loc6_.vo.y = _loc5_.y;
               _loc6_.vo.fade = MathUtil.randomRadii(300,100) + param2 * MathUtil.randomRadii(200,50);
               this.runArr.push(_loc6_);
            }
            else
            {
               _loc4_ = new ScriptCmd_MoveTo();
               _loc4_.module = this.module;
               if(param1.vo.isAttack == 1)
               {
                  _loc4_.vo.id = "left:" + param2;
               }
               else
               {
                  _loc4_.vo.id = "right:" + param2;
               }
               _loc4_.vo.x = _loc5_.x;
               _loc4_.vo.y = _loc5_.y;
               _loc4_.vo.speed = 550;
               this.runArr.push(_loc4_);
            }
         }
      }
      
      private function onLoop(param1:TimerHandlerVo) : void
      {
         runHandlerVo = param1;
         if(this.isStart == false)
         {
            runArr.forEach(runArr_onStart,null);
            isStart = true;
         }
         else
         {
            runArr = runArr.filter(runArr_onStep);
            if(this.runArr.length == 0)
            {
               App.timer.clearTimer(this.onLoop);
               this.onComplete();
            }
         }
      }
      
      private function runArr_onStart(param1:ScriptCmdBase, ... rest) : void
      {
         param1.onStart(runHandlerVo);
      }
      
      private function runArr_onStep(param1:ScriptCmdBase, ... rest) : Boolean
      {
         param1.onStep(this.runHandlerVo);
         if(param1._isEnd)
         {
            return false;
         }
         return true;
      }
      
      override public function dispose() : void
      {
         this.runArr = null;
         App.timer.clearTimer(this.onLoop);
      }
   }
}
