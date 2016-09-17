package game.ui.commons.icons
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderS9UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="60" height="60">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS6_2" x="-1" y="-3" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="2" y="0" var="img_icon" width="56" height="56"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="5" y="40" backgroundColor="0xcfbeaf" color="0xffffff"/>
			  <Label text="名字啦啦啦啦啦" stroke="0xffffff" mouseEnabled="false" var="txt_name" align="center" x="-18" y="61" backgroundColor="0xcfbeaf" color="0xffffff" width="100" multiline="true" wordWrap="true"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public var txt_name:Label = null;
      
      public function WealthRenderS9UI()
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
