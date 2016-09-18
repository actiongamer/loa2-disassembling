package nslm2.modules.globalModules.fbFansPage
{
   import game.ui.fansPage.FBFansPageModuleUI;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.configs.ClientConfig;
   import morn.core.utils.URLUtils;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.logging.Log;
   
   public class FBFansPageModule extends FBFansPageModuleUI
   {
      
      private static var _tempBool:Boolean = false;
       
      
      public function FBFansPageModule()
      {
         super();
         init();
      }
      
      private function init() : void
      {
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         titleTxt.text = LocaleMgr.ins.getStr(999001124);
         var _loc1_:Array = WealthUtil.dropGroupIDToWealthVoArr(DefindConsts.GAME_LIKE_DROP);
         rewardList.repeatX = _loc1_.length;
         rewardList.dataSource = _loc1_;
      }
      
      private function btnHandler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(closeBtn !== _loc3_)
         {
            if(likeBtn === _loc3_)
            {
               if(likeBtn.style == "按钮大黄充值")
               {
                  if(ClientConfig.gameId == "167")
                  {
                     URLUtils.openWindow("https://www.facebook.com/GTA.LeagueOfAngels2");
                  }
                  else if(ClientConfig.gameId == "160")
                  {
                     URLUtils.openWindow("https://www.facebook.com/LeagueOfAngels2");
                  }
                  else if(ClientConfig.gameId == "186")
                  {
                     if(ClientConfig.language == "it")
                     {
                        URLUtils.openWindow("https://www.facebook.com/LeagueOfAngels2IT");
                     }
                     else if(ClientConfig.language == "pl")
                     {
                        URLUtils.openWindow("https://www.facebook.com/LeagueOfAngels2PL");
                     }
                     else if(ClientConfig.language == "tr")
                     {
                        URLUtils.openWindow("https://www.facebook.com/LOA2TR");
                     }
                  }
                  else
                  {
                     URLUtils.openWindow("https://www.facebook.com/LeagueOfAngels2");
                  }
                  _tempBool = true;
               }
               else
               {
                  ServerEngine.ins.send(10002,null,likeRewardHandler);
               }
               ModuleMgr.ins.closeModule(90001);
            }
         }
         else
         {
            ModuleMgr.ins.closeModule(90001);
         }
      }
      
      private function likeRewardHandler() : void
      {
         VipModel.ins.canGetGameLikeReward = false;
         FloatUtil.showGetItemsDisplayPanel(rewardList.dataSource as Array);
         ObserverMgr.ins.sendNotice("updateIconBar");
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         callBackFBFansPage(_tempBool);
      }
      
      private function callBackFBFansPage(param1:*) : void
      {
         Log.info("粉丝页点赞请求返回" + param1);
         if(param1)
         {
            likeBtn.style = "按钮大绿充值";
            likeBtn.label = LocaleMgr.ins.getStr(999001126);
         }
         else
         {
            likeBtn.style = "按钮大黄充值";
            likeBtn.label = LocaleMgr.ins.getStr(999001125);
         }
      }
   }
}
