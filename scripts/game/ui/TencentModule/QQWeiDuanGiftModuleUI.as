package game.ui.TencentModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import game.ui.TencentModule.render.QQWeiDuanGiftRenderFakeUI;
   
   public class QQWeiDuanGiftModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400">
			  <PanelBg x="0" y="0" width="708" height="550"/>
			  <Image skin="png.uiQQWeiDuanGift.img_bg" x="17" y="39"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="15" y="36" sizeGrid="16,16,16,16" width="680" height="504"/>
			  <List x="22" y="154" var="list" repeatY="3">
			    <QQWeiDuanGiftRenderFake name="render" runtime="game.ui.TencentModule.render.QQWeiDuanGiftRenderFakeUI"/>
			  </List>
			  <Image skin="png.uiQQWeiDuanGift.img_title" x="160" y="50"/>
			</PopModuleView>;
       
      
      public var list:List = null;
      
      public function QQWeiDuanGiftModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.TencentModule.render.QQWeiDuanGiftRenderFakeUI"] = QQWeiDuanGiftRenderFakeUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
