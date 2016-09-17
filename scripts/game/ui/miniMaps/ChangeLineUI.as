package game.ui.miniMaps
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.core.components.Label;
   
   public class ChangeLineUI extends View
   {
      
      protected static var uiView:XML = <View width="106" height="18">
			  <Image skin="png.uiMiniMap.路线底" x="-2" y="18" var="img_listBg" height="64" width="109"/>
			  <List x="1" y="18" repeatY="3" var="list_line">
			    <MiniMapLineRender name="render" runtime="game.ui.miniMaps.MiniMapLineRenderUI"/>
			  </List>
			  <Box x="7" y="0" var="boxCurLine" width="89.15" height="22">
			    <Image skin="png.uiMiniMap.btn_arrowDown" y="8" var="btn_arrowDown" anchorX="0.5" anchorY="0.5"/>
			    <Label text="当前路线: 3线" autoSize="left" x="10" var="txt_line" style="内容数字" y="0"/>
			  </Box>
			</View>;
       
      
      public var img_listBg:Image = null;
      
      public var list_line:List = null;
      
      public var boxCurLine:Box = null;
      
      public var btn_arrowDown:Image = null;
      
      public var txt_line:Label = null;
      
      public function ChangeLineUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.miniMaps.MiniMapLineRenderUI"] = MiniMapLineRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
