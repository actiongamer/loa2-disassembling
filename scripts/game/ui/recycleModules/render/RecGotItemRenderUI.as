package game.ui.recycleModules.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RecGotItemRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="90" height="95">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="12" y="0" var="img_quality" sizeGrid="6,6,6,6" width="60" height="60"/>
			  <Image skin="png.comp.image" x="15" y="3" var="img_icon" width="54" height="54"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="15" y="41" backgroundColor="0xcfbeaf" color="0xffffff" style="按钮文字"/>
			  <Label text="名字名字名字名字" stroke="0xffffff" mouseEnabled="false" var="txt_name" width="90" align="center" y="57" backgroundColor="0xcfbeaf" color="0xffffff" centerX="0" x="0" mouseChildren="false" multiline="true" wordWrap="true"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public var txt_name:Label = null;
      
      public function RecGotItemRenderUI()
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
