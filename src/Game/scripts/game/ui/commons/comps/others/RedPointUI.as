package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class RedPointUI extends View
   {
      
      protected static var uiView:XML = <View width="14" height="14">
			  <Image skin="png.a5.commonImgs.img_redPoint" var="img_icon"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public function RedPointUI()
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
