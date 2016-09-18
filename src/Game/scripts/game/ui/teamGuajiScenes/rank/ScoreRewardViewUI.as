package game.ui.teamGuajiScenes.rank
{
   import morn.customs.components.FadeView;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class ScoreRewardViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="770" height="400">
			  <List y="28" spaceY="60" repeatY="7" centerX="0" x="1">
			    <Box name="render">
			      <Image skin="png.a5.commonImgs.列表分割线" width="768"/>
			    </Box>
			  </List>
			  <List y="90" spaceY="63" repeatY="3" centerX="0" x="1">
			    <Box name="render">
			      <Image skin="png.a5.commonImgs.公会排行底" width="768" height="62"/>
			    </Box>
			  </List>
			  <Image skin="png.a5.commonImgs.排行标题头" width="768" centerX="0"/>
			  <PageBarS2 y="424" var="pageBarUI" centerX="0" x="314.5" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="74" y="422"/>
			  <Box x="30" y="8">
			    <Label text="\l41300227" autoSize="none" style="下划线黄色" width="137" height="18" var="txt_rank" align="center"/>
			    <Label text="\l41300234" autoSize="none" x="269" style="下划线黄色" width="96" height="18" var="txt_listTitle2" align="center" y="2"/>
			    <Label text="\l41300235" autoSize="none" x="534" style="下划线黄色" width="96" height="18" var="txt_listTitle4" align="center"/>
			  </Box>
			  <Label text="\l41300243 " autoSize="none" x="19" y="427" style="普通说明" width="112" height="19"/>
			  <Label text="20" autoSize="none" x="98" y="425" style="渐变1" width="104" height="22" align="center" var="txt_pieceCnt"/>
			  <List x="27" y="31" var="list_rank" repeatY="6" spaceY="4">
			    <guajiRewardListRender name="render" runtime="game.ui.teamGuajiScenes.rank.guajiRewardListRenderUI"/>
			  </List>
			</FadeView>;
       
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var txt_rank:Label = null;
      
      public var txt_listTitle2:Label = null;
      
      public var txt_listTitle4:Label = null;
      
      public var txt_pieceCnt:Label = null;
      
      public var list_rank:List = null;
      
      public function ScoreRewardViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.teamGuajiScenes.rank.guajiRewardListRenderUI"] = guajiRewardListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
