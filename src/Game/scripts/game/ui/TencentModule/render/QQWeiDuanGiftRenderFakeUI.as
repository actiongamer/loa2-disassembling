package game.ui.TencentModule.render
{
   import morn.core.components.View;
   
   public class QQWeiDuanGiftRenderFakeUI extends View
   {
      
      protected static var uiView:XML = <View width="666" height="127">
			  <Image skin="png.a5.comps.img_block" x="0" y="0" left="0" right="0" top="0" bottom="0"/>
			</View>;
       
      
      public function QQWeiDuanGiftRenderFakeUI()
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
