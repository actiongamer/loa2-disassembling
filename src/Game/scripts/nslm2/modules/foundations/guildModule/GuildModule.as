package nslm2.modules.foundations.guildModule
{
   import game.ui.guildModules.GuildModuleViewUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.foundations.guildModule.view.panel.guildList.GuildListPanel;
   import game.ui.guildModules.GuildDisplayView.GuildDisplayViewUI;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.model.PlayerModel;
   import com.greensock.TweenLite;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.HelpAndRuleParam;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.foundations.AlertUtil;
   import flash.display.DisplayObject;
   import nslm2.modules.foundations.guildModule.view.panel.main.GuildBaseInfoPanel;
   import nslm2.modules.foundations.guildModule.view.panel.memberList.GuildMemberListView;
   import nslm2.modules.foundations.guildModule.view.panel.manage.GuildManageView;
   import nslm2.modules.foundations.guildModule.view.panel.donate.GuildDonatePanel;
   import nslm2.modules.foundations.guildModule.view.panel.log.GuildLogPanel;
   import nslm2.modules.foundations.guildModule.view.panel.rank.GuildRankView;
   import nslm2.modules.foundations.guildModule.view.panel.shardDonate.GuildHeroShardDonatePanel;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   
   public class GuildModule extends GuildModuleViewUI
   {
       
      
      private var viewStack:ViewStack;
      
      private var guildService:GuildServiceHandler;
      
      private var guildModel:GuildModel;
      
      private var guildListPanel:GuildListPanel;
      
      private var guildDisplayView:GuildDisplayViewUI;
      
      private var preTabIndex:int = 0;
      
      public function GuildModule()
      {
         super();
         guildService = GuildServiceHandler.ins;
         guildModel = GuildModel.ins;
         tabBar.labels = [LocaleMgr.ins.getStr(11000801),LocaleMgr.ins.getStr(11000802),LocaleMgr.ins.getStr(11000803),LocaleMgr.ins.getStr(11000804),LocaleMgr.ins.getStr(11000805),LocaleMgr.ins.getStr(11000806),LocaleMgr.ins.getStr(999004011)].join(",");
         tabBar.selectHandler = tabBarSelectHandler;
         FuncOpenAutoCtrl.checkFuncTabNew([0,0,0,0,0,0,900300],tabBar);
         this.moduleFadeInType = 2;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         ObserverMgr.ins.regObserver(this);
         var _loc2_:Boolean = PlayerModel.ins.playerInfo.familyId;
         if(!_loc2_)
         {
            if(!guildDisplayView)
            {
               guildDisplayView = new GuildDisplayViewUI();
               guildDisplayView.x = 14;
               guildDisplayView.y = 41;
               addChild(guildDisplayView);
            }
            img_frame.visible = false;
            tabBar.visible = false;
         }
         else
         {
            tabBar.visible = true;
            tabBar.selectedIndex = 0;
            TweenLite.delayedCall(0.1,showBasePanel);
            guildService.reqGuildinfo();
            guildService.reqMemberList();
            guildService.getAuthorityData();
            guildService.getDonateInfo();
            guildService.reqApplicantList();
            guildService.reqHeroShardPanelInfo();
         }
         hideRedPoint();
         img_help.visible = false;
         this.img_help.addEventListener("click",helpHandler);
         super.preShow(param1);
      }
      
      protected function helpHandler(param1:MouseEvent) : void
      {
         var _loc2_:HelpAndRuleParam = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000359),LocaleMgr.ins.getStr(999004018));
         ModuleMgr.ins.showModule(12201,_loc2_,this.moduleId);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         NGUtil.checkModuleShow(this.moduleId,this);
         if(param1 == "heroShard")
         {
            tabBar.selectedIndex = 6;
         }
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            tabBar.selectHandler = tabBarSelectHandler;
         }
         else
         {
            tabBar.selectHandler = null;
         }
      }
      
      private function tabBarSelectHandler(param1:int) : void
      {
         if(param1 == 4)
         {
            if(!guildModel.checkHasAuthority(202))
            {
               AlertUtil.float(LocaleMgr.ins.getStr(11000228));
               tabBar.selectedIndex = preTabIndex;
               return;
            }
         }
         preTabIndex = param1;
         viewStack.selectedIndex = param1;
         img_help.visible = param1 == 6;
      }
      
      override public function getFocusNotices() : Array
      {
         return ["guild_notice_show_guild_info_panel","guild_notice_show_guild_donate_panel","guild_notice_update_applicant_list","guild_notice_update_donate_data","GUILD_NOTICE_UPDATE_HERO_SHARD_PANEL"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = param1;
         if("GUILD_NOTICE_UPDATE_HERO_SHARD_PANEL" !== _loc4_)
         {
            if("guild_notice_show_guild_donate_panel" !== _loc4_)
            {
               if("guild_notice_show_guild_info_panel" !== _loc4_)
               {
                  if("guild_notice_update_applicant_list" !== _loc4_)
                  {
                     if("guild_notice_update_donate_data" === _loc4_)
                     {
                        showRedPoint();
                     }
                  }
                  else
                  {
                     showRedPoint();
                  }
               }
               else
               {
                  if(guildDisplayView)
                  {
                     guildDisplayView.dispose();
                     guildDisplayView = null;
                  }
                  tabBar.visible = true;
                  showBasePanel();
                  img_frame.visible = true;
                  tabBar.selectedIndex = 0;
               }
            }
            else
            {
               _loc3_ = param2;
               if(guildDisplayView)
               {
                  guildDisplayView.dispose();
                  guildDisplayView = null;
               }
               tabBar.visible = true;
               img_frame.visible = true;
               tabBar.selectedIndex = 3;
            }
         }
         else
         {
            img_redPoint_7.visible = GuildModel.ins.panelRes.ply.receiveList.length > 0;
         }
      }
      
      private function hideRedPoint() : void
      {
         this.img_redPoint_3.visible = false;
         this.img_redPoint_4.visible = false;
      }
      
      private function showRedPoint() : void
      {
         var _loc1_:* = null;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         this.img_redPoint_3.visible = false;
         this.img_redPoint_4.visible = false;
         var _loc3_:Array = guildModel.getShowRedPointArr();
         var _loc4_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc3_[_loc5_];
            _loc1_ = "img_redPoint_" + _loc2_;
            if(this.hasOwnProperty(_loc1_))
            {
               (this[_loc1_] as DisplayObject).visible = true;
            }
            _loc5_++;
         }
      }
      
      private function showBasePanel() : void
      {
         if(!viewStack)
         {
            viewStack = new ViewStack();
            viewStack.subViewClasses = [GuildBaseInfoPanel,GuildMemberListView,GuildManageView,GuildDonatePanel,GuildLogPanel,GuildRankView,GuildHeroShardDonatePanel];
            viewStack.x = 14;
            viewStack.y = 66;
            addChild(viewStack);
         }
         viewStack.selectedIndex = 0;
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(showBasePanel);
         guildModel.dispose();
         super.dispose();
      }
   }
}
