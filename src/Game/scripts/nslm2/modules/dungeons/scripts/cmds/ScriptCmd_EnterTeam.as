package nslm2.modules.dungeons.scripts.cmds
{
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import nslm2.modules.fightPlayer.UnitView;
   import flash.geom.Point;
   
   public class ScriptCmd_EnterTeam extends ScriptCmdBase
   {
       
      
      private var unitArr:Array;
      
      private var runArr:Array;
      
      private var runHandlerVo:TimerHandlerVo;
      
      public function ScriptCmd_EnterTeam()
      {
         runArr = [];
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         var _loc2_:* = null;
         super.onStart(param1);
         if(this.module.isBossBattle)
         {
            this.onEnd();
         }
         else
         {
            unitArr = this.findEleArr();
            unitArr.forEach(unit_enterOriEach);
            if(this.vo.id == "side:1" || this.vo.id == "side:3")
            {
               _loc2_ = new ScriptCmd_Camera();
               _loc2_.module = this.module;
               _loc2_.vo.x = this.module.anchorPoi.x;
               _loc2_.vo.speed = 550;
               this.runArr.push(_loc2_);
            }
            runArr.forEach(runArr_onStart);
         }
      }
      
      private function unit_enterOriEach(param1:UnitView, ... rest) : void
      {
         var _loc4_:* = null;
         var _loc3_:Point = param1.vo.oriXY.clone();
         _loc3_.x = _loc3_.x + module.anchorPoi.x;
         _loc3_.y = _loc3_.y + module.anchorPoi.y;
         if(param1.vo.hp != 0 && !param1.vo.xy.equals(_loc3_))
         {
            _loc4_ = new ScriptCmd_MoveTo();
            _loc4_.module = this.module;
            _loc4_.vo.id = param1.vo.id;
            _loc4_.vo.x = _loc3_.x;
            _loc4_.vo.y = _loc3_.y;
            _loc4_.vo.speed = 550;
            this.runArr.push(_loc4_);
         }
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         runHandlerVo = param1;
         runArr = runArr.filter(runArr_onStep);
         if(this.runArr.length == 0)
         {
            this.onEnd();
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
   }
}
