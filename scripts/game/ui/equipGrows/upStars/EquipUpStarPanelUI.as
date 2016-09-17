package game.ui.equipGrows.upStars
{
   import morn.customs.components.PanelView;
   import morn.core.components.Button;
   import morn.customs.components.ClipList;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.RadioGroup;
   import game.ui.commons.icons.WealthRenderS16UI;
   import morn.core.components.List;
   import morn.core.components.ProgressBar;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   import game.ui.equipGrows.strens.EquipStrenPropRenderS1UI;
   import game.ui.equipGrows.strens.EquipStrenPropRenderUI;
   
   public class EquipUpStarPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="558" height="466">
			  <Button skin="png.uiEquipGrow.upstar.btn_mannal" x="16" y="12" stateNum="1" labelMargin="0,20,0,0" var="btn_mannal"/>
			  <ClipList value="0" clipWidth="10" align="center" url="png.a5.comps.clipList.clipList_S3" x="37" y="35" var="lianSuoLvl" width="10" height="13" visible="false"/>
			  <Box x="15" y="131" var="box_avail">
			    <Box x="73" y="79" var="box_notavail">
			      <Image skin="png.uiEquipGrow.upstar.装备-升星-提示文字bj" x="49"/>
			      <Label text="只有橙色及以上装备可以升级" autoSize="none" y="4" style="普通说明" size="17" width="379" height="25" align="center" color="0xff3000" var="label_hint1"/>
			    </Box>
			    <RadioGroup x="76" y="299" var="box_redNeed">
			      <CheckBox y="2" selected="true" style="CheckBox普通" name="item0" x="16"/>
			      <WealthRenderS16 x="49" var="needRes1" y="1" width="66.8" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			      <CheckBox x="137" y="1" selected="true" style="CheckBox普通" name="item1"/>
			      <WealthRenderS16 x="170" var="needRes2" width="66.8" y="0" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			      <CheckBox x="259" y="1" selected="true" style="CheckBox普通" name="item2"/>
			      <WealthRenderS16 x="292" var="needRes3" width="66.8" y="0" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			    </RadioGroup>
			    <Image skin="png.a5.commonImgs.分割透明底" y="170" x="19"/>
			    <Box y="30" var="box_property" width="528" height="36">
			      <List repeatY="2" var="list_prop" x="23" y="-3" width="92" height="36">
			        <EquipStrenPropRender name="render" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderUI"/>
			      </List>
			      <List x="357" y="-3" repeatY="2" var="list_propNext" width="92" height="36" spaceY="30">
			        <EquipStrenPropRenderS1 name="render" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"/>
			      </List>
			      <Box x="319" y="26" var="box_nextExTitle">
			        <Image skin="png.a5.commonImgs.角色-红底" x="37"/>
			        <Label text="激活星级祝福" autoSize="none" y="3" style="普通说明" width="222" height="20" var="label_nextExtraProp" align="center" bold="true" color="0xfc6b0a"/>
			      </Box>
			    </Box>
			    <Button label="升星" x="105" y="260" stateNum="1" style="按钮大绿" var="btn_once"/>
			    <Button label="升星十次" x="290" y="260" stateNum="1" style="按钮大黄" var="btn_multi"/>
			    <Image skin="png.uiEquipGrow.魔法棒" x="92" y="251" mouseChildren="false" mouseEnabled="false"/>
			    <Image skin="png.uiEquipGrow.魔法棒" x="277" y="251" mouseChildren="false" mouseEnabled="false"/>
			    <Box x="52.5" y="223" var="box_progress">
			      <ProgressBar skin="png.uiEquipGrow.upstar.progress" var="progress" x="45" y="-7"/>
			      <Image skin="png.uiEquipGrow.upstar.框1" x="32" y="-2"/>
			      <Label text="1/12212" autoSize="none" x="100" y="1" color="0xffffff" align="center" width="209" height="18" var="txt_progress" isHtml="true" style="按钮文字"/>
			    </Box>
			    <List x="189" y="150" repeatX="3" var="list_stars">
			      <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			    </List>
			    <Box x="339" var="box_nextTitle" y="0">
			      <Image skin="png.a5.commonImgs.角色-红底" x="19"/>
			      <Label text="下阶属性" autoSize="none" y="2" color="0xfc6b0a" width="186" height="18" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true"/>
			    </Box>
			    <Box x="101" y="299" var="box_need">
			      <Label text="需要" autoSize="none" y="2" style="普通说明" width="48" height="20" align="right"/>
			      <WealthRenderS16 x="52" var="needRes" runtime="game.ui.commons.icons.WealthRenderS16UI"/>
			    </Box>
			    <Label text="pageBarS2" autoSize="none" x="115" y="220" style="不足禁止红" width="280" var="label_hint2" align="center" size="17" height="25"/>
			    <Box x="4" y="1" var="box_curTitle">
			      <Image skin="png.a5.commonImgs.角色-黄色" x="20"/>
			      <Label text="本阶属性" autoSize="none" y="1" color="0xf1c373" width="189" height="18" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true"/>
			    </Box>
			    <Label text="\l30006301" autoSize="none" y="222" style="普通说明" width="551" align="center" color="0xff3000" var="label_hint3" x="-13.5" size="17" height="25"/>
			    <Label text="pageBarS2" autoSize="none" x="125" y="195" style="重要提示绿" width="130" var="label_perc" height="20"/>
			  </Box>
			  <Label text="升星图鉴" autoSize="none" x="0" y="52" style="按钮文字" width="96" align="center" mouseChildren="false" mouseEnabled="false" multiline="true" wordWrap="true" height="40"/>
			</PanelView>;
       
      
      public var btn_mannal:Button = null;
      
      public var lianSuoLvl:ClipList = null;
      
      public var box_avail:Box = null;
      
      public var box_notavail:Box = null;
      
      public var label_hint1:Label = null;
      
      public var box_redNeed:RadioGroup = null;
      
      public var needRes1:WealthRenderS16UI = null;
      
      public var needRes2:WealthRenderS16UI = null;
      
      public var needRes3:WealthRenderS16UI = null;
      
      public var box_property:Box = null;
      
      public var list_prop:List = null;
      
      public var list_propNext:List = null;
      
      public var box_nextExTitle:Box = null;
      
      public var label_nextExtraProp:Label = null;
      
      public var btn_once:Button = null;
      
      public var btn_multi:Button = null;
      
      public var box_progress:Box = null;
      
      public var progress:ProgressBar = null;
      
      public var txt_progress:Label = null;
      
      public var list_stars:List = null;
      
      public var box_nextTitle:Box = null;
      
      public var box_need:Box = null;
      
      public var needRes:WealthRenderS16UI = null;
      
      public var label_hint2:Label = null;
      
      public var box_curTitle:Box = null;
      
      public var label_hint3:Label = null;
      
      public var label_perc:Label = null;
      
      public function EquipUpStarPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.EquipStarRenderUI"] = EquipStarRenderUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS16UI"] = WealthRenderS16UI;
         viewClassMap["game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"] = EquipStrenPropRenderS1UI;
         viewClassMap["game.ui.equipGrows.strens.EquipStrenPropRenderUI"] = EquipStrenPropRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
