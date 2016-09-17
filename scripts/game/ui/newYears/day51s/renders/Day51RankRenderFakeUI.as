package game.ui.newYears.day51s.renders
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderSize64UI;
   
   public class Day51RankRenderFakeUI extends View
   {
      
      protected static var uiView:XML = <View width="670" height="70">
			  <Label text="score" autoSize="none" x="159" y="27" style="渐变橙" width="90" height="26" align="center" var="txt_lv" size="20"/>
			  <Image skin="png.uiLuckTree.worldTree.img_line" x="20" y="68" width="630"/>
			  <Label text="score" autoSize="none" x="5" y="41" style="普通说明" width="179" height="26" align="center" var="txt_name" size="18"/>
			  <Image skin="png.a5.commonImgs.1ST" x="70" y="10" var="img_rank"/>
			  <WealthRenderSize64 name="render" x="570" y="3" runtime="game.ui.commons.icons.WealthRenderSize64UI"/>
			  <WealthRenderSize64 name="render" x="262" y="3" runtime="game.ui.commons.icons.WealthRenderSize64UI"/>
			</View>;
       
      
      public var txt_lv:Label = null;
      
      public var txt_name:Label = null;
      
      public var img_rank:Image = null;
      
      public function Day51RankRenderFakeUI()
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
