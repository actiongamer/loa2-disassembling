package game.ui.qihooModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS3UI;
   import morn.core.components.Label;
   import game.ui.qihooModule.render.QihooLvlUpGiftRenderUI;
   
   public class QihooModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="651" height="557">
			  <PanelBg x="10" y="5" width="630" height="551"/>
			  <Image skin="png.a5.comps.img_block" x="29" y="45" width="596" height="135" var="img_title"/>
			  <Image skin="png.a5.comps.img_block" x="29" y="139" width="596" height="407" var="img_backpanel"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="25" y="43" sizeGrid="14,18,14,14" width="602" height="501"/>
			  <List x="36" y="156" repeatY="3" spaceY="0" var="list_gifts">
			    <QihooLvlUpGiftRender name="render" runtime="game.ui.qihooModule.render.QihooLvlUpGiftRenderUI"/>
			  </List>
			  <PageBarS3 x="564" y="203" var="pageBarUi" height="280" runtime="game.ui.commons.comps.pageBars.PageBarS3UI"/>
			  <Label text="更多特权，请关注" autoSize="none" x="391" y="118" style="普通说明" width="226" height="20" align="right" var="txt_toWeb"/>
			</PopModuleView>;
       
      
      public var img_title:Image = null;
      
      public var img_backpanel:Image = null;
      
      public var list_gifts:List = null;
      
      public var pageBarUi:PageBarS3UI = null;
      
      public var txt_toWeb:Label = null;
      
      public function QihooModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS3UI"] = PageBarS3UI;
         viewClassMap["game.ui.qihooModule.render.QihooLvlUpGiftRenderUI"] = QihooLvlUpGiftRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
