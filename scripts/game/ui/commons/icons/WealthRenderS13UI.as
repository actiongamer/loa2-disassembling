package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderS13UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="20" height="20">
			  <Image skin="png.comp.image" var="img_icon" width="20" height="20"/>
			  <Label text="label" x="20" y="2" width="55" var="txt_num" align="left" style="按钮文字" autoSize="none"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function WealthRenderS13UI()
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
