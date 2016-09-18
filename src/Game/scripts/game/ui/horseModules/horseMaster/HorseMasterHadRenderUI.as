package game.ui.horseModules.horseMaster
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class HorseMasterHadRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="75" height="20">
			  <Image skin="png.comp.image" var="img_icon" width="22" height="22" x="-1" y="-1"/>
			  <Label text="9999" x="20" y="2" width="55" var="txt_num" align="left" style="按钮文字" autoSize="none"/>
			  <Label text="\l60300008" x="-36" y="2" var="txt_1" align="left" style="按钮文字" autoSize="none" language="en" lgx="-55,-36"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public var txt_1:Label = null;
      
      public function HorseMasterHadRenderUI()
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
