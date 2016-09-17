package game.ui.TencentModule.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class TencentVipRightsRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="288" height="126">
			  <Image skin="png.a5.comps.img_block" width="288" height="126" x="0" y="0" var="img_bg"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public function TencentVipRightsRenderUI()
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
