package nslm2.common.service
{
   import nslm2.modules.cultivates.pet.service.PetService;
   import proto.PetInfoRes;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.nets.sockets.ServerEngine;
   import proto.BaoWuBagRes;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import proto.FamilyMemberInfoRes;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.greensock.TweenLite;
   import nslm2.modules.foundations.chatModules.ChatModel;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.FamilyApplyNotify;
   import nslm2.mgrs.stcMgrs.vos.StcFacebookFeedVo;
   import nslm2.utils.PlatformUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.BaoWuStatNotify;
   import proto.CardInfoNotify;
   import nslm2.common.model.CardInfoModel;
   
   public class CommonServiceHandler
   {
      
      private static var _ins:nslm2.common.service.CommonServiceHandler;
       
      
      public function CommonServiceHandler()
      {
         super();
      }
      
      public static function get ins() : nslm2.common.service.CommonServiceHandler
      {
         if(_ins == null)
         {
            _ins = new nslm2.common.service.CommonServiceHandler();
         }
         return _ins;
      }
      
      public function initService() : void
      {
         addAwaysHandler();
         getGuildInfo();
         getTreasureBg();
         OpActivityStaticServiceHandler.ins.requestStaticData([]);
         getPetInfo();
      }
      
      private function getPetInfo() : void
      {
         PetService.ins.getAllPetInfo(getPetInfoHandler);
      }
      
      private function getPetInfoHandler(param1:PetInfoRes) : void
      {
         if(param1)
         {
            PetModel.ins.updateAllPetInfo(param1.info);
         }
      }
      
      public function getTreasureBg() : void
      {
         ServerEngine.ins.send(5100,null,getBaoWuBg);
      }
      
      private function getBaoWuBg(param1:BaoWuBagRes) : void
      {
         if(param1)
         {
            TreasureModel.ins.initTreasureData(param1.list);
         }
      }
      
      private function getGuildInfo() : void
      {
         ServerEngine.ins.send(5223);
      }
      
      private function addAwaysHandler() : void
      {
         ServerEngine.ins.addAlwayHandler(5223,updateFamilyMemberInfo);
         ServerEngine.ins.addAlwayHandler(5220,familyApplyNotify);
         ServerEngine.ins.addAlwayHandler(5111,baoWuStatusChangeHandler);
         ServerEngine.ins.addAlwayHandler(4302,onServerCpl_cardInfoNotify);
      }
      
      private function updateFamilyMemberInfo(param1:FamilyMemberInfoRes) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:GuildModel = GuildModel.ins;
         if(!Uint64Util.equal(PlayerModel.ins.playerInfo.familyId,param1.familyId))
         {
            if(param1.familyId)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(11000837));
               PlayerModel.ins.playerInfo.familyId = param1.familyId;
               PlayerModel.ins.playerInfo.familyName = param1.familyName;
               if(ModuleMgr.ins.isShow(40700))
               {
                  ModuleMgr.ins.closeModule(40700);
                  TweenLite.delayedCall(0.6,ModuleMgr.ins.showModule,[40700]);
               }
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(11000244));
               ModuleMgr.ins.closeModule(40700);
               ModuleMgr.ins.closeModule(40740);
               GuildModel.ins.highPos = 0;
               GuildModel.ins.pos = 0;
            }
            ChatModel.ins.synChannels();
         }
         PlayerModel.ins.playerInfo.familyId = param1.familyId;
         PlayerModel.ins.playerInfo.familyName = param1.familyName;
         _loc2_.updateRoleGuildInfo(param1);
         ObserverMgr.ins.sendNotice("guild_notice_update_role_guild_data");
      }
      
      private function familyApplyNotify(param1:FamilyApplyNotify) : void
      {
         res = param1;
         if(PlatformUtil.isFeedShowFaceBook)
         {
            var feedConfig:StcFacebookFeedVo = StcMgr.ins.getVoByMultiColumnValue("static_facebook_feed",["feedType"],[6]) as StcFacebookFeedVo;
            if(feedConfig)
            {
               var obj:Object = {};
               obj.vo = feedConfig;
               obj.para_1 = res.name;
               obj.para_2 = 0;
               App.timer.doOnce(1000,function():void
               {
                  ModuleMgr.ins.showModule(88002,obj,ModuleMgr.ins.popLayer.curModuleId);
               });
            }
         }
      }
      
      private function baoWuStatusChangeHandler(param1:BaoWuStatNotify) : void
      {
         TreasureModel.ins.updateTreasureStatus(param1.id,param1.status);
      }
      
      public function onServerCpl_cardInfoNotify(param1:CardInfoNotify) : void
      {
         CardInfoModel.ins.parseNotify(param1);
         ObserverMgr.ins.sendNotice("MSG_CARD_INFO_CHANGED");
      }
   }
}
