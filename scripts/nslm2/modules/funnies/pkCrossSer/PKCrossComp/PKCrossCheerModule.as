package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import game.ui.pkCrossSer.PKCrossCheerUI;
   import morn.core.components.Image;
   import morn.core.components.ViewStack;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class PKCrossCheerModule extends PKCrossCheerUI
   {
      
      public static var img_red0:Image;
      
      public static var img_red1:Image;
       
      
      private var subViewStack:ViewStack;
      
      public function PKCrossCheerModule()
      {
         super();
         subViewStack = new ViewStack();
         subViewStack.x = 25;
         subViewStack.y = 77;
         addChild(subViewStack);
         tabBar.labels = LocaleMgr.ins.getStr(50600027);
         tabBar.selectHandler = tabChangeHandler;
         subViewStack.selectedIndex = 0;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(50600028);
         tabBar.selectedIndex = 0;
         this.img_bgg.skin = UrlLib.pkCrossSerUrl("cheer_bg.jpg");
         this.red0.visible = false;
         this.red1.visible = false;
         img_red0 = this.red0;
         img_red1 = this.red1;
         initTabView();
         ObserverMgr.ins.regObserver(this);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("MSG_SWITCH_MODULE_REN_POINT" === _loc3_)
         {
            if(param2 != null)
            {
               if(param2.moduleId == 50246)
               {
                  img_red0.visible = param2.vis;
               }
            }
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return ["OPT_FINAL_CHEER_CHG_TIMES","MSG_SWITCH_MODULE_REN_POINT"];
      }
      
      private function initTabView() : void
      {
         subViewStack.addItem(new CheerSkillView());
         var _loc1_:CheerAwardView = new CheerAwardView();
         _loc1_.reqData();
         subViewStack.addItem(_loc1_);
         subViewStack.addItem(new CheerRuleView());
      }
      
      private function tabChangeHandler(param1:int) : void
      {
         subViewStack.selectedIndex = param1;
         if(subViewStack.selection is CheerAwardView)
         {
            CheerAwardView(subViewStack.selection).reqData();
         }
      }
   }
}
