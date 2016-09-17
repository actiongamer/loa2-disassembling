package game.ui.treasures.strens
{
   import morn.customs.components.FadeView;
   import morn.core.components.Box;
   import game.ui.equipGrows.strens.EquipStrenPropRenderS1UI;
   import morn.core.components.ProgressBar;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.ComboBox;
   import game.ui.equipGrows.strens.EquipStrenPropRenderUI;
   import morn.core.components.Button;
   import morn.core.components.CheckBox;
   import game.ui.commons.comps.others.RecycleAlertRenderUI;
   import morn.customs.components.ClipList;
   import morn.customs.components.GCircle;
   import game.ui.treasures.render.TreasureListRenderUI;
   
   public class TreasureStrenPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="558" height="470" mouseEnabled="true" mouseChildren="true">
			  <Image skin="png.uiTreasure.下透明框" x="2" y="331"/>
			  <Box x="20" y="348" var="box_bottom">
			    <Image skin="png.uiTreasure.强化-文字底" x="87"/>
			    <Image skin="png.uiTreasure.强化-文字底" x="296"/>
			    <EquipStrenPropRenderS1 x="295" y="1" var="nextLvl" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"/>
			    <Box x="148" y="49" var="box_progress">
			      <ProgressBar skin="png.a5.comps.progresses.progress_S9" sizeGrid="5,0,12,0" var="progressBar"/>
			      <Label text="1/12212" autoSize="none" x="82" y="-1" color="0xffffff" labelFilterKind="101" align="center" width="164" height="18" var="txt_progress" style="按钮文字"/>
			    </Box>
			    <Label text="Lv.11" autoSize="left" x="82" y="48" labelFilterKind="101" width="41" height="18" var="txt_level" style="随品质变化"/>
			    <Label text="+11" autoSize="none" color="0x38ff1b" stroke="0x0" var="txt_levelPre" labelFilterKind="101" letterSpacing="1" x="115" y="48" width="32" height="18" style="普通绿色"/>
			    <Box x="82" y="19" var="box_property">
			      <List repeatY="1" var="list_prop">
			        <EquipStrenPropRender name="render" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderUI"/>
			      </List>
			      <List x="212" repeatY="1" var="list_propNext" y="1">
			        <EquipStrenPropRenderS1 name="render" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"/>
			      </List>
			    </Box>
			    <Image skin="png.uiTreasure.强化-箭头" x="234" y="2"/>
			    <ComboBox y="94" var="comb_quality" width="135" sizeGrid="4,2,60,2" style="Combobox普通" x="35"/>
			    <EquipStrenPropRender x="82" y="1" var="nowLvl" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderUI"/>
			    <Button label="一键强化" stateNum="1" buttonMode="true" labelFilterKind="黑色1像素描边" x="329" y="75" var="btn_autoStren" style="按钮大黄" labelMargin="20"/>
			    <Image skin="png.uiTreasure.强化" x="331" y="71" mouseChildren="false" mouseEnabled="false"/>
			    <Box x="192" y="75" var="box_stren">
			      <Button label="确定" stateNum="1" buttonMode="true" labelFilterKind="黑色1像素描边" y="1" var="btn_stren" style="按钮大黄" labelMargin="20"/>
			      <Image skin="png.uiTreasure.强化" x="6" mouseChildren="false" mouseEnabled="false"/>
			    </Box>
			    <Box x="192" y="75" var="box_selecte">
			      <Button label="强化" stateNum="1" buttonMode="true" labelFilterKind="黑色1像素描边" y="1" var="btn_autoSelect" style="按钮大绿" labelMargin="20"/>
			      <Image skin="png.uiTreasure.一键选择" x="3" mouseEnabled="false" mouseChildren="false"/>
			    </Box>
			    <Label text="\l30600020" autoSize="none" color="0xf9bd77" align="right" y="71" height="20" style="普通说明" width="147" var="tunShiTxt" buttonMode="false" underline="true" x="0"/>
			    <CheckBox x="149" y="69" selected="false" style="CheckBox普通" var="checkBoxBtn"/>
			  </Box>
			  <RecycleAlertRender x="370" y="20" var="render_recycle" runtime="game.ui.commons.comps.others.RecycleAlertRenderUI"/>
			  <Image skin="png.uiTreasure.强化-名字底" x="195.5" y="-4"/>
			  <Label autoSize="none" x="85" y="11" labelFilterKind="101" width="388" height="22" align="center" var="txt_treasureName" bold="true" text="嗷呜" style="加底标题" size="14" centerX="0"/>
			  <List x="56" y="40" var="list_treasures">
			    <TreasureListRender x="55" y="178" name="item0" runtime="game.ui.treasures.render.TreasureListRenderUI"/>
			    <TreasureListRender x="280" y="177" name="item1" runtime="game.ui.treasures.render.TreasureListRenderUI"/>
			    <TreasureListRender y="88" name="item2" runtime="game.ui.treasures.render.TreasureListRenderUI"/>
			    <TreasureListRender x="336" y="88" name="item3" runtime="game.ui.treasures.render.TreasureListRenderUI"/>
			    <TreasureListRender x="55" name="item4" runtime="game.ui.treasures.render.TreasureListRenderUI"/>
			    <TreasureListRender x="280" name="item5" runtime="game.ui.treasures.render.TreasureListRenderUI"/>
			  </List>
			  <Box x="-9" y="7" var="box_lansuo">
			    <Image skin="png.uiTreasure.强化连锁" y="2" x="20"/>
			    <ClipList value="0" clipWidth="10" align="center" url="png.a5.comps.clipList.clipList_S3" x="52" y="46" var="lianSuoLvl" width="10" height="13"/>
			    <GCircle fillAlpha="0" x="23" width="63" height="74" var="liansuoArea" lineAlpha="0" lineColor="0" buttonMode="true"/>
			    <Label text="\l30100090" autoSize="none" y="60" style="渐变4" width="104" height="20" align="center" size="14"/>
			  </Box>
			</FadeView>;
       
      
      public var box_bottom:Box = null;
      
      public var nextLvl:EquipStrenPropRenderS1UI = null;
      
      public var box_progress:Box = null;
      
      public var progressBar:ProgressBar = null;
      
      public var txt_progress:Label = null;
      
      public var txt_level:Label = null;
      
      public var txt_levelPre:Label = null;
      
      public var box_property:Box = null;
      
      public var list_prop:List = null;
      
      public var list_propNext:List = null;
      
      public var comb_quality:ComboBox = null;
      
      public var nowLvl:EquipStrenPropRenderUI = null;
      
      public var btn_autoStren:Button = null;
      
      public var box_stren:Box = null;
      
      public var btn_stren:Button = null;
      
      public var box_selecte:Box = null;
      
      public var btn_autoSelect:Button = null;
      
      public var tunShiTxt:Label = null;
      
      public var checkBoxBtn:CheckBox = null;
      
      public var render_recycle:RecycleAlertRenderUI = null;
      
      public var txt_treasureName:Label = null;
      
      public var list_treasures:List = null;
      
      public var box_lansuo:Box = null;
      
      public var lianSuoLvl:ClipList = null;
      
      public var liansuoArea:GCircle = null;
      
      public function TreasureStrenPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RecycleAlertRenderUI"] = RecycleAlertRenderUI;
         viewClassMap["game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"] = EquipStrenPropRenderS1UI;
         viewClassMap["game.ui.equipGrows.strens.EquipStrenPropRenderUI"] = EquipStrenPropRenderUI;
         viewClassMap["game.ui.treasures.render.TreasureListRenderUI"] = TreasureListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
