package game.ui.horseModules.horseMaster
{
   import morn.customs.components.PanelView;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.SkillRenderS3UI;
   import morn.core.components.Button;
   import morn.core.components.ProgressBar;
   import game.ui.commons.icons.LotteryRenderS9UI;
   import morn.core.components.Image;
   
   public class HorseMasterPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="800" height="550">
			  <HorseMasterLvLabel x="165" y="140" var="lvCur" runtime="game.ui.horseModules.horseMaster.HorseMasterLvLabelUI"/>
			  <Box x="555" y="132" var="box_nextLv">
			    <HorseMasterLvLabel x="9.5" var="lvNext" runtime="game.ui.horseModules.horseMaster.HorseMasterLvLabelUI"/>
			    <List y="25" repeatY="5" spaceY="6" var="listPropNext">
			      <HorsePropNextRender name="render" runtime="game.ui.horseModules.horseMaster.HorsePropNextRenderUI"/>
			    </List>
			    <Image skin="png.a5.commonImgs.角色-属性条" x="13" y="18"/>
			  </Box>
			  <Image skin="png.uiHorse.masterInfo.img_blueBg" x="150" y="286"/>
			  <Image skin="png.uiHorse.masterInfo.img_nameBg" x="276" y="74"/>
			  <Label text="1阶8级" x="300" y="81" width="200" height="24" var="txt_levelName" style="人名1不随品质变化" bold="true" align="center" size="15" mouseEnabled="false"/>
			  <List x="149" y="165" repeatY="5" spaceY="6" var="listPropCur">
			    <HorsePropCurRender name="render" runtime="game.ui.horseModules.horseMaster.HorsePropCurRenderUI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.角色-属性条" x="156" y="158"/>
			  <SkillRenderS3 x="153" y="309" var="skillRender_cur" runtime="game.ui.commons.icons.SkillRenderS3UI"/>
			  <Label text="\l30106004" x="127" y="287" width="131" style="普通说明" align="center" mouseEnabled="false"/>
			  <HorseSkillRender x="554" y="272" var="skillRender_next" runtime="game.ui.horseModules.horseMaster.HorseSkillRenderUI"/>
			  <Box x="66" y="418" var="box_subBar">
			    <Image skin="png.uiHorse.masterInfo.img_bottomBg"/>
			    <Box x="148" y="21" var="box_levelUp">
			      <Button label="一键升级" x="206" style="按钮大黄" y="29" var="btn_levelUpAll"/>
			      <Button label="\l30100004" x="53" style="按钮大绿" y="29" var="btn_levelUp" labelMargin="40"/>
			      <HorseMasterCostRender x="73" y="36" var="renderCost" runtime="game.ui.horseModules.horseMaster.HorseMasterCostRenderUI"/>
			      <ProgressBar skin="png.a5.comps.progresses.progress_S9" x="72" y="2" sizeGrid="5,0,12,0" var="progressBar"/>
			      <HorseMasterLvLabel var="lvBottom" language="en" lgx="-30,0" lgy="0,0" x="0" y="0" runtime="game.ui.horseModules.horseMaster.HorseMasterLvLabelUI"/>
			      <Label text="999/9999" stroke="0xffffff" mouseEnabled="false" var="txt_progressValue" backgroundColor="0xcfbeaf" autoSize="left" x="152" y="2" letterSpacing="1" width="145" height="17" align="center" style="普通说明"/>
			    </Box>
			    <Box y="152" var="box_shengjie" x="81">
			      <Image skin="png.uiHorse.masterInfo.img_tianfuBg" y="23" width="258" height="48" x="21"/>
			      <Button label="\l30100005" style="按钮大绿" y="29" var="btn_shengjie" x="326"/>
			      <Image skin="png.uiHorse.changeHorse.黄光" x="303"/>
			      <Label text="\l30300046" autoSize="none" x="308" y="6" style="加底标题" width="99" height="18" align="center" var="title_need1"/>
			      <Label stroke="0x0" y="28" text="\l30300047" style="普通说明" width="300" align="center" buttonMode="true"/>
			      <Label text="（伤害减免提高15%）" bold="false" stroke="0x0" var="txt_desc2" y="49" align="center" width="300" size="13" style="重要提示绿"/>
			      <LotteryRenderS9 x="405" y="3" var="renderCost_shengjie" runtime="game.ui.commons.icons.LotteryRenderS9UI"/>
			    </Box>
			    <HorseMasterHadRender x="242" y="92" var="renderHad" runtime="game.ui.horseModules.horseMaster.HorseMasterHadRenderUI"/>
			  </Box>
			  <Box x="436" y="375" var="box_nextRank">
			    <Image skin="png.uiHorse.masterInfo.img_tianfuBg" width="258" height="48" var="img_nextJieBg" x="12"/>
			    <Label stroke="0x0" y="5" text="下次进阶可激活天赋" style="普通说明" width="300" align="center" buttonMode="true" x="21"/>
			    <Label text="（伤害减免提高15%）" bold="false" stroke="0x0" var="txt_desc" y="26" align="center" width="300" size="13" style="重要提示绿"/>
			  </Box>
			  <Button x="576" y="54" style="按钮小黄" var="btn_tianfu" stateNum="1" skin="png.a5.commonImgs.btn_tujian" labelMargin="0,30,0,0"/>
			  <Label text="\l30100015" x="561" y="111" style="按钮文字" width="99" height="18" align="center" mouseChildren="false" mouseEnabled="false"/>
			</PanelView>;
       
      
      public var lvCur:game.ui.horseModules.horseMaster.HorseMasterLvLabelUI = null;
      
      public var box_nextLv:Box = null;
      
      public var lvNext:game.ui.horseModules.horseMaster.HorseMasterLvLabelUI = null;
      
      public var listPropNext:List = null;
      
      public var txt_levelName:Label = null;
      
      public var listPropCur:List = null;
      
      public var skillRender_cur:SkillRenderS3UI = null;
      
      public var skillRender_next:game.ui.horseModules.horseMaster.HorseSkillRenderUI = null;
      
      public var box_subBar:Box = null;
      
      public var box_levelUp:Box = null;
      
      public var btn_levelUpAll:Button = null;
      
      public var btn_levelUp:Button = null;
      
      public var renderCost:game.ui.horseModules.horseMaster.HorseMasterCostRenderUI = null;
      
      public var progressBar:ProgressBar = null;
      
      public var lvBottom:game.ui.horseModules.horseMaster.HorseMasterLvLabelUI = null;
      
      public var txt_progressValue:Label = null;
      
      public var box_shengjie:Box = null;
      
      public var btn_shengjie:Button = null;
      
      public var title_need1:Label = null;
      
      public var txt_desc2:Label = null;
      
      public var renderCost_shengjie:LotteryRenderS9UI = null;
      
      public var renderHad:game.ui.horseModules.horseMaster.HorseMasterHadRenderUI = null;
      
      public var box_nextRank:Box = null;
      
      public var img_nextJieBg:Image = null;
      
      public var txt_desc:Label = null;
      
      public var btn_tianfu:Button = null;
      
      public function HorseMasterPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS9UI"] = LotteryRenderS9UI;
         viewClassMap["game.ui.commons.icons.SkillRenderS3UI"] = SkillRenderS3UI;
         viewClassMap["game.ui.horseModules.horseMaster.HorseMasterCostRenderUI"] = game.ui.horseModules.horseMaster.HorseMasterCostRenderUI;
         viewClassMap["game.ui.horseModules.horseMaster.HorseMasterHadRenderUI"] = game.ui.horseModules.horseMaster.HorseMasterHadRenderUI;
         viewClassMap["game.ui.horseModules.horseMaster.HorseMasterLvLabelUI"] = game.ui.horseModules.horseMaster.HorseMasterLvLabelUI;
         viewClassMap["game.ui.horseModules.horseMaster.HorsePropCurRenderUI"] = HorsePropCurRenderUI;
         viewClassMap["game.ui.horseModules.horseMaster.HorsePropNextRenderUI"] = HorsePropNextRenderUI;
         viewClassMap["game.ui.horseModules.horseMaster.HorseSkillRenderUI"] = game.ui.horseModules.horseMaster.HorseSkillRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
