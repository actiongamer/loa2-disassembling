package game.ui.loadingModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.customs.components.GRect;
   
   public class LoadingPopUI extends View
   {
      
      protected static var uiView:XML = <View width="636.5" height="163">
			  <Image skin="png.uiLoadingModules.小loading底黑色地板" x="-0.5" y="-7" width="637" height="170"/>
			  <Image skin="png.uiLoadingModules.小loading底" x="155" y="16" var="img_logo_2"/>
			  <Image skin="png.uiLoadingModules.小loadin11111" x="155" y="15" var="img_logo"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="157" y="4" width="359" height="149" var="logoMask"/>
			</View>;
       
      
      public var img_logo_2:Image = null;
      
      public var img_logo:Image = null;
      
      public var logoMask:GRect = null;
      
      public function LoadingPopUI()
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
