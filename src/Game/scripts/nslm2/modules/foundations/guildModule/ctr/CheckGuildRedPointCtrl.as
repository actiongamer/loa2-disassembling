package nslm2.modules.foundations.guildModule.ctr
{
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   
   public class CheckGuildRedPointCtrl implements IObserver
   {
      
      private static var _ins:nslm2.modules.foundations.guildModule.ctr.CheckGuildRedPointCtrl;
       
      
      public var hasDonateReward:Boolean;
      
      public var hasDungeonTime:Boolean;
      
      public var hasShardDonate:Boolean;
      
      private var guildModel:GuildModel;
      
      public function CheckGuildRedPointCtrl()
      {
         guildModel = GuildModel.ins;
         super();
         ObserverMgr.ins.regObserver(this);
         checkGuildDungeonCnt();
      }
      
      public static function get ins() : nslm2.modules.foundations.guildModule.ctr.CheckGuildRedPointCtrl
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.guildModule.ctr.CheckGuildRedPointCtrl();
         }
         return _ins;
      }
      
      public function initGuildInfo() : void
      {
         if(PlayerModel.ins.playerInfo.familyId)
         {
            GuildServiceHandler.ins.reqGuildinfo();
         }
      }
      
      public function checkDonateRewardStatus() : void
      {
         hasDonateReward = guildModel.hasDonateReward;
         updateRedPointStatus();
      }
      
      public function checkShardDonateStatus() : void
      {
         hasShardDonate = guildModel.panelRes.ply.receiveList.length > 0;
         updateRedPointStatus();
      }
      
      private function checkGuildDungeonCnt() : void
      {
         hasDungeonTime = NpcFuncService.ins.getVo(40720).count;
         updateRedPointStatus();
      }
      
      private function updateRedPointStatus() : void
      {
         if(hasDonateReward || hasDungeonTime || hasShardDonate)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(40700,true));
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(40700,false));
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["guild_notice_update_donate_data","guild_notice_update_guild_info","MSG_NPC_FUNC_VO_CHANGE","GUILD_NOTICE_UPDATE_HERO_SHARD_PANEL"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("guild_notice_update_guild_info" !== _loc3_)
         {
            if("guild_notice_update_donate_data" !== _loc3_)
            {
               if("MSG_NPC_FUNC_VO_CHANGE" !== _loc3_)
               {
                  if("GUILD_NOTICE_UPDATE_HERO_SHARD_PANEL" === _loc3_)
                  {
                     checkShardDonateStatus();
                  }
               }
               else if(param2 == 40720)
               {
                  checkGuildDungeonCnt();
               }
            }
            else
            {
               checkDonateRewardStatus();
            }
         }
         else
         {
            GuildServiceHandler.ins.getDonateInfo();
         }
      }
   }
}
