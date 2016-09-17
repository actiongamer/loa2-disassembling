package nslm2.modules.battles.heroAwakenRoad.effectCtrl
{
   import com.mz.core.interFace.IDispose;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.battles.heroAwakenRoad.view.HeroAwakenMonsterInfoPanel;
   import morn.core.components.Component;
   import nslm2.modules.Chapters.ShowStageInfoVo;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import com.mz.core.event.MzEvent;
   import flash.events.Event;
   import avmplus.getQualifiedClassName;
   import flash.utils.getDefinitionByName;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class HeroAwakenInfoPanelCtrl implements IDispose, IObserver
   {
       
      
      private var _panel:HeroAwakenMonsterInfoPanel;
      
      private var _container:Component;
      
      private var _showingVo:ShowStageInfoVo;
      
      public function HeroAwakenInfoPanelCtrl(param1:HeroAwakenMonsterInfoPanel, param2:Component)
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
         var _loc2_:ShowStageInfoVo = param1.data as ShowStageInfoVo;
         if(_showingVo && _loc2_.id == _showingVo.id)
         {
            return;
         }
         _showingVo = _loc2_;
         _container.addChild(_panel);
         _panel.initX = (_container.width - _panel.width) / 2;
         _panel.show(_showingVo);
         _panel.commitMeasure();
         _panel.x = (_container.width - _panel.width) / 2;
         _panel.y = (_container.height - _panel.height) / 2;
         _panel.panelFadeIn();
         checkGuide();
      }
      
      private function checkGuide() : void
      {
         NGUtil.checkModuleShow(30121,_panel);
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
