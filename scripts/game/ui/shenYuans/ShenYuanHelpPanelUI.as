package game.ui.shenYuans
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import morn.core.components.List;
   import morn.core.components.Label;
   
   public class ShenYuanHelpPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="370" height="466">
			  <PanelBgS3 x="0" y="0" width="370" height="466" frameStyle="2"/>
			  <PageBarS1 x="138" y="424" centerX="0" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			  <List x="22" y="61" repeatY="4" spaceY="5" var="list_player">
			    <ShenYuanHelpRender name="render" runtime="game.ui.shenYuans.ShenYuanHelpRenderUI"/>
			  </List>
			  <Label text="你将使用好友的队伍作战" autoSize="left" x="17" y="38" style="普通说明" height="18" align="left" centerX="0"/>
			  <Label text="\l41500129" autoSize="left" x="31.5" y="86" style="普通说明" width="307" height="63" align="center" centerX="0" var="txt_no_friend"/>
			</PopModuleView>;
       
      
      public var pageBar:PageBarS1UI = null;
      
      public var list_player:List = null;
      
      public var txt_no_friend:Label = null;
      
      public function ShenYuanHelpPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.shenYuans.ShenYuanHelpRenderUI"] = ShenYuanHelpRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
