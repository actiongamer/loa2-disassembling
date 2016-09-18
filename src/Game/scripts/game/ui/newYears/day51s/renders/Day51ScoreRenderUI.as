package game.ui.newYears.day51s.renders
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderSize40UI;
   
   public class Day51ScoreRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="500" height="48">
			  <Button label="按钮" x="361" y="12" style="按钮中绿" var="btn_get"/>
			  <Image skin="png.a5.commonImgs.img_have" x="360" y="-6" var="img_get"/>
			  <List x="139" y="3" repeatX="5" spaceX="4" var="list_gift">
			    <WealthRenderSize40 name="render" runtime="game.ui.commons.icons.WealthRenderSize40UI"/>
			  </List>
			  <Label text="999" autoSize="none" x="18" y="15" style="渐变橙" width="65" height="26" align="right" var="txt_lv"/>
			  <Image skin="png.uiFunnyCommon.img_list_line" x="4" y="47"/>
			  <Label text="12" autoSize="none" x="363" y="15" style="不足禁止红" width="236" height="23" align="left" var="txt_need"/>
			</View>;
       
      
      public var btn_get:Button = null;
      
      public var img_get:Image = null;
      
      public var list_gift:List = null;
      
      public var txt_lv:Label = null;
      
      public var txt_need:Label = null;
      
      public function Day51ScoreRenderUI()
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
