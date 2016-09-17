package game.ui.mallModule.render
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class MallAlertWealthRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="54" height="54" mouseEnabled="false">
			  <List x="3" y="3" var="list_wealth" repeatX="1">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Box x="-39" y="-33" var="box_discount" mouseChildren="false" mouseEnabled="false">
			    <Image skin="png.uiMallAlert.img_barginBg" var="img_barginBg"/>
			  </Box>
			</View>;
       
      
      public var list_wealth:List = null;
      
      public var box_discount:Box = null;
      
      public var img_barginBg:Image = null;
      
      public function MallAlertWealthRenderUI()
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
