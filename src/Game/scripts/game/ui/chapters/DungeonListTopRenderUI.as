package game.ui.chapters
{
   import morn.core.components.View;
   import morn.customs.components.ClipList;
   import morn.core.components.Box;
   import morn.core.components.ProgressBar;
   import game.ui.commons.comps.others.TreasureBoxBaseRenderUI;
   
   public class DungeonListTopRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="470" height="60">
			  <StarRender x="135" y="30" var="starRender0" runtime="game.ui.chapters.StarRenderUI"/>
			  <StarRender x="236" y="30" var="starRender1" runtime="game.ui.chapters.StarRenderUI"/>
			  <StarRender x="327" y="30" var="starRender2" runtime="game.ui.chapters.StarRenderUI"/>
			  <ClipList value="10" clipWidth="13" align="left" url="png.a5.comps.clipList.clipList_S13" x="161" y="35" var="clipList_rewardNeed0"/>
			  <ClipList value="10" clipWidth="13" align="left" url="png.a5.comps.clipList.clipList_S13" x="263" y="35" var="clipList_rewardNeed1"/>
			  <ClipList value="10" clipWidth="13" align="left" url="png.a5.comps.clipList.clipList_S13" x="354" y="33" var="clipList_rewardNeed2"/>
			  <Box x="385" y="14" var="box_chapterStar">
			    <Image skin="png.a5.commonImgs.img_bottomShadow" x="7" y="6" width="56" height="22" alpha="0"/>
			    <ClipList value="3" clipWidth="13" align="right" url="png.a5.comps.clipList.clipList_S13" x="53" y="5" var="clipList_rewardNow"/>
			    <StarRender scale="1" runtime="game.ui.chapters.StarRenderUI"/>
			    <ClipList value="10" clipWidth="13" align="center" url="png.a5.comps.clipList.clipList_S13" x="75" y="5" var="clipList_rewardTotal" width="13" height="17"/>
			    <Image skin="png.uiChapter.dungeonMap.line" x="53" y="5"/>
			  </Box>
			  <ProgressBar skin="png.a5.comps.progresses.progress_S9" x="59" y="19" var="progress_star" sizeGrid="5,0,0,0" height="15"/>
			  <TreasureBoxBaseRender x="148" y="-6" var="box0" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			  <TreasureBoxBaseRender x="240" y="-6" var="box1" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			  <TreasureBoxBaseRender x="331" y="-6" var="box2" runtime="game.ui.commons.comps.others.TreasureBoxBaseRenderUI"/>
			</View>;
       
      
      public var starRender0:game.ui.chapters.StarRenderUI = null;
      
      public var starRender1:game.ui.chapters.StarRenderUI = null;
      
      public var starRender2:game.ui.chapters.StarRenderUI = null;
      
      public var clipList_rewardNeed0:ClipList = null;
      
      public var clipList_rewardNeed1:ClipList = null;
      
      public var clipList_rewardNeed2:ClipList = null;
      
      public var box_chapterStar:Box = null;
      
      public var clipList_rewardNow:ClipList = null;
      
      public var clipList_rewardTotal:ClipList = null;
      
      public var progress_star:ProgressBar = null;
      
      public var box0:TreasureBoxBaseRenderUI = null;
      
      public var box1:TreasureBoxBaseRenderUI = null;
      
      public var box2:TreasureBoxBaseRenderUI = null;
      
      public function DungeonListTopRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.chapters.StarRenderUI"] = game.ui.chapters.StarRenderUI;
         viewClassMap["game.ui.commons.comps.others.TreasureBoxBaseRenderUI"] = TreasureBoxBaseRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
