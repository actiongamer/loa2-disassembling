package game.ui.roleInfos.equipPanels
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   import game.ui.roleInfos.phaseUps.SkillShowRenderUI;
   
   public class SkillInfoPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="350" height="226">
			  <PanelBg x="-1" y="2" width="349" height="226"/>
			  <Image skin="png.uiRoleInfo.技能-线" x="19" y="190" width="303"/>
			  <Label text="\l30100211\l" autoSize="none" x="26" y="198" color="0xeac472" letterSpacing="1" leading="6" multiline="true" wordWrap="true" width="300" height="19" align="right"/>
			  <Image skin="png.uiRoleInfo.技能-底" x="-7" y="46"/>
			  <Image skin="png.uiRoleInfo.技能-底" x="2" y="122"/>
			  <List x="24" y="54" var="list_skill" repeatY="2" spaceY="20">
			    <SkillShowRender name="render" runtime="game.ui.roleInfos.phaseUps.SkillShowRenderUI"/>
			  </List>
			</PanelView>;
       
      
      public var list_skill:List = null;
      
      public function SkillInfoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleInfos.phaseUps.SkillShowRenderUI"] = SkillShowRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
