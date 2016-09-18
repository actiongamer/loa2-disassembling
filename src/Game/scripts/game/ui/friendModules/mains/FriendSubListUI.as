package game.ui.friendModules.mains
{
   import morn.core.components.View;
   import morn.core.components.List;
   
   public class FriendSubListUI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="370">
			  <List x="0" y="0" repeatY="6" spaceY="2" var="list_firend">
			    <FriendSubListRender name="render" runtime="game.ui.friendModules.mains.FriendSubListRenderUI"/>
			  </List>
			</View>;
       
      
      public var list_firend:List = null;
      
      public function FriendSubListUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.friendModules.mains.FriendSubListRenderUI"] = FriendSubListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
