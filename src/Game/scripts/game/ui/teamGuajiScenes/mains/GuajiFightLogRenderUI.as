package game.ui.teamGuajiScenes.mains
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class GuajiFightLogRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="370" height="22">
			  <Label text="普通说明" autoSize="none" x="6" y="3" style="普通说明" width="306" height="20" var="txt_content"/>
			  <Label text="普通说明" autoSize="none" x="316" y="3" style="普通绿色" width="166" height="20" var="txt_playback" underline="true" align="left"/>
			</View>;
       
      
      public var txt_content:Label = null;
      
      public var txt_playback:Label = null;
      
      public function GuajiFightLogRenderUI()
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
