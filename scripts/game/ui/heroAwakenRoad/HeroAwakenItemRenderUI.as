package game.ui.heroAwakenRoad
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class HeroAwakenItemRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="60" height="83">
			  <Label text="名字啦啦啦啦啦" stroke="0xffffff" mouseEnabled="false" var="txt_needNum" width="91" align="center" x="-14" y="54" backgroundColor="0xcfbeaf" color="0xffffff" height="18" style="普通说明"/>
			  <WealthRenderS5 x="4" y="-1" var="render_wealth" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			</View>;
       
      
      public var txt_needNum:Label = null;
      
      public var render_wealth:WealthRenderS5UI = null;
      
      public function HeroAwakenItemRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
