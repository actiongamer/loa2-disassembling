package game.ui.mallModule
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import game.ui.mallModule.render.MallListItemRenderUI;
   
   public class CommonPageUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="600" height="400">
			  <Image skin="png.uiMall.底3" x="-8" y="-4" width="805" height="462" sizeGrid="4,4,4,4"/>
			  <List x="3" y="10" repeatX="3" repeatY="3" spaceX="8" spaceY="8" var="list_items">
			    <MallListItemRender name="render" runtime="game.ui.mallModule.render.MallListItemRenderUI"/>
			  </List>
			  <PageBarS2 x="324.5" y="423" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			</FadeView>;
       
      
      public var list_items:List = null;
      
      public var pageBar:PageBarS2UI = null;
      
      public function CommonPageUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.mallModule.render.MallListItemRenderUI"] = MallListItemRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
