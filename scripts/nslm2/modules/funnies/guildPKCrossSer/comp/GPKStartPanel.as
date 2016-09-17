package nslm2.modules.funnies.guildPKCrossSer.comp
{
   import game.ui.guildPKCrossSer.GPKStartPanelUI;
   import proto.FamilyExpeChallengeInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.guildPKCrossSer.GPKCModel;
   import proto.FamilyExpeChallengeInfoRes;
   import flash.events.MouseEvent;
   import proto.FamilyExpeFamilyInfo;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.funnies.guildPKCrossSer.GPKConst;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class GPKStartPanel extends GPKStartPanelUI
   {
      
      public static const NUM_PER_PAGE:int = 3;
       
      
      private var _cd:int = 0;
      
      private var currPage:int = 1;
      
      private var allPage:int = 1;
      
      public function GPKStartPanel()
      {
         super();
         this.list_enemy.itemRender = GPKStartRender;
         this.img_bg1.url = UrlLib.gpkcUrl("img_star_bg2.png");
         this.img_bg2.url = UrlLib.gpkcUrl("img_star_bg.png");
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9040761);
         this.btn_change.clickHandler = changeClick;
         this.btn_change.visible = false;
         refreshView();
      }
      
      private function changeClick() : void
      {
         var _loc1_:FamilyExpeChallengeInfoReq = new FamilyExpeChallengeInfoReq();
         _loc1_.refresh = true;
         ServerEngine.ins.send(4353,_loc1_,onInfoRet,onError);
         this.btn_change.disabled = true;
         _cd = 5;
         TimerManager.ins.doLoop(1000,countdown);
      }
      
      private function countdown() : void
      {
         this.btn_change.label = LocaleMgr.ins.getStr(30610021) + "(" + _cd + ")";
         _cd = Number(_cd) - 1;
         if(_cd < 0)
         {
            this.btn_change.disabled = false;
            this.btn_change.label = LocaleMgr.ins.getStr(30610021);
            TimerManager.ins.clearTimer(countdown);
         }
      }
      
      private function get model() : GPKCModel
      {
         return GPKCModel.ins;
      }
      
      private function reqInfo() : void
      {
         ServerEngine.ins.send(4353,null,onInfoRet,onError);
      }
      
      public function onInfoRet(param1:FamilyExpeChallengeInfoRes) : void
      {
         model.challengeInfo = param1;
         refreshView();
      }
      
      public function onError(param1:*) : void
      {
      }
      
      override public function dispose() : void
      {
         TimerManager.ins.clearTimer(countdown);
         super.dispose();
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.pageBarUI.btn_first.addEventListener("click",clickHandler);
            this.pageBarUI.btn_last.addEventListener("click",clickHandler);
            this.pageBarUI.btn_next.addEventListener("click",clickHandler);
            this.pageBarUI.btn_prev.addEventListener("click",clickHandler);
         }
         else
         {
            this.pageBarUI.btn_first.removeEventListener("click",clickHandler);
            this.pageBarUI.btn_last.removeEventListener("click",clickHandler);
            this.pageBarUI.btn_next.removeEventListener("click",clickHandler);
            this.pageBarUI.btn_prev.removeEventListener("click",clickHandler);
         }
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = param1.currentTarget;
         if(this.pageBarUI.btn_next !== _loc2_)
         {
            if(this.pageBarUI.btn_prev !== _loc2_)
            {
               if(pageBarUI.btn_first !== _loc2_)
               {
                  if(pageBarUI.btn_last === _loc2_)
                  {
                     currPage = allPage;
                  }
               }
               else
               {
                  currPage = 1;
               }
            }
            else
            {
               currPage = Number(currPage) - 1;
            }
         }
         else
         {
            currPage = Number(currPage) + 1;
         }
         if(currPage > allPage)
         {
            currPage = allPage;
         }
         if(currPage < 1)
         {
            currPage = 1;
         }
         refreshList();
      }
      
      private function refreshList() : void
      {
         if(currPage <= 1)
         {
            this.pageBarUI.btn_first.disabled = true;
            this.pageBarUI.btn_prev.disabled = true;
         }
         else
         {
            this.pageBarUI.btn_first.disabled = false;
            this.pageBarUI.btn_prev.disabled = false;
         }
         if(currPage >= allPage)
         {
            this.pageBarUI.btn_last.disabled = true;
            this.pageBarUI.btn_next.disabled = true;
         }
         else
         {
            this.pageBarUI.btn_last.disabled = false;
            this.pageBarUI.btn_next.disabled = false;
         }
         var _loc1_:int = (currPage - 1) * 3;
         this.list_enemy.array = model.challengeInfo.enemyFamilies.slice(_loc1_,_loc1_ + 3);
         pageBarUI.txt_pageNum.text = currPage + "/" + allPage;
      }
      
      private function get meInfo() : FamilyExpeFamilyInfo
      {
         return model.challengeInfo.selfFamily;
      }
      
      private function refreshView() : void
      {
         img_flag_bg.url = GuildUtil.getFlagBgUrl(meInfo.flagBase);
         img_flag_icon.url = GuildUtil.getFlagIconUrl(meInfo.flagIcon);
         this.txt_me_name.text = "Lv." + meInfo.familyLv + " " + meInfo.familyName;
         this.txt_me_info.text = LocaleMgr.ins.getStr(41701004) + "：" + TextFieldUtil.htmlText2(GPKConst.powerToW(meInfo.ability),11137387) + "\n" + LocaleMgr.ins.getStr(30610225) + TextFieldUtil.htmlText2(meInfo.avaiNum + "/" + meInfo.totalNum,11137387) + "\n" + LocaleMgr.ins.getStr(41701006) + "：" + TextFieldUtil.htmlText2(meInfo.reputation,11137387) + "\n" + LocaleMgr.ins.getStr(30610226) + TextFieldUtil.htmlText2(meInfo.rank,11137387);
         currPage = 1;
         allPage = Math.ceil(model.challengeInfo.enemyFamilies.length / 3);
         refreshList();
         this.txt_fight_times.text = LocaleMgr.ins.getStr(30610209) + TextFieldUtil.htmlText2(model.info.self.residualTimes,11137387) + "/" + DefindConsts.FAMILY_EXPE_FAMILY_FIGHT_TIMES;
      }
   }
}
