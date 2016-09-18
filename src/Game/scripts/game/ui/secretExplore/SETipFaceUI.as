package game.ui.secretExplore
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class SETipFaceUI extends View
   {
      
      protected static var uiView:XML = <View width="64" height="64">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS6_2" x="1" y="1" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="4" y="4" var="img_icon" width="56" height="56"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public function SETipFaceUI()
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
