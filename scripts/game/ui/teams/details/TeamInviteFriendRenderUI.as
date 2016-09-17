package game.ui.teams.details
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.CheckBox;
   
   public class TeamInviteFriendRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="308" height="60" buttonMode="true">
			  <Image skin="png.uiTeams.好友选中" x="-2" y="0" var="img_roll"/>
			  <Label text="Lv.98" autoSize="left" x="114" y="23" width="46" height="18" var="txt_lv" style="普通说明" mouseEnabled="false" mouseChildren="false"/>
			  <Label text="人名" autoSize="left" x="114" y="7" width="73" height="18" var="txt_name" style="人名1不随品质变化" mouseEnabled="false" mouseChildren="false"/>
			  <CheckBox x="21" y="21" selected="true" style="CheckBox普通" var="selectedBox"/>
			  <Box x="62" y="6">
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" var="img_quality" sizeGrid="6,6,6,6" width="48" height="48"/>
			    <Image skin="png.comp.image" x="4" y="4" var="img_icon" width="40" height="40"/>
			  </Box>
			  <Label text="玩家签名玩家签名九十签名玩家签名玩家玩" autoSize="left" x="114" y="41" var="txt_signatue" style="普通说明" width="172" height="18" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.uiTeams.好友下面分割线" x="0" y="61"/>
			</PlayerRender>;
       
      
      public var img_roll:Image = null;
      
      public var txt_lv:Label = null;
      
      public var txt_name:Label = null;
      
      public var selectedBox:CheckBox = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_signatue:Label = null;
      
      public function TeamInviteFriendRenderUI()
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
