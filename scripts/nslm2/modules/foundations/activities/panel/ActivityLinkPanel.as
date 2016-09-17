package nslm2.modules.foundations.activities.panel
{
   import game.ui.activities.panel.ActivityLinkPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import proto.StaticActivity;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.modules.foundations.activities.service.ActivityService;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import flash.display.BitmapData;
   import morn.core.components.Button;
   import morn.core.utils.URLUtils;
   import morn.customs.expands.MornExpandUtil;
   
   public class ActivityLinkPanel extends ActivityLinkPanelUI implements IViewStackPage
   {
       
      
      private var _mainInfo:StaticActivity;
      
      private var _textCdCtrl:TextCDCtrlS2;
      
      public function ActivityLinkPanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this._textCdCtrl = new TextCDCtrlS2(this.txt_leftTime,textCDFormat,null);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.show();
         this.fadeIn(0,11010);
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         _textCdCtrl.stop();
      }
      
      public function get model() : ActivityModel
      {
         return ActivityModel.ins;
      }
      
      public function get service() : ActivityService
      {
         return ActivityService.ins;
      }
      
      public function show() : void
      {
         _mainInfo = ActivityModel.ins.nowShowActivity;
         _textCdCtrl.start(_mainInfo.endtm);
         this.txt_activityName.text = _mainInfo.name;
         this.txt_activityTime.text = LocaleMgr.ins.getStr(60500002) + TimeUtils.getFullTimeStr(_mainInfo.starttm) + "——" + TimeUtils.getFullTimeStr(_mainInfo.endtm);
         this.txt_rule.text = _mainInfo.notice;
         if(_mainInfo.pictures)
         {
            ResMgr.ins.load(1,_mainInfo.pictures,loadCpl);
         }
      }
      
      private function loadCpl(param1:String, param2:*) : void
      {
         this.img_bg.bitmapData = param2 as BitmapData;
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_urlLink === _loc2_)
         {
            URLUtils.openWindow(_mainInfo.actLink);
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(999000186) + TimeUtils.hisCNWithDay(param1);
      }
   }
}
