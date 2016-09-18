package nslm2.common.ui.components.comps2d.others
{
   import game.ui.commons.comps.others.TaskAlertRenderS3UI;
   import nslm2.common.compsEffects.SummaryZoomInAndRotationEffCtrl3;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.LocalData;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.events.Event;
   
   public class TaskAlertRenderS3 extends TaskAlertRenderS3UI
   {
       
      
      private var _hideTime:int = 15;
      
      private var _summaryZoomInCtrl:SummaryZoomInAndRotationEffCtrl3;
      
      public var txt_oriX:int;
      
      public var txt_oriY:int;
      
      private var oldSizeY:int;
      
      public function TaskAlertRenderS3()
      {
         super();
         this.txt_oriX = this.txt_content.x;
         this.txt_oriY = this.txt_content.y;
         this.mouseEvent = false;
      }
      
      public function show(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc5_:* = false;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         if(param1)
         {
            if(_summaryZoomInCtrl == null)
            {
               _summaryZoomInCtrl = new SummaryZoomInAndRotationEffCtrl3(this,2,4);
               this.parts.push(new SummaryZoomInAndRotationEffCtrl3(this,2,4));
            }
            if(param1 == 41224 && PlayerModel.ins.level >= 30)
            {
               hide();
               return;
            }
            _loc3_ = LocalData.insCurPlayer.load("shopAlertShowPrefix" + param1,0);
            _loc5_ = ServerTimer.ins.second - _loc3_ >= 86400;
            if(_loc5_ == false)
            {
               hide();
               return;
            }
            LocalData.insCurPlayer.save("shopAlertShowPrefix" + param1,ServerTimer.ins.second);
            this.txt_content.text = LocaleMgr.ins.getStr(41300000 + param1);
            oldSizeY = this.txt_content.height;
            _loc2_ = this.txt_content.textWidth + 4;
            _loc4_ = this.txt_content.height + 0;
            this.box_txt.width = Math.max(165,_loc2_ + txt_oriX * 2);
            this.box_txt.height = Math.max(64,_loc4_ + txt_oriY * 2);
            this.img_bg.width = this.box_txt.width;
            this.img_bg.height = this.box_txt.height;
            this.txt_content.x = (this.box_txt.width - _loc2_) / 2;
            this.txt_content.y = 106 - _loc4_;
            this.addEventListener("enterFrame",onResizeTxt);
            TimerManager.ins.doOnce(_hideTime * 1000,hide);
         }
         else
         {
            hide();
         }
      }
      
      private function onResizeTxt(param1:Event) : void
      {
         if(this.parent == null)
         {
            return;
         }
         if(oldSizeY == this.txt_content.height)
         {
            return;
         }
         oldSizeY = this.txt_content.height;
         var _loc2_:int = this.txt_content.textWidth + 4;
         var _loc3_:int = this.txt_content.height + 0;
         this.box_txt.width = Math.max(165,_loc2_ + txt_oriX * 2);
         this.box_txt.height = Math.max(64,_loc3_ + txt_oriY * 2);
         this.img_bg.width = this.box_txt.width;
         this.img_bg.height = this.box_txt.height;
         this.txt_content.x = (this.box_txt.width - _loc2_) / 2;
         this.txt_content.y = 106 - _loc3_;
      }
      
      public function hide() : void
      {
         if(_summaryZoomInCtrl)
         {
            _summaryZoomInCtrl.dispose();
            _summaryZoomInCtrl = null;
         }
         this.visible = false;
         this.removeEventListener("resize",onResizeTxt);
      }
   }
}
