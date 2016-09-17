package game.ui.commons.icons.labels
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class WealthRenderLabelS1UI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="45" height="20">
			  <Image skin="png.comp.image" x="0" y="0" var="img_icon" width="20" height="20"/>
			  <Label text="999" mouseEnabled="false" var="txt_num" x="20" y="3" style="不足禁止红" autoSize="left" align="left"/>
			</WealthRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function WealthRenderLabelS1UI()
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
