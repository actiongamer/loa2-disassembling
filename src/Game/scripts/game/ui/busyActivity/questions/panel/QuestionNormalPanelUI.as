package game.ui.busyActivity.questions.panel
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Box;
   
   public class QuestionNormalPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="580" height="162">
			  <Label text="升级后加底标题" autoSize="none" x="8" y="9" style="升级后加底标题" width="581" var="txtQuestion" size="14" multiline="true" wordWrap="true"/>
			  <Box x="16" y="41" var="answerBox"/>
			</View>;
       
      
      public var txtQuestion:Label = null;
      
      public var answerBox:Box = null;
      
      public function QuestionNormalPanelUI()
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
