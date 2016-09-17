package game.ui.equipGrows.strens
{
   import morn.customs.components.PanelView;
   import game.ui.roleInfos.RoleInfoCostRenderUI;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.customs.components.ClipList;
   import morn.customs.components.GCircle;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class EquipStrenPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="558" height="466">
			  <Image skin="png.a5.commonImgs.分割透明底" x="58" y="340"/>
			  <RoleInfoCostRender x="339" var="costRenderer" y="432" runtime="game.ui.roleInfos.RoleInfoCostRenderUI"/>
			  <Box x="98" y="352" var="box_crt">
			    <List y="16" var="list_prop" repeatY="1">
			      <EquipStrenPropRender name="render" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderUI"/>
			    </List>
			    <EquipStrenPropRender var="nowLvlRender" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderUI"/>
			  </Box>
			  <Image skin="png.a5.commonImgs.img_arrowRight2" x="251" y="346"/>
			  <Box x="323" y="352" var="box_next" width="95" height="32">
			    <List y="16" var="list_AddProp" repeatY="1">
			      <EquipStrenPropRenderS1 name="render" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"/>
			    </List>
			    <EquipStrenPropRenderS1 var="newLvlRender" y="0" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"/>
			  </Box>
			  <Box x="25" y="13" var="box_lansuo" buttonMode="true">
			    <Image skin="png.uiEquipGrow.new.强化连锁" y="2"/>
			    <ClipList value="0" clipWidth="10" align="center" url="png.a5.comps.clipList.clipList_S3" x="32" y="46" var="lianSuoLvl" width="10" height="13"/>
			    <GCircle fillAlpha="0" x="3" width="58" height="74" var="liansuoArea" lineAlpha="0" lineColor="0" y="0"/>
			  </Box>
			  <Box x="99" y="387" var="box_btn_1">
			    <Button label="    强化5次" buttonMode="true" var="btn_strenFive" x="12" y="8" style="按钮大绿" labelMargin="30"/>
			    <Image skin="png.uiEquipGrow.强化5次" mouseEnabled="false" var="img_btn1"/>
			  </Box>
			  <Box x="325" y="387" var="box_btn_2" mouseChildren="true">
			    <Button label="   强化1次" stateNum="1" buttonMode="true" var="btn_strenOnce" style="按钮大黄" x="12" y="8" labelMargin="30"/>
			    <Image skin="png.uiEquipGrow.强化" mouseEnabled="false" var="img_btn2" x="0" y="0"/>
			  </Box>
			  <Label text="pageBarS2" autoSize="none" x="144" y="321" style="重要提示绿" var="label_perc" language="en" lgx="80,144" lgy="321,321"/>
			  <Box x="451" y="351" var="box_upArrow">
			    <Image skin="png.uiEquipGrow.new.强化-绿箭头"/>
			    <Image skin="png.uiEquipGrow.new.强化-绿箭头" y="22"/>
			  </Box>
			  <Label text="\l30100090" autoSize="none" x="-3" y="73" style="渐变4" width="120" height="20" align="center" size="14"/>
			  <Box x="400" y="40" var="box_attr">
			    <Image skin="png.a5.commonImgs.img_yellow"/>
			    <Label text="pageBarS2" autoSize="none" x="0" y="4" style="普通说明" width="150" height="20" align="center" var="label_title"/>
			    <Label text="精炼达到180级时可激活：" autoSize="none" x="6" y="26" style="普通说明" width="142" height="20" var="label_require" color="0xf9bd77"/>
			    <Label text="【神兵锋锐】攻击+1000 " autoSize="none" x="6" y="49" style="普通说明" width="142" var="label_attr" color="0xf9bd77" align="left" multiline="true" wordWrap="true"/>
			  </Box>
			  <Image skin="png.uiEquipGrow.crit" x="280" y="121" var="lCritImg" mouseChildren="false" mouseEnabled="false" anchorX="0.5" anchorY="0.5"/>
			</PanelView>;
       
      
      public var costRenderer:RoleInfoCostRenderUI = null;
      
      public var box_crt:Box = null;
      
      public var list_prop:List = null;
      
      public var nowLvlRender:game.ui.equipGrows.strens.EquipStrenPropRenderUI = null;
      
      public var box_next:Box = null;
      
      public var list_AddProp:List = null;
      
      public var newLvlRender:game.ui.equipGrows.strens.EquipStrenPropRenderS1UI = null;
      
      public var box_lansuo:Box = null;
      
      public var lianSuoLvl:ClipList = null;
      
      public var liansuoArea:GCircle = null;
      
      public var box_btn_1:Box = null;
      
      public var btn_strenFive:Button = null;
      
      public var img_btn1:Image = null;
      
      public var box_btn_2:Box = null;
      
      public var btn_strenOnce:Button = null;
      
      public var img_btn2:Image = null;
      
      public var label_perc:Label = null;
      
      public var box_upArrow:Box = null;
      
      public var box_attr:Box = null;
      
      public var label_title:Label = null;
      
      public var label_require:Label = null;
      
      public var label_attr:Label = null;
      
      public var lCritImg:Image = null;
      
      public function EquipStrenPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"] = game.ui.equipGrows.strens.EquipStrenPropRenderS1UI;
         viewClassMap["game.ui.equipGrows.strens.EquipStrenPropRenderUI"] = game.ui.equipGrows.strens.EquipStrenPropRenderUI;
         viewClassMap["game.ui.roleInfos.RoleInfoCostRenderUI"] = RoleInfoCostRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
