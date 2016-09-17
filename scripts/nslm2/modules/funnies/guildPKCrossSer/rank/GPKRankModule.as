package nslm2.modules.funnies.guildPKCrossSer.rank
{
   import game.ui.rankModules.RankModuleUI;
   import morn.core.components.Label;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import game.ui.guildPKCrossSer.GPKRank.GPKghpmTitleUI;
   import game.ui.guildPKCrossSer.GPKRank.GPKgrpmTitleUI;
   import game.ui.guildPKCrossSer.GPKRank.GPKkfpmTitleUI;
   import game.ui.guildPKCrossSer.GPKRank.GPKzkxxTitleUI;
   import game.ui.guildPKCrossSer.GPKRank.gpkRankBoxUI;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.FamilyExpeLastChampionRes;
   import nslm2.modules.funnies.guildPKCrossSer.GPKCModel;
   import nslm2.utils.ServerTimer;
   import nslm2.utils.RTools;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import nslm2.modules.foundations.ranks.RankUtil;
   import flash.events.MouseEvent;
   import proto.CrossArenaRankInfoRes;
   import proto.FamilyExpeBattleInfoRes;
   import com.greensock.TweenLite;
   import morn.core.utils.StringUtils;
   import nslm2.modules.funnies.guildPKCrossSer.GPKConst;
   import proto.FamilyExpeFamilyPlayerRankRes;
   import nslm2.common.compsEffects.ListHChangePageEffect;
   import proto.FamilyExpeSingleRankRes;
   import proto.FamilyExpeFamilyPlayerRankReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FamilyExpeSingleRankReq;
   import proto.FamilyExpeCrossRankReq;
   import proto.FamilyExpeCrossRankRes;
   import nslm2.modules.funnies.pkCrossSer.PKCrossComp.PKCRankNameRener;
   import morn.core.components.Image;
   
   public class GPKRankModule extends RankModuleUI
   {
      
      private static const NUM_PER_PAGE:int = 10;
      
      public static var type:int;
       
      
      private var curpage:int = 1;
      
      private var list:Array;
      
      private var totalpage:int = 0;
      
      private var exec:Boolean = false;
      
      private var title_kfpm:Array;
      
      private var title_grpm:Array;
      
      private var title_ghnpm:Array;
      
      private var txt_times:Label;
      
      private var textCDCtrl_preFinish:TextCDCtrlS2;
      
      private var titleGhnpm:GPKghpmTitleUI;
      
      private var titleGrpm:GPKgrpmTitleUI;
      
      private var titleKfpm:GPKkfpmTitleUI;
      
      private var titleZkxx:GPKzkxxTitleUI;
      
      private var btn_kfpmReward:gpkRankBoxUI;
      
      private var lastChamp:FamilyExpeLastChampionRes;
      
      private var actDay:int;
      
      private var tabChange:Boolean = false;
      
      private var _res:CrossArenaRankInfoRes;
      
      protected var hChangePageCtrl:ListHChangePageEffect;
      
      private var changeDir:int = 0;
      
      public function GPKRankModule()
      {
         title_kfpm = [11800201,11000808,50500089,31013,41701004,41701005,41701006];
         title_grpm = [11800201,11000854,2035,10000004,40700042,11000808,40700033];
         title_ghnpm = [11800201,11000854,40700022,2035,10000004,40700042,50200002,41701005];
         super();
         bangdanname.itemRender = PKCRankNameRener;
         bangdanname.repeatY = 4;
         list_items.spaceX = 0;
         list_items.spaceY = 6;
         list_items.width = 546;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr("9111800");
         this.hChangePageCtrl = new ListHChangePageEffect(this.list_items);
         var _loc1_:Image = new Image();
         _loc1_.skin = "png.a5.commonImgs.img_fightBg2";
         _loc1_.x = this.txt_myrankinfo1.x + 150;
         _loc1_.y = this.txt_myrankinfo1.y + 20;
         addChild(_loc1_);
         txt_times = new Label();
         txt_times.style = "渐变1";
         txt_times.width = _loc1_.width + 100;
         txt_times.height = _loc1_.height * 2;
         txt_times.align = "center";
         txt_times.text = LocaleMgr.ins.getStr(99900125);
         txt_times.x = _loc1_.x - 50;
         txt_times.y = _loc1_.y;
         addChild(txt_times);
         initTitle();
         model.reqLastChampion(setLastChampion);
         btn_kfpmReward = new gpkRankBoxUI();
         btn_kfpmReward.x = _loc1_.x - 50 + 318;
         btn_kfpmReward.y = _loc1_.y - 15;
         addChild(btn_kfpmReward);
         btn_kfpmReward.btn_box.clickHandler = boxClick;
      }
      
      private function boxClick() : void
      {
         ModuleMgr.ins.showOrCloseModule(40771,lastChamp,40764);
      }
      
      private function setLastChampion(param1:FamilyExpeLastChampionRes) : void
      {
         lastChamp = param1;
      }
      
      private function getOpenDay() : int
      {
         var _loc1_:Array = GPKCModel.ins.openAry();
         actDay = _loc1_[4];
         var _loc2_:int = ServerTimer.ins.second - RTools.getTimestamp(_loc1_[1],_loc1_[2],_loc1_[3],0,0,0) / 1000;
         return _loc2_ / 86400 + 1;
      }
      
      private function initTitle() : void
      {
         titleGhnpm = new GPKghpmTitleUI();
         titleGrpm = new GPKgrpmTitleUI();
         titleKfpm = new GPKkfpmTitleUI();
         titleZkxx = new GPKzkxxTitleUI();
         var _loc2_:* = head_value.x;
         titleZkxx.x = _loc2_;
         _loc2_ = _loc2_;
         titleKfpm.x = _loc2_;
         _loc2_ = _loc2_;
         titleGrpm.x = _loc2_;
         titleGhnpm.x = _loc2_;
         _loc2_ = head_value.y;
         titleZkxx.y = _loc2_;
         _loc2_ = _loc2_;
         titleKfpm.y = _loc2_;
         _loc2_ = _loc2_;
         titleGrpm.y = _loc2_;
         titleGhnpm.y = _loc2_;
         head_value.parent.addChild(titleGhnpm);
         head_value.parent.addChild(titleGrpm);
         head_value.parent.addChild(titleKfpm);
         head_value.parent.addChild(titleZkxx);
         DisplayUtils.removeSelf(head_value);
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < title_kfpm.length)
         {
            titleKfpm["t" + _loc1_].text = LocaleMgr.ins.getStr(title_kfpm[_loc1_]);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < title_grpm.length)
         {
            titleGrpm["t" + _loc1_].text = LocaleMgr.ins.getStr(title_grpm[_loc1_]);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < title_ghnpm.length)
         {
            titleGhnpm["t" + _loc1_].text = LocaleMgr.ins.getStr(title_ghnpm[_loc1_]);
            _loc1_++;
         }
         titleZkxx.t0.text = LocaleMgr.ins.getStr(41701000);
      }
      
      private function invisibleAllTitle() : void
      {
         titleGhnpm.visible = false;
         titleGrpm.visible = false;
         titleKfpm.visible = false;
         titleZkxx.visible = false;
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
         var _loc3_:RankUtil = new RankUtil(41701000,"png.uiRankModule.图标.图标1","png.uiRankModule.暗底.1","png.uiRankModule.亮底.1");
         var _loc2_:RankUtil = new RankUtil(41701001,"png.uiRankModule.图标.图标2","png.uiRankModule.暗底.2","png.uiRankModule.亮底.2");
         var _loc5_:RankUtil = new RankUtil(41701002,"png.uiRankModule.图标.图标3","png.uiRankModule.暗底.3","png.uiRankModule.亮底.3");
         var _loc4_:RankUtil = new RankUtil(41701003,"png.uiRankModule.图标.图标4","png.uiRankModule.暗底.4","png.uiRankModule.亮底.4");
         bangdanname.dataSource = [_loc3_,_loc2_,_loc5_,_loc4_];
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
      
      public function get model() : GPKCModel
      {
         return GPKCModel.ins;
      }
      
      private function tabhandler(param1:int) : void
      {
         type = param1;
         curpage = 1;
         changeDir = 0;
         var _loc2_:int = 0;
         this.list_items.dataSource = [];
         this.pageBarRef.visible = true;
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            this["b" + _loc2_].visible = true;
            _loc2_++;
         }
         btn_kfpmReward.visible = false;
         resetListSize();
         switch(int(type))
         {
            case 0:
               _loc2_ = 0;
               while(_loc2_ < 5)
               {
                  this["b" + _loc2_].visible = false;
                  _loc2_++;
               }
               invisibleAllTitle();
               titleZkxx.visible = true;
               list_items.itemRender = GPKzkxxRender;
               list_items.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
               list_items.repeatY = NaN;
               list_items.height = 360;
               this.pageBarRef.visible = false;
               showGuildTop();
               break;
            case 1:
               invisibleAllTitle();
               titleKfpm.visible = true;
               list_items.itemRender = GPKkfpmRender;
               showGuildTop();
               btn_kfpmReward.visible = true;
               break;
            case 2:
               invisibleAllTitle();
               titleGrpm.visible = true;
               list_items.itemRender = GPKgrpmRender;
               showMyTop();
               break;
            case 3:
               invisibleAllTitle();
               titleGhnpm.visible = true;
               list_items.itemRender = GPKghnpmRender;
               showMyTop();
         }
         tabChange = true;
         requestData(type);
      }
      
      private function resetListSize() : void
      {
         list_items.vScrollBarSkin = null;
         list_items.repeatY = 10;
         list_items.height = NaN;
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
         var _loc2_:int = 0;
         bangdanname.selectedIndex = _loc2_;
         tabhandler(_loc2_);
      }
      
      private function computePage(param1:int) : void
      {
         var _loc2_:int = Math.ceil(param1 / 10);
         this.totalpage = Math.max(_loc2_,1);
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
         }
      }
      
      protected function onZKXXCpl(param1:FamilyExpeBattleInfoRes) : void
      {
         if(param1 == null)
         {
            list = [];
            this.list_items.dataSource = [];
            this.curpage = 0;
            this.totalpage = 0;
         }
         else
         {
            list = param1.result;
            this.list_items.dataSource = param1.result;
         }
         this.getValue();
         if(this.exec == false)
         {
            this.moduleServerCpl();
            this.exec = true;
         }
      }
      
      private function showGuildTop() : void
      {
         if(!lastChamp)
         {
            if(isDisposed)
            {
               return;
            }
            TweenLite.delayedCall(0.5,showGuildTop);
            return;
         }
         var _loc1_:int = getOpenDay();
         if(_loc1_ > 0 && _loc1_ <= actDay)
         {
            txt_times.text = LocaleMgr.ins.getStr(99900126,[_loc1_]);
         }
         else
         {
            txt_times.text = LocaleMgr.ins.getStr(99900127);
         }
         if(lastChamp && !StringUtils.isNull(lastChamp.familyName))
         {
            txt_times.text = txt_times.text + (LocaleMgr.ins.getStr(99900128) + GPKConst.getDistStr(lastChamp.opName,lastChamp.distId,lastChamp.familyName));
         }
         this.txt_myrankinfo1.text = LocaleMgr.ins.getStr(99900129,[lastChamp.myFamilyRank,lastChamp.reputations,lastChamp.winTimes]);
      }
      
      private function showMyTop() : void
      {
         var _loc1_:int = getOpenDay();
         if(_loc1_ > 0 && _loc1_ <= actDay)
         {
            txt_times.text = LocaleMgr.ins.getStr(99900126,[_loc1_]);
         }
         else
         {
            txt_times.text = LocaleMgr.ins.getStr(99900130);
         }
         if(bangdanname.selectedIndex == 3)
         {
            this.txt_myrankinfo1.text = LocaleMgr.ins.getStr(99900131,[lastChamp.myRankInFamily,lastChamp.myCon]);
         }
         else
         {
            this.txt_myrankinfo1.text = LocaleMgr.ins.getStr(99900131,[lastChamp.myRank,lastChamp.myCon]);
         }
      }
      
      protected function onGhnpmCpl(param1:FamilyExpeFamilyPlayerRankRes) : void
      {
         if(param1 == null)
         {
            list = [];
            this.list_items.dataSource = [];
            this.curpage = 0;
            this.totalpage = 0;
         }
         else
         {
            list = param1.info;
            this.list_items.dataSource = param1.info;
            computePage(param1.totalNum);
         }
         this.getValue();
         if(this.exec == false)
         {
            this.moduleServerCpl();
            this.exec = true;
         }
      }
      
      protected function onGrpmCpl(param1:FamilyExpeSingleRankRes) : void
      {
         if(param1 == null)
         {
            list = [];
            this.list_items.dataSource = [];
            this.curpage = 0;
            this.totalpage = 0;
         }
         else
         {
            list = param1.info;
            this.list_items.dataSource = param1.info;
            computePage(param1.totalNum);
         }
         this.getValue();
         if(this.exec == false)
         {
            this.moduleServerCpl();
            this.exec = true;
         }
      }
      
      private function getValue() : void
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
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         this.list_items.selectedIndex = -1;
         switch(int(param1))
         {
            case 0:
               ServerEngine.ins.send(4364,null,onZKXXCpl);
               break;
            case 1:
               _loc2_ = new FamilyExpeCrossRankReq();
               _loc2_.page = curpage;
               ServerEngine.ins.send(4363,_loc2_,onkfpm);
               break;
            case 2:
               _loc3_ = new FamilyExpeSingleRankReq();
               _loc3_.page = curpage;
               ServerEngine.ins.send(4366,_loc3_,onGrpmCpl);
               break;
            case 3:
               _loc4_ = new FamilyExpeFamilyPlayerRankReq();
               _loc4_.page = curpage;
               ServerEngine.ins.send(4365,_loc4_,onGhnpmCpl);
         }
      }
      
      private function onkfpm(param1:FamilyExpeCrossRankRes) : void
      {
         if(param1 == null)
         {
            list = [];
            this.list_items.dataSource = [];
            this.curpage = 0;
            this.totalpage = 0;
         }
         else
         {
            list = param1.info;
            this.list_items.dataSource = param1.info;
            computePage(param1.totalNum);
         }
         this.getValue();
         if(this.exec == false)
         {
            this.moduleServerCpl();
            this.exec = true;
         }
      }
   }
}
