package game.ui.fashionAcc
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.pageBars.PageBarS3UI;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class FashionAccSelectModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="387" height="421">
			  <PanelBgS3 x="5" y="3" width="377" height="416" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <Image skin="png.uiFashionUpgrade.打造选择界面.底1" x="15" y="22"/>
			  <Image skin="png.uiFashionUpgrade.打造选择界面.图片" x="116" y="39"/>
			  <PageBarS3 x="38" y="54" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS3UI"/>
			  <List x="33" y="98" width="64" height="242" repeatY="3" spaceY="19" var="list_title">
			    <FashionAccSelectTitleRender name="render" runtime="game.ui.fashionAcc.FashionAccSelectTitleRenderUI"/>
			  </List>
			  <Button label="按钮" x="197" y="377" style="按钮中绿" var="btn_select"/>
			  <List x="115" y="162" width="261" height="210" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="list_acc">
			    <FashionAccRender name="render" runtime="game.ui.fashionAcc.FashionAccRenderUI"/>
			  </List>
			  <Label text="\l31210012" autoSize="none" x="116" y="251" style="普通说明" width="257" height="20" align="center" var="txt_all"/>
			</PopModuleView>;
       
      
      public var pageBarUI:PageBarS3UI = null;
      
      public var list_title:List = null;
      
      public var btn_select:Button = null;
      
      public var list_acc:List = null;
      
      public var txt_all:Label = null;
      
      public function FashionAccSelectModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS3UI"] = PageBarS3UI;
         viewClassMap["game.ui.fashionAcc.FashionAccRenderUI"] = FashionAccRenderUI;
         viewClassMap["game.ui.fashionAcc.FashionAccSelectTitleRenderUI"] = FashionAccSelectTitleRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
