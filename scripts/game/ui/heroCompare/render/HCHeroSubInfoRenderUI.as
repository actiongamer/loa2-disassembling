package game.ui.heroCompare.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class HCHeroSubInfoRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="769" height="30">
			  <Image skin="png.uiHeroCompare.长条05" x="0" y="0"/>
			  <Label autoSize="none" x="4" y="2" width="106" height="25" align="center" var="txt_value" bold="false" text="123123"/>
			</View>;
       
      
      public var txt_value:Label = null;
      
      public function HCHeroSubInfoRenderUI()
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
