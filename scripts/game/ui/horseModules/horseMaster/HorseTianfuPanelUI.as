package game.ui.horseModules.horseMaster
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   
   public class HorseTianfuPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="227" height="249">
			  <PanelBgS3 x="1" y="1" width="372" height="257" frameStyle="2" showLightBottom="false"/>
			  <List x="24.5" y="42" repeatY="10" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="list_tianfu" spaceY="2" width="332">
			    <HorseTianfuRender name="render" runtime="game.ui.horseModules.horseMaster.HorseTianfuRenderUI"/>
			  </List>
			</PanelView>;
       
      
      public var list_tianfu:List = null;
      
      public function HorseTianfuPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.horseModules.horseMaster.HorseTianfuRenderUI"] = HorseTianfuRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
