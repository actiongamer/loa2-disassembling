package game.ui.noticeModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class NoticeMiniBarUI extends View
   {
      
      protected static var uiView:XML = <View width="358" height="41">
			  <Label text="通知" autoSize="left" x="4" y="2" style="二级框标题" var="txt_type" height="20"/>
			  <Label text="sdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsd" autoSize="none" x="16" y="23" style="普通说明" width="342" var="txt_content" wordWrap="true" multiline="true" height="51"/>
			</View>;
       
      
      public var txt_type:Label = null;
      
      public var txt_content:Label = null;
      
      public function NoticeMiniBarUI()
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
