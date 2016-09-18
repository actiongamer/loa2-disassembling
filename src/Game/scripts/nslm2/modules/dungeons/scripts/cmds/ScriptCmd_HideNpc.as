package nslm2.modules.dungeons.scripts.cmds
{
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import nslm2.modules.fightPlayer.UnitView;
   
   public class ScriptCmd_HideNpc extends ScriptCmdBase
   {
       
      
      private var unitArr:Array;
      
      public function ScriptCmd_HideNpc()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
         unitArr = this.findEleArr();
         this.setVisible(false);
         this.onEnd();
      }
      
      protected function setVisible(param1:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = unitArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = unitArr[_loc4_];
            _loc2_.visible = param1;
            _loc4_++;
         }
      }
   }
}
