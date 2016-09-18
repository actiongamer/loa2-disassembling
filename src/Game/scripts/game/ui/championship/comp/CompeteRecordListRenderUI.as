package game.ui.championship.comp
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class CompeteRecordListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="509" height="30">
			  <Label text="普通说明" autoSize="none" x="8" y="4" style="普通说明" width="403" height="18" var="txt_content"/>
			  <Label text="250" autoSize="none" x="388" y="3" style="普通说明" width="266" height="18" var="txt_result" align="left"/>
			</View>;
       
      
      public var txt_content:Label = null;
      
      public var txt_result:Label = null;
      
      public function CompeteRecordListRenderUI()
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
