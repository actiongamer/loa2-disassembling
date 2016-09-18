package game.ui.mainToolBar
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class ButtonWealhtRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="69" height="32">
			  <Image skin="png.a5.comps.img_block" x="13" y="14" anchorX="0.5" anchorY="0.5" autoSize="false" width="24" height="24" var="img_icon"/>
			  <Label text="20000" autoSize="left" x="25" y="5" size="12" var="txt_num" letterSpacing="1" style="普通说明" buttonMode="true" height="18"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function ButtonWealhtRenderUI()
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
