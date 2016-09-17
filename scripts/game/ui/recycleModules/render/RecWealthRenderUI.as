package game.ui.recycleModules.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class RecWealthRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="98" height="20">
			  <Label text="8888888888" autoSize="none" x="24" y="3" size="12" color="0xffe1a2" var="txt_num" letterSpacing="1" width="73" height="18"/>
			  <Image skin="png.comp.image" var="img_icon" width="20" height="20" x="-5" y="1"/>
			</WealthRender>;
       
      
      public var txt_num:Label = null;
      
      public var img_icon:Image = null;
      
      public function RecWealthRenderUI()
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
