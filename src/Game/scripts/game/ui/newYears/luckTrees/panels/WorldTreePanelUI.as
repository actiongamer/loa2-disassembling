package game.ui.newYears.luckTrees.panels
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.ProgressBar;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.newYears.luckTrees.renders.WorldTreeRenderUI;
   
   public class WorldTreePanelUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Image skin="png.uiLuckTree.worldTree.img_tree" x="60" y="-63" var="img_tree_bg"/>
			  <Box x="351" y="22" var="box_progress">
			    <ProgressBar skin="png.a5.comps.progresses.progress_S10" x="19" y="19" sizeGrid="5,0,18,0" var="progressBar" height="24"/>
			    <Image skin="png.uiLuckTree.img_progress_rim" y="15" x="0"/>
			    <Image skin="png.uiLuckTree.img_progressShine" x="17" var="img_progressShine"/>
			    <Label text="祝福值: 11313/1313" autoSize="none" x="115" y="23" style="普通说明" width="162" height="21" align="center" var="txt_val"/>
			  </Box>
			  <Image skin="png.uiLuckTree.worldTree.img_icon" x="326" y="24" var="img_icon_tree"/>
			  <Label text="to world tree" autoSize="none" x="499" y="23" style="普通说明" width="211" align="right" var="txt_to_world_tree" height="20"/>
			  <Label text="lv.4" autoSize="none" x="480" y="20" style="渐变1" width="91" height="22" align="left" var="txt_tree_lv"/>
			  <Image skin="png.uiLuckTree.personScore.img_bg" x="257" y="83" height="370"/>
			  <Label text="LV" autoSize="none" x="270" y="95" style="加底标题" width="119" align="center" var="txt_list_title_lv" height="20"/>
			  <Label text="Reward" autoSize="none" x="411" y="95" style="加底标题" width="159" align="center" var="txt_list_title_reward" height="20"/>
			  <List x="262" y="120" var="list_gift" repeatY="6" spaceY="4" height="326" width="515">
			    <WorldTreeRender name="render" runtime="game.ui.newYears.luckTrees.renders.WorldTreeRenderUI"/>
			  </List>
			  <Label text="Option" autoSize="none" x="583" y="95" style="加底标题" width="159" align="center" var="txt_list_title_option" height="20"/>
			  <Label text="Date Time CD" autoSize="none" x="240" y="3" style="普通说明" width="512" height="19" var="txt_cd" align="right"/>
			  <Label text="tree lv.4" autoSize="none" x="363" y="23" style="普通说明" width="113" height="20" align="right" var="txt_tree_lv_label"/>
			</View>;
       
      
      public var img_tree_bg:Image = null;
      
      public var box_progress:Box = null;
      
      public var progressBar:ProgressBar = null;
      
      public var img_progressShine:Image = null;
      
      public var txt_val:Label = null;
      
      public var img_icon_tree:Image = null;
      
      public var txt_to_world_tree:Label = null;
      
      public var txt_tree_lv:Label = null;
      
      public var txt_list_title_lv:Label = null;
      
      public var txt_list_title_reward:Label = null;
      
      public var list_gift:List = null;
      
      public var txt_list_title_option:Label = null;
      
      public var txt_cd:Label = null;
      
      public var txt_tree_lv_label:Label = null;
      
      public function WorldTreePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.newYears.luckTrees.renders.WorldTreeRenderUI"] = WorldTreeRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
