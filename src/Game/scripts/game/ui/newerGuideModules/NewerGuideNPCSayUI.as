package game.ui.newerGuideModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class NewerGuideNPCSayUI extends View
   {
      
      protected static var uiView:XML = <View width="800" height="400">
			  <Image skin="png.a5.comps.img_block" x="152" y="262" anchorX="0.5" var="img_left" anchorY="1" autoSize="true" width="300" height="300"/>
			  <Image skin="png.uiNewerGuide.img_bg" x="-525" y="133"/>
			  <Image skin="png.uiNewerGuide.人名下划线" x="-29.5" y="260"/>
			  <Label text="人名" autoSize="none" x="14" y="229" style="二级框标题" size="24" var="txt_name" width="203" height="35" align="left" color="0xe6cd78"/>
			  <Label text="人名" autoSize="none" x="13" y="294" style="二级框标题" size="20" var="txt_content" width="253" height="92" align="left" multiline="true" wordWrap="true" color="0xFFFFFF"/>
			</View>;
       
      
      public var img_left:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_content:Label = null;
      
      public function NewerGuideNPCSayUI()
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
