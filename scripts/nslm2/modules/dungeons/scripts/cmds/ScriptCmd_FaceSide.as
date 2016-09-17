package nslm2.modules.dungeons.scripts.cmds
{
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import nslm2.modules.fightPlayer.UnitView;
   
   public class ScriptCmd_FaceSide extends ScriptCmdBase
   {
       
      
      public function ScriptCmd_FaceSide()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         super.onStart(param1);
         var _loc3_:Array = this.findEleArr();
         var _loc4_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc3_[_loc5_];
            _loc2_.setRotation(this.countRotation(),true);
            _loc5_++;
         }
         this.vo.time = 500;
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         super.onStep(param1);
         this.checkEnd();
      }
   }
}
