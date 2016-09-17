package nslm2.modules.funnies.teamPKCS.rank
{
   import game.ui.rankModules.RankModuleUI;
   import game.ui.teamPKCS.rank.TPKCRankTitleUI;
   import nslm2.common.compsEffects.ListHChangePageEffect;
   import morn.core.components.Label;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.ranks.RankUtil;
   import flash.events.MouseEvent;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CteamArenaRankRes;
   import nslm2.modules.funnies.teamPKCS.TPKCModel;
   import nslm2.modules.funnies.pkCrossSer.PKCrossComp.PKCRankNameRener;
   import com.mz.core.utils.DisplayUtils;
   import morn.core.components.Image;
   
   public class TPKCRankModule extends RankModuleUI
   {
      
      public static var type:int;
      
      public static var NUM_PER_PAGE:int = 10;
       
      
      private var title:TPKCRankTitleUI;
      
      private var curpage:int = 1;
      
      private var title_hx:Array;
      
      private var title_js:Array;
      
      protected var hChangePageCtrl:ListHChangePageEffect;
      
      private var txt_times:Label;
      
      private var totalpage:int = 0;
      
      private var changeDir:int = 0;
      
      private var tabChange:Boolean = false;
      
      private var exec:Boolean = false;
      
      private var _res:CteamArenaRankRes;
      
      public function TPKCRankModule()
      {
         title_hx = [11800201,41210070,50800048,11000810,50800049,13350024];
         title_js = [11800201,50600034,50500089,11000810,10000004,13350024];
         super();
         bangdanname.itemRender = PKCRankNameRener;
         bangdanname.repeatY = 1;
         list_items.itemRender = TPKCRankRender;
         list_items.spaceX = 0;
         list_items.spaceY = 3;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr("9111800");
         title = new TPKCRankTitleUI();
         title.x = head_value.x;
         title.y = head_value.y;
         head_value.parent.addChild(title);
         DisplayUtils.removeSelf(head_value);
         this.hChangePageCtrl = new ListHChangePageEffect(this.list_items);
         var _loc1_:Image = new Image();
         _loc1_.skin = "png.a5.commonImgs.img_fightBg2";
         _loc1_.x = this.txt_myrankinfo1.x + 150;
         _loc1_.y = this.txt_myrankinfo1.y + 20;
         addChild(_loc1_);
         txt_times = new Label();
         txt_times.x = _loc1_.x - 50;
         txt_times.y = _loc1_.y;
         txt_times.style = "渐变1";
         txt_times.height = 22;
         txt_times.text = LocaleMgr.ins.getStr(999900251);
         txt_times.width = _loc1_.width + 100;
         txt_times.align = "center";
         addChild(txt_times);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.txt_frame_propt.text = LocaleMgr.ins.getStr(11800101);
         var _loc2_:RankUtil = new RankUtil(50800045,"png.uiRankModule.图标.图标1","png.uiRankModule.暗底.4","png.uiRankModule.亮底.4");
         var _loc3_:RankUtil = new RankUtil(50600041,"png.uiRankModule.图标.图标2","png.uiRankModule.暗底.1","png.uiRankModule.亮底.1");
         bangdanname.dataSource = [_loc2_,_loc3_];
         this.bangdanname.changeHandler = tabhandler;
         super.preShow(param1);
         this.txt_myrankinfo2.visible = false;
         this.txt_rankinfoprompt.visible = false;
         this.img_pmd.visible = false;
         this.btn_search.visible = false;
         this.txt_searchname.visible = false;
         this.txt_desc.visible = false;
         this.txt_myrankinfo1.multiline = true;
         this.txt_myrankinfo1.height = 100;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         bangdanname.selectedIndex = 0;
         tabhandler(0);
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
         computePage();
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
         computePage();
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
         computePage();
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
         computePage();
      }
      
      protected function requestData(param1:int) : void
      {
         this.list_items.selectedIndex = -1;
         switch(int(param1))
         {
            case 0:
               ServerEngine.ins.send(5404,null,onPreCpl);
            default:
               ServerEngine.ins.send(5404,null,onPreCpl);
         }
      }
      
      protected function onPreCpl(param1:CteamArenaRankRes) : void
      {
         var _loc2_:int = 0;
         _res = param1;
         if(param1 == null)
         {
            this.list_items.dataSource = [];
            this.curpage = 0;
            this.totalpage = 0;
            this.txt_myrankinfo1.text = LocaleMgr.ins.getStr(50800050,[LocaleMgr.ins.getStr(12200),0]);
         }
         else
         {
            _loc2_ = Math.ceil(param1.info.length / NUM_PER_PAGE);
            this.totalpage = _loc2_;
            computePage();
            this.txt_myrankinfo1.text = LocaleMgr.ins.getStr(50800050,[param1.rank,param1.score]);
         }
         this.getValue();
         if(this.exec == false)
         {
            this.moduleServerCpl();
            this.exec = true;
         }
      }
      
      private function computePage() : void
      {
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
         var _loc1_:int = (curpage - 1) * NUM_PER_PAGE;
         this.list_items.array = _res.info.slice(_loc1_,_loc1_ + NUM_PER_PAGE);
         pageBarRef.txt_pageNum.text = curpage + "/" + totalpage;
         getValue();
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
            if(TPKCModel.ins.isPreDay)
            {
               this.txt_times.text = LocaleMgr.ins.getStr(50800047,[TPKCModel.ins.preDay]);
            }
            else
            {
               this.txt_times.text = LocaleMgr.ins.getStr(50800046);
            }
         }
         else
         {
            _loc2_ = title_js;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            this.title["t" + _loc3_].text = LocaleMgr.ins.getStr(_loc2_[_loc3_]);
            _loc3_++;
         }
         tabChange = true;
         requestData(type);
      }
   }
}
