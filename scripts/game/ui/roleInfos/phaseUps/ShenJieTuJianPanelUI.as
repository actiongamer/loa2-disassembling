package game.ui.roleInfos.phaseUps
{
   import morn.customs.components.PanelView;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   
   public class ShenJieTuJianPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="344" height="449">
			  <PanelBgS3 x="1" y="1" width="343" height="447" frameStyle="2"/>
			  <PageBarS2 x="99" y="404" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List x="24" y="48" var="list_info">
			    <ShenjieTujianListRender name="render" x="0" y="0" runtime="game.ui.roleInfos.phaseUps.ShenjieTujianListRenderUI"/>
			  </List>
			</PanelView>;
       
      
      public var pageBar:PageBarS2UI = null;
      
      public var list_info:List = null;
      
      public function ShenJieTuJianPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.roleInfos.phaseUps.ShenjieTujianListRenderUI"] = ShenjieTujianListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
