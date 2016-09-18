package nslm2.modules.dungeons.scripts.cmds
{
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import com.mz.core.utils2.ShakeUtil;
   import com.mz.core.mgrs.UIMgr;
   
   public class ScriptCmd_Shake extends ScriptCmdBase
   {
       
      
      public function ScriptCmd_Shake()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
         ShakeUtil.shake(false,UIMgr.root3D,this.vo.kind,this.vo.frequency,this.vo.range,this.vo.duration);
         ShakeUtil.shake(true,UIMgr.layer2D,this.vo.kind,this.vo.frequency,this.vo.range,this.vo.duration);
         this.vo.time = this.vo.frequency * this.vo.duration;
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         super.onStep(param1);
         this.checkEnd();
      }
   }
}
