package nslm2.common.ui.components.comps2d
{
   import com.mz.core.display.MzSprite;
   import com.mz.core.interFace.IDispose;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.Stc2dSpecialEffectVo;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import flash.display.MovieClip;
   import morn.core.handlers.Handler;
   import flash.events.Event;
   import com.mz.core.utils.DisplayUtils;
   
   public class McS2 extends MzSprite implements IDispose
   {
       
      
      public var sid:int;
      
      public var mcX:int;
      
      public var mcY:int;
      
      public var from:int;
      
      public var to:int;
      
      private var loop:int;
      
      private var _stopAtLastFrame:Boolean;
      
      private var mc_url:String;
      
      private var mc:MovieClip;
      
      private var _startHandler;
      
      public function McS2()
      {
         mc = new MovieClip();
         super();
      }
      
      public static function preload(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:Stc2dSpecialEffectVo = StcMgr.ins.get2dSpecialEffectVo(param1);
         if(_loc3_)
         {
            _loc2_ = StcMgr.ins.get2dSpecialEffectVo(param1).path;
            new GetResTask(14,_loc2_).addHandlers(preload_cpl).exec();
         }
      }
      
      private static function preload_cpl(param1:GetResTask) : void
      {
         var _loc2_:MovieClip = ResMgr.ins.getRes(param1.url) as MovieClip;
         _loc2_.gotoAndStop(1);
      }
      
      public function init(param1:int, param2:int = 0, param3:int = 0, param4:int = 1, param5:int = 0, param6:int = 1) : McS2
      {
         this.sid = param1;
         this.mcX = param2;
         this.mcY = param3;
         this.from = param4;
         this.to = param5;
         if(this.from == 0)
         {
            this.from = 1;
         }
         if(this.to == 0)
         {
            this.to = mc.totalFrames;
         }
         this.loop = param6;
         var _loc7_:Stc2dSpecialEffectVo = StcMgr.ins.get2dSpecialEffectVo(sid);
         new GetResTask(14,_loc7_.path).addHandlers(getEff2d_cpl).exec();
         return this;
      }
      
      public function stopAtLastFrame(param1:Boolean = true) : McS2
      {
         _stopAtLastFrame = true;
         return this;
      }
      
      public function addStartHandler(param1:*) : McS2
      {
         _startHandler = param1;
         return this;
      }
      
      private function getEff2d_cpl(param1:GetResTask) : void
      {
         mc = ResMgr.ins.getRes(param1.url) as MovieClip;
         if(mc)
         {
            this.addChild(mc);
            mc.x = this.mcX;
            mc.y = this.mcY;
            this.addEvents(true);
            if(_stopAtLastFrame)
            {
               this.addEvents(false);
               this.mc.gotoAndStop(this.mc.totalFrames);
            }
            else
            {
               startPlay();
            }
            if(_startHandler)
            {
               Handler.execute(_startHandler);
            }
         }
      }
      
      private function startPlay() : void
      {
         loop = Number(loop) - 1;
         mc.gotoAndPlay(this.from);
      }
      
      private function onFrame(param1:Event) : void
      {
         if(mc && mc.currentFrame == this.to)
         {
            onEnd();
         }
      }
      
      private function mc_onEnd(param1:Event) : void
      {
         this.onEnd();
      }
      
      public function onEnd() : void
      {
         if(loop == 0)
         {
            this.addEvents(false);
            mc.gotoAndStop(this.mc.totalFrames);
         }
         else
         {
            startPlay();
         }
      }
      
      private function addEvents(param1:Boolean) : void
      {
         if(param1)
         {
            mc.addEventListener("enterFrame",onFrame);
            mc.addEventListener("end",mc_onEnd);
         }
         else
         {
            mc.removeEventListener("enterFrame",onFrame);
            mc.removeEventListener("end",mc_onEnd);
         }
      }
      
      override public function dispose() : void
      {
         if(mc)
         {
            this.addEvents(false);
            mc.removeEventListener("enterFrame",onFrame);
            DisplayUtils.removeSelf(mc);
            mc = null;
         }
         super.dispose();
      }
   }
}
