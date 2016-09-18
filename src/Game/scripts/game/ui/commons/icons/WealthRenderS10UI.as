package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderS10UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="49" height="24">
			  <Image skin="png.comp.image" var="img_icon" width="24" height="24"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" align="left" x="24" y="0" backgroundColor="0xcfbeaf" autoSize="left" size="18" style="二级框标题"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function WealthRenderS10UI()
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
