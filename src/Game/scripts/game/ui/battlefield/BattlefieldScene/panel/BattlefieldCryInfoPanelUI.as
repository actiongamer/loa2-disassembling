package game.ui.battlefield.BattlefieldScene.panel
{
   import morn.core.components.View;
   import game.ui.battlefield.BattlefieldScene.render.BattlefieldCryInfoRenderUI;
   
   public class BattlefieldCryInfoPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="39">
			  <List repeatX="4">
			    <BattlefieldCryInfoRender x="0" y="0" name="render" runtime="game.ui.battlefield.BattlefieldScene.render.BattlefieldCryInfoRenderUI"/>
			  </List>
			</View>;
       
      
      public function BattlefieldCryInfoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldScene.render.BattlefieldCryInfoRenderUI"] = BattlefieldCryInfoRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
