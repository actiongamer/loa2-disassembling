package game.ui.resourceDg
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Label;
   
   public class ResTalkUI extends View
   {
      
      protected static var uiView:XML = <View width="220" height="90">
			  <Box x="9" y="1" var="bg">
			    <Image skin="png.uiMainCitys.resDg.summaryBg" x="208" width="216" height="90" sizeGrid="4,5,30,15" scaleX="-1" y="0"/>
			    <Label y="3" style="普通说明" var="txt_summary" width="203" multiline="true" wordWrap="true" align="left" text="十二个字十二个字十二个字十二个字十二个字十二" leading="2" height="60" autoSize="none" x="0"/>
			  </Box>
			</View>;
       
      
      public var bg:Box = null;
      
      public var txt_summary:Label = null;
      
      public function ResTalkUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
