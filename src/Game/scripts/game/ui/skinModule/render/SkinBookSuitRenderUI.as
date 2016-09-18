package game.ui.skinModule.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class SkinBookSuitRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="400" height="20">
			  <Label text="\l999900500" autoSize="none" style="普通说明" width="400" height="20" align="left" var="txt_desc"/>
			</View>;
       
      
      public var txt_desc:Label = null;
      
      public function SkinBookSuitRenderUI()
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
