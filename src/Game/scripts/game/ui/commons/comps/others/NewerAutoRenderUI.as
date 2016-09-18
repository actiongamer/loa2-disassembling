package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class NewerAutoRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="149" height="35">
			  <Label text="自动引导中..." autoSize="none" x="0" y="0" style="渐变1" width="149" height="32" align="left" size="24" var="txt_label"/>
			</View>;
       
      
      public var txt_label:Label = null;
      
      public function NewerAutoRenderUI()
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
