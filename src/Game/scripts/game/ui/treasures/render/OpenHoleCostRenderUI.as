package game.ui.treasures.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.RadioButton;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class OpenHoleCostRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="215" height="24">
			  <RadioButton x="2" y="1" style="Radio普通" selected="true" var="radiaoBtn"/>
			  <HBox x="28" y="2" space="2">
			    <Label text="20000" autoSize="none" y="2" style="重要提示绿" var="txt_num" x="0" width="34" height="16"/>
			    <Image skin="png.comp.image" x="32" width="20" height="20" var="img_icon"/>
			    <Label text="（当前剩余1200000000）" autoSize="left" x="52" y="2" style="随品质变化" var="txt_have"/>
			  </HBox>
			</WealthRender>;
       
      
      public var radiaoBtn:RadioButton = null;
      
      public var txt_num:Label = null;
      
      public var img_icon:Image = null;
      
      public var txt_have:Label = null;
      
      public function OpenHoleCostRenderUI()
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
