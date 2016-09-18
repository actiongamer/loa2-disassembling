package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class ResWealthRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="78" height="32">
			  <Image skin="png.a5.comps.img_block" x="15" y="16" anchorX="0.5" anchorY="0.5" autoSize="true" var="img_icon" smoothing="true"/>
			  <Label text="x88888" autoSize="left" x="27" y="8" size="12" var="txt_num" letterSpacing="1" style="普通说明" buttonMode="true"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function ResWealthRenderUI()
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
