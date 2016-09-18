package nslm2.modules.roleInfos.equipPanels
{
   import game.ui.roleInfos.equipPanels.SkillInfoPanelUI;
   
   public class SkillInfoPanel extends SkillInfoPanelUI
   {
       
      
      public function SkillInfoPanel()
      {
         super();
         this.panelBg.titleImgId = 30106;
      }
      
      public function show(param1:Array) : void
      {
         list_skill.dataSource = param1;
      }
   }
}
