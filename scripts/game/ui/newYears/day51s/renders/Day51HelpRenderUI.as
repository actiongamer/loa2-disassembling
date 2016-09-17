package game.ui.newYears.day51s.renders
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class Day51HelpRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="684" height="467">
			  <Image skin="png.a5.comps.img_block" x="0" y="0" autoSize="true" var="img_pic" centerX="0" centerY="0"/>
			</View>;
       
      
      public var img_pic:Image = null;
      
      public function Day51HelpRenderUI()
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
