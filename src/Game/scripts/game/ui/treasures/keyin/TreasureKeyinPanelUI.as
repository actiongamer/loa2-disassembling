package game.ui.treasures.keyin
{
   import morn.customs.components.FadeView;
   import game.ui.commons.comps.others.RecycleAlertRenderUI;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.ProgressBar;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderSize24TxtUI;
   import morn.core.components.Image;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   import game.ui.equipGrows.strens.EquipStrenPropRenderS1UI;
   import game.ui.equipGrows.strens.EquipStrenPropRenderUI;
   
   public class TreasureKeyinPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="558" height="470" mouseEnabled="true" mouseChildren="true">
			  <RecycleAlertRender x="370" y="20" var="render_recycle" runtime="game.ui.commons.comps.others.RecycleAlertRenderUI"/>
			  <Image skin="png.uiTreasure.强化-名字底" x="195.5" y="-4"/>
			  <Label autoSize="none" x="85" y="11" labelFilterKind="101" width="388" height="22" align="center" var="txt_treasureName" bold="true" text="嗷呜" style="加底标题" size="14" centerX="0"/>
			  <Box x="2" y="178" var="box_operation">
			    <Image skin="png.uiTreasure.下透明框" y="113"/>
			    <Box x="104" y="145" var="box_bottom">
			      <Box var="box_progress" y="47" x="28">
			        <ProgressBar skin="png.a5.comps.progresses.progress_S9" sizeGrid="5,0,12,0" var="progressBar"/>
			        <Label text="1/12212" autoSize="none" x="82" y="-1" color="0xffffff" labelFilterKind="101" align="center" width="164" height="18" var="txt_progress" style="按钮文字"/>
			      </Box>
			      <Box x="57" y="98">
			        <Button label="\l30609007" stateNum="1" buttonMode="true" labelFilterKind="黑色1像素描边" y="1" var="btn_keyin" style="按钮大绿" labelMargin="20"/>
			        <Image skin="png.uiTreasure.强化" x="3" mouseEnabled="false" mouseChildren="false"/>
			      </Box>
			      <Box x="194" y="98">
			        <Button label="\l30609008" stateNum="1" buttonMode="true" labelFilterKind="黑色1像素描边" var="btn_autoKeyin" style="按钮大黄" labelMargin="20"/>
			        <Image skin="png.uiTreasure.强化" x="3" y="1" mouseChildren="false" mouseEnabled="false"/>
			      </Box>
			      <List repeatX="10" var="list_stars" spaceX="-6">
			        <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			      </List>
			      <Box x="79" y="68" var="box_cost">
			        <Label autoSize="none" y="4" labelFilterKind="101" width="157" height="22" align="left" text="\l30609005" style="普通说明"/>
			        <Label autoSize="none" x="122" y="4" labelFilterKind="101" width="157" height="22" align="left" text="拥有" style="普通绿色" var="txt_has"/>
			        <WealthRenderSize24Txt x="72" var="costRender" y="0" runtime="game.ui.commons.icons.WealthRenderSize24TxtUI"/>
			      </Box>
			      <Label autoSize="none" x="44" y="69" labelFilterKind="101" width="298" height="22" align="center" text="\l30609016" style="普通绿色" centerX="0" var="txt_maxStar" size="14"/>
			    </Box>
			    <Box x="1" y="29" var="box_property" width="528" height="36">
			      <List repeatY="2" var="list_prop" x="20" y="0">
			        <EquipStrenPropRender name="render" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderUI"/>
			      </List>
			      <List x="381" y="0" repeatY="2" var="list_propNext" width="92" height="36">
			        <EquipStrenPropRenderS1 name="render" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"/>
			      </List>
			    </Box>
			    <Image skin="png.a5.commonImgs.角色-黄色" x="30"/>
			    <Image skin="png.a5.commonImgs.角色-红底" x="378" y="0" var="bgNextProp"/>
			    <Label text="本阶属性" autoSize="none" x="26" y="2" color="0xf1c373" width="150" height="18" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true"/>
			    <Label text="下阶属性" autoSize="none" x="382" y="2" color="0xfc6b0a" width="150" height="18" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true" var="txtStaticNextProp"/>
			  </Box>
			  <Box x="73" y="177" var="box_notavail">
			    <Image skin="png.uiEquipGrow.upstar.装备-升星-提示文字bj" x="74"/>
			    <Label text="\l30609013" autoSize="none" y="4" style="普通说明" size="17" width="523" height="25" align="center" color="0xff3000" var="label_hint1" x="-47.5"/>
			  </Box>
			</FadeView>;
       
      
      public var render_recycle:RecycleAlertRenderUI = null;
      
      public var txt_treasureName:Label = null;
      
      public var box_operation:Box = null;
      
      public var box_bottom:Box = null;
      
      public var box_progress:Box = null;
      
      public var progressBar:ProgressBar = null;
      
      public var txt_progress:Label = null;
      
      public var btn_keyin:Button = null;
      
      public var btn_autoKeyin:Button = null;
      
      public var list_stars:List = null;
      
      public var box_cost:Box = null;
      
      public var txt_has:Label = null;
      
      public var costRender:WealthRenderSize24TxtUI = null;
      
      public var txt_maxStar:Label = null;
      
      public var box_property:Box = null;
      
      public var list_prop:List = null;
      
      public var list_propNext:List = null;
      
      public var bgNextProp:Image = null;
      
      public var txtStaticNextProp:Label = null;
      
      public var box_notavail:Box = null;
      
      public var label_hint1:Label = null;
      
      public function TreasureKeyinPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.EquipStarRenderUI"] = EquipStarRenderUI;
         viewClassMap["game.ui.commons.comps.others.RecycleAlertRenderUI"] = RecycleAlertRenderUI;
         viewClassMap["game.ui.commons.icons.WealthRenderSize24TxtUI"] = WealthRenderSize24TxtUI;
         viewClassMap["game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"] = EquipStrenPropRenderS1UI;
         viewClassMap["game.ui.equipGrows.strens.EquipStrenPropRenderUI"] = EquipStrenPropRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
