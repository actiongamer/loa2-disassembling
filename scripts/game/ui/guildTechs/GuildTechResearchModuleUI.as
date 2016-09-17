package game.ui.guildTechs
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class GuildTechResearchModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="388" height="520">
			  <PanelBgS3 x="0" frameStyle="2" frameVisible="true" y="0" left="0" right="0" top="0" bottom="0"/>
			  <Label text="昨日积分:" autoSize="none" x="22" y="42" style="普通说明" var="txt_tip" align="left" width="346" height="18"/>
			  <List x="18" y="83" var="list" repeatY="5" spaceY="8">
			    <GuildTechResearchRender x="0" y="0" name="render" runtime="game.ui.guildTechs.GuildTechResearchRenderUI"/>
			  </List>
			  <Label text="昨日积分:" autoSize="none" x="22" y="63" style="普通说明" var="txt_tip2" align="left" width="346" height="18"/>
			</PopModuleView>;
       
      
      public var txt_tip:Label = null;
      
      public var list:List = null;
      
      public var txt_tip2:Label = null;
      
      public function GuildTechResearchModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.guildTechs.GuildTechResearchRenderUI"] = GuildTechResearchRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
