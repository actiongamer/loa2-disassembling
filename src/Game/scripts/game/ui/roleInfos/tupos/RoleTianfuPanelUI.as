package game.ui.roleInfos.tupos
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   
   public class RoleTianfuPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="374" height="424">
			  <PanelBgS3 x="0" y="0" width="372" height="423" frameStyle="2"/>
			  <List x="18" y="39" repeatY="3" spaceY="5" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="337" height="367" var="list_tujian">
			    <TupoTujianRender name="render" runtime="game.ui.roleInfos.tupos.TupoTujianRenderUI"/>
			  </List>
			</PanelView>;
       
      
      public var list_tujian:List = null;
      
      public function RoleTianfuPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleInfos.tupos.TupoTujianRenderUI"] = TupoTujianRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
