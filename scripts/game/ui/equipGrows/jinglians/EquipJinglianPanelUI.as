package game.ui.equipGrows.jinglians
{
   import morn.customs.components.PanelView;
   import morn.core.components.Box;
   import morn.customs.components.ClipList;
   import morn.customs.components.GCircle;
   import morn.core.components.List;
   import morn.core.components.ProgressBar;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import game.ui.horseModules.horseMaster.HorseMasterHadRenderUI;
   import game.ui.equipGrows.strens.EquipStrenPropRenderS1UI;
   import game.ui.equipGrows.strens.EquipStrenPropRenderUI;
   
   public class EquipJinglianPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="558" height="466">
			  <Box x="25" y="14" var="box_lansuo" buttonMode="true">
			    <Image skin="png.uiEquipGrow.new.精炼连锁" y="1"/>
			    <ClipList value="0" clipWidth="10" align="center" url="png.a5.comps.clipList.clipList_S3" x="32" y="45" var="lianSuoLvl" width="10" height="13"/>
			    <GCircle fillAlpha="0" x="3" width="59" height="62" var="liansuoArea" lineAlpha="0" lineColor="0"/>
			  </Box>
			  <Box x="-15" y="199" var="box_property" width="528" height="36">
			    <List repeatY="2" var="list_prop" x="20" y="0">
			      <EquipStrenPropRender name="render" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderUI"/>
			    </List>
			    <List x="416" y="0" repeatY="2" var="list_propNext" width="92" height="36">
			      <EquipStrenPropRenderS1 name="render" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"/>
			    </List>
			  </Box>
			  <Image skin="png.a5.commonImgs.角色-黄色" x="11" y="168"/>
			  <Image skin="png.a5.commonImgs.角色-红底" x="390" y="168"/>
			  <Label text="本阶属性" autoSize="none" x="10" y="172" color="0xf1c373" width="150" height="18" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true"/>
			  <Label text="下阶属性" autoSize="none" x="389" y="172" color="0xfc6b0a" width="150" height="18" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true"/>
			  <Box x="44" y="327">
			    <Image skin="png.a5.commonImgs.分割透明底"/>
			    <Box x="160" y="13" var="box_progress">
			      <ProgressBar skin="png.a5.comps.progresses.progress_S9" sizeGrid="5,0,12,0" var="progressBar" x="-0.5"/>
			      <Label text="1/12212" autoSize="none" x="46.5" y="-1" color="0xffffff" align="center" width="209" height="18" var="txt_progress" isHtml="true" style="按钮文字"/>
			    </Box>
			    <Label text="精炼等级：" autoSize="left" x="36" y="10" color="0xeac472" width="60" height="18"/>
			    <Label text="8 阶" autoSize="left" x="97" y="10" color="0xeac472" width="53" height="18" var="txt_level"/>
			    <Box x="73" y="39" var="box_box0">
			      <Box y="2" var="box_btn">
			        <Button label="    精 炼" stateNum="1" buttonMode="true" var="btn_jinlian" style="按钮大绿" x="9" y="9" labelMargin="30"/>
			        <Image skin="png.uiEquipGrow.精炼" mouseEnabled="false" var="img_btn"/>
			      </Box>
			      <Box x="179" var="box_btn2">
			        <Button label="   一 键 精 炼 " stateNum="1" buttonMode="true" var="btn_jinlian2" style="按钮大黄" x="9" y="9" labelMargin="30"/>
			        <Image skin="png.uiEquipGrow.精炼" mouseEnabled="false" var="img_btn2"/>
			      </Box>
			    </Box>
			    <Label text="+1" autoSize="none" color="0x38ff1b" stroke="0x0" var="txt_levelPre" letterSpacing="1" x="138" y="10" width="22" height="18"/>
			    <HorseMasterHadRender x="136" y="88" var="renderHad" runtime="game.ui.horseModules.horseMaster.HorseMasterHadRenderUI"/>
			  </Box>
			  <Box x="534" y="198" var="box_upArrow">
			    <Image skin="png.uiEquipGrow.new.强化-绿箭头"/>
			    <Image skin="png.uiEquipGrow.new.强化-绿箭头" y="22"/>
			  </Box>
			  <Label text="\l30100091" autoSize="none" x="5" y="73" style="渐变4" width="104" height="20" align="center" size="14"/>
			  <Label text="\l30100091" autoSize="none" x="11" y="89" width="104" height="20" align="left" var="label_chainhint" visible="false"/>
			  <Box x="400" y="40" var="box_attr" lgx="400,400,400,400,400,400,400,400" lgy="40,40,40,40,40,40,40,10" language="ru">
			    <Image skin="png.a5.commonImgs.img_yellow" x="0"/>
			    <Label text="pageBarS2" autoSize="none" x="1" y="4" style="普通说明" width="150" height="20" align="center" var="label_title"/>
			    <Label text="精炼达到180级时可激活：" autoSize="none" x="6" y="26" style="普通说明" width="142" height="20" var="label_require" color="0xf9bd77"/>
			    <Label text="【神兵锋锐】攻击+1000 " autoSize="none" x="6" y="49" style="普通说明" width="142" var="label_attr" color="0xf9bd77" align="left" multiline="true" wordWrap="true"/>
			  </Box>
			</PanelView>;
       
      
      public var box_lansuo:Box = null;
      
      public var lianSuoLvl:ClipList = null;
      
      public var liansuoArea:GCircle = null;
      
      public var box_property:Box = null;
      
      public var list_prop:List = null;
      
      public var list_propNext:List = null;
      
      public var box_progress:Box = null;
      
      public var progressBar:ProgressBar = null;
      
      public var txt_progress:Label = null;
      
      public var txt_level:Label = null;
      
      public var box_box0:Box = null;
      
      public var box_btn:Box = null;
      
      public var btn_jinlian:Button = null;
      
      public var img_btn:Image = null;
      
      public var box_btn2:Box = null;
      
      public var btn_jinlian2:Button = null;
      
      public var img_btn2:Image = null;
      
      public var txt_levelPre:Label = null;
      
      public var renderHad:HorseMasterHadRenderUI = null;
      
      public var box_upArrow:Box = null;
      
      public var label_chainhint:Label = null;
      
      public var box_attr:Box = null;
      
      public var label_title:Label = null;
      
      public var label_require:Label = null;
      
      public var label_attr:Label = null;
      
      public function EquipJinglianPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"] = EquipStrenPropRenderS1UI;
         viewClassMap["game.ui.equipGrows.strens.EquipStrenPropRenderUI"] = EquipStrenPropRenderUI;
         viewClassMap["game.ui.horseModules.horseMaster.HorseMasterHadRenderUI"] = HorseMasterHadRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
