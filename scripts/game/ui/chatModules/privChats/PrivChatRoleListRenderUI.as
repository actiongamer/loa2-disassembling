package game.ui.chatModules.privChats
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import game.ui.commons.comps.others.RedPointNumUI;
   
   public class PrivChatRoleListRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="148" height="60">
			  <PrivChatRoleListRender_player x="0" y="0" var="render_playerUI" runtime="game.ui.chatModules.privChats.PrivChatRoleListRender_playerUI"/>
			  <Image skin="png.uiChatModules.privChats.选中框" x="-4" y="-4" var="img_selectBox" name="selectBoxAll"/>
			  <Button stateNum="1" buttonMode="true" skin="png.a5.btns.btn_closeS3" x="127" var="btn_remove"/>
			  <RedPointNum y="33" x="124" var="redPoiChatCountUI" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			</PlayerRender>;
       
      
      public var render_playerUI:game.ui.chatModules.privChats.PrivChatRoleListRender_playerUI = null;
      
      public var img_selectBox:Image = null;
      
      public var btn_remove:Button = null;
      
      public var redPoiChatCountUI:RedPointNumUI = null;
      
      public function PrivChatRoleListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chatModules.privChats.PrivChatRoleListRender_playerUI"] = game.ui.chatModules.privChats.PrivChatRoleListRender_playerUI;
         viewClassMap["game.ui.commons.comps.others.RedPointNumUI"] = RedPointNumUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
