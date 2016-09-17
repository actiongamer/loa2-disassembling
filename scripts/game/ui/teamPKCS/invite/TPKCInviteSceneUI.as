package game.ui.teamPKCS.invite
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.TextInput;
   
   public class TPKCInviteSceneUI extends View
   {
      
      protected static var uiView:XML = <View width="1500" height="900" top="0" bottom="0" right="0" left="0" visible="true">
			  <Box x="461" y="724" centerX="0" bottom="50">
			    <Image skin="png.uiTeamPKCS.invite.img_bg1" var="img_bg2" visible="false"/>
			    <Label text="渐变1" autoSize="none" x="18" y="6" style="渐变1" width="542" height="74" align="center" var="txt_teamcount" size="16"/>
			  </Box>
			  <Box x="399" y="-34" centerX="0" top="-30">
			    <Image skin="png.uiTeamPKCS.invite.img_bg0" var="img_bg0"/>
			    <Image skin="png.uiTeamPKCS.invite.img_bg1" x="65" y="116" var="img_bg1"/>
			    <Label text="普通说明" autoSize="none" x="168" y="119" style="普通说明" width="418" height="95" var="txt_signuprequire" multiline="true" wordWrap="true"/>
			    <Box x="215" y="208" var="ui_team" visible="false">
			      <Image skin="png.uiTeamPKCS.invite.总战力" var="img_bg3" visible="true"/>
			      <Label text="女神联盟回归" x="51" y="17" style="普通说明" var="txt_teamname" visible="true" width="146" height="22" align="center"/>
			      <HBox x="54" y="40">
			        <Label text="\l999900291" autoSize="none" y="2" style="普通说明" var="txt_totalfight" visible="true" height="19"/>
			        <Label text="678" autoSize="none" x="54" style="渐变1" align="left" var="txt_fightValue" width="97" height="23" visible="true"/>
			      </HBox>
			    </Box>
			    <Label text="\l999900255" autoSize="none" x="30.5" y="28" style="渐变1" width="645" align="center" size="48" height="63" bold="true"/>
			    <Label text="\l999900261" autoSize="none" x="72" y="89" style="渐变2" width="562" height="26" align="center" size="20"/>
			  </Box>
			  <Box x="294" y="86" var="ui_introduction" visible="false">
			    <Image skin="png.comp.image" width="846" height="559" var="img_bg_intro"/>
			    <Label text="\l999900255" autoSize="none" x="347" y="154" style="渐变黄" width="210" height="24" align="center" font="Microsoft YaHei" var="txt_title"/>
			    <Label text="普通说明" autoSize="none" x="274" y="194" style="普通说明" width="521" height="359" var="txt_0" multiline="true" wordWrap="true"/>
			  </Box>
			  <Box x="463" y="280" var="ui_jointeam" visible="false" centerX="0" centerY="0">
			    <Button skin="png.uiTeamPKCS.invite.img_createteam" width="222" height="377" var="btn_createteam" stateNum="1" x="3"/>
			    <Button skin="png.uiTeamPKCS.invite.img_applyteam" x="355" width="222" height="377" var="btn_applyteam" stateNum="1"/>
			    <Label text="\l999900262" autoSize="none" y="262" style="渐变黄" width="222" height="35" align="center" font="Microsoft YaHei" size="21" mouseChildren="false" mouseEnabled="false"/>
			    <Label text="\l999900260" autoSize="none" x="353" y="262" style="渐变黄" width="222" height="35" align="center" font="Microsoft YaHei" size="21" mouseChildren="false" mouseEnabled="false"/>
			  </Box>
			  <Box x="475" y="233" var="ui_leader" centerX="0" centerY="0">
			    <Button label="\l999900285" style="按钮小绿" var="btn_delete1" y="323" x="20" visible="false"/>
			    <Button label="\l999900285" style="按钮小绿" var="btn_delete3" x="104" visible="false" y="251"/>
			    <Button label="\l999900285" style="按钮小绿" var="btn_delete2" y="323" x="441" visible="false"/>
			    <Button label="\l999900285" style="按钮小绿" var="btn_delete4" x="353" visible="false" y="251"/>
			    <Image skin="png.uiTeamPKCS.invite.总战力" x="139" var="img_bg3_l" visible="true"/>
			    <Button label="\l999900280" style="按钮中红" var="btn_apply_list" y="505"/>
			    <Button label="\l999900281" x="103" style="按钮中红" var="btn_apply_setting" y="505"/>
			    <Button label="\l999900283" x="354" style="按钮中红" var="btn_invite_friend_l" y="505"/>
			    <Button label="\l999900279" style="按钮小绿" var="btn_changename" x="340" visible="true" y="14"/>
			    <Button label="\l999900284" x="465" style="按钮中红" var="btn_dismiss" y="505"/>
			    <Button label="\l999900282" x="208" style="按钮大绿" var="btn_sign_up" y="501"/>
			    <TextInput text="女神联盟回归" x="190" width="146" height="21" var="txt_teamnameinput" align="center" style="普通说明" y="15"/>
			    <HBox x="193" y="37">
			      <Label text="\l999900286" autoSize="none" y="2" style="普通说明" var="txt_totalfight_l" visible="true" width="75" height="19"/>
			      <Label text="678" autoSize="none" x="54" style="渐变1" align="left" var="txt_fightValue_l" width="97" height="24"/>
			    </HBox>
			  </Box>
			  <Box x="578" y="231" var="ui_member" centerX="0" centerY="0">
			    <Image skin="png.uiTeamPKCS.invite.总战力" x="36" var="img_bg3_m" visible="true"/>
			    <Label text="女神联盟回归" x="87" y="14" style="普通说明" var="txt_teamname_m" visible="true" width="146" height="22" align="center"/>
			    <Button label="\l999900277" x="105" style="按钮大绿" var="btn_ready" width="119" height="33" y="506"/>
			    <Button label="\l999900278" x="251" style="按钮中红" var="btn_leaveteam" y="510"/>
			    <Button label="\l999900276" style="按钮中红" var="btn_invite_friend_m" y="510"/>
			    <HBox x="90" y="37">
			      <Label text="\l999900286" autoSize="none" y="2" style="普通说明" var="txt_totalfight_m" visible="true"/>
			      <Label text="678" autoSize="none" x="54" style="渐变1" align="left" var="txt_fightValue_m" height="24" visible="true" width="116"/>
			    </HBox>
			  </Box>
			</View>;
       
      
      public var img_bg2:Image = null;
      
      public var txt_teamcount:Label = null;
      
      public var img_bg0:Image = null;
      
      public var img_bg1:Image = null;
      
      public var txt_signuprequire:Label = null;
      
      public var ui_team:Box = null;
      
      public var img_bg3:Image = null;
      
      public var txt_teamname:Label = null;
      
      public var txt_totalfight:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var ui_introduction:Box = null;
      
      public var img_bg_intro:Image = null;
      
      public var txt_title:Label = null;
      
      public var txt_0:Label = null;
      
      public var ui_jointeam:Box = null;
      
      public var btn_createteam:Button = null;
      
      public var btn_applyteam:Button = null;
      
      public var ui_leader:Box = null;
      
      public var btn_delete1:Button = null;
      
      public var btn_delete3:Button = null;
      
      public var btn_delete2:Button = null;
      
      public var btn_delete4:Button = null;
      
      public var img_bg3_l:Image = null;
      
      public var btn_apply_list:Button = null;
      
      public var btn_apply_setting:Button = null;
      
      public var btn_invite_friend_l:Button = null;
      
      public var btn_changename:Button = null;
      
      public var btn_dismiss:Button = null;
      
      public var btn_sign_up:Button = null;
      
      public var txt_teamnameinput:TextInput = null;
      
      public var txt_totalfight_l:Label = null;
      
      public var txt_fightValue_l:Label = null;
      
      public var ui_member:Box = null;
      
      public var img_bg3_m:Image = null;
      
      public var txt_teamname_m:Label = null;
      
      public var btn_ready:Button = null;
      
      public var btn_leaveteam:Button = null;
      
      public var btn_invite_friend_m:Button = null;
      
      public var txt_totalfight_m:Label = null;
      
      public var txt_fightValue_m:Label = null;
      
      public function TPKCInviteSceneUI()
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
