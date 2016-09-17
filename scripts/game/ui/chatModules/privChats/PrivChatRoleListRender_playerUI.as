package game.ui.chatModules.privChats
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class PrivChatRoleListRender_playerUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="148" height="60">
			  <Image skin="png.uiChatModules.privChats.底框" x="0" y="0"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="10" y="10" var="img_quality" sizeGrid="6,6,6,6" width="42" height="42"/>
			  <Image skin="png.comp.image" x="14" y="14" var="img_icon" width="34" height="34"/>
			  <Label text="人名人名人名" autoSize="left" x="57" y="23" width="78" height="18" var="txt_name" style="随品质变化"/>
			  <Label text="vip" autoSize="left" x="58" y="3" width="78" height="21" var="txt_vipInfo" style="随品质变化"/>
			</PlayerRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_vipInfo:Label = null;
      
      public function PrivChatRoleListRender_playerUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
