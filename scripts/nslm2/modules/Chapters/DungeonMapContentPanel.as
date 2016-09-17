package nslm2.modules.Chapters
{
   import game.ui.chapters.DungeonMapContentPanelUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.compsEffects.SummaryZoomInEffCtrl;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.common.ui.components.comps2d.others.ActivityDoubleTip;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcChapterVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import com.mz.core.event.MzEvent;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.configs.ClientConfig;
   import morn.customs.expands.MornExpandUtil;
   
   public class DungeonMapContentPanel extends DungeonMapContentPanelUI implements IObserver
   {
       
      
      private var _chapterId:int;
      
      private var _chapterArr:Array;
      
      private var _summaryCtrl:SummaryZoomInEffCtrl;
      
      public function DungeonMapContentPanel()
      {
         super();
         ObserverMgr.ins.regObserver(this);
         this.tab_change.labels = LocaleMgr.ins.getStr(998000351);
         this.tab_change.selectHandler = onTabChanged;
         this.list_map.selectHandler = selectChapter;
         if(ClientConfig.isRuLang())
         {
            this.addChild(list_map);
         }
         this.tab_change.visible = FuncOpenAutoCtrl.checkOpen(40408);
         checkShowAlert();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.btn_invade.visible = false;
      }
      
      public function checkShowAlert() : void
      {
         if(FuncOpenAutoCtrl.checkOpen(40408) == true)
         {
            if(PlayerModel.ins.level <= 20)
            {
               this.box_alert.visible = true;
               if(_summaryCtrl == null)
               {
                  _summaryCtrl = new SummaryZoomInEffCtrl(this.box_alert,2,4);
                  this.parts.push(new SummaryZoomInEffCtrl(this.box_alert,2,4));
               }
            }
            else
            {
               this.box_alert.visible = false;
            }
         }
         else
         {
            this.box_alert.visible = false;
         }
      }
      
      public function init() : void
      {
         var _loc1_:* = null;
         showInvade(ChapterModel.ins.chapterType == 2);
         _chapterArr = ChapterModel.ins.stcChapterVoArr;
         this.list_map.dataSource = _chapterArr;
         if(ActivityModel.ins.have(1013))
         {
            _loc1_ = new ActivityDoubleTip();
            this.addChild(_loc1_);
            _loc1_.x = 839;
            _loc1_.y = 3;
         }
         if(ActivityModel.ins.have(1012))
         {
            _loc1_ = new ActivityDoubleTip();
            this.addChild(_loc1_);
            _loc1_.x = 759;
            _loc1_.y = 3;
         }
      }
      
      public function get curChapterId() : int
      {
         return _chapterId;
      }
      
      public function show(param1:uint) : void
      {
         _chapterId = param1;
         ChapterModel.ins.lastOpenChapterId = param1;
         var _loc2_:StcChapterVo = StcMgr.ins.getChapterVo(param1);
         this.txt_title.text = LocaleMgr.ins.getStr(_loc2_.name);
         this.ui_top.dataSource = param1;
         if(param1 == ChapterModel.ins.newChapterId)
         {
            ChapterModuleEffectCtrl.ins.showNewStage();
         }
         ChapterModel.ins.preLoadBg(param1);
      }
      
      private function onTabChanged(param1:int) : void
      {
         ChapterModel.ins.chapterType = ChapterConsts.CHAPTER_TYPELIB[param1];
         showInvade(ChapterModel.ins.chapterType == 2);
         _chapterArr = ChapterModel.ins.stcChapterVoArr;
         if(ChapterModel.ins.chapterType == 1)
         {
            checkShowAlert();
         }
         else
         {
            this.box_alert.visible = false;
         }
         var _loc3_:StcChapterVo = ChapterModel.ins.nextChapterVo;
         var _loc2_:StcStageVo = StcMgr.ins.getVoByMultiColumnValue("static_stage",["chapter_id","sort"],[_loc3_.id,1]);
         if(PlayerModel.ins.level >= int(_loc2_.unlock_level))
         {
            this._chapterId = _loc3_.id;
         }
         else
         {
            _loc3_ = StcMgr.ins.getVoByMultiColumnValue("static_chapter",["sort","kind"],[_loc3_.sort - 1,_loc3_.kind]);
            this._chapterId = _loc3_.id;
         }
         show(_chapterId);
         this.dispatchEvent(new MzEvent("evtChapterTabChanged"));
         this.list_map.dataSource = _chapterArr;
      }
      
      private function showInvade(param1:Boolean) : void
      {
         this.box_elite.visible = param1;
         if(param1)
         {
            this.img_frame.skin = "png.uiChapter.dungeonMap.img_eliteBg";
         }
         else
         {
            this.img_frame.skin = "png.uiChapter.dungeonMap.img_normalBg";
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_invade === _loc2_)
         {
            ModuleMgr.ins.showModule(40404,null,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function selectChapter(param1:int) : void
      {
         var _loc2_:StcChapterVo = _chapterArr[param1];
         show(_loc2_.id);
      }
      
      public function getFocusNotices() : Array
      {
         return ["PLAYER_LEVEL_UP"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("PLAYER_LEVEL_UP" === _loc3_)
         {
            this.tab_change.visible = FuncOpenAutoCtrl.checkOpen(40408);
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
