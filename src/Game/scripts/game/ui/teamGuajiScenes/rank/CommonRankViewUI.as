package game.ui.teamGuajiScenes.rank
{
   import morn.customs.components.FadeView;
   import morn.core.components.Button;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.RuleDescriptionUI;
   import morn.core.components.List;
   
   public class CommonRankViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="770" height="457">
			  <Button label="\l41300086" x="613" style="按钮大绿" y="418" var="btn_getReward"/>
			  <List x="1" y="28" spaceY="60" repeatY="7">
			    <Box name="render">
			      <Image skin="png.a5.commonImgs.列表分割线" width="768"/>
			    </Box>
			  </List>
			  <List x="1" y="90" spaceY="63" repeatY="3">
			    <Box name="render">
			      <Image skin="png.a5.commonImgs.公会排行底" width="768" height="61"/>
			    </Box>
			  </List>
			  <Image skin="png.a5.commonImgs.排行标题头" centerX="0" sizeGrid="20,2,20,2" width="768"/>
			  <PageBarS2 x="314.5" y="410" var="pageBarUI" centerX="0" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Box x="14" y="6">
			    <Label text="\l41300225" autoSize="none" style="下划线黄色" width="120" height="18" var="txt_rank" align="center"/>
			    <Label text="\l41300226" autoSize="none" x="171" style="下划线黄色" width="120" height="18" var="txt_listTitle2" align="center"/>
			    <Label text="\l41300227" autoSize="none" x="326" style="下划线黄色" width="200" height="18" var="txt_listTitle3" align="center"/>
			    <Label text="\l41300229" autoSize="none" x="531" style="下划线黄色" width="150" height="18" var="txt_listTitle4" align="center"/>
			  </Box>
			  <Label text="抢夺宝物碎片数量：" autoSize="none" x="130" y="438" style="普通说明" width="508" height="19" align="center" var="txt_myRank"/>
			  <RuleDescription x="38" y="418" var="helpComp" runtime="game.ui.commons.comps.others.RuleDescriptionUI"/>
			  <List x="2" y="30" repeatY="6" spaceY="4" var="list_rank">
			    <guajiRankingRender name="render" runtime="game.ui.teamGuajiScenes.rank.guajiRankingRenderUI"/>
			  </List>
			</FadeView>;
       
      
      public var btn_getReward:Button = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var txt_rank:Label = null;
      
      public var txt_listTitle2:Label = null;
      
      public var txt_listTitle3:Label = null;
      
      public var txt_listTitle4:Label = null;
      
      public var txt_myRank:Label = null;
      
      public var helpComp:RuleDescriptionUI = null;
      
      public var list_rank:List = null;
      
      public function CommonRankViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RuleDescriptionUI"] = RuleDescriptionUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.teamGuajiScenes.rank.guajiRankingRenderUI"] = guajiRankingRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
