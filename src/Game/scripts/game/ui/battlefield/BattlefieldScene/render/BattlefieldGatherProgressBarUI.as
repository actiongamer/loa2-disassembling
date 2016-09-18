package game.ui.battlefield.BattlefieldScene.render
{
   import morn.core.components.View;
   import morn.core.components.ProgressBar;
   import morn.core.components.Label;
   
   public class BattlefieldGatherProgressBarUI extends View
   {
      
      protected static var uiView:XML = <View width="211" height="33">
			  <ProgressBar skin="png.a5.comps.progresses.progress_S12" x="0" y="0" var="progressBar" sizeGrid="18,0,18,0" value="0.5"/>
			  <Label text="80%" autoSize="none" x="58" y="8" style="普通说明" var="txt_progressValue" width="92" align="center" size="14"/>
			</View>;
       
      
      public var progressBar:ProgressBar = null;
      
      public var txt_progressValue:Label = null;
      
      public function BattlefieldGatherProgressBarUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
