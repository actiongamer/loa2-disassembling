package nslm2.common.compsEffects
{
   import nslm2.common.ctrls.ListPageBarCtrl;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.FilterUtil;
   import morn.core.components.List;
   import morn.core.components.Label;
   
   public class ChapterListPageBarCtrl extends ListPageBarCtrl
   {
       
      
      private var _changeHandler;
      
      private var _canGoPage:uint;
      
      private var _levelCanGoPage:uint;
      
      public function ChapterListPageBarCtrl(param1:List, param2:Label, param3:Button, param4:Button, param5:Button = null, param6:Button = null)
      {
         super(param1,param2,param3,param4,param5,param6);
         hChangePageCtrl.setCplHandler(_changeHandler);
         hChangePageCtrl.setTime(0.8);
      }
      
      public function set canGoPage(param1:uint) : void
      {
         _canGoPage = param1;
         this.validate();
      }
      
      public function set setLevelCanGoPage(param1:int) : void
      {
         _levelCanGoPage = param1;
         this.validate();
      }
      
      public function setChangeHandler(param1:*) : ChapterListPageBarCtrl
      {
         _changeHandler = param1;
         hChangePageCtrl.setCplHandler(_changeHandler);
         return this;
      }
      
      override protected function btn_onClick(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = null;
         hChangePageCtrl.preChange();
         var _loc4_:* = param1;
         if(btnPrev !== _loc4_)
         {
            if(btnNext !== _loc4_)
            {
               if(btnFirst !== _loc4_)
               {
                  if(btnLatest === _loc4_)
                  {
                     this.list.page = _canGoPage;
                     hChangePageCtrl.afterChange(1);
                  }
               }
               else
               {
                  this.list.page = 0;
                  hChangePageCtrl.afterChange(5);
               }
            }
            else
            {
               if(this.list.page + 1 > _canGoPage)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(40400032));
                  return;
               }
               _loc3_ = StcMgr.ins.getVoByMultiColumnValue("static_stage",["chapter_id","sort"],[ChapterModel.ins.nextChapterVo.id,1]);
               if(this.list.page + 1 > _levelCanGoPage && PlayerModel.ins.level < _loc3_.unlock_level)
               {
                  AlertUtil.lackLevel(_loc3_.unlock_level);
                  return;
               }
               this.list.page = this.list.page + 1;
               hChangePageCtrl.afterChange(1);
            }
         }
         else
         {
            this.list.page = this.list.page - 1;
            hChangePageCtrl.afterChange(5);
         }
         ObserverMgr.ins.sendNotice("evtDungeonInfoClose");
         this.list.selectedIndex = this.list.page;
         this.validate();
      }
      
      override public function validate() : void
      {
         pageNumFunc(this.list,this.pageTxt);
         if(btnPrev)
         {
            btnPrev.visible = this.list.page > 0;
         }
         if(btnFirst)
         {
            btnFirst.visible = this.list.page > 0;
         }
         if(btnNext)
         {
            btnNext.visible = this.list.page + 1 < this.list.totalPage;
         }
         if(btnLatest)
         {
            btnLatest.visible = this.list.page + 1 < this.list.totalPage;
         }
         var _loc1_:StcStageVo = StcMgr.ins.getVoByMultiColumnValue("static_stage",["chapter_id","sort"],[ChapterModel.ins.nextChapterVo.id,1]);
         if(this.list.page + 1 > _canGoPage || this.list.page + 1 > _levelCanGoPage && PlayerModel.ins.level < _loc1_.unlock_level)
         {
            if(btnNext)
            {
               btnNext.filters = [FilterUtil.grayFilter()];
            }
            if(btnLatest)
            {
               btnLatest.filters = [FilterUtil.grayFilter()];
            }
         }
         else
         {
            if(btnNext)
            {
               btnNext.filters = null;
            }
            if(btnLatest)
            {
               btnLatest.filters = null;
            }
         }
      }
   }
}
