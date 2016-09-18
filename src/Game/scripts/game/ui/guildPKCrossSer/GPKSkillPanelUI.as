package game.ui.guildPKCrossSer
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class GPKSkillPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="805" height="550">
			  <PanelBg x="0" y="0" width="805" height="550"/>
			  <Image skin="png.comp.image" x="15" y="36" width="776" height="502" var="img_bg0"/>
			  <List x="21" y="51" repeatX="4" spaceX="-18" var="list_item">
			    <GPKSkillRender name="render" runtime="game.ui.guildPKCrossSer.GPKSkillRenderUI"/>
			  </List>
			  <Label text="普通说明" autoSize="none" x="169" y="500" style="普通说明" width="469" height="20" var="txt_desc"/>
			  <Button label="按钮" x="679" y="498" style="按钮小红" var="btn_rank"/>
			</PopModuleView>;
       
      
      public var img_bg0:Image = null;
      
      public var list_item:List = null;
      
      public var txt_desc:Label = null;
      
      public var btn_rank:Button = null;
      
      public function GPKSkillPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.guildPKCrossSer.GPKSkillRenderUI"] = GPKSkillRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
