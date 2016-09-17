package nslm2.modules.dungeons.scripts.cmds
{
   import flash.display.MovieClip;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import com.mz.core.logging.logs.LackAssetsFatal;
   import nslm2.utils.RTools;
   import flash.events.Event;
   
   public class ScriptCmd_Effect2d extends ScriptCmdBase
   {
       
      
      private var mc_url:String;
      
      private var mc:MovieClip;
      
      private var loop:int;
      
      public function ScriptCmd_Effect2d()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
         mc = module.getDisplay2DById(this.vo.tempId) as MovieClip;
         if(mc != null)
         {
            this.startPlay();
         }
         else
         {
            mc_url = "effect2d/" + this.vo.url + ".swf";
            ResMgr.ins.load(14,mc_url,load_onCpl);
         }
      }
      
      private function load_onCpl(param1:String, param2:MovieClip) : void
      {
         if(param2 == null)
         {
            return;
            §§push(new LackAssetsFatal(this,param1));
         }
         else
         {
            ResMgr.ins.delRes(mc_url);
            mc = param2;
            this.addEvents(true);
            module.addDisplay2D(this.vo.tempId,mc);
            this.startPlay();
            return;
         }
      }
      
      private function startPlay() : void
      {
         mc.x = this.vo.x;
         mc.y = this.vo.y;
         if(this.vo.from == 0)
         {
            this.vo.from = 1;
         }
         if(this.vo.to == 0)
         {
            this.vo.to = mc.totalFrames;
         }
         mc.gotoAndPlay(this.vo.from);
         if(this.vo.frameRate == 0)
         {
            this.vo.frameRate = 60;
         }
         App.timer.doLoop(RTools.frameRateToMs(this.vo.frameRate),this.onLoop,true);
      }
      
      private function onLoop(... rest) : void
      {
         var _loc2_:int = mc.currentFrame;
         if(_loc2_ >= this.vo.to)
         {
            loop = Number(loop) + 1;
            if(loop >= this.vo.loop)
            {
               if(this.vo.hasButton)
               {
                  this.stop();
               }
               else
               {
                  mc.gotoAndStop(_loc2_);
                  this.onEnd();
                  return;
               }
            }
            else
            {
               _loc2_ = vo.from;
            }
         }
         else
         {
            _loc2_++;
         }
         mc.gotoAndStop(_loc2_);
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
      }
      
      public function stop() : void
      {
         App.timer.clearTimer(this.onLoop);
      }
      
      private function mc_onEnd(param1:Event) : void
      {
         this.onEnd();
      }
      
      override public function onEnd() : void
      {
         stop();
         if(mc)
         {
            this.addEvents(false);
         }
         super.onEnd();
      }
      
      private function addEvents(param1:Boolean) : void
      {
         if(param1)
         {
            mc.addEventListener("end",mc_onEnd);
         }
         else
         {
            mc.removeEventListener("end",mc_onEnd);
         }
      }
   }
}
