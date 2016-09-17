package game.ui.mallModule
{
   import morn.core.components.View;
   import morn.customs.components.WealthList;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.ClickToNextUI;
   import game.ui.commons.icons.WealthRenderS9UI;
   
   public class MallBuySuccessPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="427" height="186">
			  <Image skin="png.a5.bgs.panelBgs.raw.底板四级" x="0.5" y="0"/>
			  <WealthList x="9" y="68" repeatX="6" repeatY="1" spaceX="10" spaceY="12" var="list_item">
			    <WealthRenderS9 name="render" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  </WealthList>
			  <Image skin="png.a5.commonImgs.img_txtBg" x="107" y="22" centerX="0"/>
			  <Label text="购买获得" autoSize="none" y="21" style="渐变1" width="109" height="27" var="txt_title" align="center" centerX="0"/>
			  <ClickToNext y="163" x="296" runtime="game.ui.commons.comps.others.ClickToNextUI"/>
			</View>;
       
      
      public var list_item:WealthList = null;
      
      public var txt_title:Label = null;
      
      public function MallBuySuccessPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.ClickToNextUI"] = ClickToNextUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
