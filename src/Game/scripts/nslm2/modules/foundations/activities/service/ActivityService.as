package nslm2.modules.foundations.activities.service
{
   import flash.events.EventDispatcher;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.foundations.activities.vo.ActivityInfoVo;
   import proto.ActivityRewardFinishReq;
   import proto.ProtocolStatusRes;
   import nslm2.modules.foundations.activities.utils.ActivityUtil;
   import proto.ActivityRewardNotify;
   import proto.ActivityInfoNotify;
   import proto.ActivityHotUpdateNotify;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.StaticActivitysRes;
   import proto.ActivityGetInfosRes;
   
   public class ActivityService extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.foundations.activities.service.ActivityService;
       
      
      private var _rewardVo:ActivityInfoVo;
      
      public function ActivityService()
      {
         super();
         ServerEngine.ins.addAlwayHandler(8353,serverCpl_activityRewardNotify);
         ServerEngine.ins.addAlwayHandler(8352,serverCpl_activityInfoNotify);
         ServerEngine.ins.addAlwayHandler(8360,serverCpl_activityHotUpdateNotify);
      }
      
      public static function get ins() : nslm2.modules.foundations.activities.service.ActivityService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.activities.service.ActivityService();
         }
         return _ins;
      }
      
      private function get model() : ActivityModel
      {
         return ActivityModel.ins;
      }
      
      public function getStaticData() : void
      {
         ServerEngine.ins.send(8354,null,serverCpl_staticData);
      }
      
      public function getInfo() : void
      {
         ServerEngine.ins.send(8350,null,serverCpl_getInfo);
      }
      
      public function getReward(param1:ActivityInfoVo, param2:int = 1) : void
      {
         _rewardVo = param1;
         var _loc3_:ActivityRewardFinishReq = new ActivityRewardFinishReq();
         _loc3_.aid = param1.activityId;
         _loc3_.rid = param1.staticActivityReward.id;
         _loc3_.count = param2;
         ServerEngine.ins.send(8351,_loc3_,serverCpl_activityRewardFinish,errHandler);
      }
      
      private function errHandler(param1:ProtocolStatusRes) : void
      {
         ServerEngine.ins.doDefaultErr(param1);
         if(ActivityUtil.lastPay || ActivityUtil.lastReward)
         {
            ActivityUtil.setActivityInfoVoCount(_rewardVo);
         }
      }
      
      private function serverCpl_activityRewardNotify(param1:ActivityRewardNotify) : void
      {
         model.onRewardChangeOne(param1);
         model.checkHasCanReward();
      }
      
      private function serverCpl_activityInfoNotify(param1:ActivityInfoNotify) : void
      {
         model.onInfoChangeOne(param1.info);
         model.checkHasCanReward();
      }
      
      private function serverCpl_activityHotUpdateNotify(param1:ActivityHotUpdateNotify) : void
      {
         if(ModuleMgr.ins.popLayer.isShow(60500))
         {
            model.needHotUpdate = true;
         }
         else
         {
            getStaticData();
         }
      }
      
      private function serverCpl_staticData(param1:StaticActivitysRes) : void
      {
         model.initStaticData(param1);
         getInfo();
      }
      
      private function serverCpl_getInfo(param1:ActivityGetInfosRes) : void
      {
         model.onInfoChange(param1);
      }
      
      private function serverCpl_activityRewardFinish(param1:ProtocolStatusRes) : void
      {
         model.onRewardCpl(_rewardVo);
      }
   }
}
