package game.ui.guildModules.appoint
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class GuildAppointPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="372" height="449">
			  <PanelBgS3 width="372" height="449" x="0" y="0" frameStyle="1"/>
			  <Image skin="png.uiGuildModule.线" x="25" y="292" width="319"/>
			  <Button label="\l40700015" stateNum="1" buttonMode="true" labelFont="SSZH" x="0" y="399" var="btn_confirm" style="按钮中绿" centerX="0"/>
			  <Label text="普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明" autoSize="left" x="27" y="297" style="普通说明" width="320" height="89" multiline="true" wordWrap="true" leading="6" var="txt_rules"/>
			  <Panel x="20" y="52" width="338" height="242" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3">
			    <List var="list_officer" repeatY="8">
			      <GuildOfficerListRender name="render" runtime="game.ui.guildModules.appoint.GuildOfficerListRenderUI"/>
			    </List>
			  </Panel>
			</PopModuleView>;
       
      
      public var btn_confirm:Button = null;
      
      public var txt_rules:Label = null;
      
      public var list_officer:List = null;
      
      public function GuildAppointPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.guildModules.appoint.GuildOfficerListRenderUI"] = GuildOfficerListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
