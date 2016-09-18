package nslm2.modules.Chapters.elite
{
   import game.ui.chapters.eliteDungeon.EliteInvadeModuleUI;
   import nslm2.modules.Chapters.DungeonInfoPanelCtrl;
   import nslm2.modules.Chapters.EliteInvadeModel;
   import morn.core.components.Button;
   import morn.customs.expands.MornExpandUtil;
   
   public class EliteInvadeModule extends EliteInvadeModuleUI
   {
       
      
      private var _eliteDungeonInfoPanel:nslm2.modules.Chapters.elite.EliteInvadeInfoPanel;
      
      public function EliteInvadeModule()
      {
         _eliteDungeonInfoPanel = new nslm2.modules.Chapters.elite.EliteInvadeInfoPanel();
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         refresh();
         this.panelBg.titleImgId = this.moduleId;
         this.parts.push(new DungeonInfoPanelCtrl(_eliteDungeonInfoPanel,this));
         this.preShowCpl();
      }
      
      private function refresh() : void
      {
         this.list_invade.dataSource = EliteInvadeModel.ins.getResetTimeArr();
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("evtEliteInfoRefreshed" === _loc3_)
         {
            refresh();
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat("evtEliteInfoRefreshed");
      }
      
      private function onBtnFunc(param1:Button) : void
      {
      }
   }
}
