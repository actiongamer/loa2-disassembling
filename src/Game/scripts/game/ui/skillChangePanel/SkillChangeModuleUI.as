package game.ui.skillChangePanel
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.core.components.Image;
   
   public class SkillChangeModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="472" height="384">
			  <Box x="1" y="1" var="box_main">
			    <PanelBgS3 width="469" height="381" bgStyle="1" showTabLine="false" frameVisible="true" frameStyle="2"/>
			    <List x="13" y="32" repeatY="3" var="list_skills">
			      <SkillKindRender name="render" runtime="game.ui.skillChangePanel.SkillKindRenderUI"/>
			    </List>
			    <Image skin="png.uiSkillChange.img_splitLine" x="20" y="253"/>
			    <Image skin="png.uiSkillChange.img_splitLine" x="18" y="144"/>
			    <Image skin="png.uiSkillChange.img_selectBox" x="11" y="32" mouseEnabled="false" mouseChildren="false" var="img_selectBox"/>
			  </Box>
			</PopModuleView>;
       
      
      public var box_main:Box = null;
      
      public var list_skills:List = null;
      
      public var img_selectBox:Image = null;
      
      public function SkillChangeModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.skillChangePanel.SkillKindRenderUI"] = SkillKindRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
