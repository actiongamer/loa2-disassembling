package game.ui.chapters
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.commons.comps.others.TreasureBoxBaseRenderUI;
   import morn.core.components.Label;
   
   public class ChapterFlagOnceRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="71" height="105" buttonMode="false" mouseChildren="true" mouseEnabled="false">
			  <Box x="-84" y="1" var="box_drop" mouseEnabled="false">
			    <Image skin="png.uiChapter.dungeonMap.img_dropBg" var="img_dropBg" mouseEnabled="false" mouseChildren="false" x="0" y="0" width="170"/>
			    <Box x="16" y="15" var="box_content" width="155" height="36" mouseEnabled="false">
			      <Label style="普通说明" width="43" multiline="false" wordWrap="true" align="left" text="掉落：" leading="4" height="18" mouseEnabled="false" mouseChildren="false"/>
			      <List x="38" repeatY="2" var="list_drops" mouseChildren="true">
			        <ChapterDropRender name="render" runtime="game.ui.chapters.ChapterDropRenderUI"/>
			      </List>
			    </Box>
			  </Box>
			  <Box x="27" y="-30" var="box_treasureBox">
			    <Image skin="png.uiChapter.dungeonMap.img_boxShadow" y="18"/>
			    <TreasureBoxBaseRender x="10" var="treasureBox" buttonMode="true" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			  </Box>
			  <Label style="普通说明" var="txt_dungeonName" width="150" multiline="false" wordWrap="true" align="center" text="十二个字字字" leading="4" height="19" y="-89" x="-77" mouseEnabled="false" mouseChildren="false"/>
			  <Box var="box_summary" x="-29" y="-117" width="149" height="52" mouseChildren="false" mouseEnabled="false">
			    <Image skin="png.uiChapter.dungeonMap.summaryBg" x="155" width="166" height="63" sizeGrid="14,15,80,30" scaleX="-1" y="-10" var="txt_summary_bg"/>
			    <Label y="-10" style="普通说明" var="txt_summary" width="149" multiline="true" wordWrap="true" align="left" text="十二个字十二个字十二个字123123" leading="4" x="0"/>
			  </Box>
			  <Box var="box_star" x="-25" y="-33" mouseChildren="false" mouseEnabled="false" width="52" height="30">
			    <StarRender name="render" x="23" var="star2" y="0" runtime="game.ui.chapters.StarRenderUI"/>
			    <StarRender name="render" var="star0" x="-1" y="0" runtime="game.ui.chapters.StarRenderUI"/>
			    <StarRender name="render" x="11" var="star1" y="2" runtime="game.ui.chapters.StarRenderUI"/>
			  </Box>
			</View>;
       
      
      public var box_drop:Box = null;
      
      public var img_dropBg:Image = null;
      
      public var box_content:Box = null;
      
      public var list_drops:List = null;
      
      public var box_treasureBox:Box = null;
      
      public var treasureBox:TreasureBoxBaseRenderUI = null;
      
      public var txt_dungeonName:Label = null;
      
      public var box_summary:Box = null;
      
      public var txt_summary_bg:Image = null;
      
      public var txt_summary:Label = null;
      
      public var box_star:Box = null;
      
      public var star2:game.ui.chapters.StarRenderUI = null;
      
      public var star0:game.ui.chapters.StarRenderUI = null;
      
      public var star1:game.ui.chapters.StarRenderUI = null;
      
      public function ChapterFlagOnceRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chapters.ChapterDropRenderUI"] = ChapterDropRenderUI;
         viewClassMap["game.ui.chapters.StarRenderUI"] = game.ui.chapters.StarRenderUI;
         viewClassMap["game.ui.commons.comps.others.TreasureBoxBaseRenderUI"] = TreasureBoxBaseRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
