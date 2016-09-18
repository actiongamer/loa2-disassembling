package game.ui.familyBosses
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import game.ui.familyBosses.render.HornorPlayerRenderUI;
   import game.ui.familyBosses.render.HornorRankRenderUI;
   
   public class HornorRankUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="805" height="550">
			  <PanelBg x="4" y="-2" width="805" height="550"/>
			  <Image skin="png.a5.bgs.panelBgs.img_frameS1" x="19" y="37" sizeGrid="14,18,14,14" width="776" height="497" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.uiFamilyBossHornor.img_bg" x="22" y="39"/>
			  <Image skin="png.uiFamilyBossHornor.img_border" x="511" y="39"/>
			  <Image skin="png.uiFamilyBossHornor.img_1" x="553" y="38"/>
			  <Image skin="png.uiFamilyBossHornor.img_2" x="23" y="41"/>
			  <List x="24" y="71" repeatY="11" spaceY="40" width="509">
			    <Box name="render">
			      <Image skin="png.uiFamilyBossHornor.img_line" width="509" height="2" name="render"/>
			    </Box>
			  </List>
			  <List x="24" y="114" repeatY="5" spaceY="43">
			    <Box name="render">
			      <Image skin="png.uiFamilyBossHornor.img_light"/>
			    </Box>
			  </List>
			  <List x="24" y="72" repeatY="10" spaceY="2" var="list_rank">
			    <HornorRankRender name="render" runtime="game.ui.familyBosses.render.HornorRankRenderUI"/>
			  </List>
			  <Label text="排名" autoSize="none" x="23" style="加底标题" width="96" height="18" align="center" y="48"/>
			  <Label text="公会" autoSize="none" x="129" style="加底标题" width="117" height="18" align="center" y="48"/>
			  <Label text="击杀boss数" autoSize="none" x="265" style="加底标题" width="117" height="18" align="center" y="48"/>
			  <Label text="奖励" autoSize="none" x="405" style="加底标题" width="117" height="18" align="center" y="48"/>
			  <Image skin="png.uiPreview.荣耀殿堂" x="-61" y="-177" alpha=".6"/>
			  <Box x="535" y="47" var="box_detail">
			    <Label text="击杀最终boss等级：" autoSize="none" x="7" style="普通说明" width="117" height="18" align="center"/>
			    <Label text="120" autoSize="none" x="123" style="重要提示黄" width="117" height="18" align="left" var="txt_maxLvl"/>
			    <Label text="累计输出：" autoSize="none" x="7" style="普通说明" width="117" height="18" align="right" y="20"/>
			    <Label text="120" autoSize="none" x="124" style="重要提示黄" width="117" height="18" align="left" y="20" var="txt_totalDmg"/>
			    <List y="42" repeatY="5" spaceY="-6" var="list_detailRank">
			      <HornorPlayerRender name="render" runtime="game.ui.familyBosses.render.HornorPlayerRenderUI"/>
			    </List>
			  </Box>
			</PopModuleView>;
       
      
      public var list_rank:List = null;
      
      public var box_detail:Box = null;
      
      public var txt_maxLvl:Label = null;
      
      public var txt_totalDmg:Label = null;
      
      public var list_detailRank:List = null;
      
      public function HornorRankUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.familyBosses.render.HornorPlayerRenderUI"] = HornorPlayerRenderUI;
         viewClassMap["game.ui.familyBosses.render.HornorRankRenderUI"] = HornorRankRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
