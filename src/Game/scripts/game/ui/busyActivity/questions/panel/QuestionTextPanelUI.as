package game.ui.busyActivity.questions.panel
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.TextArea;
   
   public class QuestionTextPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="580" height="350">
			  <Label text="升级后加底标题" autoSize="none" x="8" y="20" style="渐变橙" width="481" height="23" var="txtQuestion"/>
			  <TextArea leading="14" var="txtContent" autoSize="left" x="16" y="76" multiline="true" style="普通说明" width="553" height="274" maxChars="100"/>
			  <Label text="不足禁止红" autoSize="none" x="465" y="329" style="不足禁止红" width="102" height="20" align="right" var="txt_txtCount"/>
			</View>;
       
      
      public var txtQuestion:Label = null;
      
      public var txtContent:TextArea = null;
      
      public var txt_txtCount:Label = null;
      
      public function QuestionTextPanelUI()
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
