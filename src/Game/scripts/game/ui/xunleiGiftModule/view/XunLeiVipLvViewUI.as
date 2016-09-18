package game.ui.xunleiGiftModule.view
{
   import morn.core.components.View;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS3UI;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import game.ui.xunleiGiftModule.render.XunleiLvlUpGiftRenderUI;
   
   public class XunLeiVipLvViewUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <List x="11" y="0" repeatY="3" spaceY="0" var="list_gifts">
			    <XunleiLvlUpGiftRender name="render" runtime="game.ui.xunleiGiftModule.render.XunleiLvlUpGiftRenderUI"/>
			  </List>
			  <PageBarS3 x="539" y="52" var="pageBarUi" height="270" runtime="game.ui.commons.comps.pageBars.PageBarS3UI"/>
			  <Button label="按钮" x="240.5" style="按钮大绿" y="359" var="btn_get"/>
			  <Label text="重要提示绿" autoSize="none" x="403" y="367" style="重要提示绿" width="124" height="20" var="txt_toWeb"/>
			</View>;
       
      
      public var list_gifts:List = null;
      
      public var pageBarUi:PageBarS3UI = null;
      
      public var btn_get:Button = null;
      
      public var txt_toWeb:Label = null;
      
      public function XunLeiVipLvViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS3UI"] = PageBarS3UI;
         viewClassMap["game.ui.xunleiGiftModule.render.XunleiLvlUpGiftRenderUI"] = XunleiLvlUpGiftRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
