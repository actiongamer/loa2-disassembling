package game.ui.TencentModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.TencentModule.render.TencentActivityLeftTabRenderUI;
   
   public class TencentActivityModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="803" height="551">
			  <PanelBg x="0" y="0" width="804" height="551"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="12" y="34" sizeGrid="14,18,14,14" width="777" height="506"/>
			  <Image skin="png.uiTencent.img_titleInitBg" x="189" y="38" var="img_bg"/>
			  <Image skin="png.uiTencent.img_bg" x="193" y="130" var="img_backpanel" width="592" height="408"/>
			  <List x="21" y="45" var="list_title" repeatY="4" spaceY="6">
			    <TencentActivityLeftTabRender name="render" runtime="game.ui.TencentModule.render.TencentActivityLeftTabRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_backpanel:Image = null;
      
      public var list_title:List = null;
      
      public function TencentActivityModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.TencentModule.render.TencentActivityLeftTabRenderUI"] = TencentActivityLeftTabRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
