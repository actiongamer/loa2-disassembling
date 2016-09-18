package game.ui.roleTeam.panel
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import game.ui.equipGrows.strens.EquipStrenPropRenderS1UI;
   import game.ui.equipGrows.strens.EquipStrenPropRenderUI;
   import game.ui.roleTeam.render.EquipMasterEquipRenderUI;
   
   public class EquipStrenMasterViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="518" height="327">
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="10" y="234" sizeGrid="10,10,10,10" width="500" height="142"/>
			  <Image skin="png.a5.commonImgs.img_frame" x="9" y="232" width="502" height="146" sizeGrid="20,20,20,20"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="0" sizeGrid="10,10,10,10" width="518" height="225"/>
			  <Image skin="png.uiRoleTeam.箭头" x="235" y="286"/>
			  <List x="8" y="29" repeatX="2" repeatY="2" spaceY="8" spaceX="8" var="list_equip">
			    <EquipMasterEquipRender name="render" runtime="game.ui.roleTeam.render.EquipMasterEquipRenderUI"/>
			  </List>
			  <Label text="全身装备强化18级" autoSize="none" x="5" y="201" style="道具2" width="508" align="center" var="txt_tips" height="22"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="183.5" y="234"/>
			  <Box x="4" y="264" var="box_nowProp">
			    <Label text="全身装备强化18级" autoSize="none" x="36" y="23" style="重要提示橘黄" width="163" height="18" align="center" var="txt_con"/>
			    <Label text="基础属性" autoSize="none" x="14" color="0xf1c373" width="202" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true" var="txt_name"/>
			    <Image skin="png.uiRoleTeam.分割线" y="48" x="14"/>
			    <List y="62" repeatX="2" repeatY="2" spaceY="6" var="list_prop" spaceX="8">
			      <EquipStrenPropRender name="render" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderUI"/>
			    </List>
			  </Box>
			  <Box x="271" y="264" var="box_next">
			    <Label text="全身装备强化18级" autoSize="none" x="53" y="23" style="随品质变化" width="163" height="18" align="center" color="0x00ff00" var="txt_conNext"/>
			    <Image skin="png.uiRoleTeam.分割线" y="48" x="26"/>
			    <List y="61" repeatX="2" repeatY="2" spaceY="6" var="list_nextProp" spaceX="8">
			      <EquipStrenPropRenderS1 name="render" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"/>
			    </List>
			    <Label text="强化连锁19" autoSize="none" x="34" color="0xf1c373" width="200" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true" var="txt_nameNext" style="随品质变化"/>
			  </Box>
			  <Label text="全身装备强化18级全身装备强化18级全身装备强化18级" autoSize="none" x="30" y="297" style="重要提示橘黄" width="180" align="left" var="txt_lvlZeroTip" multiline="true" wordWrap="true" mouseEnabled="false" leading="4" language="en" lgx="30,30" lgy="280,297"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="183.5" y="-2"/>
			  <Label text="强化精度" autoSize="none" y="240" color="0xf1c373" width="464" height="18" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true" var="txt_liansuoName" x="27"/>
			  <Label text="强化精度" autoSize="none" y="5" color="0xf1c373" width="494" height="23" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true" var="txt_progressTitle" x="10"/>
			  <Label text="下级效果暂未开放" autoSize="none" x="323" y="301" style="升级后加底标题" width="163" height="30" align="center" var="txt_maxLvl" size="16"/>
			</FadeView>;
       
      
      public var list_equip:List = null;
      
      public var txt_tips:Label = null;
      
      public var box_nowProp:Box = null;
      
      public var txt_con:Label = null;
      
      public var txt_name:Label = null;
      
      public var list_prop:List = null;
      
      public var box_next:Box = null;
      
      public var txt_conNext:Label = null;
      
      public var list_nextProp:List = null;
      
      public var txt_nameNext:Label = null;
      
      public var txt_lvlZeroTip:Label = null;
      
      public var txt_liansuoName:Label = null;
      
      public var txt_progressTitle:Label = null;
      
      public var txt_maxLvl:Label = null;
      
      public function EquipStrenMasterViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"] = EquipStrenPropRenderS1UI;
         viewClassMap["game.ui.equipGrows.strens.EquipStrenPropRenderUI"] = EquipStrenPropRenderUI;
         viewClassMap["game.ui.roleTeam.render.EquipMasterEquipRenderUI"] = EquipMasterEquipRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
