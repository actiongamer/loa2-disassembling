package game.ui.busyActivity.questions.panel
{
   import morn.core.components.View;
   import morn.core.components.CheckBox;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class QuestionRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="540" height="22">
			  <CheckBox x="0" y="0" selected="true" style="CheckBox普通" var="btn"/>
			  <Label text="普通说明\n123" autoSize="none" x="36" y="-1" style="普通说明" width="543" height="22" size="14" var="lContent" multiline="true" wordWrap="true"/>
			  <Image skin="png.a5.bgs.输入框" x="0" y="-6" width="540" alpha="0" var="mouseRect" height="34"/>
			</View>;
       
      
      public var btn:CheckBox = null;
      
      public var lContent:Label = null;
      
      public var mouseRect:Image = null;
      
      public function QuestionRenderUI()
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
