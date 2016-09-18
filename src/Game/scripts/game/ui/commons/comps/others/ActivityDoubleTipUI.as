package game.ui.commons.comps.others
{
   import morn.core.components.View;
   
   public class ActivityDoubleTipUI extends View
   {
      
      protected static var uiView:XML = <View width="85" height="64">
			  <Image skin="png.a5.commonImgs.img_doubleTip2" x="0" y="0"/>
			</View>;
       
      
      public function ActivityDoubleTipUI()
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
