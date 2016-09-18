package game.ui.fashionModules
{
   import morn.customs.components.NpcPropTwoRender;
   import morn.core.components.Label;
   import morn.core.components.HBox;
   import morn.core.components.Image;
   
   public class FashionPropTwoRenderUI extends NpcPropTwoRender
   {
      
      protected static var uiView:XML = <NpcPropTwoRender width="140" height="18">
			  <Label text="生 命：" autoSize="left" x="2" y="0" height="18" var="txt_name" style="人名1不随品质变化"/>
			  <HBox x="52" y="0" var="hbox_value">
			    <Label text="0" autoSize="left" height="18" var="txt_value" letterSpacing="1" style="人名1不随品质变化"/>
			    <Label text="21561" autoSize="left" height="18" var="txt_value2" letterSpacing="1" align="left" x="41" style="重要提示绿"/>
			    <Image skin="png.a5.commonImgs.img_arrowupS1" x="67" y="1" var="img_arrowUp"/>
			  </HBox>
			</NpcPropTwoRender>;
       
      
      public var txt_name:Label = null;
      
      public var hbox_value:HBox = null;
      
      public var txt_value:Label = null;
      
      public var txt_value2:Label = null;
      
      public var img_arrowUp:Image = null;
      
      public function FashionPropTwoRenderUI()
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
