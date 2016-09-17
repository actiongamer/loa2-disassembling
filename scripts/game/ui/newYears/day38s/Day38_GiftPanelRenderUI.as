package game.ui.newYears.day38s
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderSize64UI;
   
   public class Day38_GiftPanelRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="420" height="90">
			  <Label text="当前放鞭炮点数" autoSize="none" x="145" y="13" style="小标题" width="268" height="21" var="txt1"/>
			  <Label text="当前放鞭炮点数" autoSize="none" x="145" y="35" style="普通说明" width="224" height="21" var="txt2"/>
			  <Button label="按钮" x="283" y="33" style="按钮大绿" var="btn_get"/>
			  <Image skin="png.a5.commonImgs.img_gotReward" x="294" y="-2" var="img_get"/>
			  <Image skin="png.uiDay38.img_line2" x="20" y="88" width="400"/>
			  <List x="7" y="12" var="list_gift" repeatX="2" spaceX="4">
			    <WealthRenderSize64 name="render" runtime="game.ui.commons.icons.WealthRenderSize64UI"/>
			  </List>
			</View>;
       
      
      public var txt1:Label = null;
      
      public var txt2:Label = null;
      
      public var btn_get:Button = null;
      
      public var img_get:Image = null;
      
      public var list_gift:List = null;
      
      public function Day38_GiftPanelRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderSize64UI"] = WealthRenderSize64UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
