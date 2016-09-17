package nslm2.modules.Chapters
{
   import com.mz.core.interFace.IDispose;
   import com.mz.core.interFace.IObserver;
   import morn.core.components.Component;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import com.mz.core.event.MzEvent;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.modules.dungeons.DungeonVo;
   import nslm2.common.globals.GlobalRef;
   import nslm2.mgrs.stcMgrs.consts.StcStageConsts;
   import nslm2.modules.battles.battleResults.BattleResultGlobel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.events.Event;
   import avmplus.getQualifiedClassName;
   import flash.utils.getDefinitionByName;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class DungeonInfoPanelCtrl implements IDispose, IObserver
   {
       
      
      private var _panel:nslm2.modules.Chapters.DungeonInfoPanel;
      
      private var _container:Component;
      
      private var _showingVo:nslm2.modules.Chapters.ShowStageInfoVo;
      
      public function DungeonInfoPanelCtrl(param1:nslm2.modules.Chapters.DungeonInfoPanel, param2:Component)
      {
         super();
         _panel = param1;
         _container = param2;
         switchEventListeners(true);
         ObserverMgr.ins.regObserver(this);
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            NGUtil.regTempFunc(40407,_panel);
            this._panel.addEventListener("close",dungeonInfoClose);
            this._container.addEventListener("evtShowStageInfo",onShowChapterInfo);
         }
         else
         {
            NGUtil.unregTempFunc(40407);
            this._panel.removeEventListener("close",dungeonInfoClose);
            this._container.removeEventListener("evtShowStageInfo",onShowChapterInfo);
         }
      }
      
      private function onShowChapterInfo(param1:MzEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:nslm2.modules.Chapters.ShowStageInfoVo = param1.data as nslm2.modules.Chapters.ShowStageInfoVo;
         if(_showingVo && _loc3_.id == _showingVo.id)
         {
            return;
         }
         _showingVo = _loc3_;
         var _loc4_:StcStageVo = StcMgr.ins.getStageVo(_showingVo.id);
         if(_loc4_ && _loc4_.chapter_id == 100 && ChapterModel.ins.getStageInfoStar(_loc4_.id) <= 0)
         {
            if(ChapterModel.ins.canEnterStage(_loc4_.id) == false)
            {
               return;
            }
            ChapterModel.ins.preStageId = _loc4_.id;
            _loc2_ = new DungeonVo(_loc4_.id);
            GlobalRef.mainCityReshowParam.chapterModuleInitVo = new ChapterModuleInitVo(_loc4_.chapter_id,0,false);
            GlobalRef.mainCityReshowParam.lastAttackChapterId = _loc4_.chapter_id;
            if(StcStageConsts.isNormalDgStage(_loc4_.id))
            {
               BattleResultGlobel.ins.doubleId = 1012;
            }
            else
            {
               BattleResultGlobel.ins.doubleId = 1013;
            }
            ModuleMgr.ins.showModule(40300,{"vo":_loc2_});
         }
         else
         {
            _panel.initX = (_container.width - _panel.width) / 2;
            _panel.show(_loc3_.id);
            _panel.commitMeasure();
            _panel.x = (_container.width - _panel.width) / 2;
            _panel.y = (_container.height - _panel.height) / 2;
            _panel.panelFadeIn();
            _container.addChild(_panel);
            checkGuide();
         }
      }
      
      private function checkGuide() : void
      {
         NGUtil.checkModuleShow(40407,_panel);
      }
      
      private function dungeonInfoClose(param1:Event) : void
      {
         if(_panel && param1.currentTarget == _panel)
         {
            _panel.panelFadeOut();
            removeDungeonInfoPanel();
            _showingVo = null;
         }
      }
      
      public function removeDungeonInfoPanel() : void
      {
         _showingVo = null;
         var _loc2_:String = getQualifiedClassName(_panel);
         var _loc3_:Class = getDefinitionByName(_loc2_) as Class;
         var _loc1_:* = new _loc3_();
         _panel.removeEventListener("close",dungeonInfoClose);
         _panel.dispose();
         _panel = _loc1_;
         _panel.addEventListener("close",dungeonInfoClose);
      }
      
      public function getFocusNotices() : Array
      {
         return ["evtDungeonInfoClose"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("evtDungeonInfoClose" === _loc3_)
         {
            removeDungeonInfoPanel();
         }
      }
      
      public function dispose() : void
      {
         switchEventListeners(false);
         if(_panel)
         {
            _panel.dispose();
            _panel = null;
         }
         ObserverMgr.ins.unregObserver(this);
      }
   }
}
