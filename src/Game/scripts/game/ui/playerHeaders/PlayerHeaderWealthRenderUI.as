package game.ui.playerHeaders
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class PlayerHeaderWealthRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="49" height="24">
			  <Image skin="png.comp.image" var="img_icon" width="23" height="23" anchorX="0.5" anchorY="0.5" x="12" y="12"/>
			  <Label stroke="0xffffff" mouseEnabled="false" var="txt_num" align="left" x="24" y="3" backgroundColor="0xcfbeaf" autoSize="left" style="二级框标题" size="12" text="9991/4999"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function PlayerHeaderWealthRenderUI()
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
