package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import game.ui.rankModules.RankModuleUI;
   import game.ui.rankModules.RankTitle7CellUI;
   import morn.core.components.Label;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import nslm2.modules.foundations.ranks.RankUtil;
   import nslm2.modules.funnies.pkCrossSer.PKCrossModel;
   import flash.events.MouseEvent;
   import proto.CrossArenaRankInfoRes;
   import nslm2.modules.funnies.newYears.olmpic2016.OlmpicSelCountryModel;
   import nslm2.common.compsEffects.ListHChangePageEffect;
   import proto.CrossArenaRankInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.utils.DisplayUtils;
   import morn.core.components.Image;
   
   public class PKCrossRankModule extends RankModuleUI
   {
      
      private static const NUM_PER_PAGE:int = 10;
      
      public static var type:int;
       
      
      private var curpage:int = 1;
      
      private var list:Array;
      
      private var totalpage:int = 0;
      
      private var exec:Boolean = false;
      
      private var title:RankTitle7CellUI;
      
      private var title_hx:Array;
      
      private var title_js:Array;
      
      private var txt_times:Label;
      
      private var textCDCtrl_preFinish:TextCDCtrlS2;
      
      private var tabChange:Boolean = false;
      
      private var _res:CrossArenaRankInfoRes;
      
      protected var hChangePageCtrl:ListHChangePageEffect;
      
      private var changeDir:int = 0;
      
      public function PKCrossRankModule()
      {
         title_hx = [11800201,50500039,50500089,11000809,10000004,50200002,41300083];
         title_js = [11800201,50500039,50500089,11000809,10000004,50200002,50500126];
         super();
         bangdanname.itemRender = PKCRankNameRener;
         bangdanname.repeatY = 2;
         list_items.itemRender = PKCRankListRener;
         list_items.spaceX = 0;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr("9111800");
         title = new RankTitle7CellUI();
         title.x = head_value.x;
         title.y = head_value.y;
         head_value.parent.addChild(title);
         DisplayUtils.removeSelf(head_value);
         this.hChangePageCtrl = new ListHChangePageEffect(this.list_items);
         var _loc1_:Image = new Image();
         _loc1_.skin = "png.uiPKCrossSer.img_lightBg";
         _loc1_.x = this.txt_myrankinfo1.x + 150;
         _loc1_.y = this.txt_myrankinfo1.y + 20;
         addChild(_loc1_);
         txt_times = new Label();
         txt_times.x = _loc1_.x - 140;
         txt_times.y = _loc1_.y;
         txt_times.style = "渐变1";
         txt_times.text = LocaleMgr.ins.getStr(999000446);
         txt_times.width = _loc1_.width + 280;
         txt_times.height = 80;
         txt_times.align = "center";
         addChild(txt_times);
      }
      
      private function startPreFinishCD(param1:uint) : void
      {
         if(!textCDCtrl_preFinish)
         {
            textCDCtrl_preFinish = new TextCDCtrlS2(this.txt_times,textCDFormat,txtCDCtrl_preFinish_cpl);
            this.parts.push(textCDCtrl_preFinish);
         }
         else
         {
            textCDCtrl_preFinish.stop();
         }
         textCDCtrl_preFinish.start(param1);
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(50600001,[TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1),LabelUtils.cdColor(false))]);
      }
      
      private function txtCDCtrl_preFinish_cpl() : void
      {
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.txt_frame_propt.text = LocaleMgr.ins.getStr(11800101);
         var _loc2_:RankUtil = new RankUtil(50600040,"png.uiRankModule.图标.图标1","png.uiRankModule.暗底.4","png.uiRankModule.亮底.4");
         var _loc3_:RankUtil = new RankUtil(50600041,"png.uiRankModule.图标.图标2","png.uiRankModule.暗底.1","png.uiRankModule.亮底.1");
         bangdanname.dataSource = [_loc2_,_loc3_];
         this.bangdanname.changeHandler = tabhandler;
         this.txt_myrankinfo2.visible = false;
         this.txt_rankinfoprompt.visible = false;
         this.img_pmd.visible = false;
         this.btn_search.visible = false;
         this.txt_searchname.visible = false;
         this.txt_desc.visible = false;
         super.preShow(param1);
         this.txt_myrankinfo1.multiline = true;
         this.txt_myrankinfo1.height = 100;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.pageBarRef.btn_first.addEventListener("click",pageBtnFir);
            this.pageBarRef.btn_last.addEventListener("click",pageBtnLas);
            this.pageBarRef.btn_next.addEventListener("click",pageBtnNex);
            this.pageBarRef.btn_prev.addEventListener("click",pageBtnPre);
         }
         else
         {
            this.pageBarRef.btn_first.removeEventListener("click",pageBtnFir);
            this.pageBarRef.btn_last.removeEventListener("click",pageBtnLas);
            this.pageBarRef.btn_next.removeEventListener("click",pageBtnNex);
            this.pageBarRef.btn_prev.removeEventListener("click",pageBtnPre);
         }
      }
      
      public function get model() : PKCrossModel
      {
         return PKCrossModel.ins;
      }
      
      private function tabhandler(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         type = param1;
         curpage = 1;
         changeDir = 0;
         if(type == 0)
         {
            _loc2_ = title_hx;
         }
         else
         {
            _loc2_ = title_js;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            this.title["txt_head" + _loc3_].text = LocaleMgr.ins.getStr(_loc2_[_loc3_]);
            _loc3_++;
         }
         tabChange = true;
         requestData(type);
      }
      
      private function pageBtnPre(param1:MouseEvent) : void
      {
         changeDir = 2;
         curpage = Number(curpage) - 1;
         if(curpage > totalpage)
         {
            curpage = totalpage;
         }
         if(curpage < 1)
         {
            curpage = 1;
         }
         requestData(type);
      }
      
      private function pageBtnFir(param1:MouseEvent) : void
      {
         changeDir = 2;
         curpage = 1;
         if(curpage > totalpage)
         {
            curpage = totalpage;
         }
         if(curpage < 1)
         {
            curpage = 1;
         }
         requestData(type);
      }
      
      private function pageBtnLas(param1:MouseEvent) : void
      {
         changeDir = 1;
         curpage = totalpage;
         if(curpage > totalpage)
         {
            curpage = totalpage;
         }
         if(curpage < 1)
         {
            curpage = 1;
         }
         requestData(type);
      }
      
      private function pageBtnNex(param1:MouseEvent) : void
      {
         changeDir = 1;
         curpage = Number(curpage) + 1;
         if(curpage > totalpage)
         {
            curpage = totalpage;
         }
         if(curpage < 1)
         {
            curpage = 1;
         }
         requestData(type);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         bangdanname.selectedIndex = 0;
         tabhandler(0);
      }
      
      private function computePage(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:int = Math.ceil(param1 / 10);
         this.totalpage = _loc2_;
         this.pageBarRef.txt_pageNum.text = curpage + "/" + totalpage;
         if(curpage <= 1)
         {
            this.pageBarRef.btn_first.disabled = true;
            this.pageBarRef.btn_prev.disabled = true;
         }
         else
         {
            this.pageBarRef.btn_first.disabled = false;
            this.pageBarRef.btn_prev.disabled = false;
         }
         if(curpage >= totalpage)
         {
            this.pageBarRef.btn_last.disabled = true;
            this.pageBarRef.btn_next.disabled = true;
         }
         else
         {
            this.pageBarRef.btn_last.disabled = false;
            this.pageBarRef.btn_next.disabled = false;
         }
         if(tabChange)
         {
            tabChange = false;
            _loc3_ = _res.myRank <= 0?LocaleMgr.ins.getStr(50600005):_res.myRank + "";
            if(type == 0)
            {
               this.txt_myrankinfo1.text = LocaleMgr.ins.getStr(50600029,[_loc3_,_res.myMassFightTimes,_res.myScore]);
               if(model.info.status == 1)
               {
                  startPreFinishCD(model.info.endStamp);
               }
               else
               {
                  if(textCDCtrl_preFinish)
                  {
                     textCDCtrl_preFinish.stop();
                  }
                  txt_times.text = LocaleMgr.ins.getStr(300006062);
               }
            }
            else
            {
               if(model.info.status == 2)
               {
                  startPreFinishCD(model.info.endStamp);
               }
               else
               {
                  txt_times.text = LocaleMgr.ins.getStr(300006062);
                  if(textCDCtrl_preFinish)
                  {
                     textCDCtrl_preFinish.stop();
                  }
               }
               _loc4_ = _res.myWinTimes + _res.myFailTimes;
               if(_loc4_ > 0)
               {
                  _loc5_ = int(_res.myWinTimes * 100 / _loc4_) + "%";
               }
               else
               {
                  _loc5_ = "0%";
               }
               this.txt_myrankinfo1.text = LocaleMgr.ins.getStr(50600030,[_loc3_,_res.myWinTimes + _res.myFailTimes,_loc5_]);
            }
         }
      }
      
      protected function onPKCROSSHXCpl(param1:CrossArenaRankInfoRes) : void
      {
         _res = param1;
         if(param1 == null)
         {
            list = [];
            this.list_items.dataSource = [];
            this.curpage = 0;
            this.totalpage = 0;
         }
         else
         {
            list = param1.infos;
            this.list_items.dataSource = param1.infos;
            computePage(param1.rankLen);
            OlmpicSelCountryModel.ins.selCountry = param1.myCountry;
            OlmpicSelCountryModel.ins.autoShow();
         }
         this.getValue(0);
         if(this.exec == false)
         {
            this.moduleServerCpl();
            this.exec = true;
         }
      }
      
      protected function onPKCROSSJSCpl(param1:CrossArenaRankInfoRes) : void
      {
         _res = param1;
         if(param1 == null)
         {
            list = [];
            this.list_items.dataSource = [];
            this.curpage = 0;
            this.totalpage = 0;
         }
         else
         {
            list = param1.infos;
            this.list_items.dataSource = param1.infos;
            computePage(param1.rankLen);
            OlmpicSelCountryModel.ins.selCountry = param1.myCountry;
            OlmpicSelCountryModel.ins.autoShow();
         }
         this.getValue(1);
      }
      
      private function getValue(param1:int) : void
      {
         if(changeDir == 0)
         {
            this.fadeIn(0,11010);
         }
         else
         {
            hChangePageCtrl.preChange();
            hChangePageCtrl.afterChange(changeDir);
            this.fadeIn(0,11800);
         }
      }
      
      override public function dispose() : void
      {
         if(textCDCtrl_preFinish)
         {
            textCDCtrl_preFinish.stop();
         }
         super.dispose();
      }
      
      protected function requestData(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         this.list_items.selectedIndex = -1;
         switch(int(param1))
         {
            case 0:
               _loc3_ = new CrossArenaRankInfoReq();
               _loc3_.numEachPage = 10;
               _loc3_.page = curpage;
               _loc3_.choice = 1;
               ServerEngine.ins.send(4315,_loc3_,onPKCROSSHXCpl);
               break;
            case 1:
               _loc2_ = new CrossArenaRankInfoReq();
               _loc2_.numEachPage = 10;
               _loc2_.page = curpage;
               _loc2_.choice = 2;
               ServerEngine.ins.send(4315,_loc2_,onPKCROSSJSCpl);
         }
      }
   }
}
