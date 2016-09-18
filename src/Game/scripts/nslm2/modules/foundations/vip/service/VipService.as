package nslm2.modules.foundations.vip.service
{
   import proto.GetVipInfoRes;
   import nslm2.modules.foundations.vip.model.VipModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.common.globals.GlobalRef;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetVipRewardInfoReq;
   import proto.VipGetFirstChargeRes;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import com.mz.core.configs.EnvConfig;
   import proto.VipMonthCardRes;
   
   public class VipService
   {
      
      private static var _ins:nslm2.modules.foundations.vip.service.VipService;
       
      
      public function VipService()
      {
         super();
         ServerEngine.ins.addAlwayHandler(6401,cplHandler);
         ServerEngine.ins.addAlwayHandler(6505,monthlyCardInfoHandler);
         ServerEngine.ins.addAlwayHandler(6405,firstChargeInfoHandler);
      }
      
      public static function get ins() : nslm2.modules.foundations.vip.service.VipService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.vip.service.VipService();
         }
         return _ins;
      }
      
      public function cplHandler(param1:GetVipInfoRes) : void
      {
         var _loc2_:Boolean = false;
         VipModel.ins.currentDiamond = param1.dimond;
         ObserverMgr.ins.sendNotice("PLAYER_VIP_UP",PlayerModel.ins.vipUpNum);
         if(PlayerModel.ins.vipUpNum)
         {
            if(ModuleMgr.ins.isShow(10400))
            {
               if(NGUtil.isShow == false)
               {
                  _loc2_ = false;
                  ModuleMgr.ins.showModule(12100,null,ModuleMgr.ins.popLayer.curModuleId);
               }
            }
            if(_loc2_ == false)
            {
               GlobalRef.needShowVip = true;
            }
         }
         PlayerModel.ins.vipUpNum = 0;
         if(param1.rewardGot.length == 16)
         {
            VipModel.ins.buyStatusArr = [];
            var _loc5_:int = 0;
            var _loc4_:* = param1.rewardGot;
            for each(var _loc3_ in param1.rewardGot)
            {
               VipModel.ins.buyStatusArr.push(_loc3_);
            }
            ObserverMgr.ins.sendNotice("refreshHeaderRedPoint");
         }
      }
      
      public function getCurrentDiamond(param1:* = null) : void
      {
         ServerEngine.ins.send(6401,null,param1);
      }
      
      public function getFirstChargeInfo(param1:* = null) : void
      {
         ServerEngine.ins.send(6405,null,param1);
      }
      
      public function buyGift(param1:int, param2:* = null, param3:* = null) : void
      {
         var _loc4_:GetVipRewardInfoReq = new GetVipRewardInfoReq();
         _loc4_.num = param1;
         ServerEngine.ins.send(6403,_loc4_,param2,param3);
      }
      
      public function firstChargeInfoHandler(param1:VipGetFirstChargeRes) : void
      {
         VipModel.ins.firstCharge = param1.firstCharge;
         if(param1.firstCharge)
         {
            if(param1.reward)
            {
               VipModel.ins.canGetFirstChargeReward = false;
            }
            else
            {
               VipModel.ins.canGetFirstChargeReward = true;
            }
         }
         else
         {
            VipModel.ins.canGetFirstChargeReward = true;
         }
         if(VipModel.ins.canGetFirstChargeReward)
         {
            NpcFuncService.ins.changeCount(60200,1);
         }
         else
         {
            NpcFuncService.ins.changeCount(60200,0);
         }
         ObserverMgr.ins.sendNotice("refreshFirstCharge",param1);
         VipModel.ins.canGetFavoriteReward = param1.canGetWebSaveReward;
         if(VipModel.ins.canGetFavoriteReward)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(60520,true));
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(60520,false));
         }
         VipModel.ins.canGetGameLikeReward = param1.canGetGameLikeReward;
         VipModel.ins.canGetClientDownGift = param1.canGetClientReward;
         if(VipModel.ins.canGetClientDownGift)
         {
            if(VipModel.ins.isUsingClient == true)
            {
               NpcFuncService.ins.changeCount(60510,1);
            }
            else
            {
               NpcFuncService.ins.changeCount(60510,0);
            }
            NpcFuncService.ins.getVo(60510).extra = false;
         }
         else if(!(EnvConfig.ins.ptId == 590 && VipModel.ins.isUsingClient == false))
         {
            NpcFuncService.ins.getVo(60510).extra = true;
         }
         ObserverMgr.ins.sendNotice("updateIconBar");
      }
      
      public function monthlyCardInfoHandler(param1:VipMonthCardRes) : void
      {
         if(param1)
         {
            VipModel.ins.silverDay = param1.smallCard;
            VipModel.ins.goldDay = param1.bigCard;
            ObserverMgr.ins.sendNotice("refreshMonthlyCard");
            if(VipModel.ins.silverDay == -1 || VipModel.ins.goldDay == -1)
            {
               ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(60530,true));
            }
            else
            {
               ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(60530,false));
            }
         }
      }
   }
}
