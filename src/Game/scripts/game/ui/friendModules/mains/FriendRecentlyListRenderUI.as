package game.ui.friendModules.mains
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class FriendRecentlyListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="60">
			  <FriendRecenltyListRender_Player x="0" y="0" var="render_playerUI" runtime="game.ui.friendModules.mains.FriendRecenltyListRender_PlayerUI"/>
			  <Label text="玩家签名玩家签名九十签名玩家签名玩家玩" autoSize="left" x="103" y="34" var="txt_chat" style="普通说明" width="193" height="23"/>
			</View>;
       
      
      public var render_playerUI:game.ui.friendModules.mains.FriendRecenltyListRender_PlayerUI = null;
      
      public var txt_chat:Label = null;
      
      public function FriendRecentlyListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.friendModules.mains.FriendRecenltyListRender_PlayerUI"] = game.ui.friendModules.mains.FriendRecenltyListRender_PlayerUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
