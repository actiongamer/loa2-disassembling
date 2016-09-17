package game.ui.mallModule.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class MallItemRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="70" height="70" showMultipleSign="false">
			  <Image skin="png.comp.image" x="0" y="0" var="img_icon" width="70" height="70"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="78" align="right" x="-9" y="50" backgroundColor="0xcfbeaf" height="23" style="普通说明"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function MallItemRenderUI()
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
