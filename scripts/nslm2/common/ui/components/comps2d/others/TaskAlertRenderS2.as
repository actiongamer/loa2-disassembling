package nslm2.common.ui.components.comps2d.others
{
   import game.ui.commons.comps.others.TaskAlertRenderUI;
   import nslm2.common.compsEffects.SummaryZoomInAndRotationEffCtrl3;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcXinshouTipsVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.managers.timerMgrs.TimerManager;
   
   public class TaskAlertRenderS2 extends TaskAlertRenderUI
   {
       
      
      private var _hideTime:int = 15;
      
      private var _summaryZoomInCtrl:SummaryZoomInAndRotationEffCtrl3;
      
      public var txt_oriX:int;
      
      public var txt_oriY:int;
      
      public function TaskAlertRenderS2()
      {
         super();
         _summaryZoomInCtrl = new SummaryZoomInAndRotationEffCtrl3(this,2,4);
         this.parts.push(new SummaryZoomInAndRotationEffCtrl3(this,2,4));
         this.txt_oriX = this.txt_content.x;
         this.txt_oriY = this.txt_content.y;
         this.mouseEvent = false;
      }
      
      public function show(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:StcXinshouTipsVo = StcMgr.ins.getXinshouTipsVo(param1);
         if(_loc2_)
         {
            this.txt_content.text = LocaleMgr.ins.getStr(_loc2_.talk_id);
            _loc3_ = this.txt_content.textWidth + 4;
            _loc4_ = this.txt_content.textHeight + 0;
            this.box_txt.width = Math.max(165,_loc3_ + txt_oriX * 2);
            this.box_txt.height = Math.max(64,_loc4_ + txt_oriY * 2);
            this.img_bg.width = this.box_txt.width;
            this.img_bg.height = this.box_txt.height;
            this.txt_content.x = (this.box_txt.width - _loc3_) / 2;
            this.txt_content.y = (this.box_txt.height - _loc4_) / 2;
            switch(int(_loc2_.direction) - 2)
            {
               case 0:
                  this.img_bg.scaleX = -1;
                  this.img_bg.scaleY = -1;
                  this.img_bg.x = this.box_txt.width;
                  this.img_bg.y = this.box_txt.height;
                  break;
               default:
                  this.img_bg.scaleX = 1;
                  this.img_bg.x = 0;
                  break;
               case 2:
               default:
               default:
               default:
                  this.img_bg.scaleY = -1;
                  this.img_bg.y = this.box_txt.height;
                  break;
               case 6:
                  this.img_bg.scaleX = -1;
                  this.img_bg.x = this.box_txt.width;
            }
            TimerManager.ins.doOnce(_hideTime * 1000,hide);
         }
         else
         {
            hide();
         }
      }
      
      public function hide() : void
      {
         if(_summaryZoomInCtrl)
         {
            _summaryZoomInCtrl.dispose();
            _summaryZoomInCtrl = null;
         }
         this.visible = false;
      }
   }
}
