package game.ui.chatModules.privChats
{
   import morn.core.components.View;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   
   public class PrivChatRoleListUI extends View
   {
      
      protected static var uiView:XML = <View width="148" height="450">
			  <Image skin="png.uiFriend.mains.下分割线" x="11.5" y="402" width="125" height="26"/>
			  <List var="list_player" repeatY="6" spaceY="6">
			    <PrivChatRoleListRender x="0" y="0" name="render" runtime="game.ui.chatModules.privChats.PrivChatRoleListRenderUI"/>
			  </List>
			  <PageBarS1 x="27" y="417" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			</View>;
       
      
      public var list_player:List = null;
      
      public var pageBarUI:PageBarS1UI = null;
      
      public function PrivChatRoleListUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chatModules.privChats.PrivChatRoleListRenderUI"] = PrivChatRoleListRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
