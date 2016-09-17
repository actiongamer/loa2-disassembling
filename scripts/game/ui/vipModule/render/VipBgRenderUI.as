package game.ui.vipModule.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class VipBgRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="773" height="41">
			  <Image skin="png.uiVip.底" x="0" y="0" width="773" height="41" var="img_bg"/>
			  <Image skin="png.a5.commonImgs.小框分割线" y="0" width="773" x="0"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public function VipBgRenderUI()
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
