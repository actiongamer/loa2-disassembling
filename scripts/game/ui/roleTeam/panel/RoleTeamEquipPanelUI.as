package game.ui.roleTeam.panel
{
   import morn.customs.components.FadeView;
   import morn.customs.components.WealthList;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import game.ui.commons.icons.PlayerTitleRenderUI;
   import morn.core.components.Label;
   import game.ui.roleInfos.equipPanels.BasePropRenderUI;
   import game.ui.roleInfos.equipPanels.RoleEquipRenderUI;
   import game.ui.roleInfos.equipPanels.YuanFenRenderUI;
   import game.ui.roleTeam.render.RoleSkillRenderUI;
   
   public class RoleTeamEquipPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView name="render" width="600" height="400">
			  <Image skin="png.a5.bgs.panelBgs.img_baseBg" x="516" y="-31" sizeGrid="40,24,40,24" width="180" height="470"/>
			  <Image skin="png.uiRoleTeam.黄光" x="531.5" y="53"/>
			  <Image skin="png.uiRoleTeam.黄光" x="531.5" y="193"/>
			  <Image skin="png.uiRoleTeam.红光" x="531.5" y="279"/>
			  <WealthList y="54" repeatX="2" repeatY="2" spaceX="245" spaceY="52" var="list_equip" x="100">
			    <RoleEquipRender name="render" runtime="game.ui.roleInfos.equipPanels.RoleEquipRenderUI"/>
			  </WealthList>
			  <WealthList y="276" repeatX="2" repeatY="1" spaceX="245" spaceY="4" var="list_treasure" x="100">
			    <RoleEquipRender name="render" runtime="game.ui.roleInfos.equipPanels.RoleEquipRenderUI"/>
			  </WealthList>
			  <Button label="时 装" x="306" style="按钮大黄" y="397" var="btn_left" labelMargin="20"/>
			  <Button label="    培 养" x="135" style="按钮大黄" y="398" var="btn_right" labelMargin="35"/>
			  <List x="559" y="88" repeatX="1" repeatY="5" spaceX="-4" spaceY="-1" var="list_propBase" language="en" lgx="550,559" lgy="88,88">
			    <BasePropRender name="render" runtime="game.ui.roleInfos.equipPanels.BasePropRenderUI"/>
			  </List>
			  <Label text="\l30100041\l" autoSize="none" x="568" y="59" width="80" height="18" align="center" underline="false" selectable="false" buttonMode="true" bold="true" style="加底标题"/>
			  <Label text="\l30100042\l" autoSize="none" x="568" y="199" width="80" height="18" align="center" underline="false" selectable="false" buttonMode="true" style="加底标题"/>
			  <Label text="\l30100043\l" autoSize="none" x="568" y="285" width="80" height="18" align="center" underline="false" selectable="false" buttonMode="true" style="升级后加底标题"/>
			  <Image skin="png.uiRoleTeam.1培养" x="137" y="391" mouseEnabled="false" var="img_cultivate"/>
			  <Image skin="png.uiRoleTeam.1幻化" x="308" y="391" mouseEnabled="false" var="img_fashion"/>
			  <Box x="547" y="234" width="120" var="box_skill">
			    <List spaceX="12" repeatX="3" var="list_skill">
			      <RoleSkillRender name="render" runtime="game.ui.roleTeam.render.RoleSkillRenderUI"/>
			    </List>
			  </Box>
			  <Box x="298" y="323" var="box_qianghuadashi" lgx="323,323,323,323,323,323,323,312" language="ru" lgy="323,323,323,323,323,323,323,323">
			    <Button skin="png.a5.commonImgs.btn_strengthMaster" x="20" stateNum="1" var="btn_qhds"/>
			    <Box y="34" mouseChildren="false" mouseEnabled="false" width="90">
			      <Label text="\l9030811" autoSize="none" width="80" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="false" style="随品质变化" multiline="true" wordWrap="true"/>
			    </Box>
			  </Box>
			  <Box x="566" y="311" width="75" height="108" language="en" lgx="550,566" lgy="311,311">
			    <Box var="box_yuanfen" mouseChildren="false">
			      <List repeatX="1" repeatY="6" spaceX="-3" var="list_YuanFen" mouseChildren="false" mouseEnabled="false">
			        <YuanFenRender name="render" runtime="game.ui.roleInfos.equipPanels.YuanFenRenderUI"/>
			      </List>
			    </Box>
			  </Box>
			  <PlayerTitleRender x="140" y="-38" var="playerTitleRenderUI" runtime="game.ui.commons.icons.PlayerTitleRenderUI"/>
			  <Box x="151" y="320" var="box_skin" lgx="151,151,151,151,151,151,151,165" lgy="320,320,320,320,320,320,320,320" language="ru">
			    <Button stateNum="1" buttonMode="true" x="33" var="btn_skin" labelBold="false" style="按钮小黄" labelMargin="0,30,0,0" skin="png.uiRoleTeam.img_bookicon" scale="0.5" width="100" height="100"/>
			    <Label text="\l999900504" y="35" width="115" height="18" var="txt_get" style="普通说明" align="center" buttonMode="true" mouseChildren="false" mouseEnabled="false"/>
			  </Box>
			  <Box x="158" y="323" var="box_skillBtn" lgx="158,158,158,158,158,158,158,170" lgy="323,323,323,323,323,323,323,323" language="ru">
			    <Button skin="png.a5.commonImgs.btn_skill" x="15" var="btn_skill" stateNum="1"/>
			    <Label text="\l30300017" autoSize="none" width="80" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="false" style="随品质变化" y="34" mouseEnabled="false" mouseChildren="false" multiline="true" wordWrap="true"/>
			  </Box>
			  <Box x="242" y="325">
			    <Button skin="png.uiRoleTeam.btn_recommand" x="16" stateNum="1" labelMargin="0,20,0,0" var="btn_recommand" scale="0.75"/>
			    <Label text="阵容推荐" autoSize="none" width="80" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="false" style="随品质变化" y="33" mouseChildren="false" mouseEnabled="false" multiline="true" wordWrap="true"/>
			  </Box>
			  <Box x="0" y="-33" var="box_sz" mouseEnabled="true" mouseChildren="true">
			    <GRect fillAlpha="0" radius="0,0,0,0" lineAlpha="0" width="697" height="470"/>
			    <Button skin="png.uiRoleTeam.btn_shangzheng" x="212" stateNum="1" y="167" var="btn_sz"/>
			    <Box y="227" mouseChildren="false" mouseEnabled="false" x="83">
			      <Image skin="png.uiRoleTeam.黑色透明底"/>
			      <Label text="\l30100048\l" autoSize="none" y="7" color="0xff8400" height="25" x="99" width="182" align="center" size="14" style="下划线黄色"/>
			    </Box>
			  </Box>
			</FadeView>;
       
      
      public var list_equip:WealthList = null;
      
      public var list_treasure:WealthList = null;
      
      public var btn_left:Button = null;
      
      public var btn_right:Button = null;
      
      public var list_propBase:List = null;
      
      public var img_cultivate:Image = null;
      
      public var img_fashion:Image = null;
      
      public var box_skill:Box = null;
      
      public var list_skill:List = null;
      
      public var box_qianghuadashi:Box = null;
      
      public var btn_qhds:Button = null;
      
      public var box_yuanfen:Box = null;
      
      public var list_YuanFen:List = null;
      
      public var playerTitleRenderUI:PlayerTitleRenderUI = null;
      
      public var box_skin:Box = null;
      
      public var btn_skin:Button = null;
      
      public var txt_get:Label = null;
      
      public var box_skillBtn:Box = null;
      
      public var btn_skill:Button = null;
      
      public var btn_recommand:Button = null;
      
      public var box_sz:Box = null;
      
      public var btn_sz:Button = null;
      
      public function RoleTeamEquipPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.PlayerTitleRenderUI"] = PlayerTitleRenderUI;
         viewClassMap["game.ui.roleInfos.equipPanels.BasePropRenderUI"] = BasePropRenderUI;
         viewClassMap["game.ui.roleInfos.equipPanels.RoleEquipRenderUI"] = RoleEquipRenderUI;
         viewClassMap["game.ui.roleInfos.equipPanels.YuanFenRenderUI"] = YuanFenRenderUI;
         viewClassMap["game.ui.roleTeam.render.RoleSkillRenderUI"] = RoleSkillRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
