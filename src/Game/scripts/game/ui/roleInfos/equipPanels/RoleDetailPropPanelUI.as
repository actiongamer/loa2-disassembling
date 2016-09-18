package game.ui.roleInfos.equipPanels
{
   import morn.customs.components.PanelView;
   import morn.core.components.Panel;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.customs.components.ClipList;
   import game.ui.roleInfos.tupos.TianfuInfoRenderUI;
   import game.ui.roleTeam.render.RoleSkillRenderUI;
   import game.ui.roleTeam.render.YuanFenDetailRenderUI;
   
   public class RoleDetailPropPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="296" height="416">
			  <Image skin="png.a5.bgs.panelBgs.img_baseBg" x="-1" y="-14" sizeGrid="40,24,40,24" width="296" height="434"/>
			  <Panel x="3" y="4" width="288" height="397" var="box_content" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3">
			    <Box x="8" y="54" var="box_exceptFightValue">
			      <Image skin="png.a5.commonImgs.img_titleBg" x="30" y="188"/>
			      <Image skin="png.a5.commonImgs.img_titleBg" x="30" y="266"/>
			      <Image skin="png.a5.commonImgs.img_titleBg" x="30"/>
			      <List x="17" y="33" repeatX="2" repeatY="8" spaceX="5" var="list_propBase" language="en" lgx="2,17" lgy="33,33" spaceY="-1">
			        <BasePropRender name="render" runtime="game.ui.roleInfos.equipPanels.BasePropRenderUI"/>
			      </List>
			      <Label text="\l11700003" x="52" y="2" align="center" underline="false" selectable="false" buttonMode="true" bold="true" style="加底标题" width="150"/>
			      <Label text="\l9730106" x="52" y="191" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true" style="加底标题" width="150"/>
			      <Box x="48" y="216" width="161" var="box_skill" height="36">
			        <List spaceX="12" repeatX="4" var="list_skill" x="2" y="2">
			          <RoleSkillRender name="render" runtime="game.ui.roleTeam.render.RoleSkillRenderUI"/>
			        </List>
			      </Box>
			      <List y="294" var="list_yuanfen" spaceY="8" x="0">
			        <YuanFenDetailRender name="render" runtime="game.ui.roleTeam.render.YuanFenDetailRenderUI"/>
			      </List>
			      <Label text="\l2036" x="52" y="268" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true" style="加底标题" width="150"/>
			      <Box x="6" y="373" var="box_yuanfenNext">
			        <Image skin="png.a5.commonImgs.img_titleBg" x="29" y="0"/>
			        <List y="24" repeatY="10" var="list_tianfu" lgx="-10,0" language="en" lgy="24,24">
			          <TianfuInfoRender name="render" runtime="game.ui.roleInfos.tupos.TianfuInfoRenderUI"/>
			        </List>
			        <Label text="\l9030108" x="84.5" y="3" width="80" align="center" underline="false" selectable="false" buttonMode="true" size="12" bold="true" style="加底标题"/>
			      </Box>
			    </Box>
			    <Box x="40" y="4" var="box_fightValueBox">
			      <Image skin="png.a5.commonImgs.img_titleBg"/>
			      <ClipList value="739" clipWidth="14" align="center" url="png.a5.comps.clipList.clipList_S15" x="96" y="25" gapX="-1" var="txt_fightValue"/>
			      <Label text="\l10000004" x="20" y="2" align="center" underline="false" selectable="false" buttonMode="true" bold="true" style="加底标题" width="150"/>
			    </Box>
			  </Panel>
			</PanelView>;
       
      
      public var box_content:Panel = null;
      
      public var box_exceptFightValue:Box = null;
      
      public var list_propBase:List = null;
      
      public var box_skill:Box = null;
      
      public var list_skill:List = null;
      
      public var list_yuanfen:List = null;
      
      public var box_yuanfenNext:Box = null;
      
      public var list_tianfu:List = null;
      
      public var box_fightValueBox:Box = null;
      
      public var txt_fightValue:ClipList = null;
      
      public function RoleDetailPropPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleInfos.equipPanels.BasePropRenderUI"] = BasePropRenderUI;
         viewClassMap["game.ui.roleInfos.tupos.TianfuInfoRenderUI"] = TianfuInfoRenderUI;
         viewClassMap["game.ui.roleTeam.render.RoleSkillRenderUI"] = RoleSkillRenderUI;
         viewClassMap["game.ui.roleTeam.render.YuanFenDetailRenderUI"] = YuanFenDetailRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
