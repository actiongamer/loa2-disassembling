package nslm2.modules.funnies.arenas.mains
{
   import game.ui.arenas.mains.ArenaSigatueModuleUI;
   import nslm2.modules.foundations.alerts.views.SimpleAlert;
   import flash.events.Event;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.arenas.ArenaConsts;
   import mx.utils.StringUtil;
   import nslm2.modules.funnies.arenas.ArenaService;
   import proto.ArenaSetManifestoReq;
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.handlers.Handler;
   import proto.ProtocolStatusRes;
   import nslm2.modules.foundations.AlertUtil;
   import proto.ArenaChangeEnemyRes;
   import nslm2.common.ui.components.comps2d.TextPromptBind;
   
   public class ArenaSigatueModule extends ArenaSigatueModuleUI
   {
       
      
      public function ArenaSigatueModule()
      {
         super();
         this.txt_content.text = ArenaService.ins.infoRes.manifesto;
         this.txt_content.maxChars = ArenaConsts.ins.SIGATUE_WORDS_LIMIT_MAX;
         this.txt_prompt.text = LocaleMgr.ins.getStr(50200023,[ArenaConsts.ins.SIGATUE_WORDS_LIMIT_MIN,ArenaConsts.ins.SIGATUE_WORDS_LIMIT_MAX]);
         this.parts.push(new TextPromptBind(this.txt_content.textField,this.txt_prompt));
         this.txt_content.textField.addEventListener("change",sendText_onChange);
         this.txt_content.addEventListener("enter",onSendText);
         sendText_onChange(null);
      }
      
      override public function setAlert(param1:SimpleAlert) : void
      {
         super.setAlert(param1);
         this.alert.contentYesHandler = onSendText2;
         this.alert.panelBg.titleImgId = 50220;
      }
      
      private function sendText_onChange(param1:Event) : void
      {
         this.txt_tip.text = LocaleMgr.ins.getStr(50200106,[ArenaConsts.ins.SIGATUE_WORDS_LIMIT_MAX - this.txt_content.text.length]);
      }
      
      private function onSendText2() : void
      {
         server_changeSigntue();
      }
      
      private function onSendText(param1:Event) : void
      {
         server_changeSigntue();
      }
      
      private function server_changeSigntue() : void
      {
         var _loc2_:* = null;
         var _loc1_:String = StringUtil.trim(this.txt_content.text);
         if(_loc1_ == ArenaService.ins.infoRes.manifesto)
         {
            this.alert.onNo();
         }
         else
         {
            _loc2_ = new ArenaSetManifestoReq();
            _loc2_.manifesto = _loc1_;
            ServerEngine.ins.send(4035,_loc2_,new Handler(server_setManifesto_cpl,[_loc1_]),server_setManifesto_err);
         }
      }
      
      private function server_setManifesto_err(param1:ProtocolStatusRes) : void
      {
         if(param1.errCode == 300004081)
         {
            AlertUtil.floatErr(LocaleMgr.ins.getStr(param1.errCode,[ArenaConsts.ins.SIGATUE_WORDS_LIMIT_MIN,ArenaConsts.ins.SIGATUE_WORDS_LIMIT_MAX]));
         }
         else
         {
            ServerEngine.ins.doDefaultErr(param1);
         }
      }
      
      private function server_setManifesto_cpl(param1:String, param2:ArenaChangeEnemyRes) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(999000396));
         ArenaService.ins.infoRes.manifesto = param1;
         this.alert.onYes();
      }
   }
}
