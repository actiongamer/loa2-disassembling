package game.ui.roleInfos.phaseUps
{
   import morn.core.components.View;
   import game.ui.roleInfos.equipPanels.EquipSubBarSkillRenderUI;
   import morn.core.components.Label;
   
   public class SkillShowRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="279" height="58">
			  <EquipSubBarSkillRender x="0" y="0" var="skillRender" scale="1.2" runtime="game.ui.roleInfos.equipPanels.EquipSubBarSkillRenderUI"/>
			  <Label text="天谴怒击天谴怒击天谴怒击天谴怒击天谴怒击天谴怒击天谴怒击天谴怒击天谴怒击天谴怒击天谴怒击天谴怒击天谴怒击天谴怒击" autoSize="left" x="62" y="0" width="237" color="0xffe0a3" var="txt_skillName" multiline="true" wordWrap="true" height="60" leading="2"/>
			</View>;
       
      
      public var skillRender:EquipSubBarSkillRenderUI = null;
      
      public var txt_skillName:Label = null;
      
      public function SkillShowRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleInfos.equipPanels.EquipSubBarSkillRenderUI"] = EquipSubBarSkillRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
