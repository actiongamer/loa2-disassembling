package game.ui.newerGuideModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class NewerGuideSkipUI extends View
   {
      
      protected static var uiView:XML = <View width="165" height="64">
			  <Image skin="png.uiNewerGuide.框体（可拉九宫）" x="0" y="0" sizeGrid="24,24,24,24" var="img_bg"/>
			  <Label text="跳过指引" autoSize="none" x="33" y="20" multiline="true" wordWrap="true" width="101" var="txt_content" leading="3" letterSpacing="1" style="普通说明" size="18" height="27" align="center"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var txt_content:Label = null;
      
      public function NewerGuideSkipUI()
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
