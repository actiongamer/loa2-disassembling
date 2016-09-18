package game.ui.roleInfos.equipPanels
{
   import morn.core.components.View;
   
   public class RoleEquipSubBarUI extends View
   {
      
      protected static var uiView:XML = <View width="249" height="81">
			  <EquipSubBarSkillRender x="71" y="4" var="skill0" runtime="game.ui.roleInfos.equipPanels.EquipSubBarSkillRenderUI"/>
			  <EquipSubBarSkillRender x="192" y="4" var="skill1" runtime="game.ui.roleInfos.equipPanels.EquipSubBarSkillRenderUI"/>
			</View>;
       
      
      public var skill0:game.ui.roleInfos.equipPanels.EquipSubBarSkillRenderUI = null;
      
      public var skill1:game.ui.roleInfos.equipPanels.EquipSubBarSkillRenderUI = null;
      
      public function RoleEquipSubBarUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleInfos.equipPanels.EquipSubBarSkillRenderUI"] = game.ui.roleInfos.equipPanels.EquipSubBarSkillRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
