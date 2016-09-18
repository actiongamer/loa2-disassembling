package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderSize24TxtUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="77" height="25">
			  <Image skin="png.a5.comps.img_block" x="13" y="13" anchorX="0.5" anchorY="0.5" autoSize="true" width="24" height="24" var="img_icon"/>
			  <Label text="x88888" autoSize="left" x="28" y="5" size="12" var="txt_needNum" letterSpacing="1" style="随品质变化" buttonMode="true" width="77"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_needNum:Label = null;
      
      public function WealthRenderSize24TxtUI()
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
