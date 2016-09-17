package game.ui.roleInfos.phaseUps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class SkillRenderSmallUI extends View
   {
      
      protected static var uiView:XML = <View width="156" height="18">
			  <Label autoSize="left" x="21" y="0" width="67" color="0x3e90ff" var="txt_skillName" multiline="true" wordWrap="true" height="18" leading="6" text="技能名字"/>
			  <Label autoSize="left" x="83" y="0" width="67" color="0x3e90ff" var="txt_skillLvl" multiline="true" wordWrap="true" height="18" leading="6" text="4级"/>
			  <SmallSkillRender x="3" y="1" var="skillRender" runtime="game.ui.roleInfos.phaseUps.SmallSkillRenderUI"/>
			</View>;
       
      
      public var txt_skillName:Label = null;
      
      public var txt_skillLvl:Label = null;
      
      public var skillRender:game.ui.roleInfos.phaseUps.SmallSkillRenderUI = null;
      
      public function SkillRenderSmallUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleInfos.phaseUps.SmallSkillRenderUI"] = game.ui.roleInfos.phaseUps.SmallSkillRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
