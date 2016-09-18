package nslm2.modules.funnies.newYears.newYear2016s
{
   import game.ui.newYears.newYear2016s.NewYear2016_GodPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import morn.core.components.ViewStack;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.DisplayUtils;
   import flash.display.DisplayObjectContainer;
   
   public class NewYear2016_GodPanel extends NewYear2016_GodPanelUI implements IViewStackPage, IObserver
   {
       
      
      private var vs:ViewStack;
      
      public function NewYear2016_GodPanel()
      {
         super();
         this.tab_txt0.text = LocaleMgr.ins.getStr(999000437);
         this.tab_txt1.text = LocaleMgr.ins.getStr(999000438);
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.setAnchor(0.5,0.5);
         _loc1_.init(60000001,1,"all",true);
         addChild(_loc1_);
         _loc1_.x = 462;
         _loc1_.y = 416;
         vs = new ViewStack();
         vs.subViewClasses = [NewYear2016_GodSubPanel1,NewYear2016_GodSubPanel2];
         this.addChild(vs);
         vs.x = 0;
         this.tab.labels = " , ";
         this.tab.commitMeasure();
         DisplayUtils.addChildFromGlobal(this.tab.items[0] as DisplayObjectContainer,this.tab_txt0);
         DisplayUtils.addChildFromGlobal(this.tab.items[1] as DisplayObjectContainer,this.tab_txt1);
         DisplayUtils.addChildFromGlobal(this.tab.items[0] as DisplayObjectContainer,this.redPoi0);
         DisplayUtils.addChildFromGlobal(this.tab.items[1] as DisplayObjectContainer,this.redPoi1);
         this.tab.userChangeHandler = tab_changeHandler;
         this.tab.selectedIndex = 0;
         this.tab_changeHandler();
         validateRedPoi();
         this.switchEventListeners(true);
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ObserverMgr.ins.regObserver(this);
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      private function tab_changeHandler() : void
      {
         vs.selectedIndex = this.tab.selectedIndex;
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_NPC_FUNC_VO_CHANGE"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("MSG_NPC_FUNC_VO_CHANGE" === _loc3_)
         {
            if(param2 == 13313 || param2 == 13314)
            {
               validateRedPoi();
            }
         }
      }
      
      private function validateRedPoi() : void
      {
         this.redPoi0.visible = NpcFuncService.ins.getVo(13313).count > 0;
         this.redPoi1.visible = NpcFuncService.ins.getVo(13314).count > 0;
      }
   }
}
