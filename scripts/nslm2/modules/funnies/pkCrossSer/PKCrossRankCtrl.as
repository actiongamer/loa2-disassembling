package nslm2.modules.funnies.pkCrossSer
{
   import com.mz.core.interFace.IDispose;
   import game.ui.pkCrossSer.PKCrossModuleUI;
   import com.greensock.TweenLite;
   import proto.CrossArenaRankInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CrossArenaRankInfoRes;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.newYears.olmpic2016.OlmpicSelCountryModel;
   import morn.core.components.Button;
   
   public class PKCrossRankCtrl implements IDispose
   {
       
      
      private var _skin:PKCrossModuleUI;
      
      private var currPage:int = 1;
      
      private var allPage:int = 1;
      
      private var _dispose:Boolean;
      
      public function PKCrossRankCtrl(param1:PKCrossModuleUI)
      {
         super();
         _skin = param1;
         _skin.pageBarUI.btn_next.clickHandler = clickHandler;
         _skin.pageBarUI.btn_prev.clickHandler = clickHandler;
         _skin.btn_next_more.clickHandler = clickHandler;
         _skin.btn_prev_more.clickHandler = clickHandler;
         _dispose = false;
         TweenLite.delayedCall(60,refreshData);
      }
      
      private function refreshData() : void
      {
         if(_dispose)
         {
            return;
         }
         reqData();
         TweenLite.delayedCall(60,refreshData);
      }
      
      public function setBigOrSmall(param1:Boolean = false) : void
      {
         if(param1)
         {
            PKCrossConst.NUM_PER_PAGE = 10;
            PKCrossConst.JUMP_PAGE = 3;
            _skin.img_rank_bg.height = 326;
            _skin.box_rank_button.y = 285;
            _skin.left_dock.y = 148;
            _skin.img_line_down.visible = true;
         }
         else
         {
            PKCrossConst.NUM_PER_PAGE = 5;
            PKCrossConst.JUMP_PAGE = 5;
            _skin.img_rank_bg.height = 226;
            _skin.box_rank_button.y = 185;
            _skin.left_dock.y = 96;
            _skin.img_line_down.visible = false;
         }
      }
      
      public function reqData() : void
      {
         var _loc1_:CrossArenaRankInfoReq = new CrossArenaRankInfoReq();
         _loc1_.numEachPage = PKCrossConst.NUM_PER_PAGE;
         _loc1_.page = currPage;
         _loc1_.choice = 1;
         ServerEngine.ins.send(4315,_loc1_,rankInfoReturn);
         _skin.list_rank.repeatY = PKCrossConst.NUM_PER_PAGE;
      }
      
      private function rankInfoReturn(param1:CrossArenaRankInfoRes) : void
      {
         allPage = Math.ceil(param1.rankLen / PKCrossConst.NUM_PER_PAGE);
         _skin.txt_rank.text = param1.myRank <= 0?LocaleMgr.ins.getStr(50600005):param1.myRank + "";
         _skin.pageBarUI.txt_pageNum.text = currPage + "/" + allPage;
         _skin.list_rank.array = param1.infos;
         OlmpicSelCountryModel.ins.selCountry = param1.myCountry;
         OlmpicSelCountryModel.ins.autoShow();
      }
      
      private function clickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(_skin.pageBarUI.btn_next !== _loc2_)
         {
            if(_skin.pageBarUI.btn_prev !== _loc2_)
            {
               if(_skin.btn_next_more !== _loc2_)
               {
                  if(_skin.btn_prev_more === _loc2_)
                  {
                     currPage = currPage - PKCrossConst.JUMP_PAGE;
                  }
               }
               else
               {
                  currPage = currPage + PKCrossConst.JUMP_PAGE;
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
         reqData();
      }
      
      public function dispose() : void
      {
         _dispose = true;
         TweenLite.killDelayedCallsTo(refreshData);
      }
   }
}
