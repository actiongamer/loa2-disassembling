package game.ui.newYears.day51s.renders
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class Day51CostRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="190" height="24.000000000000014">
			  <Label text=": 99999" autoSize="left" x="25" y="4" style="小标题" align="left" var="txt_num"/>
			  <Image skin="png.a5.comps.img_block" x="0" y="0" autoSize="false" width="24" height="24" var="img_icon"/>
			</WealthRender>;
       
      
      public var txt_num:Label = null;
      
      public var img_icon:Image = null;
      
      public function Day51CostRenderUI()
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
