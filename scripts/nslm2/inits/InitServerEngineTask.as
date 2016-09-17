package nslm2.inits
{
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.configs.EnvConfig;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetPlayerOnlineDataRes;
   import nslm2.utils.ServerTimer;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.modules.foundations.chatModules.ChatModel;
   import nslm2.modules.foundations.setting.service.SettingService;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.footstones.alerts.EventNoticeService;
   import nslm2.modules.funnies.guilds.guildTechs.GuildTechService;
   import nslm2.modules.foundations.vip.service.VipService;
   import nslm2.modules.foundations.miniTasks.service.TaskService;
   import nslm2.modules.foundations.sales.service.SalesService;
   import nslm2.modules.foundations.activities.service.ActivityDropService;
   import proto.ValentineSpringOpen.EachModule;
   import nslm2.modules.funnies.npcFuncLists.FuncOpenTimeVo;
   import nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service;
   import nslm2.modules.funnies.renZhengs.WeiXinAndPhones.RenZhengService;
   import nslm2.modules.funnies.tencent.model.QQWeiDuanGiftService;
   import nslm2.modules.foundations.miniTasks.model.TaskModel;
   import nslm2.modules.funnies.championShip.model.ChampionShipModel;
   import nslm2.modules.cultivates.fashion.FashionService;
   import nslm2.modules.cultivates.lotteryHeroModules.LotteryTimesManager;
   import nslm2.modules.Chapters.ChapterService;
   import nslm2.modules.foundations.signIn.SignService;
   import nslm2.modules.foundations.sevenDays.service.SevenDaysService;
   import nslm2.modules.foundations.fourteenDays.service.FourteenDaysService;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import nslm2.modules.cultivates.reinforceTrain.ReinforceModel;
   import nslm2.modules.foundations.shop.model.ShopPlusModel;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.funnies.xunleiGifts.services.XunLeiGiftService;
   import nslm2.common.service.CommonServiceHandler;
   import nslm2.modules.foundations.miniNotice.MiniNoticeModel;
   import nslm2.modules.foundations.miniNotice.MiniNoticeService;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import nslm2.modules.funnies.qihoo.QihooService;
   import nslm2.modules.funnies.sogou.SougouService;
   import nslm2.modules.funnies.duowan.DuowanService;
   import nslm2.modules.foundations.shop.service.ShopService;
   import nslm2.modules.funnies.abilityRankModule.model.AbilityRankModel;
   import nslm2.modules.footstones.newerAlertModules.NewerAlertCtrl;
   import nslm2.modules.footstones.quickUseModules.QuickUseCtrl;
   import proto.ShopListRes;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import proto.PlayerInfoNotify;
   import proto.PanelViewRes;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import proto.HeroInfo;
   import proto.PlayerGetSaddleHorsesRes;
   import nslm2.modules.cultivates.horse.HorseService;
   
   public class InitServerEngineTask extends TaskBase
   {
       
      
      public function InitServerEngineTask()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         if(EnvConfig.ins.useServer)
         {
            ServerEngine.ins.init();
            ServerEngine.ins.send(2005,null,server_player_online_cpl);
         }
         else
         {
            onComplete();
         }
      }
      
      private function server_player_online_cpl(param1:GetPlayerOnlineDataRes) : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         ServerTimer.ins.init();
         ServerTimer.ins.server_systemTimeNotify(param1.time);
         server_info_cpl(param1.playerInfo);
         PlayerModel.ins;
         FriendService.ins;
         TeamGuajiService.ins;
         ChatModel.ins;
         SettingService.ins;
         NpcFuncService.ins.init();
         EventNoticeService.ins;
         GuildTechService.ins;
         VipService.ins;
         TaskService.ins;
         SalesService.ins;
         ActivityDropService.ins.init();
         if(param1.hasValentineSpring)
         {
            _loc2_ = param1.valentineSpring.eachModule.length;
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = param1.valentineSpring.eachModule[_loc4_];
               NpcFuncService.ins.setOpenTimeVo(new FuncOpenTimeVo(_loc3_.moduleId,_loc3_.openStamp,_loc3_.closeStamp));
               _loc4_++;
            }
            NewYear2016Service.ins.initBeatBossNum(param1.valentineSpring.beatBossNum);
         }
         RenZhengService.ins.init(param1.mobilebindinfo,param1.weixininfo);
         ServerEngine.ins.cplHandlerBatch.execute(8003,[param1.sceneNotify],false);
         ServerEngine.ins.cplHandlerBatch.execute(6051,[param1.linesate],false);
         ServerEngine.ins.cplHandlerBatch.execute(2012,[param1.setting,null],false);
         ServerEngine.ins.cplHandlerBatch.execute(2007,[param1.time,null],false);
         ServerEngine.ins.cplHandlerBatch.execute(4102,[param1.functionTime,null],false);
         ServerEngine.ins.cplHandlerBatch.execute(8004,[param1.playerdata,null],false);
         ServerEngine.ins.cplHandlerBatch.execute(8007,[param1.saInfos,null],false);
         ServerEngine.ins.cplHandlerBatch.execute(8520,[param1.acdInfo,null],false);
         QQWeiDuanGiftService.ins.init(param1.weiduan);
         TaskService.ins.crtTasksInfoHandler(param1.taskInfo);
         TaskModel.ins.reqResourceBack();
         ChampionShipModel.ins.funcOpenTime = param1.cOpenTm.openTime;
         PlayerModel.ins.se_onGetTimes(param1.gtb);
         ChatModel.ins.initIMClient();
         this.onGetHeroPanelBaseInfo(param1.pvr);
         this.onServerCpl_horse(param1.pgsh);
         FashionService.ins.server_clothesBag(param1.cbr);
         FashionService.ins.server_clothesSkillBag(param1.csbr);
         LotteryTimesManager.server_cpl(param1.lir);
         ChapterService.ins.serverCpl_getStageInfos(param1.sInfos);
         VipService.ins.firstChargeInfoHandler(param1.vgfcr);
         VipService.ins.monthlyCardInfoHandler(param1.vmc);
         VipService.ins.cplHandler(param1.vipGift);
         SignService.ins.onCanGetSignInReq(param1.csi);
         SevenDaysService.ins.deadline = param1.sevenDayCloseStamp;
         FourteenDaysService.ins.deadline = param1.fourteenDayCloseStamp;
         ShenYuanModel.ins.hisTopStar = param1.babelHistopStar;
         SalesService.ins.getInitNotify(param1.supersaleinfo);
         ReinforceModel.ins.initSupportInfo(param1.playerInfo.player.support);
         ShopPlusModel.INS.initBuyDoubleInfo(param1.buydoubleinfo);
         if(param1.hasFashion)
         {
            FashionModel.ins.initFashionAcc(param1.fashion.list);
            BagModel.ins.add(param1.fashion.items);
         }
         if(param1.hasXunleijinzuan)
         {
            XunLeiGiftService.ins.init(param1.xunleijinzuan);
         }
         CommonServiceHandler.ins.onServerCpl_cardInfoNotify(param1.cardInfo);
         MiniNoticeModel.ins.addSelfActionInfos();
         MiniNoticeService.ins.onServerCpl_functionActionNotify(param1.functionAction);
         if(param1.jueroadinfo)
         {
            HeroAwakenRoadModel.ins.initChaptersData();
            HeroAwakenRoadModel.ins.updateChapterInfo(param1.jueroadinfo.infos);
         }
         if(param1.server)
         {
            ServerTimer.ins.openServerTime = param1.server.opentime;
            PlayerModel.ins.dist = param1.server.dist;
            PlayerModel.ins.distName = param1.server.distName;
            PlayerModel.ins.opName = param1.server.opName;
         }
         var _loc5_:* = EnvConfig.ins.ptId;
         if(69 !== _loc5_)
         {
            if(166 !== _loc5_)
            {
               if(33 === _loc5_)
               {
                  DuowanService.ins.init(param1.duowaninfo);
               }
            }
            else
            {
               if(EnvConfig.ins.weiDuan == 1)
               {
                  SougouService.ins.isFromSougouGameDating = true;
               }
               else if(EnvConfig.ins.weiDuan == 16602)
               {
                  SougouService.ins.isFromSougouInput = true;
               }
               SougouService.ins.init(param1.sougouinfo);
            }
         }
         else
         {
            QihooService.ins.init(param1.git360levelinfo);
         }
         ShopService.ins.requestList(60310 + 100000,server_shopList);
         if(param1.openchageinfo)
         {
            if(param1.openchageinfo.canget)
            {
               NpcFuncService.ins.countPlusOne(60763);
            }
            AbilityRankModel.ins.activityStartTime = param1.openchageinfo.openstamp;
         }
         NewerAlertCtrl.ins.init();
         QuickUseCtrl.ins.init();
         NpcFuncService.ins.changeCount(13332,1);
         NpcFuncService.ins.changeCount(13110,1);
      }
      
      private function server_shopList(param1:ShopListRes) : void
      {
         ShopModel.ins.onDataChange(param1);
         this.onComplete();
      }
      
      private function server_info_cpl(param1:PlayerInfoNotify) : void
      {
         ServerEngine.ins.removeOnceHandler(2003);
         PlayerModel.ins.parsePlayerInfo(param1);
         CommonServiceHandler.ins.initService();
      }
      
      private function onGetHeroPanelBaseInfo(param1:PanelViewRes) : void
      {
         if(param1 == null)
         {
            param1 = new PanelViewRes();
            param1.list = [];
            param1.info = [];
         }
         if(param1.list == null)
         {
            param1.list = [];
         }
         HeroModel.ins.playerHero.baseInfo.position = 1;
         param1.list.unshift(HeroInfoUtil.heroBaseInfoToPanelBaseInfo(HeroModel.ins.playerHero.baseInfo));
         HeroModel.ins.panelBaseInfoList = param1.list;
         var _loc4_:int = 0;
         var _loc3_:* = param1.info;
         for each(var _loc2_ in param1.info)
         {
            HeroModel.ins.onChangeOne(_loc2_);
         }
      }
      
      public function onServerCpl_horse(param1:PlayerGetSaddleHorsesRes) : void
      {
         if(param1 == null)
         {
            param1 = new PlayerGetSaddleHorsesRes();
         }
         HorseService.ins.init(param1);
      }
   }
}
