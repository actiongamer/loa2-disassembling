package nslm2.modules.scenes.shenYuans.comp
{
   import game.ui.shenYuans.ShenYuanActiEndPanelUI;
   import morn.customs.expands.MornExpandUtil;
   
   public class ShenYuanActiEndPanel extends ShenYuanActiEndPanelUI
   {
       
      
      public function ShenYuanActiEndPanel()
      {
         super();
         MornExpandUtil.setCenter(this);
         addEvent();
      }
      
      private function addEvent() : void
      {
         btn_close.clickHandler = closePanel;
      }
      
      private function closePanel() : void
      {
         if(parent)
         {
            parent.removeChild(this);
         }
      }
   }
}
