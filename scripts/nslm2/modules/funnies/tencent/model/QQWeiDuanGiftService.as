package nslm2.modules.funnies.tencent.model
{
   import proto.WeiDuanRewardInfo;
   import proto.WeiDuanRewardInfo.EachReward;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import morn.core.utils.URLUtils;
   import proto.WeiDuanGetRewardReq;
   import com.mz.core.configs.EnvConfig;
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.handlers.Handler;
   import proto.WeiDuanGetRewardRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class QQWeiDuanGiftService
   {
      
      private static var _ins:nslm2.modules.funnies.tencent.model.QQWeiDuanGiftService;
       
      
      public var getHis:Array;
      
      public var clientTest:Boolean = false;
      
      private var curKind:int;
      
      public function QQWeiDuanGiftService()
      {
         getHis = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.tencent.model.QQWeiDuanGiftService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.tencent.model.QQWeiDuanGiftService();
         }
         return _ins;
      }
      
      public function init(param1:WeiDuanRewardInfo) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(param1 && param1.rewardInfo)
         {
            getHis = [];
            _loc3_ = param1.rewardInfo.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = param1.rewardInfo[_loc4_];
               if(_loc2_.have)
               {
                  if(getHis.indexOf(_loc2_.kind) == -1)
                  {
                     getHis.push(_loc2_.kind);
                  }
               }
               _loc4_++;
            }
         }
         reCountNpcFunc();
      }
      
      public function hadGet(param1:int) : Boolean
      {
         return getHis.indexOf(param1) > -1;
      }
      
      private function reCountNpcFunc() : void
      {
         if(getHis.indexOf(1) > -1 && getHis.indexOf(2) > -1 && getHis.indexOf(3) > -1)
         {
            NpcFuncService.ins.changeCount(60730,0);
         }
         else
         {
            NpcFuncService.ins.changeCount(60730,1);
         }
      }
      
      public function checkIsFromWeiDuan() : Boolean
      {
         if(clientTest)
         {
            return true;
         }
         var _loc1_:int = URLUtils.callJSAndReturn("window.external.IsMicroClient");
         return Boolean(_loc1_);
      }
      
      public function checkIsFromWeiDuanYellow() : Boolean
      {
         if(clientTest)
         {
            return true;
         }
         var _loc1_:int = URLUtils.callJSAndReturn("window.external.IsMicroClient");
         return Boolean(_loc1_ == 7 || _loc1_ == 8 || _loc1_ == 10 || _loc1_ == 14);
      }
      
      public function checkIsFromWeiDuanBlue() : Boolean
      {
         if(clientTest)
         {
            return true;
         }
         var _loc1_:int = URLUtils.callJSAndReturn("window.external.IsMicroClient");
         return Boolean(_loc1_ == 2 || _loc1_ == 9 || _loc1_ == 1);
      }
      
      public function checkIsSetAuto() : Boolean
      {
         if(clientTest)
         {
            return false;
         }
         var _loc1_:Boolean = URLUtils.callJSAndReturn("window.external.IsAutoLaunch");
         return _loc1_;
      }
      
      public function checkIsFromAuto() : Boolean
      {
         if(clientTest)
         {
            return true;
         }
         var _loc1_:Boolean = URLUtils.callJSAndReturn("window.external.IsAutoLaunchWithStartup");
         return _loc1_;
      }
      
      public function toSetAuto() : Boolean
      {
         if(clientTest)
         {
            return true;
         }
         var _loc1_:Boolean = URLUtils.callJSAndReturn("window.external.SetAutoLaunch");
         return _loc1_;
      }
      
      public function server_weiDuanGetReward(param1:uint, param2:Function) : void
      {
         var _loc3_:WeiDuanGetRewardReq = new WeiDuanGetRewardReq();
         curKind = param1;
         _loc3_.kind = param1;
         _loc3_.platId = !!clientTest?82:int(EnvConfig.ins.ptId);
         _loc3_.qqtype = EnvConfig.ins.vipType;
         ServerEngine.ins.send(6603,_loc3_,new Handler(server_getReward_cpl,[param2]));
      }
      
      private function server_getReward_cpl(param1:*, param2:WeiDuanGetRewardRes, param3:ServerEvent) : void
      {
         if(getHis.indexOf(curKind) == -1)
         {
            getHis.push(curKind);
         }
         this.reCountNpcFunc();
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.costStrToArr(DefindConsts.QQ_CLIENT_DOWNLOAD(curKind)));
         if(param1)
         {
            Handler.execute(param1,[]);
         }
      }
   }
}
