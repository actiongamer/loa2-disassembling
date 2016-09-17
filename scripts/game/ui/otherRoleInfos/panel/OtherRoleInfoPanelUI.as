package game.ui.otherRoleInfos.panel
{
   import morn.customs.components.FadeView;
   import morn.customs.components.WealthList;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Box;
   import game.ui.commons.icons.PlayerTitleRenderUI;
   import morn.core.components.Image;
   import game.ui.otherRoleInfos.render.OtherRoleEquipRenderUI;
   import game.ui.roleInfos.equipPanels.BasePropRenderUI;
   import game.ui.roleInfos.equipPanels.YuanFenRenderUI;
   import game.ui.roleTeam.render.RoleSkillRenderUI;
   
   public class OtherRoleInfoPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="600" height="400">
			  <Image skin="png.uiRoleTeam.右框" x="528" y="-21" sizeGrid="20,20,20,20" width="177" height="467"/>
			  <Image skin="png.uiRoleTeam.花纹" x="590" y="-30"/>
			  <Image skin="png.uiRoleTeam.黄底" x="532.5" y="63"/>
			  <Image skin="png.uiRoleTeam.黄底" x="535.5" y="203"/>
			  <Image skin="png.uiRoleTeam.红底" x="536" y="289"/>
			  <WealthList y="67" repeatX="2" repeatY="2" spaceX="240" spaceY="52" var="list_equip" x="110">
			    <OtherRoleEquipRender x="0" y="0" name="render" runtime="game.ui.otherRoleInfos.render.OtherRoleEquipRenderUI"/>
			  </WealthList>
			  <WealthList y="286" repeatX="2" repeatY="1" spaceX="240" spaceY="4" var="list_treasure" x="110">
			    <OtherRoleEquipRender x="0" y="0" name="render" runtime="game.ui.otherRoleInfos.render.OtherRoleEquipRenderUI"/>
			  </WealthList>
			  <Button x="316" style="按钮大黄" y="407" var="btn_addFriend" label="加好友" labelMargin="10"/>
			  <Button x="145" style="按钮大绿" y="408" var="btn_heroCompare" label="对比" labelMargin="10"/>
			  <List x="581" y="98" repeatX="1" repeatY="5" spaceX="-4" spaceY="-1" var="list_propBase" language="en" lgx="561,581" lgy="98,98">
			    <BasePropRender name="render" runtime="game.ui.roleInfos.equipPanels.BasePropRenderUI"/>
			  </List>
			  <Label text="\l30100041\l" autoSize="none" x="539" y="69" color="0xf1c373" width="150" height="18" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true"/>
			  <Label text="\l30100042\l" autoSize="none" x="542" y="210" color="0xf1c373" width="150" height="18" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true"/>
			  <Label text="\l30100043\l" autoSize="none" x="578" y="295" color="0xfc6b0a" width="80" height="18" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true"/>
			  <Box x="557" y="244" width="120" var="box_skill">
			    <List spaceX="12" repeatX="3" var="list_skill">
			      <RoleSkillRender name="render" runtime="game.ui.roleTeam.render.RoleSkillRenderUI"/>
			    </List>
			  </Box>
			  <Box x="583" y="321" language="en" lgx="563,583" lgy="321,321">
			    <Box var="box_yuanfen" mouseChildren="false">
			      <List repeatX="1" repeatY="6" spaceX="-3" var="list_YuanFen" mouseChildren="false" mouseEnabled="false">
			        <YuanFenRender name="render" runtime="game.ui.roleInfos.equipPanels.YuanFenRenderUI"/>
			      </List>
			    </Box>
			  </Box>
			  <PlayerTitleRender x="150" y="0" var="playerTitleRenderUI" runtime="game.ui.commons.icons.PlayerTitleRenderUI"/>
			  <Image skin="png.uiRoleTeam.img_compare" x="146" y="406" var="img_compare"/>
			  <Image skin="png.uiRoleTeam.img_addFriend" x="321" y="406" var="img_addFriend"/>
			</FadeView>;
       
      
      public var list_equip:WealthList = null;
      
      public var list_treasure:WealthList = null;
      
      public var btn_addFriend:Button = null;
      
      public var btn_heroCompare:Button = null;
      
      public var list_propBase:List = null;
      
      public var box_skill:Box = null;
      
      public var list_skill:List = null;
      
      public var box_yuanfen:Box = null;
      
      public var list_YuanFen:List = null;
      
      public var playerTitleRenderUI:PlayerTitleRenderUI = null;
      
      public var img_compare:Image = null;
      
      public var img_addFriend:Image = null;
      
      public function OtherRoleInfoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.PlayerTitleRenderUI"] = PlayerTitleRenderUI;
         viewClassMap["game.ui.otherRoleInfos.render.OtherRoleEquipRenderUI"] = OtherRoleEquipRenderUI;
         viewClassMap["game.ui.roleInfos.equipPanels.BasePropRenderUI"] = BasePropRenderUI;
         viewClassMap["game.ui.roleInfos.equipPanels.YuanFenRenderUI"] = YuanFenRenderUI;
         viewClassMap["game.ui.roleTeam.render.RoleSkillRenderUI"] = RoleSkillRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
