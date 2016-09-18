package game.ui.dialModule.panels
{
   import morn.core.components.View;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.dialModule.renders.DialBagRenderUI;
   
   public class DialBagPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="190" height="260" name="render">
			  <Image skin="png.uiDialModules.img_ruleBg" x="-5" y="-32"/>
			  <PageBarS1 x="55" y="228" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			  <List x="22.5" y="40" repeatX="2" repeatY="2" spaceX="25" spaceY="35" var="list_bag">
			    <DialBagRender name="render" runtime="game.ui.dialModule.renders.DialBagRenderUI"/>
			  </List>
			  <Label text="我的奖品" autoSize="none" x="23" y="18" style="渐变1" width="144" height="22" align="center" var="txt_60800024"/>
			</View>;
       
      
      public var pageBarUI:PageBarS1UI = null;
      
      public var list_bag:List = null;
      
      public var txt_60800024:Label = null;
      
      public function DialBagPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.dialModule.renders.DialBagRenderUI"] = DialBagRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
