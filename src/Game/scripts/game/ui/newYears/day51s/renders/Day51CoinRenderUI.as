package game.ui.newYears.day51s.renders
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class Day51CoinRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="125" height="25">
			  <Label text="name" autoSize="none" y="3" style="渐变1" width="115" height="22" align="left" size="14" var="txt_name" x="23"/>
			  <Image skin="png.a5.comps.img_block" x="0" y="0" var="img_icon" width="24" height="24"/>
			  <Label text="score" autoSize="none" y="3" style="渐变绿" width="104" height="22" align="left" size="14" var="txt_num" x="76"/>
			</WealthRender>;
       
      
      public var txt_name:Label = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function Day51CoinRenderUI()
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
