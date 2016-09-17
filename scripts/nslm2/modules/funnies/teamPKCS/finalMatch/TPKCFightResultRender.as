package nslm2.modules.funnies.teamPKCS.finalMatch
{
   import game.ui.teamPKCS.finalMatch.TPKCFightResultRenderUI;
   import flash.events.MouseEvent;
   import proto.CteamSimpleReport;
   import proto.CteamArenaFinalReportReq;
   import proto.CteamArenaFinalReportRes;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   
   public class TPKCFightResultRender extends TPKCFightResultRenderUI
   {
       
      
      private var _data:Object;
      
      public function TPKCFightResultRender()
      {
         super();
         this.txt_seereport.addEventListener("click",seeReport_onClick);
         this.txt_seereport.buttonMode = true;
         this.txt_seereport.mouseChildren = false;
      }
      
      private function seeReport_onClick(param1:MouseEvent) : void
      {
         e = param1;
         onReportRet = function(param1:CteamArenaFinalReportRes):void
         {
            ModuleMgr.ins.showOrCloseModule(42007,!!param1?param1.info:[]);
         };
         var repo:CteamSimpleReport = _data.data;
         var req:CteamArenaFinalReportReq = new CteamArenaFinalReportReq();
         req.id = repo.id;
         ServerEngine.ins.send(5410,req,onReportRet);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         _data = param1;
         if(_data)
         {
            _loc2_ = _data.data;
            this.txt_time.text = "[" + _data.time + ":00" + "]";
            if(_loc2_.pos == 1)
            {
               this.txt_info.text = LocaleMgr.ins.getStr(50800101,[_data.index + 1,TextFieldUtil.htmlText2(_loc2_.winName,4827135),TextFieldUtil.htmlText2(_loc2_.loseName,16723968)]);
            }
            else
            {
               this.txt_info.text = LocaleMgr.ins.getStr(50800102,[_data.index + 1,TextFieldUtil.htmlText2(_loc2_.loseName,4827135),TextFieldUtil.htmlText2(_loc2_.winName,16723968)]);
            }
         }
      }
   }
}
