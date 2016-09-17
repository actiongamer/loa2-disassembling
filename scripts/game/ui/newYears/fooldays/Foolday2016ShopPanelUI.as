package game.ui.newYears.fooldays
{
   import morn.core.components.View;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Label;
   import morn.core.components.Tab;
   
   public class Foolday2016ShopPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="1100" height="700">
			  <Box x="524" y="141">
			    <List y="78" repeatX="2" repeatY="3" spaceX="0" spaceY="7" var="list_sales">
			      <FooldayShopRender name="render" runtime="game.ui.newYears.fooldays.FooldayShopRenderUI"/>
			    </List>
			    <PageBarS2 x="207" y="448" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			    <Label text="\l13320005" autoSize="none" x="34" style="渐变1" width="600" height="43" bold="true" leading="-1" var="txt_tip1" multiline="true" wordWrap="true" y="0" size="28"/>
			    <Label text="倒计时" autoSize="none" x="47" style="渐变1" width="491" height="28" size="15" bold="true" leading="-1" var="txt_cd" multiline="true" wordWrap="true" y="48" align="right"/>
			  </Box>
			  <Tab labels="标 签,标 签" x="533" y="188" style="TAB长" var="tab_1"/>
			  <Image skin="png.a5.commonImgs.小框分割线" x="533" y="212" width="540"/>
			</View>;
       
      
      public var list_sales:List = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var txt_tip1:Label = null;
      
      public var txt_cd:Label = null;
      
      public var tab_1:Tab = null;
      
      public function Foolday2016ShopPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.newYears.fooldays.FooldayShopRenderUI"] = FooldayShopRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
