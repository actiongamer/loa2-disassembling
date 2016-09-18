package game.ui.friendModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.Tab;
   import morn.core.components.Image;
   import morn.core.components.TextInput;
   import game.ui.friendModules.mains.FriendPlayerRenderUI;
   import morn.customs.components.Accordion;
   import game.ui.commons.comps.others.RedPointNumUI;
   import morn.core.components.List;
   import game.ui.friendModules.mains.FriendQuickSearchListUI;
   import game.ui.friendModules.mains.FriendBlockListRenderUI;
   import game.ui.friendModules.mains.FriendListTileRenderUI;
   import game.ui.friendModules.mains.FriendRecentlyListRenderUI;
   import game.ui.friendModules.mains.FriendSubListUI;
   
   public class FriendModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="360" height="586" disabled="false" mouseChildren="true" x="3" mouseEnabled="true" buttonMode="true">
			  <PanelBg bgBMargin="10,35,10,60" width="360" height="586"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="15" y="117" width="330" height="380" sizeGrid="20,20,20,20"/>
			  <Box x="57" y="505" var="box_btns">
			    <Button label="     添加好友" x="138" style="按钮中绿" var="btn_add" mouseChildren="false" y="4" width="100" height="26"/>
			    <Button label="     赠送体力" style="按钮中红" var="btn_gift" mouseChildren="false" x="12" y="4" width="100" height="26"/>
			    <Image skin="png.uiFriend.添加好友" x="125" mouseEnabled="false" buttonMode="false" y="0"/>
			    <Image skin="png.uiFriend.赠送体力" mouseEnabled="false" buttonMode="false"/>
			    <Button label="     好友动态" style="按钮中红" var="btn_log" mouseChildren="false" x="12" y="40" width="100" height="26"/>
			    <Image skin="png.uiFriend.赠送体力" y="35" mouseEnabled="false" buttonMode="false"/>
			    <Button label="     好友推荐" x="138" style="按钮中绿" var="btn_recommand" mouseChildren="false" y="40" width="100" height="26"/>
			    <Image skin="png.uiFriend.添加好友" x="125" y="36" mouseEnabled="false" buttonMode="false"/>
			  </Box>
			  <Label text="普通说明 100/100" autoSize="none" x="224" y="45" style="普通说明" var="txt_friendLimit" align="right" width="128" height="20"/>
			  <Tab labels="    一已已签,    一已已签,     已已签" x="22" y="92" style="TAB超长" var="tab_kindTabGroup"/>
			  <Image skin="png.uiFriend.黑名单" x="230" y="86" var="img_icon2"/>
			  <Image skin="png.uiFriend.好友" x="19" y="88" var="img_icon0"/>
			  <Image skin="png.uiFriend.最近联系" x="127" y="88" var="img_icon1"/>
			  <TextInput text="TextInput" skin="png.uiFriend.mains.输入框" x="72" y="64" width="236" height="26" sizeGrid="4,4,4,4" margin="2,3" var="txt_desc" style="普通说明" align="left"/>
			  <Box x="72" y="64" var="box_prompt">
			    <Image skin="png.uiFriend.mains.输入框" width="236" height="26" sizeGrid="4,4,4,"/>
			    <TextInput x="5" y="4" width="202" height="19" var="txt_descPrompt" text="输入聊天信息" mouseEnabled="false" mouseChildren="false" style="普通灰色"/>
			  </Box>
			  <FriendPlayerRender x="23" y="40" var="playerRenderUI" runtime="game.ui.friendModules.mains.FriendPlayerRenderUI"/>
			  <TextInput text="TextInput" skin="png.uiFriend.mains.输入框" x="18" y="121" width="324" height="26" sizeGrid="4,4,4,4" margin="2,3" var="txt_search" style="普通说明"/>
			  <TextInput x="23" y="124" width="188" height="18" var="txt_searchPrompt" text="搜索好友" color="0xa0a0a0" labelFilterKind="黑色1像素描边" mouseEnabled="false" mouseChildren="false" style="普通灰色"/>
			  <Button skin="png.uiFriend.mains.查找01" x="320" y="127" stateNum="1" var="btn_search"/>
			  <Accordion x="19" y="155" repeatY="2" selectedIndex="1" width="322" height="335" var="list_friend">
			    <FriendListTileRender name="render" runtime="game.ui.friendModules.mains.FriendListTileRenderUI"/>
			    <FriendSubList y="192" name="subRender" x="2" runtime="game.ui.friendModules.mains.FriendSubListUI"/>
			  </Accordion>
			  <RedPointNum y="504" x="153" var="redPoiGiftUI" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			  <RedPointNum y="538" x="153" var="redPoiCongUI" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			  <List x="19" y="120" var="list_block" repeatY="18" spaceY="3" width="322" height="365" repeatX="1">
			    <FriendBlockListRender name="render" runtime="game.ui.friendModules.mains.FriendBlockListRenderUI"/>
			  </List>
			  <List x="19" y="120" var="list_recently" repeatY="6" width="322" height="370" repeatX="1" spaceY="2">
			    <FriendRecentlyListRender x="0" y="0" name="render" runtime="game.ui.friendModules.mains.FriendRecentlyListRenderUI"/>
			  </List>
			  <FriendQuickSearchList x="24" y="139" var="list_quickSearch" runtime="game.ui.friendModules.mains.FriendQuickSearchListUI"/>
			</PopModuleView>;
       
      
      public var box_btns:Box = null;
      
      public var btn_add:Button = null;
      
      public var btn_gift:Button = null;
      
      public var btn_log:Button = null;
      
      public var btn_recommand:Button = null;
      
      public var txt_friendLimit:Label = null;
      
      public var tab_kindTabGroup:Tab = null;
      
      public var img_icon2:Image = null;
      
      public var img_icon0:Image = null;
      
      public var img_icon1:Image = null;
      
      public var txt_desc:TextInput = null;
      
      public var box_prompt:Box = null;
      
      public var txt_descPrompt:TextInput = null;
      
      public var playerRenderUI:FriendPlayerRenderUI = null;
      
      public var txt_search:TextInput = null;
      
      public var txt_searchPrompt:TextInput = null;
      
      public var btn_search:Button = null;
      
      public var list_friend:Accordion = null;
      
      public var redPoiGiftUI:RedPointNumUI = null;
      
      public var redPoiCongUI:RedPointNumUI = null;
      
      public var list_block:List = null;
      
      public var list_recently:List = null;
      
      public var list_quickSearch:FriendQuickSearchListUI = null;
      
      public function FriendModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointNumUI"] = RedPointNumUI;
         viewClassMap["game.ui.friendModules.mains.FriendBlockListRenderUI"] = FriendBlockListRenderUI;
         viewClassMap["game.ui.friendModules.mains.FriendListTileRenderUI"] = FriendListTileRenderUI;
         viewClassMap["game.ui.friendModules.mains.FriendPlayerRenderUI"] = FriendPlayerRenderUI;
         viewClassMap["game.ui.friendModules.mains.FriendQuickSearchListUI"] = FriendQuickSearchListUI;
         viewClassMap["game.ui.friendModules.mains.FriendRecentlyListRenderUI"] = FriendRecentlyListRenderUI;
         viewClassMap["game.ui.friendModules.mains.FriendSubListUI"] = FriendSubListUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
