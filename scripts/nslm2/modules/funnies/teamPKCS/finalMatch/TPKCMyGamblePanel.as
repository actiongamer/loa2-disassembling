package nslm2.modules.funnies.teamPKCS.finalMatch
{
   import game.ui.championship.ChampionGambleRecordPanelUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CteamArenaFinalBetInfoRes;
   import proto.CteamArenaFinalBetInfo;
   import nslm2.modules.funnies.teamPKCS.TPKCModel;
   import proto.CteamArenaFinalBetRewardReq;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class TPKCMyGamblePanel extends ChampionGambleRecordPanelUI
   {
       
      
      private var gambleRecArr:Array;
      
      public function TPKCMyGamblePanel()
      {
         super();
         this.list_record.itemRender = TPKCMyGambleRender;
         (pageBar as IPageBar).bindList(list_record);
         btn_getAll.clickHandler = getAllGambleReward;
         this.txt_content.text = LocaleMgr.ins.getStr(50800105);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow();
         this.txt_content.visible = false;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9050403);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         ServerEngine.ins.send(5414,null,getRecord);
      }
      
      private function getRecord(param1:CteamArenaFinalBetInfoRes) : void
      {
         gambleRecArr = [];
         if(param1)
         {
            var _loc4_:int = 0;
            var _loc3_:* = param1.info;
            for each(var _loc2_ in param1.info)
            {
               if(model.getCteamInfo(_loc2_.team))
               {
                  gambleRecArr.push(_loc2_);
               }
            }
            gambleRecArr.sortOn(CteamArenaFinalBetInfo.INDEX.name,16);
         }
         this.list_record.dataSource = gambleRecArr;
         this.list_record.commitMeasure();
         canGetAllBtn();
         super.moduleServerCpl();
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["OPT_TPKC_GET_GAMBLE_REWARD_SUCCESS"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("OPT_TPKC_GET_GAMBLE_REWARD_SUCCESS" === _loc3_)
         {
            canGetAllBtn();
         }
      }
      
      private function canGetAllBtn() : void
      {
         btn_getAll.disabled = true;
         var _loc3_:int = 0;
         var _loc2_:* = gambleRecArr;
         for each(var _loc1_ in gambleRecArr)
         {
            if(!_loc1_.reward && model.isBetWin(_loc1_) == 1)
            {
               btn_getAll.disabled = false;
               return;
            }
         }
      }
      
      private function get model() : TPKCModel
      {
         return TPKCModel.ins;
      }
      
      private function getAllGambleReward() : void
      {
         var _loc1_:CteamArenaFinalBetRewardReq = new CteamArenaFinalBetRewardReq();
         _loc1_.id = 0;
         ServerEngine.ins.send(5415,_loc1_,getRwdCallBack);
      }
      
      private function getRwdCallBack() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(41210045));
         ServerEngine.ins.send(5414,null,getRecord);
      }
   }
}
