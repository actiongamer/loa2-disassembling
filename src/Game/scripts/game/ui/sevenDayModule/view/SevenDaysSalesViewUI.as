package game.ui.sevenDayModule.view
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   
   public class SevenDaysSalesViewUI extends View
   {
      
      protected static var uiView:XML = <View width="568" height="469">
			  <Image skin="png.a5.comps.img_block" x="4" y="147" var="img_salesBg" width="560" height="317"/>
			  <Image skin="png.a5.comps.img_block" x="3" y="2" width="561" height="139" var="img_titleBG"/>
			  <List x="24" y="170" repeatX="2" repeatY="2" spaceX="14" spaceY="19" var="list_sales">
			    <SevenDaysSaleRender name="render" runtime="game.ui.sevenDayModule.view.SevenDaysSaleRenderUI"/>
			  </List>
			  <Image skin="png.a5.comps.img_block" x="38" y="24" var="img_title"/>
			  <Label text="label" x="12" y="112" var="event_period"/>
			  <Label text="渐变黄" autoSize="none" x="38" y="26" style="渐变橙" width="439" height="55" align="left" font="Microsoft YaHei" size="40" mouseChildren="false" mouseEnabled="false" var="titleTxt"/>
			</View>;
       
      
      public var img_salesBg:Image = null;
      
      public var img_titleBG:Image = null;
      
      public var list_sales:List = null;
      
      public var img_title:Image = null;
      
      public var event_period:Label = null;
      
      public var titleTxt:Label = null;
      
      public function SevenDaysSalesViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.sevenDayModule.view.SevenDaysSaleRenderUI"] = SevenDaysSaleRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
