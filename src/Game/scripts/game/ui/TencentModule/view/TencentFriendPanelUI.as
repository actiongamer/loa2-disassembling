package game.ui.TencentModule.view
{
   import morn.core.components.View;
   import morn.core.components.List;
   import game.ui.TencentModule.render.TencentFriendProgressRenderFakeUI;
   
   public class TencentFriendPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <List x="0" y="0" repeatY="4" spaceY="20" var="list" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="580">
			    <TencentFriendProgressRenderFake name="render" runtime="game.ui.TencentModule.render.TencentFriendProgressRenderFakeUI"/>
			  </List>
			</View>;
       
      
      public var list:List = null;
      
      public function TencentFriendPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.TencentModule.render.TencentFriendProgressRenderFakeUI"] = TencentFriendProgressRenderFakeUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
