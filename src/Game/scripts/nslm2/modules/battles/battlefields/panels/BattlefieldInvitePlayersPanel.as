package nslm2.modules.battles.battlefields.panels
{
   import game.ui.battlefield.BattlefieldTeam.panel.BattlefieldInvitePlayersPanelUI;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import morn.core.components.Button;
   import nslm2.modules.battles.battlefields.service.BattlefieldService;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import morn.customs.expands.MornExpandUtil;
   
   public class BattlefieldInvitePlayersPanel extends BattlefieldInvitePlayersPanelUI
   {
       
      
      private var _textRefreshCtrl:TextCDCtrlS2;
      
      public function BattlefieldInvitePlayersPanel()
      {
         super();
         this.tab_players.selectHandler = onTabChanged;
         this.pageBar.bindList(this.list_players);
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         switchEventListeners(true);
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldPlayersReady",onPlayersReady);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldPlayersReady",onPlayersReady);
         }
      }
      
      private function onPlayersReady(param1:MzEvent) : void
      {
         onTabChanged(this.tab_players.selectedIndex);
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_refresh === _loc2_)
         {
            BattlefieldService.ins.getPlayersList();
            this.btn_refresh.disabled = true;
            _textRefreshCtrl = new TextCDCtrlS2(this.btn_refresh.btnLabel,textCdFormat,textCplFunc);
            this.parts.push(new TextCDCtrlS2(this.btn_refresh.btnLabel,textCdFormat,textCplFunc));
            _textRefreshCtrl.start(ServerTimer.ins.second + 5);
         }
      }
      
      private function textCdFormat(param1:int) : String
      {
         param1 = param1 < 0?0:param1;
         return LocaleMgr.ins.getStr(30610021) + "(" + param1 + LocaleMgr.ins.getStr(999000019) + ")";
      }
      
      private function textCplFunc() : void
      {
         this.btn_refresh.disabled = false;
         this.btn_refresh.label = LocaleMgr.ins.getStr(30610021);
         if(_textRefreshCtrl)
         {
            _textRefreshCtrl.dispose();
            _textRefreshCtrl = null;
         }
      }
      
      public function get pageBar() : IPageBar
      {
         return pageBarUI as IPageBar;
      }
      
      public function show() : void
      {
         this.tab_players.selectedIndex = 0;
      }
      
      private function onTabChanged(param1:int) : void
      {
         switch(int(param1))
         {
            case 0:
               this.list_players.dataSource = BattlefieldModel.ins.friendsList;
               break;
            case 1:
               this.list_players.dataSource = BattlefieldModel.ins.familyMemList;
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
