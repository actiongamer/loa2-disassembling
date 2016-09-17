package nslm2.modules.funnies.teamGuajiScenes.mini
{
   import game.ui.teamGuajiScenes.mini.TeamGuajiMiniPanelUI;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiSaodangEffect;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import proto.GuajiInfoRes;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.ServerTimer;
   import proto.GuajiGetBagInfoRes;
   import nslm2.common.event.WealthChangeEvent;
   import nslm2.utils.TimeUtils;
   import flash.events.Event;
   import nslm2.utils.WealthUtil;
   import com.greensock.TweenLite;
   
   public class TeamGuajiMiniPanel extends TeamGuajiMiniPanelUI
   {
      
      private static var leftTimeTemp:int;
      
      private static var recoveryTemp:int;
       
      
      private var sdEff:TeamGuajiSaodangEffect;
      
      public function TeamGuajiMiniPanel()
      {
         super();
         btn_mini.addEventListener("click",miniBtnClick);
         addEvent();
         top = 300;
         box_seeMore.buttonMode = true;
         box_seeMore.addEventListener("click",goTeamGuaji);
      }
      
      public static function getCanGuajiTime() : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = PlayerModel.ins.getWealthValue(8);
         var _loc1_:Array = String(DefindConsts.GUAJI_JINGLI_COST).split("|");
         var _loc5_:int = _loc1_[0];
         var _loc3_:int = _loc1_[1];
         _loc2_ = _loc4_ / _loc3_ * _loc5_ * 60;
         leftTimeTemp = 0;
         recoveryTemp = 0;
         _loc2_ = caculateLeftTime(_loc2_);
         return _loc2_;
      }
      
      public static function caculateLeftTime(param1:int) : int
      {
         var _loc2_:Array = String(DefindConsts.GUAJI_JINGLI_COST).split("|");
         var _loc5_:int = _loc2_[0];
         var _loc3_:int = _loc2_[1];
         var _loc4_:int = param1 / DefindConsts.GUAJI_JINGLI_RECOVERY;
         _loc4_ = _loc4_ - recoveryTemp;
         param1 = param1 + _loc4_ / _loc3_ * _loc5_ * 60;
         if(param1 - leftTimeTemp > DefindConsts.GUAJI_JINGLI_RECOVERY * 2)
         {
            leftTimeTemp = param1;
            recoveryTemp = recoveryTemp + _loc4_;
            caculateLeftTime(param1);
         }
         return param1;
      }
      
      protected function goTeamGuaji(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(41210);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(FuncOpenAutoCtrl.checkOpen(41210))
         {
            TeamGuajiService.ins.server_get_guajiInfo(getGuajiInfo);
         }
         else
         {
            moduleServerCpl();
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         updateEnergy();
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         var _loc2_:* = null;
         updateEnergy();
         if(!FuncOpenAutoCtrl.checkOpen(41210))
         {
            this.visible = false;
         }
         else
         {
            if(!this.visible)
            {
               TeamGuajiService.ins.server_get_guajiBag(getGuajiBagInfo);
            }
            this.visible = true;
            _loc2_ = TeamGuajiService.ins.sceneInfo;
            if(!_loc2_ || !_loc2_.startFight)
            {
               if(sdEff)
               {
                  sdEff.dispose();
                  sdEff = null;
               }
               txt_rest.visible = true;
               txt_status.visible = false;
               txt_link.text = LocaleMgr.ins.getStr(41210140);
            }
            else
            {
               txt_rest.visible = false;
               txt_status.visible = true;
               txt_link.text = LocaleMgr.ins.getStr(41210131);
               if(!sdEff)
               {
                  sdEff = new TeamGuajiSaodangEffect(txt_status);
               }
               sdEff.start(ServerTimer.ins.second,LocaleMgr.ins.getStr(41210128));
            }
         }
         super.show(param1);
      }
      
      private function getGuajiInfo(param1:GuajiInfoRes) : void
      {
         TeamGuajiService.ins.server_get_guajiBag(getGuajiBagInfo);
      }
      
      private function getGuajiBagInfo(param1:GuajiGetBagInfoRes) : void
      {
         updateRewards(param1);
         moduleServerCpl();
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["wealthChange"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("wealthChange" === _loc4_)
         {
            _loc3_ = param2 as WealthChangeEvent;
            if(_loc3_.wealthType == 8)
            {
               updateEnergy();
            }
         }
      }
      
      private function updateEnergy() : void
      {
         txt_stamina.color = PlayerModel.ins.getWealthValue(8) >= 10?458496:16723968;
         txt_stamina.num = PlayerModel.ins.getWealthValue(8);
         txt_guajiTime.text = LocaleMgr.ins.getStr(41210133,[TimeUtils.getSimpleTimeStr1(getCanGuajiTime())]);
      }
      
      protected function updateGuajiReward(param1:Event) : void
      {
         TeamGuajiService.ins.server_get_guajiBag(updateGuajiBg);
      }
      
      private function updateGuajiBg(param1:GuajiGetBagInfoRes) : void
      {
         updateRewards(param1);
      }
      
      private function updateRewards(param1:GuajiGetBagInfoRes) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _loc2_ = WealthUtil.rewardArrToWealthVoArr(param1.rwd);
            _loc2_.sortOn("quality",2);
            list_reward.dataSource = _loc2_;
            txt_empty.visible = false;
         }
         else
         {
            clearReward();
         }
      }
      
      private function clearReward(param1:Event = null) : void
      {
         txt_empty.visible = true;
         list_reward.dataSource = [];
      }
      
      protected function miniBtnClick(param1:MouseEvent) : void
      {
         if(this.box_content.x >= 0)
         {
            TweenLite.to(box_content,0.2,{"x":-box_content.width});
            TweenLite.to(box_mini,0.2,{"x":5});
            TweenLite.to(img_suofang,0.2,{"rotation":180});
         }
         else
         {
            TweenLite.to(box_content,0.2,{"x":0});
            TweenLite.to(box_mini,0.2,{"x":246});
            TweenLite.to(img_suofang,0.2,{"rotation":0});
         }
      }
      
      override public function dispose() : void
      {
         removeEvent();
         super.dispose();
      }
      
      override public function preClose(param1:Object = null) : void
      {
         if(sdEff)
         {
            sdEff.dispose();
            sdEff = null;
         }
         super.preClose(param1);
      }
      
      private function addEvent() : void
      {
         TeamGuajiService.ins.addEventListener("evt_guaji_reward_clear",clearReward);
         TeamGuajiService.ins.addEventListener("EVT_GUAJI_REWARD_DISPLAY_NOTIFY",updateGuajiReward);
      }
      
      private function removeEvent() : void
      {
         TeamGuajiService.ins.removeEventListener("EVT_GUAJI_REWARD_DISPLAY_NOTIFY",updateGuajiReward);
         TeamGuajiService.ins.removeEventListener("evt_guaji_reward_clear",clearReward);
      }
   }
}
