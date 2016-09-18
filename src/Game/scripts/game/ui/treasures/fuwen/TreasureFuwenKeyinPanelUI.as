package game.ui.treasures.fuwen
{
   import morn.customs.components.FadeView;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.core.components.ProgressBar;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderSize24TxtUI;
   import game.ui.commons.icons.LotteryRenderS9UI;
   import game.ui.horseModules.horseMaster.HorseMasterHadRenderUI;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   import game.ui.roleInfos.tupos.RoleUpRenderUI;
   import game.ui.treasures.render.RunePorpRenderUI;
   
   public class TreasureFuwenKeyinPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="558" height="470">
			  <Image skin="png.uiTreasure.强化-名字底" x="195.5" y="7" centerX="0"/>
			  <Label autoSize="none" x="85" y="21" labelFilterKind="101" width="388" height="22" align="center" var="txt_treasureName" bold="true" text="嗷呜" style="加底标题" size="14" centerX="0"/>
			  <Box x="-5" y="71" var="box_operation">
			    <Image skin="png.uiTreasure.下透明框" y="230"/>
			    <Box x="31" y="0">
			      <Image skin="png.uiTreasure2.刻印.属性底"/>
			      <List repeatX="1" repeatY="5" spaceX="-4" var="list_prop" y="42" spaceY="3.5" x="20">
			        <RunePorpRender name="render" runtime="game.ui.treasures.render.RunePorpRenderUI"/>
			      </List>
			      <Label autoSize="none" x="37" y="10" width="86" height="18" text="9阶2星" var="txt_propTitleNow" style="人名1不随品质变化" align="center"/>
			    </Box>
			    <Box x="132" y="307" var="box_bottom">
			      <Box var="box_progress">
			        <ProgressBar skin="png.a5.comps.progresses.progress_S9" sizeGrid="5,0,0,0" var="progressBar"/>
			        <Label text="1/12212" autoSize="none" x="82" y="-1" color="0xffffff" labelFilterKind="101" align="center" width="164" height="18" var="txt_progress" style="按钮文字"/>
			      </Box>
			      <Box x="12" y="44">
			        <Button label="\l30616006" stateNum="1" buttonMode="true" labelFilterKind="黑色1像素描边" y="1" var="btn_keyin" style="按钮大绿" labelMargin="20"/>
			        <Image skin="png.uiTreasure2.重铸 洗炼.手" x="1" mouseEnabled="false" mouseChildren="false" y="0"/>
			      </Box>
			      <Box x="167" y="44">
			        <Button label="\l30616007" stateNum="1" buttonMode="true" labelFilterKind="黑色1像素描边" var="btn_autoKeyin" style="按钮大黄" labelMargin="20" y="1"/>
			        <Image skin="png.uiTreasure.强化" x="2" mouseChildren="false" mouseEnabled="false" y="0"/>
			      </Box>
			      <Box x="49" y="17" var="box_cost">
			        <Label autoSize="none" y="4" labelFilterKind="101" width="157" height="22" align="left" text="\l30609005" style="普通说明"/>
			        <Label autoSize="none" x="122" y="4" labelFilterKind="101" width="157" height="22" align="left" text="拥有" style="普通绿色" var="txt_has"/>
			        <WealthRenderSize24Txt x="72" var="costRender" y="0" runtime="game.ui.commons.icons.WealthRenderSize24TxtUI"/>
			      </Box>
			      <Label autoSize="none" y="18" labelFilterKind="101" width="298" height="22" align="center" text="\l30609016" style="普通绿色" var="txt_maxStar" size="14" x="4"/>
			    </Box>
			    <Box x="360" y="0">
			      <Image skin="png.uiTreasure2.刻印.属性底"/>
			      <List repeatX="1" repeatY="5" spaceX="-4" spaceY="3.5" var="list_nextProp" y="42" x="26">
			        <RunePorpRender name="render" runtime="game.ui.treasures.render.RunePorpRenderUI"/>
			      </List>
			      <Label autoSize="none" x="37" y="10" width="86" height="18" text="9阶2星" var="txt_propTitleNext" style="人名1不随品质变化" align="center"/>
			      <List x="141" y="43" repeatY="5" spaceY="3" var="list_up">
			        <RoleUpRender name="render" runtime="game.ui.roleInfos.tupos.RoleUpRenderUI"/>
			      </List>
			    </Box>
			    <Label autoSize="none" x="40" y="168" width="144" height="55" text="(9阶：已镶嵌\n额外\n12" var="txt_propNowDesc" style="人名1不随品质变化" align="left" multiline="true" wordWrap="true"/>
			    <Label autoSize="none" x="376" y="171" width="144" height="58" text="(9阶：已镶嵌\n额外\n12" var="txt_propNextDesc" style="人名1不随品质变化" align="left" multiline="true" wordWrap="true"/>
			    <Label autoSize="none" x="175" y="248" width="207" text="圣物 刻印9阶2星" var="txt_propCur" style="人名1不随品质变化" align="center"/>
			    <Box y="308" var="box_shengjie" x="25">
			      <Image skin="png.uiTreasure2.img_tianfuBg" y="9" width="258" height="48" x="6"/>
			      <Button label="\l30100005" style="按钮大绿" y="29" var="btn_shengjie" x="311"/>
			      <Image skin="png.uiTreasure2.黄光" x="251"/>
			      <Label text="\l30300046" autoSize="none" x="256" y="6" style="加底标题" width="99" height="18" align="center" var="title_need1"/>
			      <Label stroke="0x0" y="14" text="\l30300047" style="普通说明" width="224" align="center" buttonMode="true" x="24" height="20"/>
			      <Label text="（伤害减免提高15%）" bold="false" stroke="0x0" var="txt_desc2" y="34" align="center" width="272" size="13" style="重要提示绿" height="20"/>
			      <List x="353" y="3" repeatX="2" var="list_gradeUp">
			        <LotteryRenderS9 var="renderCost_shengjie" name="render" runtime="game.ui.commons.icons.LotteryRenderS9UI"/>
			      </List>
			      <HorseMasterHadRender x="370" y="68" var="renderHad" runtime="game.ui.horseModules.horseMaster.HorseMasterHadRenderUI"/>
			    </Box>
			    <List repeatX="9" var="list_stars" scale="0.7" x="135" spaceX="2" y="268">
			      <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			    </List>
			  </Box>
			  <Box x="134" y="165" var="box_notavail">
			    <Image skin="png.uiEquipGrow.upstar.装备-升星-提示文字bj" x="3"/>
			    <Label text="\l30616013" autoSize="none" y="4" style="普通说明" size="17" width="286" height="25" align="center" color="0xff3000" var="label_hint1" x="0"/>
			  </Box>
			  <Label autoSize="none" x="201" labelFilterKind="101" width="157" height="22" align="center" text="\l30609002" style="重要提示黄" var="txt_rule" y="285" underline="true"/>
			</FadeView>;
       
      
      public var txt_treasureName:Label = null;
      
      public var box_operation:Box = null;
      
      public var list_prop:List = null;
      
      public var txt_propTitleNow:Label = null;
      
      public var box_bottom:Box = null;
      
      public var box_progress:Box = null;
      
      public var progressBar:ProgressBar = null;
      
      public var txt_progress:Label = null;
      
      public var btn_keyin:Button = null;
      
      public var btn_autoKeyin:Button = null;
      
      public var box_cost:Box = null;
      
      public var txt_has:Label = null;
      
      public var costRender:WealthRenderSize24TxtUI = null;
      
      public var txt_maxStar:Label = null;
      
      public var list_nextProp:List = null;
      
      public var txt_propTitleNext:Label = null;
      
      public var list_up:List = null;
      
      public var txt_propNowDesc:Label = null;
      
      public var txt_propNextDesc:Label = null;
      
      public var txt_propCur:Label = null;
      
      public var box_shengjie:Box = null;
      
      public var btn_shengjie:Button = null;
      
      public var title_need1:Label = null;
      
      public var txt_desc2:Label = null;
      
      public var list_gradeUp:List = null;
      
      public var renderCost_shengjie:LotteryRenderS9UI = null;
      
      public var renderHad:HorseMasterHadRenderUI = null;
      
      public var list_stars:List = null;
      
      public var box_notavail:Box = null;
      
      public var label_hint1:Label = null;
      
      public var txt_rule:Label = null;
      
      public function TreasureFuwenKeyinPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.EquipStarRenderUI"] = EquipStarRenderUI;
         viewClassMap["game.ui.commons.icons.LotteryRenderS9UI"] = LotteryRenderS9UI;
         viewClassMap["game.ui.commons.icons.WealthRenderSize24TxtUI"] = WealthRenderSize24TxtUI;
         viewClassMap["game.ui.horseModules.horseMaster.HorseMasterHadRenderUI"] = HorseMasterHadRenderUI;
         viewClassMap["game.ui.roleInfos.tupos.RoleUpRenderUI"] = RoleUpRenderUI;
         viewClassMap["game.ui.treasures.render.RunePorpRenderUI"] = RunePorpRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
