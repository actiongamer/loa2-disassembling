package game.ui.treasures.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class PropRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="81" height="26">
			  <Label autoSize="none" labelFilterKind="101" width="80" height="19" align="left" text="5.3%" style="普通绿色" x="1" y="5" var="txt_value"/>
			</View>;
       
      
      public var txt_value:Label = null;
      
      public function PropRenderUI()
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
