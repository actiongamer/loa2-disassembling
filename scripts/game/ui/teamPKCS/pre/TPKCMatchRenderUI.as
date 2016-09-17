package game.ui.teamPKCS.pre
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TPKCMatchRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="270" height="21">
			  <Label text="普通说明" autoSize="none" x="1" y="2" style="普通说明" width="270" height="20" var="txt"/>
			</View>;
       
      
      public var txt:Label = null;
      
      public function TPKCMatchRenderUI()
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
