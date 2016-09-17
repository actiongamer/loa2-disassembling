package nslm2.modules.dungeons.scripts.cmds
{
   import nslm2.modules.fightPlayer.UnitView;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   
   public class ScriptCmd_CreateUnit extends ScriptCmdBase
   {
       
      
      private var isLoaded:Boolean = false;
      
      public var unitView:UnitView;
      
      public function ScriptCmd_CreateUnit()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         unitView = this.module.createTempUnitByNpcId(int(vo.stc_npc_id),vo.tempId,vo.name,vo.x,vo.y,this.countRotation());
         unitView.vo.isAttack = 0;
         unitView.visible = false;
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         super.onStep(param1);
         if(unitView.isLoaded)
         {
            unitView.visible = true;
            this.onEnd();
         }
      }
   }
}
