package game.ui.playerHeaders
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class PlayerHeaderWealthRenderSmallUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="64" height="18">
			  <Image skin="png.comp.image" var="img_icon" width="12" height="12" anchorX="0.5" anchorY="0.5" x="9" y="9"/>
			  <Label stroke="0xffffff" mouseEnabled="false" var="txt_num" align="center" x="11" y="0" backgroundColor="0xcfbeaf" autoSize="left" style="二级框标题" size="12" text="123456" width="60" height="18"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function PlayerHeaderWealthRenderSmallUI()
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
