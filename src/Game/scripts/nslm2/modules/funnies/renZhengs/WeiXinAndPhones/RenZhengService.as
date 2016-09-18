package nslm2.modules.funnies.renZhengs.WeiXinAndPhones
{
   import flash.events.EventDispatcher;
   import proto.MobileBindInfData;
   import proto.WeixinCheckInfData;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import com.mz.core.configs.EnvConfig;
   import proto.MobileCheckGetCodeReq;
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.handlers.Handler;
   import proto.MobileCheckGetCodeRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.MobileCheckReq;
   import proto.MobileCheckRes;
   import flash.events.Event;
   import proto.MobileCheckGetRewardReq;
   import proto.MobileCheckGetRewardRes;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.WeixinGetRewardReq;
   import proto.WeixinGetRewardRes;
   
   public class RenZhengService extends EventDispatcher
   {
      
      public static const EVT_GET_PHONE_BIND:String = "EVT_GET_PHONE_BIND";
      
      public static const EVT_GET_PHONE_GET_REWARD:String = "EVT_GET_PHONE_GET_REWARD";
      
      public static const EVT_GET_WEI_XIN_BIND:String = "EVT_GET_WEI_XIN_BIND";
      
      public static const EVT_GET_WEI_XIN_GET_REWARD:String = "EVT_GET_WEI_XIN_GET_REWARD";
      
      private static var _ins:nslm2.modules.funnies.renZhengs.WeiXinAndPhones.RenZhengService;
       
      
      public var phoneNum:String = "";
      
      public var clientTest:Boolean = false;
      
      public var mobileBindInfoData:MobileBindInfData;
      
      public var weixinInfo:WeixinCheckInfData;
      
      public function RenZhengService()
      {
         super();
         ServerEngine.ins.addAlwayHandler(7323,server_weixiCanGetReward_cpl);
      }
      
      public static function get ins() : nslm2.modules.funnies.renZhengs.WeiXinAndPhones.RenZhengService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.renZhengs.WeiXinAndPhones.RenZhengService();
         }
         return _ins;
      }
      
      public function init(param1:MobileBindInfData, param2:WeixinCheckInfData) : void
      {
         if(param1 && param2)
         {
            this.mobileBindInfoData = param1;
            this.weixinInfo = param2;
            recountNpcFuncCount();
         }
      }
      
      public function recountNpcFuncCount() : void
      {
         var _loc1_:int = 0;
         var _loc3_:Boolean = false;
         var _loc2_:Boolean = false;
         if(mobileBindInfoData.binded)
         {
            if(mobileBindInfoData.cangetreward)
            {
               NpcFuncService.ins.changeCount(60761,1);
               _loc1_ = 1;
            }
            else
            {
               NpcFuncService.ins.changeCount(60761,0);
               _loc3_ = true;
            }
         }
         else
         {
            NpcFuncService.ins.changeCount(60761,0);
         }
         if(weixinInfo.alreadyget)
         {
            NpcFuncService.ins.changeCount(60762,0);
            _loc2_ = true;
         }
         else if(weixinInfo.cangetreward)
         {
            NpcFuncService.ins.changeCount(60762,1);
            _loc1_ = 1;
         }
         else
         {
            NpcFuncService.ins.changeCount(60762,0);
         }
         if(EnvConfig.ins.showDevModule)
         {
            NpcFuncService.ins.getVo(60760).extra = _loc3_ && _loc2_;
         }
         else
         {
            NpcFuncService.ins.getVo(60760).extra = _loc3_;
         }
         NpcFuncService.ins.changeCount(60760,_loc1_);
      }
      
      public function server_mobileCheckGetCode(param1:String, param2:Function) : void
      {
         if(clientTest)
         {
            server_getCode_cpl(param2,null,null);
            return;
         }
         var _loc3_:MobileCheckGetCodeReq = new MobileCheckGetCodeReq();
         _loc3_.mobilenum = param1;
         ServerEngine.ins.send(7320,_loc3_,new Handler(server_getCode_cpl,[param2]));
      }
      
      private function server_getCode_cpl(param1:*, param2:MobileCheckGetCodeRes, param3:ServerEvent) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(999000452));
         if(param1)
         {
            Handler.execute(param1,[param2,param3]);
         }
      }
      
      public function server_mobileCheck(param1:String) : void
      {
         if(clientTest)
         {
            this.server_mobileCheck_cpl(null,null);
            return;
         }
         var _loc2_:MobileCheckReq = new MobileCheckReq();
         _loc2_.code = param1;
         ServerEngine.ins.send(7321,_loc2_,server_mobileCheck_cpl);
      }
      
      private function server_mobileCheck_cpl(param1:MobileCheckRes, param2:ServerEvent) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(60760012));
         this.mobileBindInfoData.binded = true;
         this.mobileBindInfoData.cangetreward = true;
         NpcFuncService.ins.changeCount(60761,1);
         NpcFuncService.ins.changeCount(60760,1);
         this.dispatchEvent(new Event("EVT_GET_PHONE_BIND"));
      }
      
      public function server_mobileCheckGetReward() : void
      {
         if(clientTest)
         {
            this.server_getReward_cpl(null,null);
            return;
         }
         var _loc1_:MobileCheckGetRewardReq = new MobileCheckGetRewardReq();
         ServerEngine.ins.send(7322,_loc1_,server_getReward_cpl);
      }
      
      private function server_getReward_cpl(param1:MobileCheckGetRewardRes, param2:ServerEvent) : void
      {
         this.mobileBindInfoData.cangetreward = false;
         this.recountNpcFuncCount();
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.costStrToArr(DefindConsts.MOBILE_CERTIFY));
         ObserverMgr.ins.sendNotice("updateIconBar");
         this.dispatchEvent(new Event("EVT_GET_PHONE_GET_REWARD"));
      }
      
      private function server_weixiCanGetReward_cpl() : void
      {
         this.weixinInfo.cangetreward = true;
         this.recountNpcFuncCount();
         this.dispatchEvent(new Event("EVT_GET_WEI_XIN_BIND"));
      }
      
      public function server_weixinGetReward() : void
      {
         if(clientTest)
         {
            this.server_weixinGetReward_cpl(null,null);
            return;
         }
         var _loc1_:WeixinGetRewardReq = new WeixinGetRewardReq();
         ServerEngine.ins.send(7324,_loc1_,server_weixinGetReward_cpl);
      }
      
      private function server_weixinGetReward_cpl(param1:WeixinGetRewardRes, param2:ServerEvent) : void
      {
         this.weixinInfo.alreadyget = true;
         this.recountNpcFuncCount();
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.costStrToArr(DefindConsts.WEIXIN_CERTIFY));
         ObserverMgr.ins.sendNotice("updateIconBar");
         this.dispatchEvent(new Event("EVT_GET_WEI_XIN_GET_REWARD"));
      }
   }
}
