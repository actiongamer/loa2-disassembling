package game.ui.newYears.newYear2016s
{
   import morn.core.components.View;
   import game.ui.commons.icons.WealthRenderSize64UI;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Image;
   
   public class NewYear2016_GodSubPanel2RenderUI extends View
   {
      
      protected static var uiView:XML = <View width="470" height="90">
			  <WealthRenderSize64 x="14" y="12" var="render_wealth" runtime="game.ui.commons.icons.WealthRenderSize64UI"/>
			  <Label text="当前放鞭炮点数" autoSize="none" x="93" y="46" style="普通说明" width="224" height="21" var="txt2"/>
			  <Label text="当前放鞭炮点数" autoSize="none" x="93" y="25" style="小标题" width="224" height="21" var="txt1"/>
			  <Button label="按钮" x="343" y="31" style="按钮大绿" var="btn_get" toolTip="_"/>
			  <Image skin="png.a5.commonImgs.img_gotReward" x="370" y="13" width="65" height="66" var="img_get"/>
			  <Image skin="png.uiNewYear2016.subPanels.img_line2" x="20" y="88"/>
			</View>;
       
      
      public var render_wealth:WealthRenderSize64UI = null;
      
      public var txt2:Label = null;
      
      public var txt1:Label = null;
      
      public var btn_get:Button = null;
      
      public var img_get:Image = null;
      
      public function NewYear2016_GodSubPanel2RenderUI()
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
