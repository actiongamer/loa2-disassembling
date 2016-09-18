package nslm2.modules.funnies.teamGuajiScenes.guajiFunctions
{
   import game.ui.teamGuajiScenes.guajiFunctions.guajiBagUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import flash.events.MouseEvent;
   import nslm2.common.uiEffects.ListIconFlyEff;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import flash.events.Event;
   import proto.GuajiInfoRes;
   import nslm2.nets.sockets.ServerEvent;
   import proto.GuajiGetBagInfoRes;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   
   public class guajiBag extends guajiBagUI implements INewerGuideCheckHandler
   {
       
      
      public function guajiBag()
      {
         super();
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41210040);
         this.right = 10;
         this.pageBar.bindList(this.list_wealth);
         this.bottom = 150;
         this.btn_collect.addEventListener("click",onCollectClick);
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarUI as IPageBar;
      }
      
      override public function show(param1:Object = null) : void
      {
         if(param1)
         {
            this.x = UIMgr.gameWidth - this.width - 12;
         }
         else
         {
            this.x = UIMgr.gameWidth - this.width >> 1;
         }
         this.commitMeasure();
         this.btn_collect.disabled = true;
         TeamGuajiService.ins.server_get_guajiBag(get_guajiBag_cpl);
         get_guajiInfo_cpl(TeamGuajiService.ins.sceneInfo,null);
         super.show();
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["TEAM_GUAJI_STOP","TEAM_GUAJI_START","guaji_update_reward_bag"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("TEAM_GUAJI_STOP" !== _loc3_)
         {
            if("TEAM_GUAJI_START" !== _loc3_)
            {
               if("guaji_update_reward_bag" === _loc3_)
               {
                  TeamGuajiService.ins.server_get_guajiInfo(get_guajiInfo_cpl);
                  TeamGuajiService.ins.server_get_guajiBag(get_guajiBag_cpl);
               }
            }
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
      
      private function counter_format(param1:uint) : String
      {
         return LocaleMgr.ins.getStr(41210041) + TimeUtils.hisColonAddZero2(param1);
      }
      
      private function counter_cpl() : void
      {
      }
      
      private function onCollectClick(param1:MouseEvent) : void
      {
         TeamGuajiService.ins.server_get_guajiReward(null);
         new ListIconFlyEff(this.list_wealth).set_autoHideFrom(false).exec();
         this.list_wealth.array = [];
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(41212,false));
         TeamGuajiService.ins.dispatchEvent(new Event("evt_guaji_reward_clear"));
         this.txt_bag_tip.visible = true;
         btn_collect.disabled = true;
      }
      
      private function get_guajiInfo_cpl(param1:GuajiInfoRes, param2:ServerEvent) : void
      {
         this.txt_total_battle.text = LocaleMgr.ins.getStr(41210042,[param1.winCount + param1.loseCount]);
         var _loc3_:String = get_guaji_ratio(param1);
         this.txt_total_ratio.text = LocaleMgr.ins.getStr(41210043,[_loc3_]);
      }
      
      private function get_guaji_ratio(param1:GuajiInfoRes) : String
      {
         var _loc3_:Number = NaN;
         var _loc2_:* = null;
         if(param1.winCount || uint(param1.loseCount))
         {
            _loc3_ = param1.winCount / (param1.winCount + param1.loseCount);
            _loc2_ = (int(_loc3_ * 100)).toString() + "%";
         }
         else
         {
            _loc2_ = "100%";
         }
         return _loc2_;
      }
      
      private function get_guajiBag_cpl(param1:GuajiGetBagInfoRes, param2:ServerEvent) : void
      {
         if(!param1)
         {
            this.txt_bag_tip.visible = true;
            this.list_wealth.dataSource = [];
         }
         else
         {
            this.list_wealth.dataSource = WealthUtil.rewardArrToWealthVoArr(param1.rwd);
            this.txt_bag_tip.visible = false;
         }
         if(list_wealth.dataSource.length > 0)
         {
            btn_collect.disabled = false;
         }
         NGUtil.checkModuleShow(this.moduleId,this);
      }
      
      private function get_guajiReward_cpl(param1:ServerEvent) : void
      {
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         if(!(int(param1) - 20020))
         {
            if(this.list_wealth.array.length == 0)
            {
               NGUtil.gm_gotoId(param2[0]);
               return 4;
            }
         }
         return 1;
      }
   }
}
