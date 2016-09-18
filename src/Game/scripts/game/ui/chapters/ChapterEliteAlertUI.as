package game.ui.chapters
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Label;
   
   public class ChapterEliteAlertUI extends View
   {
      
      protected static var uiView:XML = <View width="148" height="68">
			  <Box x="-129" y="20" var="box_alert">
			    <Image skin="png.uiChapter.dungeonMap.img_summaryBg2" y="46" scaleY="-1"/>
			    <Label text="精英副本能够获取装备哦" autoSize="left" x="6" var="txt_alert" width="135" height="44.61146518707275" align="center" style="普通说明" size="14" bold="true" wordWrap="true"/>
			  </Box>
			</View>;
       
      
      public var box_alert:Box = null;
      
      public var txt_alert:Label = null;
      
      public function ChapterEliteAlertUI()
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
