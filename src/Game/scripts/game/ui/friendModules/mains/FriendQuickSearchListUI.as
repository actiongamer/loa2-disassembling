package game.ui.friendModules.mains
{
   import morn.core.components.View;
   import morn.core.components.List;
   
   public class FriendQuickSearchListUI extends View
   {
      
      protected static var uiView:XML = <View width="246" height="360">
			  <Image skin="png.a5.bgs.tooltipBgs.img_tipMenuBg" left="0" right="0" top="0" bottom="0" sizeGrid="20,20,20,20"/>
			  <List x="12" y="13" repeatY="4" spaceY="4" var="list_search">
			    <FriendQuickSearchRender name="render" runtime="game.ui.friendModules.mains.FriendQuickSearchRenderUI"/>
			  </List>
			</View>;
       
      
      public var list_search:List = null;
      
      public function FriendQuickSearchListUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.friendModules.mains.FriendQuickSearchRenderUI"] = FriendQuickSearchRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
