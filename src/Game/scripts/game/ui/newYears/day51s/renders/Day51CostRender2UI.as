package game.ui.newYears.day51s.renders
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   
   public class Day51CostRender2UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="165" height="21">
			  <Label text="havmu:999" autoSize="left" x="0" y="0" style="小标题" align="left" var="txt_num"/>
			</WealthRender>;
       
      
      public var txt_num:Label = null;
      
      public function Day51CostRender2UI()
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
