package game.ui.facebook
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.TextInput;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class FBInviteViewUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="810" height="560">
			  <PanelBg x="0" y="0" width="810" height="560"/>
			  <Image skin="png.uiFacebook.0060_0008_组-167" x="-64" y="39" mouseEnabled="false" mouseChildren="false"/>
			  <Box x="32" y="171" var="inviteBox">
			    <Image skin="png.uiFacebook.0060_0009_组-168-副本-2" y="41"/>
			    <Image skin="png.uiFacebook.0060_0010_组-168-副本-3" x="377" y="41"/>
			    <Button label="\l999000817" skin="png.a5.btns.btn_big_S3" x="501" y="339" stateNum="1" var="inviteFriendsBtn"/>
			    <List x="384" y="46" width="352" height="274" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="selectedFriendsList" repeatX="3" spaceX="31">
			      <FBInviteListRender name="render" x="1" y="5" runtime="game.ui.facebook.FBInviteListRenderUI"/>
			    </List>
			    <List x="7" y="46" width="352" height="274" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="allFriendsList" repeatX="3" spaceX="31">
			      <FBInviteListRender name="render" x="1" y="5" runtime="game.ui.facebook.FBInviteListRenderUI"/>
			    </List>
			    <Button label="\l999000813" skin="png.a5.btns.btn_big_S4" stateNum="1" var="selectAllBtn"/>
			    <Button label="\l999000814" skin="png.a5.btns.btn_big_S4" x="376" y="1" stateNum="1" var="disselectAllBtn"/>
			    <Box x="131" y="3" var="searchBox">
			      <Image skin="png.uiFacebook.0052_0008_图层-7"/>
			      <TextInput x="8" y="3" var="inputTxt" width="190" height="19" align="center" autoSize="none" style="普通灰色" text="\l999000803" selectable="true"/>
			      <Button skin="png.uiFacebook.btn_look" x="208" y="4" stateNum="1" var="searchBtn" mouseEnabled="false" mouseChildren="false"/>
			    </Box>
			    <Box x="507" y="5">
			      <Image skin="png.uiFacebook.0052_0008_图层-7"/>
			      <TextInput x="8" y="4" var="countTxt" width="190" height="19" align="center" autoSize="none" style="普通说明" text="(74/74 friends selected)" mouseChildren="false" mouseEnabled="false"/>
			    </Box>
			    <Label text="\l999000815" autoSize="none" x="13" y="172" style="普通说明" width="342" height="20" var="allFriendsTxt" mouseChildren="false" mouseEnabled="false" align="center" visible="false" isHtml="true"/>
			    <Label text="\l999000816" autoSize="none" x="390" y="172" style="普通说明" width="342" height="20" var="selectedFriendsTxt" mouseChildren="false" mouseEnabled="false" align="center" visible="false" isHtml="true"/>
			  </Box>
			  <Box x="13" y="160" var="rewardBox" visible="false">
			    <Image skin="png.uiFacebook.0060_0000_组-168-副本-5" x="19" y="150"/>
			    <Image skin="png.uiFacebook.kuangBg1"/>
			    <Label text="\l999000806" autoSize="none" x="36" y="51" style="加底标题" width="708" multiline="false" wordWrap="false" leading="5" isHtml="true" align="center" size="18" height="27" mouseChildren="false" mouseEnabled="false"/>
			    <Image skin="png.uiFacebook.logo" x="284" y="156" width="216" height="66" smoothing="true" var="logoImage"/>
			    <Label text="\l999000809" autoSize="none" x="9" y="355" style="加底标题" width="766" multiline="false" wordWrap="false" leading="5" isHtml="true" align="center" mouseEnabled="false" mouseChildren="false"/>
			    <List x="280" y="276" repeatX="4" repeatY="1" spaceX="8" var="rewardItemList1">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </List>
			    <Label text="\l999000808" autoSize="none" x="181" y="227" style="加底标题" width="422" multiline="true" wordWrap="true" leading="5" isHtml="true" align="center" size="13" mouseChildren="false" mouseEnabled="false"/>
			  </Box>
			  <Label text="\l999000810" autoSize="none" x="48" y="81" style="普通说明" width="422" var="decTxt" multiline="true" wordWrap="true" leading="5" isHtml="true"/>
			  <Box x="532" y="51">
			    <Label text="\l999000807" autoSize="none" x="9" style="加底标题" size="18"/>
			    <Label text="\l999000805" autoSize="none" y="82" style="二级框标题" width="243" height="20" align="center" var="tipTxt" x="0" isHtml="true"/>
			    <List x="9" y="28" repeatX="4" repeatY="1" spaceX="8" var="rewardItemList">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </List>
			  </Box>
			  <Image skin="png.uiFacebook.0060_0014_图层-3" x="470" y="75"/>
			</PopModuleView>;
       
      
      public var inviteBox:Box = null;
      
      public var inviteFriendsBtn:Button = null;
      
      public var selectedFriendsList:List = null;
      
      public var allFriendsList:List = null;
      
      public var selectAllBtn:Button = null;
      
      public var disselectAllBtn:Button = null;
      
      public var searchBox:Box = null;
      
      public var inputTxt:TextInput = null;
      
      public var searchBtn:Button = null;
      
      public var countTxt:TextInput = null;
      
      public var allFriendsTxt:Label = null;
      
      public var selectedFriendsTxt:Label = null;
      
      public var rewardBox:Box = null;
      
      public var logoImage:Image = null;
      
      public var rewardItemList1:List = null;
      
      public var decTxt:Label = null;
      
      public var tipTxt:Label = null;
      
      public var rewardItemList:List = null;
      
      public function FBInviteViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         viewClassMap["game.ui.facebook.FBInviteListRenderUI"] = FBInviteListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
