package nslm2.modules.footstones.assistantModules.subAssistants.shenyuan
{
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.footstones.assistantModules.vos.AssistantShenyuanSettingVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.assistantModules.model.AssistantModel;
   import proto.GetShenYuanInfoReq;
   import nslm2.modules.scenes.shenYuans.service.ShenYuanService;
   import com.greensock.TweenLite;
   import proto.GetShenYuanInfoRes;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ShenYuanTongGuanReq;
   import nslm2.modules.scenes.shenYuans.ShenYuanModule;
   import proto.ShenYuanRankRewardRes;
   import nslm2.utils.WealthUtil;
   import proto.ShenYuanBuff;
   import proto.ShenYuanBuyBuffReq;
   import proto.ShenYuanBuyBuffRes;
   import nslm2.modules.foundations.TimePriceUtil;
   import nslm2.common.model.PlayerModel;
   import proto.ShenYuanGetMysteriBoxReq;
   import proto.ShenYuanReceiveBoxRes;
   import proto.ShenYuanGetMysteriBoxRes;
   import proto.ShenYuanTongGuanRes;
   import proto.ProtocolStatusRes;
   
   public class AssistantShenyuanTask extends TaskBase implements IObserver
   {
       
      
      protected var setting:AssistantShenyuanSettingVo;
      
      private var _buyedBuffArr:Array;
      
      private var _lastBuyBuff:ShenYuanBuff;
      
      public function AssistantShenyuanTask(param1:Object = null)
      {
         _buyedBuffArr = [];
         super(param1);
      }
      
      override public function exec() : void
      {
         super.exec();
         initSetting();
         ObserverMgr.ins.regObserver(this);
         requestData();
      }
      
      private function get funId() : int
      {
         return 41500;
      }
      
      private function initSetting() : void
      {
         this.setting = AssistantModel.ins.getSetting(funId);
      }
      
      private function requestData(param1:GetShenYuanInfoReq = null) : void
      {
         ShenYuanService.ins.requestBaseInfo(null,param1);
      }
      
      private function delayRequestData(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _loc2_ = new GetShenYuanInfoReq();
            _loc2_.contiChanllge = true;
            TweenLite.delayedCall(0.5,requestData,[_loc2_]);
         }
         else
         {
            TweenLite.delayedCall(0.5,requestData);
         }
      }
      
      override public function stop() : void
      {
         ObserverMgr.ins.unregObserver(this);
         TweenLite.killDelayedCallsTo(requestData);
         super.stop();
      }
      
      public function getFocusNotices() : Array
      {
         return ["SHENYUAN_GET_INFO_CPL"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("SHENYUAN_GET_INFO_CPL" === _loc4_)
         {
            _loc3_ = param2 as GetShenYuanInfoRes;
            if(ShenYuanModel.ins.isTopLayer(_loc3_))
            {
               AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200058),funId);
               AssistantModel.ins.removeNeedDoFuncId(funId);
               this.onComplete();
            }
            else
            {
               onStep();
            }
         }
      }
      
      private function onStep() : void
      {
         if(this.setting.needGetRankReward && ShenYuanModel.ins.canGetReward)
         {
            ServerEngine.ins.send(6085,null,server_GetRankReward_cpl);
         }
         var _loc1_:* = ShenYuanModel.ins.currFloorType;
         if(ShenYuanModule.FLOOR_TYPE_BUFF !== _loc1_)
         {
            if(ShenYuanModule.FLOOR_TYPE_MONSTER !== _loc1_)
            {
               if(ShenYuanModule.FLOOR_TYPE_CHEST === _loc1_)
               {
                  openChest();
               }
            }
            else if(ShenYuanModel.ins.canPass)
            {
               ServerEngine.ins.send(6076,new ShenYuanTongGuanReq(),onServerCpl_pass,onServerErr_pass);
            }
            else
            {
               AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200059),funId);
               AssistantModel.ins.removeNeedDoFuncId(funId);
               this.onComplete();
            }
         }
         else
         {
            buyBuff();
         }
      }
      
      private function server_GetRankReward_cpl(param1:ShenYuanRankRewardRes) : void
      {
         ShenYuanModel.ins.canGetReward = false;
         AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200084,[WealthUtil.rewardArrToString(param1.reward)]),funId);
      }
      
      private function buyBuff() : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc1_:* = null;
         var _loc3_:Array = ShenYuanModel.ins.buffToBuyArr.concat();
         _loc3_.sort(buffSortFunc);
         var _loc2_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = _loc3_[_loc5_];
            if(_loc4_.buy == false && (AssisShenyuanUtils.isNeedBuyBuffId(_loc4_.id) == true || this.setting.buyBuffArr.length <= 0) && ShenYuanModel.ins.crtStarCnt >= _loc4_.jiage)
            {
               _loc1_ = new ShenYuanBuyBuffReq();
               _loc1_.id = _loc4_.id;
               _loc1_.param = _loc4_.param;
               _lastBuyBuff = _loc4_;
               ServerEngine.ins.send(6083,_loc1_,buyBuffSuccess);
               return;
            }
            _loc5_++;
         }
         if(_buyedBuffArr.length == 0)
         {
            AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200060,[ShenYuanModel.ins.crtStarCnt]),funId);
         }
         else
         {
            AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200061,[AssisShenyuanUtils.buffDataArrToString(_buyedBuffArr),ShenYuanModel.ins.crtStarCnt]),funId);
         }
         _buyedBuffArr = [];
         delayRequestData(true);
      }
      
      private function buffSortFunc(param1:ShenYuanBuff, param2:ShenYuanBuff) : int
      {
         if(param1.jiage > param2.jiage)
         {
            return -1;
         }
         if(param2.jiage > param1.jiage)
         {
            return 1;
         }
         return 0;
      }
      
      private function buyBuffSuccess(param1:ShenYuanBuyBuffRes) : void
      {
         _lastBuyBuff.buy = true;
         _buyedBuffArr.push(_lastBuyBuff);
         ShenYuanModel.ins.crtStarCnt = param1.nowstar;
         buyBuff();
      }
      
      private function openChest() : void
      {
         if(ShenYuanModel.ins.isNormalReward)
         {
            ServerEngine.ins.send(6086,null,onServerCpl_rewardNormalBox);
         }
         else
         {
            openMysteryBox();
         }
      }
      
      private function openMysteryBox() : void
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = this.setting.openMysteryBoxCnt - ShenYuanModel.ins.boxOpenNum;
         if(_loc2_ > 0)
         {
            _loc4_ = 1;
            while(_loc4_ <= _loc2_)
            {
               _loc1_ = _loc1_ + TimePriceUtil.getCost(6,ShenYuanModel.ins.boxOpenNum + _loc4_).count;
               _loc4_++;
            }
            if(PlayerModel.ins.diamond >= _loc1_)
            {
               _loc3_ = new ShenYuanGetMysteriBoxReq();
               _loc3_.num = this.setting.openMysteryBoxCnt - ShenYuanModel.ins.boxOpenNum;
               ServerEngine.ins.send(6075,_loc3_,onServerCpl_rewardMysteryBox);
            }
            else
            {
               AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200062),funId);
               delayRequestData(true);
            }
         }
         else
         {
            delayRequestData(true);
         }
      }
      
      private function onServerCpl_rewardNormalBox(param1:ShenYuanReceiveBoxRes) : void
      {
         AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200063,[WealthUtil.rewardArrToString(param1.reward)]),funId);
         if(this.setting.needOpenBox && this.setting.openMysteryBoxCnt > 0)
         {
            openMysteryBox();
         }
         else
         {
            delayRequestData(true);
         }
      }
      
      private function onServerCpl_rewardMysteryBox(param1:ShenYuanGetMysteriBoxRes) : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = this.setting.openMysteryBoxCnt - ShenYuanModel.ins.boxOpenNum;
         _loc4_ = 1;
         while(_loc4_ <= _loc3_)
         {
            _loc2_ = _loc2_ + TimePriceUtil.getCost(6,ShenYuanModel.ins.boxOpenNum + _loc4_).count;
            _loc4_++;
         }
         AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200064,[_loc3_,_loc2_,WealthUtil.rewardArrToString(param1.reward)]),funId);
         delayRequestData(true);
      }
      
      private function onServerCpl_pass(param1:ShenYuanTongGuanRes) : void
      {
         AssistantModel.ins.addLog(LocaleMgr.ins.getStr(60200065,[ShenYuanModel.ins.crtFloor,WealthUtil.rewardArrToString(param1.reward)]),funId);
         delayRequestData(false);
      }
      
      private function onServerErr_pass(param1:ProtocolStatusRes) : void
      {
         this.onComplete();
      }
   }
}
