package game.ui.guildModules.setting
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.ComboBox;
   
   public class SetAuthorityPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="374" height="452">
			  <PanelBgS3 x="1" y="1" width="372" height="450"/>
			  <Image skin="png.uiGuildModule.线" x="30" y="91" width="306"/>
			  <Label text="\l11000229" autoSize="left" x="35" y="103" style="加底标题"/>
			  <List x="47" y="128" spaceX="30" spaceY="10" repeatX="2" repeatY="3" var="list_staticAuth">
			    <AuthorityListRender name="render" runtime="game.ui.guildModules.setting.AuthorityListRenderUI"/>
			  </List>
			  <Image skin="png.uiGuildModule.线" x="30" y="233" width="306" height="2"/>
			  <Label text="\l11000230" autoSize="left" x="35" y="246" style="加底标题"/>
			  <List x="47" y="272" spaceX="30" spaceY="10" repeatX="2" repeatY="3" var="list_commonAuth">
			    <AuthorityListRender name="render" runtime="game.ui.guildModules.setting.AuthorityListRenderUI"/>
			  </List>
			  <HBox x="92.5" y="400" space="25">
			    <Button label="\l10900031" style="按钮中红" var="btn_left"/>
			    <Button label="\l40700023" x="130" style="按钮中绿" var="btn_right"/>
			  </HBox>
			  <HBox x="35" y="58">
			    <Label text="\l40700022" autoSize="left" y="4" style="加底标题"/>
			    <ComboBox labels="高级官员" x="44" width="121" sizeGrid="2,2,40,2" style="Combobox普通" var="comb_pos" scrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" lgx="44,44,44,44,44,44,44,64" lgy="0,0,0,0,0,0,0,0" language="ru"/>
			  </HBox>
			</PopModuleView>;
       
      
      public var list_staticAuth:List = null;
      
      public var list_commonAuth:List = null;
      
      public var btn_left:Button = null;
      
      public var btn_right:Button = null;
      
      public var comb_pos:ComboBox = null;
      
      public function SetAuthorityPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.guildModules.setting.AuthorityListRenderUI"] = AuthorityListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
