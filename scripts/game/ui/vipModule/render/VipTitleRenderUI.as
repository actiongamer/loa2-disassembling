package game.ui.vipModule.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class VipTitleRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="51" height="22">
			  <Label text="VIP0" autoSize="none" y="0.5" style="渐变1" align="center" var="txt_title" bold="false" size="14" x="0" width="51"/>
			</View>;
       
      
      public var txt_title:Label = null;
      
      public function VipTitleRenderUI()
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
