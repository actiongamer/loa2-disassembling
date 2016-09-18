package nslm2.modules.footstones.assistantModules.subAssistants.shenyuan
{
   import game.ui.assistantModules.panels.AssisShenyuanSubPanelUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class AssisShenyuanSubPanel extends AssisShenyuanSubPanelUI implements IObserver
   {
       
      
      public function AssisShenyuanSubPanel()
      {
         super();
         ObserverMgr.ins.regObserver(this);
         initLanguage();
         refreshBuffList();
      }
      
      private function initLanguage() : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000825);
      }
      
      public function getFocusNotices() : Array
      {
         return ["shenyuanBuffChanged"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("shenyuanBuffChanged" === _loc3_)
         {
            refreshBuffList();
         }
      }
      
      private function refreshBuffList() : void
      {
         this.list_buff.dataSource = AssisShenyuanUtils.getNotBuyBuffIds();
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
