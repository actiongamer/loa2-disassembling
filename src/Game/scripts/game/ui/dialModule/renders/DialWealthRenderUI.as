package game.ui.dialModule.renders
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class DialWealthRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="125" height="25">
			  <Label text="我的积分" autoSize="none" y="3" style="渐变1" width="212" height="22" align="left" size="14" var="txt_name" x="23"/>
			  <Image skin="png.a5.comps.img_block" x="12" y="13" anchorX="0.5" anchorY="0.5" var="img_icon" width="22" height="22"/>
			  <Label text="我的积分" autoSize="none" y="3" style="渐变绿" width="104" height="22" align="left" size="14" var="txt_num" x="137"/>
			</WealthRender>;
       
      
      public var txt_name:Label = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function DialWealthRenderUI()
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
