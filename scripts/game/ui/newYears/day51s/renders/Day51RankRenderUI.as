package game.ui.newYears.day51s.renders
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderSize64UI;
   
   public class Day51RankRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="670" height="70">
			  <List x="262" y="3" repeatX="4" spaceX="4" var="list_gift">
			    <WealthRenderSize64 name="render" runtime="game.ui.commons.icons.WealthRenderSize64UI"/>
			  </List>
			  <Label text="score" autoSize="none" x="159" y="27" style="渐变橙" width="90" height="26" align="center" var="txt_score" size="20"/>
			  <Image skin="png.uiFunnyCommon.img_list_line" x="20" y="68" width="630"/>
			  <Label text="score" autoSize="none" x="5" y="41" style="普通说明" width="179" height="26" align="center" var="txt_name" size="18"/>
			  <Image skin="png.a5.commonImgs.1ST" x="70" y="10" var="img_rank"/>
			  <List x="570" y="3" repeatX="4" spaceX="4" var="list_gift_super">
			    <WealthRenderSize64 name="render" runtime="game.ui.commons.icons.WealthRenderSize64UI"/>
			  </List>
			  <Label text="100-999" autoSize="none" x="19" y="10" style="渐变橙" width="141" height="26" align="center" var="txt_rank" size="20"/>
			</View>;
       
      
      public var list_gift:List = null;
      
      public var txt_score:Label = null;
      
      public var txt_name:Label = null;
      
      public var img_rank:Image = null;
      
      public var list_gift_super:List = null;
      
      public var txt_rank:Label = null;
      
      public function Day51RankRenderUI()
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
