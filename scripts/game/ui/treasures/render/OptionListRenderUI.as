package game.ui.treasures.render
{
   import morn.core.components.View;
   import morn.core.components.RadioButton;
   import morn.core.components.Label;
   
   public class OptionListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="57" height="25">
			  <RadioButton x="2" y="2" style="Radio普通" selected="true" var="selectRender"/>
			  <Label text="普通" autoSize="left" x="27" y="5" style="普通说明" var="txt_name" height="18"/>
			</View>;
       
      
      public var selectRender:RadioButton = null;
      
      public var txt_name:Label = null;
      
      public function OptionListRenderUI()
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
