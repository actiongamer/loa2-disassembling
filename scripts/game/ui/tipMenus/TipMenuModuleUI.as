package game.ui.tipMenus
{
   import morn.customs.components.TopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   
   public class TipMenuModuleUI extends TopModuleView
   {
      
      protected static var uiView:XML = <TopModuleView width="170" height="255">
			  <Image skin="png.a5.bgs.tooltipBgs.img_tipMenuBg" sizeGrid="20,20,20,20" width="170" height="255" var="img_bg" x="0" y="0"/>
			  <List repeatY="6" var="list" spaceY="6" x="12" y="22">
			    <TipMenuRender name="render" runtime="game.ui.tipMenus.TipMenuRenderUI"/>
			  </List>
			</TopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var list:List = null;
      
      public function TipMenuModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.tipMenus.TipMenuRenderUI"] = TipMenuRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
