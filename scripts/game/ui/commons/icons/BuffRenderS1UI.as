package game.ui.commons.icons
{
   import morn.customs.components.BuffRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class BuffRenderS1UI extends BuffRender
   {
      
      protected static var uiView:XML = <BuffRender width="32" height="32">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS5_1" x="0" y="0" var="img_quality" sizeGrid="8,8,8,8"/>
			  <Image skin="png.a5.comps.img_block" x="3" y="3" width="28" height="28" var="img_icon"/>
			  <Label text="12" autoSize="none" x="5" y="16" size="12" width="28" height="18" align="right" var="txt_layers" bold="false" style="普通说明"/>
			</BuffRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_layers:Label = null;
      
      public function BuffRenderS1UI()
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
