package game.ui.BagModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class GetGiftRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="410" height="25">
			  <Label text="[15-12-59 00:00:00]" x="10" y="7" var="txt_time" width="129" height="18" align="center" style="普通说明暗色"/>
			  <Label text="内容" x="149" y="7" var="txt_content" width="261" height="18" style="普通说明"/>
			</View>;
       
      
      public var txt_time:Label = null;
      
      public var txt_content:Label = null;
      
      public function GetGiftRenderUI()
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
