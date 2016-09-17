package nslm2.modules.funnies.teamPKCS.intros
{
   import game.ui.guildPKCrossSer.GPKIntroPanelUI;
   import game.ui.teamPKCS.intros.TPKIntro_rigth2UI;
   import game.ui.teamPKCS.intros.TPKIntro_rigth3UI;
   import game.ui.teamPKCS.intros.TPKIntro_rigth4UI;
   import morn.core.components.Component;
   import morn.core.components.Button;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.utils.DisplayUtils;
   import game.ui.teamPKCS.intros.TPKIntro_timeHBoxUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class TPKIntroPanel extends GPKIntroPanelUI
   {
       
      
      private var titles:Array;
      
      private var currPage:int = 1;
      
      private var allPage:int = 4;
      
      private var page2:TPKIntro_rigth2UI;
      
      private var page3:TPKIntro_rigth3UI;
      
      private var page4:TPKIntro_rigth4UI;
      
      private var curPage:Component;
      
      public function TPKIntroPanel()
      {
         titles = [50800121,50800122,50800123,50800124];
         super();
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9040773);
         this.img_bg.skin = UrlLib.gpkcUrl("img_intro_bg.png");
         pageBarUI.btn_first.clickHandler = pageClickHandler;
         pageBarUI.btn_last.clickHandler = pageClickHandler;
         pageBarUI.btn_next.clickHandler = pageClickHandler;
         pageBarUI.btn_prev.clickHandler = pageClickHandler;
         goPage(1);
         this.txt_intro.leading = 5;
      }
      
      private function pageClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(pageBarUI.btn_first !== _loc2_)
         {
            if(pageBarUI.btn_last !== _loc2_)
            {
               if(pageBarUI.btn_next !== _loc2_)
               {
                  if(pageBarUI.btn_prev === _loc2_)
                  {
                     currPage = Number(currPage) - 1;
                  }
               }
               else
               {
                  currPage = Number(currPage) + 1;
               }
            }
            else
            {
               currPage = allPage;
            }
         }
         else
         {
            currPage = 1;
         }
         goPage(currPage);
      }
      
      private function goPage(param1:int) : void
      {
         param1--;
         pageBarUI.btn_prev.disabled = currPage <= 1;
         pageBarUI.btn_first.disabled = currPage <= 1;
         pageBarUI.btn_last.disabled = currPage >= allPage;
         pageBarUI.btn_next.disabled = currPage >= allPage;
         pageBarUI.txt_pageNum.text = currPage + "/" + allPage;
         this.txt_title.text = LocaleMgr.ins.getStr(titles[param1]);
         switch(int(param1))
         {
            case 0:
               this.txt_intro.visible = true;
               this.txt_intro.text = LocaleMgr.ins.getStr(50800114);
               showCurPage(null);
               break;
            case 1:
               this.txt_intro.visible = false;
               if(page2 == null)
               {
                  page2 = new TPKIntro_rigth2UI();
               }
               showCurPage(page2);
               break;
            case 2:
               this.txt_intro.visible = false;
               if(page3 == null)
               {
                  page3 = new TPKIntro_rigth3UI();
                  txtTimeSetVal(page3.txt_t3,DefindConsts.CROSS_GROUP_32TO16_STAGE);
                  txtTimeSetVal(page3.txt_t5,DefindConsts.CROSS_GROUP_16TO8_STAGE);
               }
               showCurPage(page3);
               break;
            case 3:
               this.txt_intro.visible = false;
               if(page4 == null)
               {
                  page4 = new TPKIntro_rigth4UI();
                  txtTimeSetVal(page4.txt_t3,DefindConsts.CROSS_GROUP_8TO4_STAGE);
                  txtTimeSetVal(page4.txt_t5,DefindConsts.CROSS_GROUP_4TO2_STAGE);
                  txtTimeSetVal(page4.txt_t7,DefindConsts.CROSS_GROUP_2TO1_STAGE);
               }
               showCurPage(page4);
         }
      }
      
      private function showCurPage(param1:Component) : void
      {
         if(curPage)
         {
            DisplayUtils.removeSelf(curPage);
         }
         this.curPage = param1;
         if(curPage)
         {
            param1.centerX = 0;
            this.curPage.y = this.txt_intro.y;
            this.addChild(this.curPage);
         }
      }
      
      private function txtTimeSetVal(param1:TPKIntro_timeHBoxUI, param2:String) : void
      {
         var _loc3_:Array = param2.split("|");
         param1.txt_t3_1.text = _loc3_[0] + "-" + _loc3_[1];
         param1.txt_t3_2.text = _loc3_[1] + "-" + _loc3_[2];
         param1.txt_t3_3.text = _loc3_[2] + "-" + _loc3_[3];
         param1.txt_t3_4.text = _loc3_[3] + "-" + _loc3_[4];
      }
      
      override public function dispose() : void
      {
         if(page2)
         {
            page2.dispose();
            page2 = null;
         }
         if(page3)
         {
            page3.dispose();
            page3 = null;
         }
         if(page4)
         {
            page4.dispose();
            page4 = null;
         }
         super.dispose();
      }
   }
}
