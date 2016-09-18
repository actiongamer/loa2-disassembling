package nslm2.inits
{
   import com.mz.core.utils2.task.TaskBase;
   import com.mz.core.configs.EnvConfig;
   import nslm2.nets.sockets.ServerEngine;
   import proto.NormalBagRes;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.foundations.friendModules.FriendService;
   import flash.events.Event;
   import nslm2.modules.foundations.alerts.GetNewVersionLogTask;
   import nslm2.modules.funnies.tencent.model.TencentVipModel;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   
   public class InitServerFoundationTask extends TaskBase
   {
       
      
      public function InitServerFoundationTask()
      {
         super();
      }
      
      public function get configVo() : InitConfigVo
      {
         return this.dataSource as InitConfigVo;
      }
      
      override public function exec() : void
      {
         super.exec();
         this.configVo.subTip = "获取服务器数据:版本信息";
         this.onProcess(10);
         if(EnvConfig.ins.useServer)
         {
            se_getBag();
         }
         else
         {
            this.onComplete();
         }
      }
      
      private function se_getBag() : void
      {
         this.configVo.subTip = "获取服务器数据:背包信息";
         ServerEngine.ins.send(4010,null,se_onBag);
      }
      
      private function se_onBag(param1:NormalBagRes) : void
      {
         BagModel.ins.init(param1);
         getFriendsInfo();
      }
      
      public function getFriendsInfo() : void
      {
         this.configVo.subTip = "获取服务器数据:好友信息";
         this.onProcess(10);
         FriendService.ins.addEventListener("evtFriendList",onGetFriendList);
         FriendService.ins.getFriendList();
      }
      
      private function onGetFriendList(param1:Event) : void
      {
         FriendService.ins.removeEventListener("evtFriendList",onGetFriendList);
         se_getVersionLog();
      }
      
      private function se_getVersionLog() : void
      {
         new GetNewVersionLogTask(true).addCompleteHandler(se_onVersionLog).exec();
      }
      
      private function se_onVersionLog(param1:GetNewVersionLogTask) : void
      {
         switch(int(EnvConfig.ins.vipType) - 1)
         {
            case 0:
            case 1:
               TencentVipModel.ins.getQQGiftInfo(se_onQQVipGiftInfo);
         }
      }
      
      private function se_onQQVipGiftInfo() : void
      {
         checkRedPoints();
      }
      
      private function checkRedPoints() : void
      {
         NpcFuncService.ins.changeCount(13376,1);
         this.onComplete();
      }
   }
}
