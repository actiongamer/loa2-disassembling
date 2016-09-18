package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderS15UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="49" height="24">
			  <Image skin="png.comp.image" var="img_icon" width="30" height="30" anchorX=".5" anchorY=".5" x="0" y="12"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" align="left" x="20" y="4" backgroundColor="0xcfbeaf" autoSize="left" size="12" style="内容数字"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function WealthRenderS15UI()
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
