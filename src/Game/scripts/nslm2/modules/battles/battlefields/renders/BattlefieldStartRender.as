package nslm2.modules.battles.battlefields.renders
{
   import game.ui.battlefield.render.BattlefieldStartRenderUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import morn.core.handlers.Handler;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import nslm2.modules.footstones.assistantModules.vos.AssistantBattlefieldSettingVo;
   import nslm2.utils.ServerTimer;
   
   public class BattlefieldStartRender extends BattlefieldStartRenderUI
   {
       
      
      private var _textCDCtrl:TextCDCtrlS2;
      
      private var _textCDCtrlAutoEnter:TextCDCtrlS2;
      
      private var _cplHandler;
      
      public function BattlefieldStartRender(param1:* = null)
      {
         var _loc2_:* = null;
         super();
         _cplHandler = param1;
         _textCDCtrl = new TextCDCtrlS2(this.txt_timer,textCDFormat,textCDCpl);
         this.parts.push(new TextCDCtrlS2(this.txt_timer,textCDFormat,textCDCpl));
         _textCDCtrl.start(BattlefieldModel.ins.startStamp + int(DefindConsts.BG_CONFIRM_TIME));
         if(BattlefieldModel.ins.curBattlefieldId == 1000)
         {
            _loc2_ = LocaleMgr.ins.getStr(50500002);
         }
         else
         {
            _loc2_ = LocaleMgr.ins.getStr(50500003);
         }
         this.txt_alert.text = LocaleMgr.ins.getStr(50500155,[_loc2_]);
         if(AssistantModel.ins.isActingAuto(50500) && (AssistantModel.ins.getSetting(50500) as AssistantBattlefieldSettingVo).autoLineUp)
         {
            _textCDCtrlAutoEnter = new TextCDCtrlS2(this.txt_alert,textCDAutoFormat,textCDAutoCpl);
            this.parts.push(new TextCDCtrlS2(this.txt_alert,textCDAutoFormat,textCDAutoCpl));
            _textCDCtrlAutoEnter.start(Math.min(ServerTimer.ins.second + 5,BattlefieldModel.ins.startStamp + int(DefindConsts.BG_CONFIRM_TIME) - 1));
         }
      }
      
      private function textCDAutoFormat(param1:int) : String
      {
         var _loc2_:* = null;
         if(BattlefieldModel.ins.curBattlefieldId == 1000)
         {
            _loc2_ = LocaleMgr.ins.getStr(50500002);
         }
         else
         {
            _loc2_ = LocaleMgr.ins.getStr(50500003);
         }
         return LocaleMgr.ins.getStr(50500155,[_loc2_]) + LocaleMgr.ins.getStr(60200048,[TimeUtils.hisColonFullAddZero(param1)]);
      }
      
      private function textCDAutoCpl() : void
      {
         if(_cplHandler)
         {
            Handler.execute(_cplHandler);
         }
         txt_timer.text = "";
         BattlefieldUtil.enterBattlefield();
         ModuleMgr.ins.closeModule(10100);
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(50500107,[TimeUtils.hisColonFullAddZero(param1)]);
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
