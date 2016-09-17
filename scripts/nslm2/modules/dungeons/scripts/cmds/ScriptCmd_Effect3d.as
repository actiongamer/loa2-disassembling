package nslm2.modules.dungeons.scripts.cmds
{
   import nslm2.modules.dungeons.scripts.comps.ScriptCmdEffect3DView;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import com.mz.core.logging.Log;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   
   public class ScriptCmd_Effect3d extends ScriptCmdBase
   {
       
      
      private var mc:ScriptCmdEffect3DView;
      
      private var loop:int;
      
      private var mc_url:String;
      
      public function ScriptCmd_Effect3d()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         var _loc2_:* = null;
         super.onStart(param1);
         mc = module.getDisplay3DById(this.vo.tempId);
         if(mc != null)
         {
            this.startPlay();
         }
         else
         {
            _loc2_ = StcMgr.ins.getSpecialEffectVo(vo.stc_special_effect_id);
            if(_loc2_ == null)
            {
               Log.fatal(this,"错误的stc_special_effect_id",vo.stc_special_effect_id);
            }
            else
            {
               mc_url = "particle/" + _loc2_.effect;
               AppGlobalContext.QueueLoader.loadOne(new ResourceVo(mc_url),load_onCpl);
            }
         }
      }
      
      private function load_onCpl() : void
      {
         mc = module.addDisplay3D(this.vo.tempId,mc_url);
         this.startPlay();
      }
      
      private function startPlay() : void
      {
         mc.x = this.vo.x;
         mc.y = this.vo.y;
         if(this.vo.speed > 0)
         {
            mc.eff.playSpeed = this.vo.speed / 1000;
            mc.eff.rotationX = this.vo.rotationX;
            mc.eff.rotationY = this.vo.rotationY;
            mc.eff.rotationZ = this.vo.rotationZ;
         }
         if(this.vo.time > 0)
         {
            App.timer.doOnce(this.vo.time,this.onEnd);
         }
         else
         {
            this.onEnd();
         }
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
      }
   }
}
