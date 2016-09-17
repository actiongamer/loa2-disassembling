package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderS16UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="134" height="25">
			  <Image skin="png.a5.comps.img_block" x="12" y="12" anchorX="0.5" anchorY="0.5" autoSize="true" scale="0.4" width="64" height="64" var="img_icon"/>
			  <Label text="x88888" autoSize="left" x="28" y="4" size="12" var="txt_num" letterSpacing="1" style="随品质变化" buttonMode="true" width="105" height="18"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function WealthRenderS16UI()
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
