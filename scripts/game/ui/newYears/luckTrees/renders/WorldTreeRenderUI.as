package game.ui.newYears.luckTrees.renders
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderSize40UI;
   
   public class WorldTreeRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="500" height="48">
			  <Label text="Lv.12" autoSize="none" x="27" y="15" style="渐变橙" width="65" height="26" align="left" var="txt_lv"/>
			  <Button label="按钮" x="361" y="12" style="按钮中绿" var="btn_get"/>
			  <List x="139" y="3" repeatX="5" spaceX="4" var="list_gift">
			    <WealthRenderSize40 name="render" runtime="game.ui.commons.icons.WealthRenderSize40UI"/>
			  </List>
			  <Image skin="png.uiLuckTree.personScore.img_line" x="4" y="47"/>
			  <Label text="\l999000234" autoSize="none" x="355" y="15" style="渐变黄" width="94" height="26" align="center" var="img_get"/>
			</View>;
       
      
      public var txt_lv:Label = null;
      
      public var btn_get:Button = null;
      
      public var list_gift:List = null;
      
      public var img_get:Label = null;
      
      public function WorldTreeRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderSize40UI"] = WealthRenderSize40UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
