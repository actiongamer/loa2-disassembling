package game.ui.groupon.render
{
   import morn.core.components.View;
   import morn.core.components.ProgressBar;
   import morn.core.components.List;
   
   public class GrouponProgressBarUI extends View
   {
      
      protected static var uiView:XML = <View width="316" height="20">
			  <ProgressBar skin="png.a5.commonImgs.progress.progress" x="-2" y="-17" var="progressBar"/>
			  <Image skin="png.a5.commonImgs.progress.out_frame" x="-18" y="-3"/>
			  <List x="77" y="-14" repeatX="3" var="list_split" spaceX="98">
			    <ProgressSplitView name="render" x="0" y="0" runtime="game.ui.groupon.render.ProgressSplitViewUI"/>
			  </List>
			</View>;
       
      
      public var progressBar:ProgressBar = null;
      
      public var list_split:List = null;
      
      public function GrouponProgressBarUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.groupon.render.ProgressSplitViewUI"] = ProgressSplitViewUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
