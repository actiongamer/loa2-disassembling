package game.ui.ResRecovery
{
   import morn.core.components.View;
   import game.ui.commons.icons.WealthRenderS11UI;
   
   public class ResRecoveryItemRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="82" height="102">
			  <Image skin="png.uiResRecovery.0000_组-309" x="0" y="0"/>
			  <WealthRenderS11 x="15.5" y="15" runtime="game.ui.commons.icons.WealthRenderS11UI"/>
			</View>;
       
      
      public function ResRecoveryItemRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS11UI"] = WealthRenderS11UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
