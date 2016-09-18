package nslm2.modules.funnies.pkCrossSer.PKCrossFinal
{
   import game.ui.pkCrossSer.PKCrossFinalRankUI;
   import flash.events.Event;
   import nslm2.modules.funnies.newYears.olmpic2016.OlmpicSelCountryModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcCountryIconVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.greensock.TweenLite;
   import morn.core.components.Button;
   import nslm2.modules.funnies.pkCrossSer.PKCrossConst;
   import proto.CrossArenaRankInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CrossArenaRankInfoRes;
   import proto.CrossArenaRankInfo;
   import nslm2.modules.funnies.pkCrossSer.PKCrossModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.funnies.pkCrossSer.PKCrossRankRender;
   import flash.events.MouseEvent;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.mgrs.UIMgr;
   import com.mz.core.configs.ClientConfig;
   
   public class PKCrossFinalRank extends PKCrossFinalRankUI
   {
       
      
      private var _type:int;
      
      private var currPage:int = 1;
      
      private var allPage:int = 1;
      
      public function PKCrossFinalRank()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         if(UIMgr.gameHeight <= ClientConfig.SCENE_MIN_H + 100)
         {
            setBigOrSmall(false);
         }
         else
         {
            setBigOrSmall(true);
         }
         tab.selectHandler = tabChangeHandler;
         if(model.isFinalFighter)
         {
            tab.selectedIndex = 1;
            tabChangeHandler(1);
         }
         else
         {
            tab.selectedIndex = 0;
         }
         pageBarUI.btn_next.clickHandler = clickHandler;
         pageBarUI.btn_prev.clickHandler = clickHandler;
         btn_next_more.clickHandler = clickHandler;
         btn_prev_more.clickHandler = clickHandler;
         TweenLite.delayedCall(60,refreshData);
         if(OlmpicSelCountryModel.ins.isOpen())
         {
            OlmpicSelCountryModel.ins.addEventListener("myCountryChange",onMyCountryChange);
            onMyCountryChange(null);
         }
         else
         {
            this.img_myFlag.visible = false;
         }
      }
      
      protected function onMyCountryChange(param1:Event) : void
      {
         var _loc2_:* = null;
         if(OlmpicSelCountryModel.ins.selCountry > 0)
         {
            this.img_myFlag.visible = true;
            _loc2_ = StcMgr.ins.getCountryIconVo(OlmpicSelCountryModel.ins.selCountry);
            this.img_myFlag.url = UrlLib.olmpicCountryFlagUrl(_loc2_.icon);
         }
         else
         {
            this.img_myFlag.visible = false;
         }
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(refreshData);
         OlmpicSelCountryModel.ins.removeEventListener("myCountryChange",onMyCountryChange);
         super.dispose();
      }
      
      private function refreshData() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         reqData();
         TweenLite.delayedCall(60,refreshData);
      }
      
      private function clickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(pageBarUI.btn_next !== _loc2_)
         {
            if(pageBarUI.btn_prev !== _loc2_)
            {
               if(btn_next_more !== _loc2_)
               {
                  if(btn_prev_more === _loc2_)
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
      
      public function reqData() : void
      {
         var _loc1_:CrossArenaRankInfoReq = new CrossArenaRankInfoReq();
         _loc1_.numEachPage = PKCrossConst.NUM_PER_PAGE;
         _loc1_.page = currPage;
         _loc1_.choice = _type;
         ServerEngine.ins.send(4315,_loc1_,rankInfoReturn);
         list_rank.repeatY = PKCrossConst.NUM_PER_PAGE;
      }
      
      public function setBigOrSmall(param1:Boolean = false) : void
      {
         if(param1)
         {
            PKCrossConst.NUM_PER_PAGE = 10;
            PKCrossConst.JUMP_PAGE = 3;
            img_rank_bg.height = 326;
            box_rank_button.y = 285;
            left_dock.y = 148;
            img_line_down.visible = true;
         }
         else
         {
            PKCrossConst.NUM_PER_PAGE = 5;
            PKCrossConst.JUMP_PAGE = 5;
            img_rank_bg.height = 226;
            box_rank_button.y = 185;
            left_dock.y = 96;
            img_line_down.visible = false;
         }
      }
      
      private function rankInfoReturn(param1:CrossArenaRankInfoRes) : void
      {
         var _loc3_:int = 0;
         allPage = Math.ceil(param1.rankLen / PKCrossConst.NUM_PER_PAGE);
         pageBarUI.txt_pageNum.text = currPage + "/" + allPage;
         if(_type == 3)
         {
            _loc3_ = PKCrossConst.NUM_PER_PAGE * (currPage - 1) + 1;
            var _loc5_:int = 0;
            var _loc4_:* = param1.infos;
            for each(var _loc2_ in param1.infos)
            {
               _loc2_.score = _loc3_;
               _loc3_++;
            }
         }
         list_rank.array = param1.infos;
         OlmpicSelCountryModel.ins.selCountry = param1.myCountry;
         OlmpicSelCountryModel.ins.autoShow();
      }
      
      private function get model() : PKCrossModel
      {
         return PKCrossModel.ins;
      }
      
      private function tabChangeHandler(param1:int) : void
      {
         currPage = 1;
         if(param1 == 0)
         {
            finalMySerMode();
         }
         else if(param1 == 1)
         {
            finalMode();
         }
      }
      
      private function finalMode() : void
      {
         this.txt_info.text = !!model.isFinalFighter?LocaleMgr.ins.getStr(50400106) + TextFieldUtil.htmlText2(model.info.finalRank,65280):LocaleMgr.ins.getStr(50600037);
         t0.text = LocaleMgr.ins.getStr(11800201);
         t1.text = LocaleMgr.ins.getStr(11000854);
         t2.text = "";
         t3.text = LocaleMgr.ins.getStr(10000004);
         _type = 2;
         PKCrossRankRender.type = 2;
         reqData();
      }
      
      private function finalMySerMode() : void
      {
         this.txt_info.text = LocaleMgr.ins.getStr(50600036);
         t0.text = LocaleMgr.ins.getStr(50600035);
         t1.text = LocaleMgr.ins.getStr(11000854);
         t2.text = LocaleMgr.ins.getStr(10000004);
         t3.text = LocaleMgr.ins.getStr(50200001);
         _type = 3;
         PKCrossRankRender.type = 3;
         reqData();
      }
      
      private function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_left_dock === _loc3_)
         {
            zoomInfoPanel();
         }
      }
      
      protected function zoomInfoPanel(param1:MouseEvent = null) : void
      {
         if(this.x >= 0)
         {
            TweenLite.to(this,0.2,{"x":-this.img_rank_bg.width + 4});
            TweenLite.to(img_dock_left,0.2,{"rotation":180});
         }
         else
         {
            TweenLite.to(this,0.2,{"x":0});
            TweenLite.to(img_dock_left,0.2,{"rotation":0});
         }
      }
   }
}
