package nslm2.modules.funnies.teamGuajiScenes.pvp.autoRob
{
   import game.ui.teamGuajiScenes.pvp.saodang.PvPSaoDangPanelUI;
   import proto.GJPvpInfo;
   import game.ui.teamGuajiScenes.pvp.saodang.AutoRobResultViewUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.GuajiPvpAutoFightRes;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.modules.Chapters.saodang.SaodangVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   import nslm2.common.vo.WealthVo;
   import flash.events.MouseEvent;
   
   public class AutoRobPanel extends PvPSaoDangPanelUI
   {
       
      
      private var AUTO_BOB_MAX_TIME:int = 5;
      
      private var playerInfo:GJPvpInfo;
      
      private var _leftTimes:int;
      
      private var _saodangCnt:int;
      
      private var _saodangArr:Array;
      
      private var bobResultView:AutoRobResultViewUI;
      
      public function AutoRobPanel()
      {
         _saodangArr = [];
         super();
      }
      
      public function show(param1:Object = null) : void
      {
         playerInfo = param1 as GJPvpInfo;
         _saodangArr = [];
         _saodangCnt = 0;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41300270);
         this.list_saodang.dataSource = [];
      }
      
      override protected function panelFadeInCpl() : void
      {
         super.panelFadeInCpl();
         start();
      }
      
      private function saoDangRoundHandler(param1:GuajiPvpAutoFightRes) : void
      {
         this.list_saodang.repeatY = _saodangArr.length;
         this.list_saodang.dataSource = _saodangArr;
         list_saodang.refreshSize();
         this.contentPanel.scrollTo(0,this.list_saodang.y + this.list_saodang.height);
         if(_saodangCnt < _leftTimes)
         {
            if(param1.stealCount > 0)
            {
               TimerManager.ins.clearTimer(autoFight);
               stop(param1);
            }
            else
            {
               TimerManager.ins.doOnce(300,autoFight);
            }
         }
         else
         {
            TimerManager.ins.clearTimer(autoFight);
            stop(param1);
         }
      }
      
      private function autoFight() : void
      {
         TeamGuajiService.ins.reqeustPvPFight(playerInfo.info.dist,playerInfo.info.id,autoFightSuccessHandler);
      }
      
      private function autoFightSuccessHandler(param1:GuajiPvpAutoFightRes) : void
      {
         var _loc2_:SaodangVo = new SaodangVo();
         _loc2_.index = _saodangCnt + 1;
         _loc2_.addItemsArr = WealthUtil.rewardArrToWealthVoArr(param1.reward);
         _saodangArr.push(_loc2_);
         TeamGuajiModel.ins.rankToday = param1.rank;
         TeamGuajiModel.ins.robPieceCountToday = TeamGuajiModel.ins.robPieceCountToday + param1.stealCount;
         _saodangCnt = Number(_saodangCnt) + 1;
         saoDangRoundHandler(param1);
      }
      
      public function stop(param1:GuajiPvpAutoFightRes) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(param1)
         {
            if(!bobResultView)
            {
               bobResultView = new AutoRobResultViewUI();
            }
            if(param1.stealCount > 0)
            {
               _loc3_ = WealthUtil.rewardArrToWealthVoArr(param1.reward);
               var _loc6_:int = 0;
               var _loc5_:* = _loc3_;
               for each(var _loc4_ in _loc3_)
               {
                  if(_loc4_.kind == 20)
                  {
                     _loc2_ = _loc4_;
                  }
               }
               bobResultView.txt_result.text = LocaleMgr.ins.getStr(41300268,[_loc2_.qualityName + "x" + _loc2_.count]);
               TeamGuajiModel.ins.updateKilledPlayer();
            }
            else
            {
               bobResultView.txt_result.text = LocaleMgr.ins.getStr(41300269);
            }
            bobResultView.x = 2;
            bobResultView.y = list_saodang.y + list_saodang.height;
            contentPanel.addChild(bobResultView);
            contentPanel.commitMeasure();
            contentPanel.scrollTo(0,bobResultView.y + bobResultView.height);
         }
         TimerManager.ins.clearTimer(autoFight);
      }
      
      public function start() : void
      {
         resetSaoDangTimes();
         _saodangCnt = 0;
         if(_leftTimes > 0)
         {
            TimerManager.ins.doOnce(100,autoFight);
         }
      }
      
      private function resetSaoDangTimes() : void
      {
         _leftTimes = Math.min(TeamGuajiModel.ins.pvpCount,AUTO_BOB_MAX_TIME);
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         TimerManager.ins.clearTimer(autoFight);
         list_saodang.dataSource = [];
         super.btnCloseHandler(param1);
      }
   }
}
