package game.ui.mainToolBar
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class ExpBarUI extends View
   {
      
      protected static var uiView:XML = <View width="500" height="5">
			  <Box x="0" y="-4" width="500" height="12" var="boxBar">
			    <Image skin="png.uiMainToolBar.img_exp_bg" y="4" left="0" right="0" sizeGrid="4,0,4,0"/>
			    <Image skin="png.uiMainToolBar.img_exp_bar" y="5" var="img_bar" width="330"/>
			    <List x="50" y="5" repeatX="9" spaceX="50">
			      <ExpBarRender name="render" runtime="game.ui.mainToolBar.ExpBarRenderUI"/>
			    </List>
			    <Image skin="png.uiMainToolBar.exp末端" x="333" var="img_tail" anchorX="1"/>
			  </Box>
			  <Label text="100/100" x="60" y="-9.5" var="txt_value" width="380" buttonMode="true" style="普通说明" align="center" autoSize="none" height="18"/>
			</View>;
       
      
      public var boxBar:Box = null;
      
      public var img_bar:Image = null;
      
      public var img_tail:Image = null;
      
      public var txt_value:Label = null;
      
      public function ExpBarUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.mainToolBar.ExpBarRenderUI"] = ExpBarRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
