package game.ui.roleInfos.equipPanels
{
   import morn.customs.components.PanelView;
   import morn.customs.components.WealthList;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.LinkButton;
   import morn.core.components.Label;
   import morn.core.components.Box;
   
   public class RoleEquipPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="550" height="460" var="subPanel" alpha="1">
			  <Image skin="png.a5.bgs.panelBgs.img_propBg" x="16" y="357"/>
			  <Image skin="png.uiRoleInfo.透明底" x="45" y="384"/>
			  <WealthList y="47" repeatX="2" repeatY="2" spaceX="248" spaceY="30" var="list_equip" x="94">
			    <RoleEquipRender name="render" runtime="game.ui.roleInfos.equipPanels.RoleEquipRenderUI"/>
			  </WealthList>
			  <WealthList y="219" repeatX="2" repeatY="1" spaceX="248" spaceY="4" var="list_treasure" x="94">
			    <RoleEquipRender name="render" runtime="game.ui.roleInfos.equipPanels.RoleEquipRenderUI"/>
			  </WealthList>
			  <Image skin="png.a5.commonImgs.img_NameBg" x="185" y="11" var="img_phaseLevelName"/>
			  <Image skin="png.uiRoleInfo.角色-黄色" x="88" y="360"/>
			  <Image skin="png.uiRoleInfo.角色-红底" x="298" y="360"/>
			  <Label text="基础属性" autoSize="none" x="125" y="365" color="0xf1c373" width="80" height="18" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true"/>
			  <Label text="缘  分" autoSize="none" x="333" y="365" color="0xfc6b0a" width="80" height="18" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true"/>
			  <List x="90" y="390" repeatX="2" repeatY="3" spaceX="-4" spaceY="-1" var="list_propBase">
			    <BasePropRender name="render" runtime="game.ui.roleInfos.equipPanels.BasePropRenderUI"/>
			  </List>
			  <Button stateNum="3" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.uiRoleInfo.btn_equip" x="141" y="299" var="btn_equip"/>
			  <Button stateNum="3" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.uiRoleInfo.btn_skill" x="350" y="299" var="btn_skill"/>
			  <LinkButton label="详细属性  " x="413" y="338" stateNum="3" labelColors="0x9bfe4b,0xFFFF00,0xFFFF00" labelSize="12" var="linkBtn_detail"/>
			  <BasePropRender x="90" y="390" var="lvlRender" runtime="game.ui.roleInfos.equipPanels.BasePropRenderUI"/>
			  <Label text="长江一号" autoSize="none" y="15" color="0xff8400" height="18" var="txt_Name" x="177" width="182" align="center"/>
			  <Box x="270" y="384" var="box_yuanfen">
			    <Image skin="png.uiRoleInfo.透明底"/>
			    <List x="36" y="9" repeatX="2" repeatY="3" spaceX="-3" var="list_YuanFen" mouseChildren="false" mouseEnabled="false">
			      <YuanFenRender name="render" runtime="game.ui.roleInfos.equipPanels.YuanFenRenderUI"/>
			    </List>
			  </Box>
			  <Image x="168" y="92" var="img_type"/>
			  <Image skin="png.uiRoleInfo.珍宝" x="159" y="38" var="img_group"/>
			</PanelView>;
       
      
      public var subPanel:PanelView = null;
      
      public var list_equip:WealthList = null;
      
      public var list_treasure:WealthList = null;
      
      public var img_phaseLevelName:Image = null;
      
      public var list_propBase:List = null;
      
      public var btn_equip:Button = null;
      
      public var btn_skill:Button = null;
      
      public var linkBtn_detail:LinkButton = null;
      
      public var lvlRender:game.ui.roleInfos.equipPanels.BasePropRenderUI = null;
      
      public var txt_Name:Label = null;
      
      public var box_yuanfen:Box = null;
      
      public var list_YuanFen:List = null;
      
      public var img_type:Image = null;
      
      public var img_group:Image = null;
      
      public function RoleEquipPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleInfos.equipPanels.BasePropRenderUI"] = game.ui.roleInfos.equipPanels.BasePropRenderUI;
         viewClassMap["game.ui.roleInfos.equipPanels.RoleEquipRenderUI"] = RoleEquipRenderUI;
         viewClassMap["game.ui.roleInfos.equipPanels.YuanFenRenderUI"] = YuanFenRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
