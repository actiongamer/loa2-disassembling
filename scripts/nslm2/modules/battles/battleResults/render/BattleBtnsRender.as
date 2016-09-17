package nslm2.modules.battles.battleResults.render
{
   import game.ui.battleResults.BattleBtnsRenderUI;
   import nslm2.modules.battles.battleResults.BattleResultConfigVo;
   import nslm2.utils.PlatformUtil;
   import com.mz.core.configs.ClientConfig;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.mgrs.stcMgrs.vos.StcFacebookFeedVo;
   import com.mz.core.configs.EnvConfig;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.battles.battleResults.BattleResultGlobel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.handlers.Handler;
   import morn.core.components.Button;
   import nslm2.modules.footstones.gmModules.PlayerLogUtil;
   import nslm2.mgrs.SoundMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.globalModules.facebook.view.FBBtnView;
   import morn.customs.expands.MornExpandUtil;
   
   public class BattleBtnsRender extends BattleBtnsRenderUI
   {
       
      
      private var _exitTime:int = 15;
      
      private var configVo:BattleResultConfigVo;
      
      public function BattleBtnsRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_onClick);
         this.txt_autoExit.text = "";
         checkFaceBook();
      }
      
      private function checkFaceBook() : void
      {
         var _loc1_:* = null;
         if(PlatformUtil.isFeedShowFaceBook)
         {
            if(ClientConfig.firstBattle == 1)
            {
               btn_statistic.visible = false;
               btn_review.visible = false;
               btn_quit.x = 135;
               faceBookView.x = 270;
               txt_autoExit.x = 34;
               fbBtnView.dataSource = {
                  "feedId":11001,
                  "para_1":0,
                  "para_2":0
               };
               fbBtnView.visible = true;
            }
            else
            {
               btn_statistic.visible = true;
               btn_review.visible = true;
               _loc1_ = StcMgr.ins.getVoByMultiColumnValue("static_facebook_feed",["feedType","para_1","para_2"],[1,SceneModel.ins.stcStageVo.kind,SceneModel.ins.stcStageVo.id]) as StcFacebookFeedVo;
               if(_loc1_)
               {
                  btn_statistic.x = 0;
                  btn_review.x = 135;
                  btn_quit.x = 270;
                  faceBookView.x = 405;
                  txt_autoExit.x = 169;
                  fbBtnView.dataSource = {
                     "feedId":_loc1_.ID,
                     "para_1":_loc1_.para_1,
                     "para_2":_loc1_.para_2
                  };
                  fbBtnView.visible = true;
               }
               else
               {
                  btn_statistic.x = 67;
                  btn_review.x = 200;
                  btn_quit.x = 337;
                  txt_autoExit.x = 236;
                  fbBtnView.visible = false;
               }
            }
         }
         else
         {
            btn_statistic.x = 67;
            btn_review.x = 200;
            btn_quit.x = 337;
            txt_autoExit.x = 236;
            if(ClientConfig.firstBattle == 1)
            {
               btn_statistic.disabled = true;
               btn_review.disabled = true;
            }
            else
            {
               btn_statistic.disabled = false;
               btn_review.disabled = false;
            }
            btn_statistic.visible = true;
            btn_review.visible = true;
            fbBtnView.visible = false;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         configVo = param1 as BattleResultConfigVo;
         if(EnvConfig.ins.ptId != 2306)
         {
            TimerManager.ins.doLoop(1000,this.autoExit);
         }
      }
      
      public function exit() : void
      {
         BattleResultGlobel.ins.doubleId = 0;
         ModuleMgr.ins.closeModule(ModuleMgr.ins.popLayer.curModuleId);
         Handler.execute(configVo.closeHandler);
      }
      
      private function btn_onClick(param1:Button) : void
      {
         if(configVo == null)
         {
            return;
         }
         var _loc2_:* = param1;
         if(this.btn_quit !== _loc2_)
         {
            if(this.btn_review !== _loc2_)
            {
               if(this.btn_statistic === _loc2_)
               {
                  clearAutoExit();
                  Handler.execute(configVo.statisticHandler);
               }
            }
            else
            {
               ModuleMgr.ins.closeModule(ModuleMgr.ins.popLayer.curModuleId);
               Handler.execute(configVo.replayHandler);
               SoundMgr.ins.playCurrBack();
            }
         }
         else
         {
            if(ClientConfig.firstBattle == 1)
            {
               PlayerLogUtil.ins.saveNext();
            }
            exit();
         }
      }
      
      private function clearAutoExit() : void
      {
         TimerManager.ins.clearTimer(autoExit);
         this.txt_autoExit.text = "";
      }
      
      private function autoExit() : void
      {
         if(_exitTime == 0)
         {
            exit();
         }
         this.txt_autoExit.text = LocaleMgr.ins.getStr(40220011,[_exitTime]);
         _exitTime = Number(_exitTime) - 1;
      }
      
      public function get fbBtnView() : FBBtnView
      {
         return faceBookView as FBBtnView;
      }
      
      override public function dispose() : void
      {
         clearAutoExit();
         super.dispose();
      }
   }
}
