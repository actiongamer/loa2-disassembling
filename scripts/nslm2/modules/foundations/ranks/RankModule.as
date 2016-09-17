package nslm2.modules.foundations.ranks
{
   import game.ui.rankModules.RankModuleUI;
   import nslm2.common.compsEffects.ListHChangePageEffect;
   import proto.StageStarRankRes;
   import proto.AbilityRankRes;
   import nslm2.utils.Uint64Util;
   import proto.LevelRankRes;
   import proto.FamilyRankRes;
   import proto.AreaRankRes;
   import morn.core.components.Button;
   import proto.RankSearchNameReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.RankSearchNameRes;
   import nslm2.common.ui.components.comps2d.TextPromptBind;
   import morn.customs.expands.MornExpandUtil;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.ranks.comp.RankTitleInfo;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.AbilityRankReq;
   import proto.LevelRankReq;
   import proto.AreaRankReq;
   import proto.FamilyRankReq;
   import proto.StageStarRankReq;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class RankModule extends RankModuleUI
   {
       
      
      private var exec:Boolean = false;
      
      private var myvalue1:Number = 0;
      
      private var myvalue2:Number = 0;
      
      private var myfamily:String = "";
      
      private var curpage:int = 1;
      
      private var totalpage:int = 0;
      
      private var tmppage:int = 0;
      
      private var list:Array;
      
      private var mypage:Number;
      
      private var changepagesend:Boolean = false;
      
      protected var hChangePageCtrl:ListHChangePageEffect;
      
      private var changeDir:int;
      
      public var Norank:String;
      
      public var Myrank:String;
      
      public var Mylv:String;
      
      public var Myability:String;
      
      public var Myfam:String;
      
      public var Myfamrank:String;
      
      public var Wu:String;
      
      public var Mystar:String;
      
      public var AbilityPrompt:String;
      
      public var LvPrompt:String;
      
      public var AreaPrompt:String;
      
      public var FamPrompt:String;
      
      public var MajorlinePrompt:String;
      
      public function RankModule()
      {
         Norank = LocaleMgr.ins.getStr(11800104);
         Myrank = LocaleMgr.ins.getStr(11800102) + ":";
         Mylv = LocaleMgr.ins.getStr(11800301) + ":";
         Myability = LocaleMgr.ins.getStr(11800206) + ":";
         Myfam = LocaleMgr.ins.getStr(11800503) + ":";
         Myfamrank = LocaleMgr.ins.getStr(11800505) + ":";
         Wu = LocaleMgr.ins.getStr(30200016);
         Mystar = LocaleMgr.ins.getStr(11800601) + ":";
         AbilityPrompt = LocaleMgr.ins.getStr(11800207);
         LvPrompt = LocaleMgr.ins.getStr(11800302);
         AreaPrompt = LocaleMgr.ins.getStr(11800401);
         FamPrompt = LocaleMgr.ins.getStr(11800504);
         MajorlinePrompt = LocaleMgr.ins.getStr(11800603);
         super();
         this.fadeViewId = 11010;
         this.hChangePageCtrl = new ListHChangePageEffect(this.list_items);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr("9111800");
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.txt_searchname.addEventListener("enter",onEnterClick);
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
            this.txt_searchname.removeEventListener("enter",onEnterClick);
         }
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         requestData(0);
      }
      
      public function onStarRankCpl(param1:StageStarRankRes) : void
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
            list = param1.rank;
            this.myvalue1 = param1.myrank;
            this.myvalue2 = param1.mystar;
            this.list_items.dataSource = param1.rank;
            this.totalpage = computePage(param1.page);
         }
         this.getValue(4);
      }
      
      public function onZhanliCpl(param1:AbilityRankRes) : void
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
            list = param1.ability;
            this.myvalue1 = param1.myRank;
            this.myvalue2 = Uint64Util.toNumber(param1.myAbility);
            this.list_items.dataSource = param1.ability;
            this.totalpage = computePage(param1.page);
         }
         this.getValue(0);
         if(this.exec == false)
         {
            this.moduleServerCpl();
            this.exec = true;
         }
      }
      
      public function onDengjiCpl(param1:LevelRankRes) : void
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
            list = param1.level;
            this.myvalue1 = param1.myRank;
            this.myvalue2 = param1.myLevel;
            this.list_items.dataSource = param1.level;
            this.totalpage = computePage(param1.page);
         }
         this.getValue(1);
      }
      
      public function onGonghuiCpl(param1:FamilyRankRes) : void
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
            list = param1.family;
            this.myvalue1 = param1.myFamilyRank;
            this.myfamily = param1.myFamilyName;
            this.list_items.dataSource = param1.family;
            this.totalpage = computePage(param1.page);
         }
         this.getValue(3);
      }
      
      public function onTiantiCpl(param1:AreaRankRes) : void
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
            list = param1.area;
            this.myvalue1 = param1.myAreaRank;
            this.list_items.dataSource = param1.area;
            this.totalpage = computePage(param1.page);
         }
         this.getValue(2);
      }
      
      private function computePage(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = param1 % 10;
         if(_loc3_ == 0)
         {
            _loc2_ = param1 / 10;
         }
         else
         {
            _loc2_ = param1 / 10 + 1;
         }
         return _loc2_;
      }
      
      private function onEnterClick(... rest) : void
      {
         onClick(this.btn_search);
      }
      
      private function onClick(param1:Button) : void
      {
         var _loc2_:Boolean = false;
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc6_:* = param1;
         if(this.btn_search === _loc6_)
         {
            _loc2_ = false;
            _loc5_ = this.txt_searchname.text;
            if(this.list.length == 0)
            {
               return;
            }
            _loc4_ = 0;
            while(_loc4_ < this.list.length)
            {
               if(this.list[_loc4_].name == _loc5_)
               {
                  this.list_items.selectedIndex = _loc4_;
                  _loc2_ = true;
                  break;
               }
               _loc4_++;
            }
            if(_loc2_ == false)
            {
               tmppage = curpage;
               changepagesend = true;
               _loc3_ = new RankSearchNameReq();
               _loc3_.name = _loc5_;
               _loc3_.rankId = mypage;
               ServerEngine.ins.send(6215,_loc3_,onSearchName);
            }
         }
      }
      
      private function onSearchName(param1:RankSearchNameRes) : void
      {
         this.myvalue1 = param1.extra.myRank;
         this.totalpage = computePage(param1.page);
         this.curpage = computePage(param1.rank);
         if(this.curpage > this.tmppage)
         {
            changeDir = getChangeDir(2);
         }
         else
         {
            changeDir = getChangeDir(1);
         }
         var _loc2_:int = param1.rank - curpage * 10 + 9;
         var _loc3_:* = mypage;
         if(0 !== _loc3_)
         {
            if(1 !== _loc3_)
            {
               if(2 !== _loc3_)
               {
                  if(3 !== _loc3_)
                  {
                     if(4 === _loc3_)
                     {
                        list = param1.stage;
                        this.myvalue2 = param1.extra.mystar;
                     }
                  }
                  else
                  {
                     list = param1.family;
                     this.myfamily = param1.extra.myFamilyName;
                  }
               }
               else
               {
                  list = param1.area;
               }
            }
            else
            {
               list = param1.level;
               this.myvalue2 = param1.extra.myLevel;
            }
         }
         else
         {
            list = param1.ability;
            this.myvalue2 = Uint64Util.toNumber(param1.extra.myAbility);
         }
         this.getValue(mypage);
         this.list_items.selectedIndex = _loc2_;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.parts.push(new TextPromptBind(this.txt_searchname.textField,this.txt_descPrompt));
         MornExpandUtil.addHandlerForBtnAll(this,onClick);
         this.bangdanname.changeHandler = requestData;
         this.bangdanname.dataSource = [0,1,2,3,4];
         super.preShow(param1);
      }
      
      private function pageBarCanChange(param1:int, param2:int, param3:int) : int
      {
         changepagesend = false;
         switch(int(param3) - 1)
         {
            case 0:
               if(param2 != 0 && param1 > 1)
               {
                  param1 = int(param1 - 1);
                  changepagesend = true;
               }
               break;
            case 1:
               if(param2 != 0 && param1 + 1 <= param2)
               {
                  param1 = int(param1 + 1);
                  changepagesend = true;
               }
               break;
            case 2:
               if(param1 != 1 && param2 != 0)
               {
                  param1 = 1;
                  changepagesend = true;
               }
               break;
            case 3:
               if(param1 != param2 && param2 != 0)
               {
                  param1 = param2;
                  changepagesend = true;
                  break;
               }
         }
         return param1;
      }
      
      private function pageBarSend(param1:int) : void
      {
         curpage = pageBarCanChange(curpage,totalpage,param1);
         changeDir = getChangeDir(param1);
         if(changepagesend == true)
         {
            requestData(mypage);
         }
      }
      
      private function getChangeDir(param1:int) : int
      {
         var _loc2_:int = 0;
         switch(int(param1) - 1)
         {
            case 0:
               _loc2_ = 2;
               break;
            case 1:
               _loc2_ = 1;
               break;
            case 2:
               _loc2_ = 2;
               break;
            case 3:
               _loc2_ = 1;
         }
         return _loc2_;
      }
      
      private function pageBtnPre(param1:MouseEvent) : void
      {
         pageBarSend(1);
      }
      
      private function pageBtnFir(param1:MouseEvent) : void
      {
         pageBarSend(3);
      }
      
      private function pageBtnLas(param1:MouseEvent) : void
      {
         pageBarSend(4);
      }
      
      private function pageBtnNex(param1:MouseEvent) : void
      {
         pageBarSend(2);
      }
      
      private function pageBarText(param1:int, param2:int) : void
      {
         if(param1 == 0)
         {
            this.pageBarRef.txt_pageNum.text = "";
            this.pageBarRef.disabled = true;
         }
         else
         {
            this.pageBarRef.txt_pageNum.text = String(param2) + "/" + String(param1);
            this.pageBarRef.disabled = false;
         }
      }
      
      private function getValue(param1:int) : void
      {
         this.list_items.dataSource = list;
         if(changepagesend == true)
         {
            hChangePageCtrl.preChange();
            hChangePageCtrl.afterChange(changeDir);
            this.fadeIn(0,11800);
         }
         else
         {
            this.fadeIn(0,11010);
         }
         mypage = param1;
         var _loc4_:String = "";
         var _loc2_:String = String(myvalue2);
         var _loc5_:String = "";
         pageBarText(totalpage,curpage);
         var _loc3_:Boolean = false;
         if(curpage == 1)
         {
            if(curpage == totalpage)
            {
               this.pageBarRef.btn_first.disabled = true;
               this.pageBarRef.btn_prev.disabled = true;
               this.pageBarRef.btn_next.disabled = true;
               this.pageBarRef.btn_last.disabled = true;
            }
            else
            {
               this.pageBarRef.btn_first.disabled = true;
               this.pageBarRef.btn_prev.disabled = true;
               this.pageBarRef.btn_next.disabled = false;
               this.pageBarRef.btn_last.disabled = false;
            }
         }
         else if(curpage == totalpage)
         {
            this.pageBarRef.btn_next.disabled = true;
            this.pageBarRef.btn_last.disabled = true;
            this.pageBarRef.btn_first.disabled = false;
            this.pageBarRef.btn_prev.disabled = false;
         }
         else
         {
            this.pageBarRef.btn_first.disabled = false;
            this.pageBarRef.btn_last.disabled = false;
            this.pageBarRef.btn_next.disabled = false;
            this.pageBarRef.btn_prev.disabled = false;
         }
         switch(int(param1))
         {
            case 0:
               _loc4_ = Myability;
               _loc5_ = AbilityPrompt;
               break;
            case 1:
               _loc4_ = Mylv;
               _loc5_ = LvPrompt;
               break;
            case 2:
               _loc5_ = AreaPrompt;
               break;
            case 3:
               _loc4_ = Myfam;
               _loc5_ = FamPrompt;
               if(myfamily == "")
               {
                  _loc2_ = Wu;
               }
               else
               {
                  _loc2_ = myfamily;
               }
               break;
            case 4:
               _loc4_ = Mystar;
               _loc5_ = MajorlinePrompt;
         }
         settxtvalue(param1,myvalue1,_loc2_,_loc4_,_loc5_);
         this.bangdanname.selectedIndex = param1;
         this.changepagesend = false;
      }
      
      private function settxtvalue(param1:int, param2:int, param3:String, param4:String, param5:String) : void
      {
         var _loc7_:* = null;
         if(param1 == 3)
         {
            _loc7_ = Myfamrank;
         }
         else
         {
            _loc7_ = Myrank;
         }
         var _loc6_:RankTitleInfo = RankConst.ins.getRankConst(param1);
         this.head_value.txt_head_1.text = _loc6_.txt_head_1.text;
         this.head_value.txt_head_2.text = _loc6_.txt_head_2.text;
         this.head_value.txt_head_3.text = _loc6_.txt_head_3.text;
         this.head_value.txt_head_4.text = _loc6_.txt_head_4.text;
         this.head_value.txt_head_5.text = _loc6_.txt_head_5.text;
         this.txt_myrankinfo2.color = 458496;
         if(param2 == 0)
         {
            this.txt_myrankinfo1.text = _loc7_ + " " + Norank;
         }
         else
         {
            this.txt_myrankinfo1.text = _loc7_ + " " + String(param2);
         }
         this.txt_myrankinfo2.text = param4 + " " + param3;
         if(param1 == 0)
         {
            this.txt_myrankinfo2.text = param4 + " " + LocaleConsts.getNumberAbbr2(param3);
         }
         this.txt_rankinfoprompt.text = param5;
         if(param1 == 2)
         {
            this.txt_myrankinfo2.text = "";
         }
      }
      
      private function requestData(param1:int) : void
      {
         var _loc6_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == 3)
         {
            this.txt_descPrompt.text = LocaleMgr.ins.getStr(11800105);
         }
         else
         {
            this.txt_descPrompt.text = LocaleMgr.ins.getStr(11800103);
         }
         if(this.changepagesend == false)
         {
            curpage = 1;
         }
         this.txt_frame_propt.text = LocaleMgr.ins.getStr(11800101);
         this.list_items.selectedIndex = -1;
         switch(int(param1))
         {
            case 0:
               _loc6_ = new AbilityRankReq();
               _loc6_.page = curpage;
               ServerEngine.ins.send(6210,_loc6_,onZhanliCpl);
               break;
            case 1:
               _loc2_ = new LevelRankReq();
               _loc2_.page = curpage;
               ServerEngine.ins.send(6213,_loc2_,onDengjiCpl);
               break;
            case 2:
               _loc3_ = new AreaRankReq();
               _loc3_.page = curpage;
               ServerEngine.ins.send(6211,_loc3_,onTiantiCpl);
               break;
            case 3:
               _loc4_ = new FamilyRankReq();
               _loc4_.page = curpage;
               ServerEngine.ins.send(6212,_loc4_,onGonghuiCpl);
               break;
            case 4:
               _loc5_ = new StageStarRankReq();
               _loc5_.page = curpage;
               ServerEngine.ins.send(6214,_loc5_,onStarRankCpl);
         }
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarRef as IPageBar;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
      
      override public function dispose() : void
      {
         if(hChangePageCtrl)
         {
            hChangePageCtrl.dispose();
            hChangePageCtrl = null;
         }
         RankConst.ins.dispose();
         super.dispose();
      }
   }
}
