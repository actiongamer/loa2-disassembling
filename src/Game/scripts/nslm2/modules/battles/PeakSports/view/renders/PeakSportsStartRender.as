package nslm2.modules.battles.PeakSports.view.renders
{
   import game.ui.peakSports.render.PeakSportsStartRenderUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import nslm2.modules.battles.PeakSports.type.PeakSportsTempType;
   
   public class PeakSportsStartRender extends PeakSportsStartRenderUI
   {
       
      
      private var _cplHandler;
      
      private var _textCDCtrl:TextCDCtrlS2;
      
      private var _textCDCtrlAutoEnter:TextCDCtrlS2;
      
      public function PeakSportsStartRender(param1:* = null)
      {
         super();
         _cplHandler = param1;
         _textCDCtrl = new TextCDCtrlS2(this.txt_timer,textCDFormat,textCDCpl);
         this.parts.push(new TextCDCtrlS2(this.txt_timer,textCDFormat,textCDCpl));
         _textCDCtrl.start(PeakSportsModel.ins.startStamp + int(PeakSportsTempType.BK_CONFIRM_TIME));
         var _loc2_:String = LocaleMgr.ins.getStr(999600100);
         this.txt_alert.text = LocaleMgr.ins.getStr(999600024,[_loc2_]);
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(999600034,[TimeUtils.hisColonFullAddZero(param1)]);
      }
      
      private function textCDCpl() : void
      {
         if(_cplHandler)
         {
            Handler.execute(_cplHandler);
         }
         ModuleMgr.ins.closeModule(10100);
      }
   }
}
