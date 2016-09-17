package game.ui.playerHeaders
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.Label;
   import morn.core.components.Tab;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import game.ui.commons.props.FightValueBoxUI;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.customs.components.ClipList;
   
   public class PlayerHeaderUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="302" height="138" var="whole">
			  <Image skin="png.uiPlayerHeader.头像底框" x="17" y="45"/>
			  <PlayerHeaderWealthRender x="136" y="95" var="txt_gold" runtime="game.ui.playerHeaders.PlayerHeaderWealthRenderUI"/>
			  <Label text="阵型1" autoSize="left" x="415" y="47" color="0xc2beaf" size="13" var="txt_zhen1" width="38" height="18" buttonMode="true" style="普通说明"/>
			  <Label text="阵型2" autoSize="left" x="467" y="46" color="0xc2beaf" size="13" var="txt_zhen2" width="43" height="18" buttonMode="true" style="普通说明"/>
			  <Label text="阵型3" autoSize="left" x="518" y="46" color="0xc2beaf" size="13" var="txt_zhen3" width="40" height="18" buttonMode="true" style="普通说明"/>
			  <Tab labels="标 签,标 签" x="412" y="13" selectedIndex="1" style="TAB短" var="tab_city"/>
			  <Image skin="png.comp.image" x="74" y="124" var="img_headerIcon" autoSize="true" anchorX="0.5" anchorY="1" height="100" width="100"/>
			  <Label text="当花瓣当花瓣" autoSize="none" x="124" y="53" var="txt_name" width="136" align="center" style="二级框标题" size="13" font="Microsoft YaHei"/>
			  <PlayerHeaderWealthRender x="224" y="95" var="txt_stamina" runtime="game.ui.playerHeaders.PlayerHeaderWealthRenderUI"/>
			  <Button skin="png.uiPlayerHeader.加按钮" x="262" y="96" var="btn_addStamina" buttonMode="true" stateNum="1" width="22" height="22"/>
			  <Box x="107" y="90">
			    <Image skin="png.uiPlayerHeader.等级底"/>
			    <Label text="0" autoSize="none" y="7" style="渐变1" align="center" x="2" font="SimHei" size="15" var="btn_level" width="26" height="20"/>
			  </Box>
			  <PlayerMilitaryRender x="41" y="109" var="render_military" runtime="game.ui.playerHeaders.PlayerMilitaryRenderUI"/>
			  <Button buttonMode="true" x="16" y="59" var="btn_mScreen" style="按钮小红" skin="png.uiChatModules.a7.btn_scale"/>
			  <Button buttonMode="true" x="16" y="59" var="btn_fScreen" style="按钮小红" skin="png.uiChatModules.a7.btn_scale"/>
			  <PlayerHeaderWealthRender x="136" y="71" var="txt_diamond" runtime="game.ui.playerHeaders.PlayerHeaderWealthRenderUI"/>
			  <Image skin="png.uiPlayerHeader.diamondBack" x="210" y="73"/>
			  <PlayerHeaderWealthRenderSmall x="213" y="73" var="small_diamond" runtime="game.ui.playerHeaders.PlayerHeaderWealthRenderSmallUI"/>
			  <PlayerHeaderWealthRenderSmall x="282" y="73" var="small_diamond_bind" runtime="game.ui.playerHeaders.PlayerHeaderWealthRenderSmallUI"/>
			  <FightValueBox x="123" y="121" var="figthValueBox" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <List x="123" y="146" var="list_card" repeatX="4" repeatY="2" spaceX="5">
			    <CardInfoRender name="render" runtime="game.ui.playerHeaders.CardInfoRenderUI"/>
			  </List>
			  <Label text="点我进时装" autoSize="left" x="415" y="69" color="0xc2beaf" size="13" var="txt_fashion" width="88" height="18" buttonMode="true" visible="false" style="普通说明"/>
			  <Box x="360" y="21" var="box_renzheng">
			    <Image skin="png.uiPlayerHeader.V" x="0" y="3"/>
			    <Label text="认证" autoSize="none" y="27" style="渐变1" width="89" height="22" align="center" x="-20"/>
			  </Box>
			  <Box x="297" y="12" height="60" width="61">
			    <Box var="box_vip" x="0" y="0">
			      <Image skin="png.uiPlayerHeader.img_vip2" var="img_vip"/>
			      <ClipList value="15" clipWidth="13" align="left" url="png.a5.comps.clipList.clipList_S14" x="28" y="40" height="19" var="txt_vip"/>
			      <Image skin="png.a5.commonImgs.img_redPoint" x="43" y="9" var="img_vipredpoint"/>
			    </Box>
			    <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" width="61" height="60" sizeGrid="20,20,20,20" var="img_bg" alpha="0" buttonMode="true" x="0" mouseChildren="true" y="0"/>
			  </Box>
			  <Button buttonMode="true" x="239" y="11" var="btn_addMoney" style="按钮小红" skin="png.uiPlayerHeader.img_charge"/>
			</StaticModuleView>;
       
      
      public var whole:StaticModuleView = null;
      
      public var txt_gold:game.ui.playerHeaders.PlayerHeaderWealthRenderUI = null;
      
      public var txt_zhen1:Label = null;
      
      public var txt_zhen2:Label = null;
      
      public var txt_zhen3:Label = null;
      
      public var tab_city:Tab = null;
      
      public var img_headerIcon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_stamina:game.ui.playerHeaders.PlayerHeaderWealthRenderUI = null;
      
      public var btn_addStamina:Button = null;
      
      public var btn_level:Label = null;
      
      public var render_military:game.ui.playerHeaders.PlayerMilitaryRenderUI = null;
      
      public var btn_mScreen:Button = null;
      
      public var btn_fScreen:Button = null;
      
      public var txt_diamond:game.ui.playerHeaders.PlayerHeaderWealthRenderUI = null;
      
      public var small_diamond:game.ui.playerHeaders.PlayerHeaderWealthRenderSmallUI = null;
      
      public var small_diamond_bind:game.ui.playerHeaders.PlayerHeaderWealthRenderSmallUI = null;
      
      public var figthValueBox:FightValueBoxUI = null;
      
      public var list_card:List = null;
      
      public var txt_fashion:Label = null;
      
      public var box_renzheng:Box = null;
      
      public var box_vip:Box = null;
      
      public var img_vip:Image = null;
      
      public var txt_vip:ClipList = null;
      
      public var img_vipredpoint:Image = null;
      
      public var img_bg:Image = null;
      
      public var btn_addMoney:Button = null;
      
      public function PlayerHeaderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         viewClassMap["game.ui.playerHeaders.CardInfoRenderUI"] = CardInfoRenderUI;
         viewClassMap["game.ui.playerHeaders.PlayerHeaderWealthRenderSmallUI"] = game.ui.playerHeaders.PlayerHeaderWealthRenderSmallUI;
         viewClassMap["game.ui.playerHeaders.PlayerHeaderWealthRenderUI"] = game.ui.playerHeaders.PlayerHeaderWealthRenderUI;
         viewClassMap["game.ui.playerHeaders.PlayerMilitaryRenderUI"] = game.ui.playerHeaders.PlayerMilitaryRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
