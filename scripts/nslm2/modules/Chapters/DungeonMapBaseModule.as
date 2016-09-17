package nslm2.modules.Chapters
{
   import game.ui.chapters.DungeonMapBaseModuleUI;
   import nslm2.common.compsEffects.ChapterListPageBarCtrl;
   import morn.core.components.Component;
   import morn.core.components.List;
   import nslm2.common.ctrls.BtnLongBarCtrl;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class DungeonMapBaseModule extends DungeonMapBaseModuleUI
   {
       
      
      private var _chapterListPageBarCtrl:ChapterListPageBarCtrl;
      
      public function DungeonMapBaseModule()
      {
         super();
         ObserverMgr.ins.regObserver(this);
         MornExpandUtil.setCenter(this);
         switchEventListeners(true);
      }
      
      protected function get content() : Component
      {
         return null;
      }
      
      protected function get listMap() : List
      {
         return null;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.bgCustom.addChild(content);
         this.panelBg.img_rim.mouseEnabled = false;
         this.panelBg.img_rim.mouseChildren = false;
         _chapterListPageBarCtrl = new ChapterListPageBarCtrl(listMap,null,this.btn_left.btn_arrow,this.btn_right.btn_arrow);
         this.parts.push(new ChapterListPageBarCtrl(listMap,null,this.btn_left.btn_arrow,this.btn_right.btn_arrow));
         this.parts.push(new BtnLongBarCtrl(this.btn_left.btn_arrow,this.btn_left.img_bg));
         this.parts.push(new BtnLongBarCtrl(this.btn_right.btn_arrow,this.btn_right.img_bg));
      }
      
      protected function setListCanGoPage(param1:uint) : void
      {
         _chapterListPageBarCtrl.canGoPage = param1;
      }
      
      protected function setLevelCanGoPage(param1:uint) : void
      {
         _chapterListPageBarCtrl.setLevelCanGoPage = param1;
      }
      
      protected function listGotoSelectIndex(param1:uint) : void
      {
         _chapterListPageBarCtrl.goToSelectIndex(param1);
      }
      
      protected function setChangeHandler(param1:*) : void
      {
         _chapterListPageBarCtrl.setChangeHandler(param1);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         switchEventListeners(false);
         super.preClose(param1);
      }
      
      override public function dispose() : void
      {
         if(content)
         {
            content.dispose();
         }
         super.dispose();
      }
   }
}
