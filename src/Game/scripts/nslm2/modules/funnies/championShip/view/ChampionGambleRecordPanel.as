package nslm2.modules.funnies.championShip.view
{
   import game.ui.championship.ChampionGambleRecordPanelUI;
   import nslm2.modules.funnies.championShip.service.ChampionShipService;
   import proto.CompeteGambleInfoRes;
   import nslm2.common.compsEffects.ListCellTweenEffect;
   import proto.CompeteGambleInfo;
   import proto.CompeteGambleRewardRes;
   import nslm2.modules.funnies.championShip.model.ChampionShipModel;
   import com.greensock.TweenLite;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class ChampionGambleRecordPanel extends ChampionGambleRecordPanelUI
   {
       
      
      private var service:ChampionShipService;
      
      private var gambleRecArr:Array;
      
      private var crtRecordData:CompeteGambleInfo;
      
      public function ChampionGambleRecordPanel()
      {
         service = ChampionShipService.ins;
         gambleRecArr = [];
         super();
         this.list_record.dataSource = [];
         (pageBar as IPageBar).bindList(list_record);
         btn_getAll.clickHandler = getAll;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = this.moduleId;
         super.preShow();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         service.requestGambleRecord(getRecord);
      }
      
      private function getRecord(param1:CompeteGambleInfoRes) : void
      {
         if(param1)
         {
            gambleRecArr = param1.gambleInfos;
         }
         gambleRecArr.sort(sortRecord);
         this.list_record.dataSource = gambleRecArr;
         this.list_record.commitMeasure();
         validateGetAllBtn();
         super.moduleServerCpl();
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["notice_get_gamle_reward_success"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("notice_get_gamle_reward_success" === _loc3_)
         {
            gambleRecArr.sort(sortRecord);
            new ListCellTweenEffect(this.list_record,gambleRecArr).exec();
            this.list_record.commitMeasure();
            validateGetAllBtn();
         }
      }
      
      private function validateGetAllBtn() : void
      {
         btn_getAll.disabled = true;
         var _loc3_:int = 0;
         var _loc2_:* = gambleRecArr;
         for each(var _loc1_ in gambleRecArr)
         {
            if(_loc1_.rewardStatus == 1)
            {
               btn_getAll.disabled = false;
            }
         }
      }
      
      private function getAll() : void
      {
         btn_getAll.disabled = true;
         var _loc1_:CompeteGambleInfo = gambleRecArr[0];
         if(_loc1_.rewardStatus == 1)
         {
            requestGetReward(_loc1_);
         }
      }
      
      private function requestGetReward(param1:CompeteGambleInfo) : void
      {
         crtRecordData = param1;
         ChampionShipService.ins.getGambleReward(param1.gStageIndex,param1.frontStageIndex,getRwdCallBack);
      }
      
      private function getRwdCallBack(param1:CompeteGambleRewardRes) : void
      {
         ChampionShipModel.ins.canGetGambleReward = param1.canGetGambleReward;
         crtRecordData.rewardStatus = 2;
         gambleRecArr.sort(sortRecord);
         this.list_record.dataSource = gambleRecArr;
         this.list_record.commitMeasure();
         TweenLite.delayedCall(0.3,getAll);
      }
      
      private function sortRecord(param1:CompeteGambleInfo, param2:CompeteGambleInfo) : int
      {
         if(param1.rewardStatus == 2 && param2.rewardStatus < 2)
         {
            return 1;
         }
         if(param1.rewardStatus < 2 && param2.rewardStatus == 2)
         {
            return -1;
         }
         if(param1.rewardStatus == 1 && param2.rewardStatus != 1)
         {
            return -1;
         }
         if(param1.rewardStatus != 1 && param2.rewardStatus == 1)
         {
            return 1;
         }
         if(param1.status > param2.status)
         {
            return 1;
         }
         if(param1.status < param2.status)
         {
            return -1;
         }
         if(param1.frontStageIndex > param2.frontStageIndex)
         {
            return 1;
         }
         if(param1.frontStageIndex < param2.frontStageIndex)
         {
            return -1;
         }
         return 0;
      }
   }
}
