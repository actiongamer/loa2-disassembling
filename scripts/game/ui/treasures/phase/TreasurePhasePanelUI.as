package game.ui.treasures.phase
{
   import morn.customs.components.FadeView;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS7UI;
   import game.ui.treasures.render.TreasureRenderUI;
   import game.ui.equipGrows.strens.EquipStrenPropRenderS1UI;
   import game.ui.treasures.render.RandomPropRenderUI;
   
   public class TreasurePhasePanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="558" height="470">
			  <Label autoSize="none" x="47" labelFilterKind="101" width="60" height="22" align="center" text="基础属性" style="加底标题" y="57" underline="false" var="txt_10220000"/>
			  <List y="88" var="list_nowProp" x="14">
			    <EquipStrenPropRenderS1 name="render" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"/>
			  </List>
			  <Box x="13" y="128" var="box_operation">
			    <Image skin="png.uiTreasure.img_phase" x="76" y="98"/>
			    <Button label="觉醒" x="208" style="按钮大绿" y="263" var="btn_phase" labelMargin="20"/>
			    <LotteryRenderS7 x="228" y="301" var="render_goldCost" runtime="game.ui.commons.icons.LotteryRenderS7UI"/>
			    <Image skin="png.uiTreasure.强化" x="210" y="263"/>
			    <Image skin="png.a5.commonImgs.img_arrowupS1" x="52" scaleY="-1"/>
			    <List y="1" var="list_nextProp">
			      <EquipStrenPropRenderS1 name="render" runtime="game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"/>
			    </List>
			    <TreasureRender x="81" y="166" var="render_treasure" runtime="game.ui.treasures.render.TreasureRenderUI"/>
			    <TreasurePhaseCostRender x="376" y="166" var="render_cost" runtime="game.ui.treasures.phase.TreasurePhaseCostRenderUI"/>
			  </Box>
			  <Box x="136" y="218.5" var="box_notavail">
			    <Image skin="png.uiEquipGrow.upstar.装备-升星-提示文字bj" x="3"/>
			    <Label text="只有红色圣物才可以进化成金色圣物" autoSize="none" y="4" style="不足禁止红" size="17" width="286" height="25" align="center" var="txt_30600902" x="0"/>
			  </Box>
			  <Label autoSize="none" x="433" labelFilterKind="101" width="60" height="22" align="center" text="随机属性" style="加底标题" y="57" underline="false" var="txt_30609001"/>
			  <Label autoSize="none" x="384" labelFilterKind="101" width="157" height="22" align="center" text="新随机属性" style="重要提示绿" var="txt_30600903" y="190" underline="false"/>
			  <List repeatX="1" repeatY="4" spaceX="-4" spaceY="-1" var="list_randomProp" x="383" y="81">
			    <RandomPropRender name="render" runtime="game.ui.treasures.render.RandomPropRenderUI"/>
			  </List>
			  <Label autoSize="none" x="204" labelFilterKind="101" width="157" height="22" align="center" text="\l30609002" style="重要提示黄" y="318" underline="true" var="txt_rule" buttonMode="true"/>
			  <Image skin="png.uiTreasure.强化-名字底" x="195.5" y="10"/>
			  <Label autoSize="none" y="25" labelFilterKind="101" width="388" height="22" align="center" var="txt_treasureName" bold="true" text="嗷呜" style="加底标题" size="14" centerX="0" x="85"/>
			</FadeView>;
       
      
      public var txt_10220000:Label = null;
      
      public var list_nowProp:List = null;
      
      public var box_operation:Box = null;
      
      public var btn_phase:Button = null;
      
      public var render_goldCost:LotteryRenderS7UI = null;
      
      public var list_nextProp:List = null;
      
      public var render_treasure:TreasureRenderUI = null;
      
      public var render_cost:game.ui.treasures.phase.TreasurePhaseCostRenderUI = null;
      
      public var box_notavail:Box = null;
      
      public var txt_30600902:Label = null;
      
      public var txt_30609001:Label = null;
      
      public var txt_30600903:Label = null;
      
      public var list_randomProp:List = null;
      
      public var txt_rule:Label = null;
      
      public var txt_treasureName:Label = null;
      
      public function TreasurePhasePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS7UI"] = LotteryRenderS7UI;
         viewClassMap["game.ui.equipGrows.strens.EquipStrenPropRenderS1UI"] = EquipStrenPropRenderS1UI;
         viewClassMap["game.ui.treasures.phase.TreasurePhaseCostRenderUI"] = game.ui.treasures.phase.TreasurePhaseCostRenderUI;
         viewClassMap["game.ui.treasures.render.RandomPropRenderUI"] = RandomPropRenderUI;
         viewClassMap["game.ui.treasures.render.TreasureRenderUI"] = TreasureRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
