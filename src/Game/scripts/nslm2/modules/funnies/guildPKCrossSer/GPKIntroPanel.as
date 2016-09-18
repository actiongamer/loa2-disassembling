package nslm2.modules.funnies.guildPKCrossSer
{
   import game.ui.guildPKCrossSer.GPKIntroPanelUI;
   import morn.core.components.Button;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class GPKIntroPanel extends GPKIntroPanelUI
   {
       
      
      private var titles:Array;
      
      private var txts:Array;
      
      private var imgs:Array;
      
      private var currPage:int = 1;
      
      private var allPage:int = 3;
      
      public function GPKIntroPanel()
      {
         titles = [50700043,50700044,50700045];
         txts = [50700046,50700047,50700048];
         imgs = ["img_intro_1","img_intro_2","img_intro_3"];
         super();
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9040773);
         pageBarUI.btn_first.clickHandler = pageClickHandler;
         pageBarUI.btn_last.clickHandler = pageClickHandler;
         pageBarUI.btn_next.clickHandler = pageClickHandler;
         pageBarUI.btn_prev.clickHandler = pageClickHandler;
         goPage(1);
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
         this.txt_title.text = LocaleMgr.ins.getStr(titles[param1]);
         this.txt_intro.text = LocaleMgr.ins.getStr(txts[param1]);
         pageBarUI.txt_pageNum.text = currPage + "/" + allPage;
      }
   }
}
