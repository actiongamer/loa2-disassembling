package game.ui.xunleiGiftModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.xunleiGiftModule.render.XunLeiLeftTabRenderUI;
   
   public class XunleiGiftModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="803" height="551">
			  <PanelBg x="0" y="0" width="804" height="551"/>
			  <Image skin="png.uiXunLeiGift.img_title" x="195" y="41" width="595" height="122" var="img_bg"/>
			  <Image skin="png.uiXunLeiGift.img_backpanel" x="193" y="134" width="596" height="407" var="img_backpanel"/>
			  <List x="23" y="45" var="list_title" repeatY="4" spaceY="6">
			    <XunLeiLeftTabRender name="render" runtime="game.ui.xunleiGiftModule.render.XunLeiLeftTabRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_backpanel:Image = null;
      
      public var list_title:List = null;
      
      public function XunleiGiftModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.xunleiGiftModule.render.XunLeiLeftTabRenderUI"] = XunLeiLeftTabRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
