package nslm2.modules.dungeons.scripts.cmds
{
   import flash.display.Bitmap;
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import flash.display.BitmapData;
   
   public class ScriptCmd_Image extends ScriptCmdBase
   {
       
      
      private var img:Bitmap;
      
      private var loop:int;
      
      public function ScriptCmd_Image()
      {
         super();
      }
      
      override public function getResTaskArr() : Vector.<TaskBase>
      {
         return new <TaskBase>[new GetResTask(1,this.vo.url)];
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         var _loc2_:* = null;
         super.onStart(param1);
         if(this.vo.scaleX == 0)
         {
            this.vo.scaleX = 100;
         }
         if(this.vo.scaleY == 0)
         {
            this.vo.scaleY = 100;
         }
         img = module.getDisplay2DById(this.vo.tempId) as Bitmap;
         if(img != null)
         {
            this.startPlay();
         }
         else
         {
            _loc2_ = ResMgr.ins.getRes(this.vo.url) as BitmapData;
            img = new Bitmap(_loc2_);
            module.addDisplay2D(this.vo.tempId,img);
            this.startPlay();
         }
      }
      
      private function startPlay() : void
      {
         img.x = this.vo.x;
         img.y = this.vo.y;
         img.scaleX = this.vo.scaleX / 100;
         img.scaleY = this.vo.scaleY / 100;
         img.rotation = this.vo.rotation;
         if(this.vo.fade)
         {
            this.img.alpha = 0;
            this.vo.time = this.vo.fade;
         }
         else
         {
            this.onEnd();
         }
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         if(img == null)
         {
            return;
         }
         super.onStep(param1);
         img.alpha = this.runFrame / this.totalFrame;
         this.checkEnd();
      }
      
      override public function onEnd() : void
      {
         if(img)
         {
            img.alpha = 1;
         }
         super.onEnd();
      }
   }
}
